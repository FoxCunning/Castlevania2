    TempPtr00_lo = $00                          ; $00
    TempPtr00_hi = $01                          ; $01
    TempPtr02_lo = $02                          ; $02
    TempPtr02_hi = $03                          ; $03
    Temp07 = $07                                ; $07
    TempPtr08_lo = $08                          ; $08
    TempPtr08_hi = $09                          ; $09

	ObstaclePointerLo = $0A						; $0A
	
	Unknown10_CollisionAndScrollingTemp = $10	; $10
	
	Unknown13_Horizontal_32pixelUnitForObject = $13		; $13
	Unknown14_Horizontal_256pixelUnitForObject = $14	; $14

    MainMenuOptionIndex = $23                   ; $23
    RandomSeed = $2E                            ; $2E
    CurrentLevelMapType = $30                   ; $30
    Unknown39_From_XscrollingPositionDividedBy16 = $39  ; $39
    Unknown3B_From_8C8D_dividedBy16 = $3B       ; $3B
    ActorSpawnControlUnknown3C = $3C            ; $3C
    CurrentLevelData_Actors_PointerLo = $3D     ; $3D
    CurrentLevelData_Actors_PointerHi = $3E     ; $3E
    Unknown42 = $42                             ; $42
    InventoryBodyPartSelection = $4F            ; $4F
    CurrentLevelSceneNumber = $50               ; $50
    CurrentLevelSubRoomNumber = $51             ; $51
    CurrentXScrollingPositionPixels = $53       ; $53
    CurrentXScrollingPositionScreens = $54      ; $54
	LevelData_MetaTiles_pointerLo = $63			; $63
	LevelData_CategoryThresholds_pointerLo = $6E	; $6E
	LevelData_Screens_pointerLo = $70			; $70
	LevelData_Stairs_pointerLo = $72			; $72
	DialogText_Ycoord = $77						; $77
	DialogText_Saved_ID = $79					; $79
    DialogTextID = $7F                          ; $7F
    IsNightTime = $82                           ; $82
	CurrentDayBCD = $83							; $83
    CurrentYScrollingPositionPixels_Mod256 = $8C    ; $8C
    CurrentYScrollingPositionScreens_maybe = $8D    ; $8D
	
    Temp93 = $93                                ; $93
	Temp94 = $94								; $94

    SoundEffectRelatedPtrLo = $99               ; $99
    SoundEffectRelatedPtrHi = $9A               ; $9A
    Sound_PeriodTemp_Unknown9B_lo = $9B         ; $9B
    Sound_PeriodTemp_Unknown9B_hi = $9C         ; $9C
    Sound_StartSong_TrackDataPtr_Lo = $9D       ; $9D
    Sound_StartSong_TrackDataPtr_Hi = $9E       ; $9E

    SoundTrackPtrLo = $A1                       ; $A1
    SoundTrackPtrHi = $A2                       ; $A2
    Sound_RecordPtrLo = $A3                     ; $A3
    Sound_RecordPtrHi = $A4                     ; $A4
    Sound_TempA5 = $A5                          ; $A5
    Sound_TempPtrA7_lo = $A7                    ; $A7
    Sound_TempPtrA7_hi = $A8                    ; $A8
    Sound_FadeCounter = $A9                     ; $A9
    Sound_FadeMode = $AA                        ; $AA

    Sound_SongPausedFlag_Channel0_square0 = $AB         ; $AB
    Sound_CurrentSongNumber_Channel0_square0 = $B1      ; $B1
    Sound_CurrentSongNumber_Channel2_triangle = $B3     ; $B3
    Sound_CurrentSongNumber_Channel3_effectsquare = $B4 ; $B4
    Sound_CUrrentSongNumber_Channel5_Percussion = $B6   ; $B6
    Sound_TrackDataPointer1Lo_Channel0_square0 = $B7    ; $B7
	Sound_TrackDataPointer1Hi_Channel0_square0 = $BD	; $BD
    Sound_FlagsC3_Channel0_square0 = $C3                ; $C3
    Sound_ChannelTempoPossibly_Channel0_square0 = $C9   ; $C9
    Sound_ReturnPointerLo_Channel0_square0 = $CF        ; $CF
    Sound_ReturnPointerHi_Channel0_square0 = $D5        ; $D5
    Sound_LoopCounter_Channel0_square0 = $DB            ; $DB
	Sound_LoopBeginPointerLo_Channel0_square0 = $E1	    ; $E1
	Sound_LoopBeginPointerHi_Channel0_square0 = $E7	    ; $E7
	
	Input_CurrentJoyButtonsOrig = $F1				; $F1
    Input_NewJoyButtonsWork = $F5                   ; $F5
    Input_CurrentJoyButtonsWork = $F7               ; $F7

    Sound_CurrentPeriodLo = $0110                   ; $0110
    Sound_CurrentPeriodHi = $0115                   ; $0115
    Sound_CacheAPUreg3 = $011A                      ; $011A
    Sound_CacheAPUreg3_Channel2_Triangle = $011C    ; $011C
    Sound_CacheAPUreg2 = $011F                      ; $011F
    Sound_EffectTableResultLoNibble = $0124         ; $0124
    Sound_CacheAPUreg0and1_twonibbles = $0129       ; $0129
    Sound_CurrentOctavePossibly = $012E             ; $012E
    Sound_TabUnknown0131 = $0131                    ; $0131
    Sound_TabUnknown0134 = $0134                    ; $0134
    Sound_EffectTableIndex = $0136                  ; $0136
    Sound_TabUnknown0138 = $0138                    ; $0138
    Sound_TabUnknown013A_squarewavesonly = $013A    ; $013A
    Sound_TabUnknown013C_squarewavesonly = $013C    ; $013C
    Sound_TabUnknown013E = $013E                    ; $013E
    Sound_TabUnknown0140 = $0140                    ; $0140
    Sound_TabUnknown0146 = $0146                    ; $0146
    Sound_TabUnknown0148 = $0148                    ; $0148
    Sound_EffectRelated_Index = $014A               ; $014A
    Sound_EffectTableResultHiNibble = $014C         ; $104C
    Sound_TabUnknown014E = $014E                    ; $014E
    Sound_EffectRelatedBytesRead = $0150            ; $0150
    Sound_TabUnknown0152 = $0152                    ; $0152
    Sound_EffectRelatedBytesRead_Copy = $0154       ; $0154
    Sound_TabUnknown0156 = $0156                    ; $0156
    Sound_EffectRelatedLoopCounter = $0158          ; $0158
    Sound_TabUnknown015A = $015A                    ; $015A
    Sound_TempPtr015C_lo = $015C                    ; $015C
    Sound_CurrentLogicalChannel = $0164             ; $0164
    Sound_StartSong_MainPtrOffset = $0168           ; $0168
    Sound_StartSong_LatestSongIndex = $0169         ; $0169
    Sound_StartSong_NumTracksRemaining = $016A      ; $016A
    Sound_StartSong_CurrentLogicalChannel = $016B   ; $016B
    Sound_PCMsampleActive = $016C                   ; $016C

    ObjectCurrentPose1 = $0300                  ; $0300
    ObjectPaletteIndex = $0312                  ; $0312
    ObjectScreenYCoord = $0324                  ; $0324
    ObjectScreenYCoordFrac = $0336              ; $0336
    ObjectScreenXCoord = $0348                  ; $0348
    ObjectScreenXCoordFrac = $035A              ; $035A
    ObjectYSpeed = $036C                        ; $036C
    ObjectYSpeedFrac = $037E                    ; $037E
    ObjectXSpeed = $0390                        ; $0390

    ObjectType = $03B4                          ; $03B4
    ObjectDialogStatusFlag = $03C6              ; $03C6
    ObjectCurrentActionType = $03D8             ; $03D8
    ObjectPoseChangeCounter = $03EA             ; $03EA
    ObjectCurrentPose2 = $03FC                  ; $03FC

    ObjectFacingLeft = $0420                    ; $0420
    ObjectUnknown432 = $0432                    ; $0432

    ObjectAIvar1 = $0444                        ; $0444
    UnknownFlag0446 = $0446                     ; $0446
    ObjectAIvar2 = $0456                        ; $0456
    ObjectAIvar3 = $0468                        ; $0468
    Ending_PrimaryActionIndex = $047A           ; $047A
    ObjectAIvar4 = $048C                        ; $048C
    ObjectAIvar5 = $049E                        ; $049E
    ObjectAIvar6 = $04B0                        ; $04B0
    ObjectEnemyRemainingHP = $04C2              ; $04C2
    ObjectDialogTextIndex = $04D7               ; $04D7
	Unknown04ED_finalConfrontationRelated = $04ED	; $04ED
    ObjectStunCounter = $04F8                   ; $04F8

    APU_HW__4000_Reg0 = $4000                       ; $4000
    APU_HW__4001_Reg1_SweepControl = $4001          ; $4001
    APU_HW__4002_Reg2_WaveLengthLo = $4002          ; $4002
    APU_HW__4003_Reg3_WaveLengthHi = $4003          ; $4003
    APU_HW__4004_Reg0_channel1 = $4004              ; $4004
    APU_HW__4008_Reg0_channel2 = $4008              ; $4008
    APU_HW__400B_Reg3_channel2_WaveLengthHi = $400B ; $400B
    APU_HW__400C_Reg0_channel3 = $400C              ; $400C
    APU_HW__4010_PCM_IRQenableAndWaveLength = $4010 ; $4010
    APU_HW__4015_EnableChannelsMask = $4015         ; $4015