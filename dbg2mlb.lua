ROMMap = {start = 0, offset = 0}


function ROMMap:new(start, offset)
    obj = {}
    setmetatable(obj, self)
    self.start = start
    self.offset = offset
    return obj
end


function get_label(line)
    local label = 'name="UNDEF"'

    -- Split on commas
    for token in line:gmatch('[^,%s]+') do
        -- Find label
        if (string.find(token, "name=")) then
            label = token:gsub('name=', '')
            break
        end
    end

    -- Only keep what's in the quotes
    return label:gsub('%"', '')
end


function get_id(line)
    local id = "0"

    for token in line:gmatch('[^,%s]+') do

        if (string.find(token, "id=")) then
            id = token:gsub('id=', '')
            break
        end

    end

    return tonumber(id)
end


function get_value(line)
    local value = "0"

    -- Split on commas
    for token in line:gmatch('[^,%s]+') do
        if (string.find(token, "val=")) then
            value = token:gsub('val=', '')
            break
        end
    end

    return tonumber(value)
end


function get_addrsize(line)
    local addrsize = "UNKNOWN"

    for token in line:gmatch('[^,%s]+') do
        if (string.find(token, "addrsize=")) then
            addrsize = token:gsub('addrsize=', '')
            break
        end
    end

    return addrsize
end


function get_type(line)
    local type = "UNKNOWN"

    for token in line:gmatch('[^,%s]+') do
        if (string.find(token, "type=")) then
            type = token:gsub('type=', '')
            break
        end
    end

    return type
end


function get_start(line)
    local start = "0"

    for token in line:gmatch('[^,%s]+') do
        if (string.find(token, "start=")) then
            start = token:gsub('start=', '')
            break
        end
    end

    return tonumber(start)
end


function get_offset(line)
    local ofs = "0"

    for token in line:gmatch('[^,%s]+') do
        if (string.find(token, "ooffs=")) then
            ofs = token:gsub('ooffs=', '')
            break
        end
    end

    return tonumber(ofs)
end


function get_seg(line)
    local seg = "-1"

    for token in line:gmatch('[^,%s]+') do
        if (string.find(token, "seg=")) then
            seg = token:gsub('seg=', '')
            break
        end
    end

    return tonumber(seg)
end


--


map = {}
output = {}

print("Converting debug symbols...")

line_no = 0
for line in io.lines("_debug.txt") do

    if line_no == 0 then
        print(line)
    else
        local header = ""
        local pos = line:find('\t')
        
        if (pos ~= nil) then
            header = string.sub(line, 1, pos - 1)
            
            -- SEGMENTS
            if (header == "seg") then
                local name = get_label(line)
                local start = get_start(line)
                if (start == nil) then
                    print("ERROR: No start for segment:", line)
                    break
                end
                local offset = 0
                if (start >= 0x8000) then
                    offset = get_offset(line)
                end

                local id = get_id(line)
                -- table.insert(map, ROMMap:new(start, offset))
                map[id] = ROMMap:new(start, offset)
                map[id].start = start
                map[id].offset = offset
                
                -- print("Found:", header, name, map[id].start, map[id].offset)

            end

            -- SYMBOLS
            if (header == "sym") then
                local name = get_label(line)
                
                -- Skip local symbols
                if (name:sub(1, 1) ~= '@') then
                    -- Find the relative address
                    local address = get_value(line)
                    
                    if (address < 0x8000) then
                        -- RAM label
                        --print("Found RAM label:", name)
                        if (get_type(line) == "equ") then
                            table.insert(output, string.format("G:%04X:%s", address, name))
                        end
                    else
                        -- ROM label
                        --print("Found ROM label:", name)
                        local seg = get_seg(line)
                        
                        if (seg ~= -1 and get_type(line) == "lab") then
                            local file_addr = map[seg].offset + address - map[seg].start
                            table.insert(output, string.format("P:%06X:%s", file_addr, name))
                        end

                    end

                end

            end

        end

    end

    line_no = line_no + 1
end

--[[
for i = 0, #map do
    print(string.format("Seg[%02d]: $%06X - $%06X", i, map[i].start, map[i].offset))
end
--]]

-- Write output file

out_file = io.open("out/Symbols.mlb", "w")
for i = 1, #output do
    --print("OUT:", output[i])
    out_file:write(output[i], "\n")
end
out_file:close()

print("...done!")
