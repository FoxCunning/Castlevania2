local in_name = "Castlevania2.nes"

local fdin = io.open(in_name, "rb")
if fdin == nil then
    print("'Castlevania2.nes' not found. Please enter full path to ROM file.")
    print("(Leave empty to abort)")
    in_name = io.read()
    print("\n")
    fdin = assert(io.open(in_name, "rb"))
end

if in_name == "" then
    do return 1 end
end

-- Skip header
local data = fdin:read(16)
-- Skip PRG ROM
data = fdin:read(128*1024)
-- Read CHR ROM
data = fdin:read(128*1024)

fdin:close()

-- Write to output
local fdout = assert(io.open("CHR_ROM.chr", "wb"))
fdout:write(data)
fdout:close()

do return 0 end
