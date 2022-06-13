.segment "BANK_03"
; Offset in ROM: $0C000
.setcpu "6502X"

.feature org_per_seg
.feature pc_assignment

.include "globals.inc"


Simon_TryAvoidCollision:
                          ; If Simon's feet (X+0, Y+$10) are colliding with type $0 or $3, try:
                            ;   First move him left by 8 pixels:
                            ;   If still colliding, try moving right by $10 pixels:
	lda #$00
	sta Temp94
	@8004:
	lda #$00
	ldy #$10
	jsr Simon_CheckMapCollision
	beq @8011
	cmp #$03
	bne @8025
	@8011:
	ldx Temp94
	inc Temp94
	lda _data_C028_indexed,x
	cmp #$FF
	beq @8025
	clc
	adc ObjectScreenXCoord
	sta ObjectScreenXCoord
	bne @8004
	@8025:
	 jmp _func_C4F3
;------------------------------------------
_data_C028_indexed:
	.byte $F8,$10,$FF
SimonSetFacingToInverseOfA:
	eor #$01
	sta ObjectFacingLeft
_loc_C030:
	rts
;------------------------------------------
SwampTreadingTest:
	lda RemainingLaurelPower
	bne _loc_C030
	lda TimeFlag8F_TimeIsStopped
	and #$01
	beq _loc_C030
	lda #$00
	ldy #$08
	jsr Simon_CheckMapCollision
	cmp #$03
	bne _loc_C030
	lda TimeFlag8F_TimeIsStopped
	bmi @807D
	lda FrameCounter
	and #$1F
	bne @8056
	lda #$0D
	jsr AnyBankPlayTracks
	@8056:
	lda #$84
	sta SwampFlashCounter
	lda $6D
	ora $6C
	beq @8072
	ldx #$6C
	lda #$40
	ldy $6D
	bpl @806F
	jsr Inc16bitPointerAtX_by_A
	jmp @8072

	@806F:
	jsr Dec16bitPointerAtX_by_A
	@8072:
	 lda FrameCounter
	and #$0F
	bne _loc_C030
	lda #$01
	jmp DecreaseHPbyA

	@807D:
	  lda #$10
	jsr DecreaseHPbyA
	lda #$40
	sta ObjectStunCounter
	lda ObjectFacingLeft
	jsr SimonSetFacingToInverseOfA
	jmp SimonDamageKnockBack
;------------------------------------------
_func_C090:
	lda Unknown195_PossiblyScrollingRelated
	bne @8099
	lda $36
	beq @80C4
	@8099:
	lda ObjectCurrentActionType
	cmp #$04
	bne @80A3
	lda ObjectXSpeed
	@80A3:
	cmp #$03
	beq @80C4
	lda ObjectScreenYCoord
	cmp #$D0
	bcc @80C4
	jsr Object_CreateThreeWaterSplashes_AroundSimon
	lda #$01
	sta GameInDeathState
	lda #$88
	jsr _func_C0C5
	jsr AnyBankTerminateSound
	lda #$34
	jsr AnyBankPlayTracks
	pla
	pla
	@80C4:
	 rts
;------------------------------------------
_func_C0C5:
	sta $35
	lda #$F8
	sta ObjectScreenYCoord
	lda #$FF
	sta DeathStateRelatedFlagMaybe
	jmp Object_SetCurrentActionType_For_Simon
;------------------------------------------
_func_C0D3:
	lda ObjectCurrentActionType
	and #$0F
	tay
	beq @80EC
	dey
	beq @8100
	dec $35
	bne @80EB
	lda #$FF
	sta ObjectCurrentActionType
	lda #$01
	sta $35
	@80EB:
	rts

	@80EC:
	 jsr AnyBankTerminateSound
	lda #$34
	jsr AnyBankPlayTracks
	lda #$01
	sta GameInDeathState
	jsr DeleteSimonWhipObject
	lda #$81
	jmp Object_SetCurrentActionType_For_Simon

	@8100:
	  lda #$28
	sta TempPtr08_lo
	ldx #$00
	jsr Object_GravityAccelerateBy_Var08
	jsr Object_IncreaseYPositionByYVelocity
	ldy #$08
	jsr Simon_CheckMapCollision_LeftAndRight
	beq @8121
	lda #$36
	jsr SetObjectIndexToAutomaticSpriteDataTable_to_A_for_Simon
	lda #$78
	sta $35
	lda #$82
	sta ObjectCurrentActionType
	@8121:
	lda ObjectScreenYCoord
	cmp #$E0
	bcc _8145
	lda #$18
	jmp _func_C0C5

	_812D:
	  lda #$00
	sta $37
	sta $3A
	lda ObjectCurrentActionType
	cmp #$FF
	bne _8146
	dec $35
	bne _8145
	lda #$06
	sta CurrentPlotAction
	jsr _func_1C0B3
	_8145:
	rts

	_8146:
	 jsr _func_C0D3
	ldx #$00
	jmp ObjectLoadAutomaticSpriteNumber

	_814E:
	 lda #$00
	sta ObjectPaletteIndex
	beq _81A1
;------------------------------------------
_loc_C155:
	lda #$00
	sta $36
	jsr LoadLevelDataScreensPointerLo_Byte1_minus1_storeInY
	cpy Current_WhatUnknown57
	bne @8164
	lda #$FF
	sta $36
	@8164:
	lda DeathStateRelatedFlagMaybe
	bne _812D
	lda CurrentHP
	bne @8175
	lda #$FF
	sta DeathStateRelatedFlagMaybe
	lda #$80
	jmp Object_SetCurrentActionType_For_Simon

	@8175:
	ldy #$00
	lda ObjectCurrentActionType
	cmp #$07
	bcs @818B
	lda ObjectIndexToAutomaticSpriteDataTable
	cmp #$2C
	bne @8186
	iny
	@8186:
	cmp #$2B
	bne @818B
	iny
	@818B:
	 sty UnknownFlag04D6
	lda RemainingLaurelPower
	beq _814E
	lda FrameCounter
	and #$01
	beq @819C
	dec RemainingLaurelPower
	@819C:
	ldx #$00
	jsr Object_FlashPalette
	_81A1:
	  jsr _func_C090
	jsr SwampTreadingTest
	jsr _func_1D5C9
	jsr _func_C57B
	jsr _func_C227
	jsr _func_C1E9
	jsr _func_C2DE
	jsr _func_C4AA
	jsr _func_C38A
	lda _data_C1E3
	pha
	 lda _data_C1E2
	 pha
	  lda ObjectCurrentActionType
	  jsr JumpWithParams
_JumpPointerTable_C1CA:
	.word (SimonExecuteCurrentAction0_Idle) ;8723 (C723) ()
	.word (SimonExecuteCurrentAction1_Walking) ;8970 (C970) ()
	.word (SimonExecuteCurrentAction2_Jumping_5_Falling) ;89CD (C9CD) ()
	.word (SimonExecuteCurrentAction3_Ducking) ;8975 (C975) ()
	.word (SimonExecuteCurrentAction4_Whipping_Or_UsingWeapon) ;89A8 (C9A8) ()
	.word (SimonExecuteCurrentAction2_Jumping_5_Falling) ;89CD (C9CD) ()
	.word (SimonExecuteCurrentAction6_TakingDamageThrown) ;8A0E (CA0E) ()
	.word (SimonExecuteCurrentAction7_PositionSimonForStairs) ;8A22 (CA22) ()
	.word (SimonExecuteCurrentAction8_BeginStairsClimb) ;8A47 (CA47) ()
	.word (SimonExecuteCurrentAction9_StairsStand) ;8AD9 (CAD9) ()
	.word (SimonExecuteCurrentAction10_StairsClimb_Automatic) ;8A52 (CA52) ()
	.word (SimonExecuteCurrentAction11_Nothing)
_data_C1E2:
	.byte $E3
_data_C1E3:
	.byte $81,$A2,$00,$4C,$2A,$DD
_func_C1E9:
	lda UnknownFlag0446
	bne SimonExecuteCurrentAction11_Nothing
	lda $68
	bne SimonExecuteCurrentAction11_Nothing
	lda ScrollingIsLocked
	bne SimonExecuteCurrentAction11_Nothing
	lda ObjectScreenYCoord
	cmp #$70
	bcc @8205
	cmp #$90
	bcc SimonExecuteCurrentAction11_Nothing
	lda #$22
	bne @8207

	@8205:
	lda #$21
	@8207:
	 sta $68
	lda $68
	cmp #$21
	beq @8219
	jsr LoadLevelDataScreensPointerLo_Byte1_minus1_storeInY
	cpy Current_WhatUnknown57
	bne SimonExecuteCurrentAction11_Nothing
	jmp _827A

	@8219:
	lda Current_WhatUnknown57
	bne SimonExecuteCurrentAction11_Nothing
	lda CurrentYScrollingPositionPixels_Mod240
	ora $55
	bne SimonExecuteCurrentAction11_Nothing
	jmp _827A
;------------------------------------------
SimonExecuteCurrentAction11_Nothing:
	rts
;------------------------------------------
_func_C227:
	lda ObjectYSpeed
	bmi @823B
	bne @8237
	lda ObjectYSpeedFrac
	bne @8237
	lda #$00
	beq @823D

	@8237:
	lda #$02
	bne @823D

	@823B:
	 lda #$01
	@823D:
	  sta $68
	lda ScrollingIsLocked
	bne _827A
	lda UnknownFlag0446
	bne _827A
	lda $68
	tay
	beq _loc_C280
	dey
	beq @8269
	lda ObjectScreenYCoord
	cmp #$80
	bcc _827A
	jsr LoadLevelDataScreensPointerLo_Byte1_minus1_storeInY
	cpy Current_WhatUnknown57
	beq _827A
	lda ObjectYSpeed
	cmp #$02
	bcc _loc_C280
	lda #$40
	bne _loc_C27C

	@8269:
	lda ObjectScreenYCoord
	cmp #$81
	bcs _827A
	lda Current_WhatUnknown57
	bne _loc_C280
	lda CurrentYScrollingPositionPixels_Mod240
	ora $55
	bne _loc_C280
	_827A:
	   lda #$80
_loc_C27C:
	ora $68
	sta $68
_loc_C280:
	rts

	@8281:
	 lda $68
	and #$03
	cmp #$01
	beq @82AD
	lda ObjectYSpeed
	sec
	sbc #$02
	sta Temp93
	lda #$02
	@8293:
	clc
	adc CurrentYScrollingPositionPixels_Mod240
	sta CurrentYScrollingPositionPixels_Mod240
	lda ObjectScreenYCoordFrac
	clc
	adc ObjectYSpeedFrac
	sta ObjectScreenYCoordFrac
	lda ObjectScreenYCoord
	adc Temp93
	sta ObjectScreenYCoord
	jmp @832E

	@82AD:
	lda ObjectYSpeed
	clc
	adc #$01
	sta Temp93
	lda #$FF
	bne @8293

	_82B9:
	lda $68
	and #$03
	cmp #$01
	beq @82C7
	ldy #$01
	lda #$FF
	bne @82CB

	@82C7:
	ldy #$FF
	lda #$01
	@82CB:
	 sty TempPtr00_lo
	clc
	adc ObjectScreenYCoord
	sta ObjectScreenYCoord
	lda CurrentYScrollingPositionPixels_Mod240
	clc
	adc TempPtr00_lo
	sta CurrentYScrollingPositionPixels_Mod240
	jmp @832E
;------------------------------------------
_func_C2DE:
	lda ObjectScreenYCoord
	cmp #$10
	bcs @82F0
	lda #$11
	sta ObjectScreenYCoord
	lda #$00
	tay
	jsr Object0_SetYVelocity16bit_from_AY
	@82F0:
	lda Unknown195_PossiblyScrollingRelated
	bne @8300
	lda ObjectScreenYCoord
	cmp #$C4
	bcc @8300
	lda #$00
	sta ScrollingIsLocked
	@8300:
	lda CurrentYScrollingPositionPixels_Mod240
	sta $75
	lda Current_WhatUnknown57
	sta $76
	lda $68
	bne @830F
	jmp _loc_C378

	@830F:
	asl a
	bcs @8373
	asl a
	bcc @8318
	jmp @8281

	@8318:
	asl a
	bcs _82B9
	lda $55
	adc ObjectYSpeedFrac
	sta $55
	lda CurrentYScrollingPositionPixels_Mod240
	adc ObjectYSpeed
	sta CurrentYScrollingPositionPixels_Mod240
	lda ObjectYSpeed
	sta TempPtr00_lo
	@832E:
	  lda CurrentYScrollingPositionPixels_Mod240
	cmp #$E0
	bcc @834C
	lda TempPtr00_lo
	bpl @8343
	lda CurrentYScrollingPositionPixels_Mod240
	sbc #$20
	sta CurrentYScrollingPositionPixels_Mod240
	dec Current_WhatUnknown57
	jmp @834C

	@8343:
	lda CurrentYScrollingPositionPixels_Mod240
	clc
	adc #$20
	sta CurrentYScrollingPositionPixels_Mod240
	inc Current_WhatUnknown57
	@834C:
	 lda $68
	and #$03
	tay
	dey
	beq @8364
	jsr LoadLevelDataScreensPointerLo_Byte1_minus1_storeInY
	cpy Current_WhatUnknown57
	bne @8361
	lda #$00
	sta $55
	sta CurrentYScrollingPositionPixels_Mod240
	@8361:
	jmp _loc_C378

	@8364:
	 lda Current_WhatUnknown57
	bpl @8370
	lda #$00
	sta $55
	sta CurrentYScrollingPositionPixels_Mod240
	sta Current_WhatUnknown57
	@8370:
	jmp _loc_C378

	@8373:
	   ldx #$00
	jsr Object_IncreaseYPositionByYVelocity
_loc_C378:
	jsr _func_C85C
	lda TempPtr00_lo
	sta Temp94
	jsr _func_C851
	lda TempPtr00_lo
	sec
	sbc Temp94
	sta $3A
	rts
;------------------------------------------
_func_C38A:
	lda CurrentXScrollingPositionPixels
	sta $74
	lda $67
	and #$03
	tay
	bne @8398
	jmp _loc_C42F

	@8398:
	lda #$08
	dey
	beq @839F
	lda #$F8
	@839F:
	sta $06
	ldy #$00
	lda ObjectCurrentActionType
	cmp #$07
	bcs @83E9
	cmp #$02
	beq @83BC
	cmp #$05
	beq @83BC
	cmp #$03
	beq @83B8
	bne @83C3
	@83B8:
	ldy #$04
	bne @83C3

	@83BC:
	 lda ObjectYSpeed
	bmi @83C3
	ldy #$02
	@83C3:
	  lda _DataPointerTable_C49F,y
	sta Temp94
	lda _DataPointerTable_C49F+1,y
	sta Temp95
	ldy #$00
	@83CF:
	lda (Temp94),y
	cmp #$FF
	beq @83E9
	iny
	sty Temp97
	tay
	lda $06
	jsr Simon_CheckMapCollision
	beq @83E4
	cmp #$03
	bne _loc_C42F
	@83E4:
	ldy Temp97
	jmp @83CF

	@83E9:
	   ldy $67
	bmi @8429
	ldx #$00
	lda $6D
	bpl @83F4
	dex
	@83F4:
	stx Temp93
	lda $52
	clc
	adc $6C
	sta $52
	lda CurrentXScrollingPositionPixels
	adc $6D
	sta CurrentXScrollingPositionPixels
	lda CurrentXScrollingPositionScreens
	adc Temp93
	sta CurrentXScrollingPositionScreens
	dey
	beq @841A
	lda CurrentXScrollingPositionScreens
	bpl _loc_C42F
	lda #$00
	sta CurrentXScrollingPositionScreens
	sta CurrentXScrollingPositionPixels
	sta $52
	beq _loc_C42F

	@841A:
	jsr LoadLevelDataScreensPointerLo_Byte0_minus1_storeInY
	cpy CurrentXScrollingPositionScreens
	bne _loc_C42F
	lda #$00
	sta $52
	sta CurrentXScrollingPositionPixels
	beq _loc_C42F

	@8429:
	 jsr _func_C437
	jsr _func_C449
_loc_C42F:
	lda $74
	sec
	sbc CurrentXScrollingPositionPixels
	sta $37
	rts
;------------------------------------------
_func_C437:
	lda ObjectScreenXCoordFrac
	clc
	adc $6C
	sta ObjectScreenXCoordFrac
	lda ObjectScreenXCoord
	adc $6D
	sta ObjectScreenXCoord
	rts
;------------------------------------------
_func_C449:
	lda CurrentLevelSubRoomNumber
	and #$7F
	tay
	lda ObjectScreenXCoord
	cmp #$F0
	bcs @845A
	cmp #$10
	bcc @845E
	rts

	@845A:
	iny
	tya
	bne @847A
	@845E:
	 lda CurrentLevelMapType
	cmp #$05
	bne @8476
	lda #$00
	sta CurrentYScrollingPositionPixels_Mod240
	sta ObjectCurrentActionType
	sta ObjectYSpeed
	sta ObjectYSpeedFrac
	lda #$BD
	sta ObjectScreenYCoord
	@8476:
	dey
	tya
	ora #$80
	@847A:
	  sta CurrentLevelSubRoomNumber
	lda TimeFlag8F_TimeIsStopped
	cmp #$81
	beq @8486
	cmp #$01
	bne @848C
	@8486:
	ldy CurrentLevelSubRoomNumber
	cpy #$FF
	beq @8493
	@848C:
	 lda #$08
	@848E:
	sta PlotAction05_GameLoop_WhichAction
	jmp @D40B

	@8493:
	  cmp #$01
	beq @849B
	lda #$0B
	bne @848E

	@849B:
	lda #$09
	bne @848E
;------------------------------------------
_DataPointerTable_C49F:
	.word (DataTableEntry_C4A6) ;84A6 (C4A6) ()
	.word (DataTableEntry_C4A5) ;84A5 (C4A5) ()
	.word (DataTableEntry_C4A7) ;84A7 (C4A7) ()
DataTableEntry_C4A5:
	.byte $10
DataTableEntry_C4A6:
	.byte $08
DataTableEntry_C4A7:
	.byte $F0,$00,$FF
_func_C4AA:
	lda $6D
	bmi @84B6
	bne @84BA
	lda $6C
	bne @84BA
	beq @84BC
	@84B6:
	lda #$02
	bne @84BC

	@84BA:
	 lda #$01
	@84BC:
	  sta $67
	lda $67
	tay
	beq @84D7
	dey
	beq @84DE
	lda ObjectScreenXCoord
	cmp #$81
	bcs @84EC
	lda CurrentXScrollingPositionScreens
	bne @84D7
	lda CurrentXScrollingPositionPixels
	ora $52
	beq @84EC
	@84D7:
	  lda $67
	and #$03
	sta $67
	rts

	@84DE:
	 lda ObjectScreenXCoord
	cmp #$80
	bcc @84EC
	jsr LoadLevelDataScreensPointerLo_Byte0_minus1_storeInY
	cpy CurrentXScrollingPositionScreens
	bne @84D7
	@84EC:
	  lda $67
	ora #$80
	sta $67
	rts
;------------------------------------------
_func_C4F3:
	ldx #$00
_func_C4F5:
	jsr _func_C879
	lda TempPtr00_lo
	and #$F8
	sta Temp94
	jsr _func_C85C
	lda Temp94
	sec
	sbc TempPtr00_lo
	sta ObjectScreenYCoord,x
	@8509:
	 rts
;------------------------------------------
_data_C50A_indexed:
	.byte $00,$16,$0C,$1C,$00,$0E
_func_C510:
	lda ObjectDialogStatusFlag,x
	and #$01
	beq @8524
	lda ObjectScreenXCoord,x
	cmp #$80
	bcs @8522
	lda #$01
	bne @8524

	@8522:
	lda #$FF
	@8524:
	 sta Temp95
	lda #$00
	sta $98
	ldy Temp97
	lda _data_C50A_indexed,y
	beq @853B
	ldy ObjectFacingLeft,x
	bne @853B
	dec $98
	jsr Math_NegateA
	@853B:
	ldy Temp97
	iny
	clc
	adc ObjectScreenXCoord,x
	sta Temp94
	lda Temp95
	adc $98
	sta Temp95
	lda Temp94
	sec
	sbc ObjectScreenXCoord
	sta Temp94
	lda Temp95
	sbc #$00
	sta Temp95
	bcs @8569
	lda Temp94
	jsr Math_NegateA
	sta Temp94
	lda Temp95
	eor #$FF
	adc #$00
	sta Temp95
	@8569:
	lda Temp95
	bne @8573
	lda Temp94
	cmp _data_C50A_indexed,y
	rts

	@8573:
	sec
	_8574:
	rts

	_8575:
	lda ObjectXSpeed
	jmp @8582
;------------------------------------------
_func_C57B:
	lda ObjectCurrentActionType
	cmp #$04
	beq _8575
	@8582:
	ldy #$00
	cmp #$07
	bcs _8574
	cmp #$02
	beq @8594
	cmp #$05
	beq @8594
	cmp #$06
	bne @8595
	@8594:
	iny
	@8595:
	 sty Temp93
	ldx #$06
	@8599:
	 lda ObjectType,x
	cmp #$21
	beq @85B8
	cmp #$22
	beq @85BC
	cmp #$34
	beq @85B8
	cmp #$3D
	beq @85B4
	@85AC:
	inx
	cpx #$12
	bcc @8599
	jmp _loc_C632

	@85B4:
	lda #$01
	bne @85BE

	@85B8:
	 lda #$02
	bne @85BE

	@85BC:
	  lda #$00
	@85BE:
	   asl a
	sta Temp97
	lda Temp93
	bne @85C8
	jmp @85FA

	@85C8:
	lda ObjectYSpeed
	bpl @85D0
	jmp @85AC

	@85D0:
	lda ObjectAIvar4,x
	bne @85AC
	jsr _func_C510
	bcs @85AC
	lda ObjectScreenYCoord,x
	sec
	sbc ObjectScreenYCoord
	bcc @85AC
	cmp #$10
	bcs @85AC
	lda ObjectScreenYCoord,x
	sec
	sbc #$10
	sta ObjectScreenYCoord
	lda #$FF
	sta Ending_PrimaryActionIndex,x
	sta Unknown41
	jmp _loc_C658

	@85FA:
	 lda Ending_PrimaryActionIndex,x
	bne @8602
	jmp @85AC

	@8602:
	jsr _func_C510
	bcs @8623
	lda $6C
	clc
	adc ObjectXSpeedFrac,x
	sta $6C
	lda $6D
	adc ObjectXSpeed,x
	sta $6D
	lda ObjectYSpeedFrac,x
	sta ObjectYSpeedFrac
	lda ObjectYSpeed,x
	sta ObjectYSpeed
	rts

	@8623:
	lda #$00
	sta Ending_PrimaryActionIndex,x
	sta Unknown41
	lda #$08
	sta ObjectAIvar4,x
	jmp _loc_C6E0
;------------------------------------------
_loc_C632:
	lda Temp93
	beq _loc_C684
	lda ObjectYSpeed
	bmi _loc_C67E
	jsr _func_C6FF
	ldy #$10
	jsr Simon_CheckMapCollision_LeftAndRight
	cmp #$01
	beq @8655
	cmp #$02
	beq @8655
	lda $04
	cmp #$01
	beq @8655
	cmp #$02
	bne _loc_C67E
	@8655:
	   jsr _func_C4F3
_loc_C658:
	lda UnknownFlag0446
	bne @8662
	lda #$07
	jsr AnyBankPlayTracks
	@8662:
	lda #$00
	sta UnknownFlag0446
	tay
	jsr Object0_SetYVelocity16bit_from_AY
	jsr Clear_Unknown6Cand6D
	ldy #$00
	lda ObjectCurrentActionType
	cmp #$04
	bne @867B
	sty ObjectXSpeed
	rts

	@867B:
	sty ObjectCurrentActionType
_loc_C67E:
	rts

	.byte $A5,$04,$D0,$D2,$60
_loc_C684:
	jsr _func_C711
	ldy #$10
	lda ObjectCurrentActionType
	cmp #$04
	bne @8693
	lda ObjectXSpeed
	@8693:
	cmp #$03
	bne @8699
	ldy #$0C
	@8699:
	jsr Simon_CheckMapCollision_LeftAndRight
	cmp #$01
	beq @86A4
	cmp #$02
	bne @86D8
	@86A4:
	  lda #$00
	sta Unknown43
	lda CurrentXScrollingPositionPixels
	sta CurrentXScrollingPositionPixels_BackupForDeath
	lda CurrentXScrollingPositionScreens
	sta CurrentXScrollingPositionScreens_BackupForDeath
	lda CurrentYScrollingPositionPixels_Mod240
	sta CurrentYScrollingPositionPixels_Mod240_BackupForDeath
	lda Current_WhatUnknown57
	sta Current_WhatUnknown57_BackupForDeath
	lda ObjectScreenXCoord
	sta SimonScreenXCoord_BackupForDeath
	lda ObjectScreenYCoord
	sta SimonScreenYCoord_BackupForDeath
	lda CurrentLevelMapType
	sta CurrentLevelMapType_BackupForDeath
	lda CurrentLevelSceneNumber
	sta CurrentLevelSceneNumber_BackupForDeath
	lda CurrentLevelSubRoomNumber
	sta CurrentLevelSubroomNumber_BackupForDeath
	rts

	@86D8:
	 lda $04
	beq _loc_C6E0
	cmp #$03
	bne @86A4
_loc_C6E0:
	lda #$01
	jsr CheckIfBoneHeld_SetSimonAutomaticSprite_To_Table_Atimes2plusBone
	jsr Clear_Unknown6Cand6D
	lda #$05
	jmp Object_SetCurrentActionType_For_Simon
;------------------------------------------
Simon_CheckMapCollision_LeftAndRight:
	sty Temp94
	lda #$FA
	ldy Temp94
	jsr Simon_CheckMapCollision
	sta $04
	lda #$06
	ldy Temp94
	jmp Simon_CheckMapCollision
;------------------------------------------
_func_C6FF:
	lda TimeFlag8F_TimeIsStopped
	and #$01
	beq _8722
	ldy #$00
	jsr Simon_CheckMapCollision_LeftAndRight
	cmp #$03
	bne _8722
	jmp @8655
;------------------------------------------
_func_C711:
	lda TimeFlag8F_TimeIsStopped
	and #$01
	beq _8722
	ldy #$00
	jsr Simon_CheckMapCollision_LeftAndRight
	cmp #$03
	bne _8722
	pla
	pla
	_8722:
	rts
;------------------------------------------
SimonExecuteCurrentAction0_Idle:
	lda #$00
ItemMenuPauseScreen_JoyButtons_check:
	sta Temp07
	lda Input_NewJoyButtonsWork
	and #$40
	beq @8730
	jmp UnknownContextCAD9_JoyButtons_40_B_pressed_UseWeapon

	@8730:
	lda Input_NewJoyButtonsWork
	and #$80
	beq @8739
	jmp UnknownContextCAD9_JoyButtons_80_A_pressed_Jump_maybe

	@8739:
	lda Input_CurrentJoyButtonsWork
	lsr a
	bcs ItemMenuPauseScreen_JoyButtons_01_Rt_pressed
	lsr a
	bcs ItemMenuPauseScreen_JoyButtons_02_Lt_pressed
	lsr a
	bcs ItemMenuPauseScreen_JoyButtons_04_Dn_pressed
	lsr a
	bcc ItemMenuPauseScreen_JoyButtons_nothing_pressed
	jmp ItemMenuPauseScreen_JoyButtons_08_Up_pressed
;------------------------------------------
ItemMenuPauseScreen_JoyButtons_nothing_pressed:
	lda #$00
	jsr CheckIfBoneHeld_SetSimonAutomaticSprite_To_Table_Atimes2plusBone
	jsr Clear_Unknown6Cand6D
	jmp Object_SetCurrentActionType_For_Simon
;------------------------------------------
ItemMenuPauseScreen_JoyButtons_01_Rt_pressed:
	ldy #$01
	lda #$00
	jsr ItemMenuPauseScreen_CursorMovement_Horizontal_ByY
	lda #$01
_loc_C75E:
	sta ObjectFacingLeft
	lda Temp07
	bne @876A
	lda #$00
	jsr SetObjectIndexToAutomaticSpriteDataTable_to_A_for_Simon
	@876A:
	lda #$01
	jmp Object_SetCurrentActionType_For_Simon
;------------------------------------------
ItemMenuPauseScreen_JoyButtons_02_Lt_pressed:
	ldy #$FF
	lda #$00
	jsr ItemMenuPauseScreen_CursorMovement_Horizontal_ByY
	lda #$00
	beq _loc_C75E
;------------------------------------------
Clear_Unknown6Cand6D:
	lda #$00
	tay
	sta $6C
	sty $6D
	rts
;------------------------------------------
ItemMenuPauseScreen_JoyButtons_04_Dn_pressed:
	lda #$00
	jsr UnknownFunc1D428
	lda ObjectScreenYCoord
	clc
	adc #$04
	sta ObjectScreenYCoord
	lda #$01
	jsr CheckIfBoneHeld_SetSimonAutomaticSprite_To_Table_Atimes2plusBone
	lda #$03
	sta ObjectCurrentActionType
	jmp Clear_Unknown6Cand6D
;------------------------------------------
ItemMenuPauseScreen_JoyButtons_08_Up_pressed:
	lda #$01
	jsr UnknownFunc1D428
	lda TimeFlag8F_TimeIsStopped
	bmi @87B0
	lda CurrentHourBCD
	cmp #$06
	bcc @87C1
	cmp #$18
	bcs @87C1
	@87B0:
	lda TimeFlag8F_TimeIsStopped
	and #$01
	bne @87C1
	lda #$00
	ldy #$04
	jsr Simon_CheckMapCollision
	cmp #$03
	beq @87C4
	@87C1:
	 jmp ItemMenuPauseScreen_JoyButtons_nothing_pressed

	@87C4:
	  lda CurrentXScrollingPositionPixels
	sta CurrentXScrollingPositionPixels_BackupForExitRoom
	lda CurrentXScrollingPositionScreens
	sta CurrentXScrollingPositionScreens_BackupForExitRoom
	lda CurrentYScrollingPositionPixels_Mod240
	sta CurrentYScrollingPositionPixels_Mod240_BackupForExitRoom
	lda Current_WhatUnknown57
	sta Current_WhatUnknown57_BackupForExitRoom
	lda ObjectScreenXCoord
	sta SimonScreenXCoord_BackupForExitRoom
	lda ObjectScreenYCoord
	sta SimonScreenYCoord_BackupForExitRoom
	lda CurrentLevelSceneNumber
	sta CurrentLevelSceneNumber_BackupForExitRoom
	lda TimeFlag8F_TimeIsStopped
	bpl @87FE
	lda CurrentLevelSceneNumber
	clc
	adc #$06
	sta CurrentLevelSceneNumber
	lda #$00
	sta CurrentLevelSubRoomNumber
	lda #$0B
	sta PlotAction05_GameLoop_WhichAction
	jmp ItemMenuPauseScreen_JoyButtons_nothing_pressed

	@87FE:
	lda CurrentLevelSceneNumber
	asl a
	asl a
	sta TempPtr00_lo
	lda CurrentXScrollingPositionPixels
	clc
	adc ObjectScreenXCoord
	lda CurrentXScrollingPositionScreens
	adc TempPtr00_lo
	tay
	lda _data_C81F_indexed,y
	sta CurrentLevelSceneNumber
	lda #$00
	sta CurrentLevelSubRoomNumber
	lda #$09
	sta PlotAction05_GameLoop_WhichAction
	jmp ItemMenuPauseScreen_JoyButtons_nothing_pressed
;------------------------------------------
_data_C81F_indexed:
	.byte $08,$08,$07,$09,$0A,$07,$07,$0B,$0C,$0D,$0D,$0E,$0F,$0F,$07,$10
	.byte $11,$11,$12,$13,$14,$14,$07,$15,$16,$16,$17,$17
_func_C83B:
	ldy Current_WhatUnknown57
	lda CurrentYScrollingPositionPixels_Mod240
	clc
	adc TempPtr00_lo
	bcs @8848
	cmp #$E0
	bcc @884C
	@8848:
	iny
	clc
	adc #$20
	@884C:
	 sta TempPtr00_lo
	sty TempPtr00_hi
	rts
;------------------------------------------
_func_C851:
	ldy $76
	lda $75
	jmp @8860

	_8858:
	ldy #$00
	beq _886B
;------------------------------------------
_func_C85C:
	ldy Current_WhatUnknown57
	lda CurrentYScrollingPositionPixels_Mod240
	@8860:
	sec
	sbc #$0D
	bcs _886B
	dey
	bmi _8858
	sec
	sbc #$20
	_886B:
	 sta TempPtr00_lo
	sty TempPtr00_hi
	jmp @8886

	_8872:
	lda #$00
	sta TempPtr00_lo
	sta TempPtr00_hi
	rts
;------------------------------------------
_func_C879:
	lda ObjectScreenYCoord,x
	sec
	sbc #$0D
	bcc _8872
	sta TempPtr00_lo
	jsr _func_C83B
	@8886:
	ldy TempPtr00_hi
	lda #$00
	sta TempPtr00_hi
	@888C:
	dey
	bmi @8898
	clc
	adc #$E0
	bcc @888C
	inc TempPtr00_hi
	bne @888C
	@8898:
	stx $96
	ldx #$00
	jsr Inc16bitPointerAtX_by_A
	ldx $96
	rts
;------------------------------------------
UnknownFunctionC8A2_CalledFrom1D42A:
	ldx #$00
	jsr _func_C879
	lda CurrentXScrollingPositionPixels
	clc
	adc ObjectScreenXCoord
	sta TempPtr02_lo
	lda CurrentXScrollingPositionScreens
	adc #$00
	sta TempPtr02_hi
	rts
;------------------------------------------
_func_C8B6:
	ldx #$06
	@88B8:
	 lda ObjectType,x
	cmp #$21
	beq @88D2
	cmp #$22
	beq @88D2
	cmp #$34
	beq @88D2
	cmp #$3D
	beq @88D2
	@88CB:
	inx
	cpx #$12
	bcc @88B8
	clc
	rts

	@88D2:
	lda Ending_PrimaryActionIndex,x
	beq @88CB
	sec
	rts
;------------------------------------------
UnknownContextCAD9_JoyButtons_80_A_pressed_Jump_maybe:
	jsr _func_C8B6
	bcc @88F4
	lda #$00
	sta Ending_PrimaryActionIndex,x
	sta Unknown41
	lda ObjectYSpeedFrac,x
	clc
	adc #$20
	tay
	lda ObjectYSpeed,x
	adc #$FC
	jmp @88F8

	@88F4:
	lda #$FC
	ldy #$00
	@88F8:
	 jsr Object0_SetYVelocity16bit_from_AY
	lda #$01
	jsr CheckIfBoneHeld_SetSimonAutomaticSprite_To_Table_Atimes2plusBone
	lda #$01
	sta UnknownFlag0446
	lda Input_CurrentJoyButtonsWork
	lsr a
	bcs @891A
	lsr a
	bcs @890F
	bcc @8926
	@890F:
	ldy #$FF
	lda #$00
	jsr ItemMenuPauseScreen_CursorMovement_Horizontal_ByY
	lda #$00
	beq @8923

	@891A:
	 ldy #$01
	lda #$00
	jsr ItemMenuPauseScreen_CursorMovement_Horizontal_ByY
	lda #$01
	@8923:
	  sta ObjectFacingLeft
	@8926:
	   lda #$02
	jmp Object_SetCurrentActionType_For_Simon
;------------------------------------------
UnknownContextCAD9_JoyButtons_40_B_pressed_UseWeapon:
	jsr Clear_Unknown6Cand6D
	@892E:
	   lda ObjectCurrentActionType
	cmp #$04
	beq @8938
	sta ObjectXSpeed
	@8938:
	lda #$04
	sta ObjectCurrentActionType
	lda Input_CurrentJoyButtonsWork
	and #$08
	bne SimonUseSpecialWeapon
_loc_C943:
	jmp SimonUseWhip
;------------------------------------------
SimonUseSpecialWeapon:
	jsr SpecialWeaponUse_Try_FindSlot
	bcc _loc_C943
	lda ObjectXSpeed
	cmp #$09
	beq @8957
	lda #$04
	@8954:
	  jmp SetObjectIndexToAutomaticSpriteDataTable_to_A_for_Simon

	@8957:
	lda ObjectFacingLeft
	bne @8969
	lda ObjectAIvar3
	beq @8965
	@8961:
	 lda #$2D
	bne @8954

	@8965:
	  lda #$2E
	bne @8954

	@8969:
	 lda ObjectAIvar3
	bne @8965
	beq @8961
SimonExecuteCurrentAction1_Walking:
	lda #$FF
	jmp ItemMenuPauseScreen_JoyButtons_check
;------------------------------------------
SimonExecuteCurrentAction3_Ducking:
	jsr Clear_Unknown6Cand6D
	lda Input_CurrentJoyButtonsWork
	and #$04
	bne @898C
	lda ObjectScreenYCoord
	sec
	sbc #$04
	sta ObjectScreenYCoord
	lda #$00
	jmp Object_SetCurrentActionType_For_Simon

	@898C:
	lda Input_NewJoyButtonsWork
	and #$40
	beq @8995
	jmp UnknownContextCAD9_JoyButtons_40_B_pressed_UseWeapon

	@8995:
	lda Input_CurrentJoyButtonsWork
	lsr a
	bcs @899E
	lsr a
	bcs @89A2
	rts

	@899E:
	ldy #$01
	bne @89A4

	@89A2:
	 ldy #$00
	@89A4:
	  sty ObjectFacingLeft
	rts
;------------------------------------------
SimonExecuteCurrentAction4_Whipping_Or_UsingWeapon:
	lda $03B5
	bne @89BC
	lda ObjectCurrentPose2
	cmp #$04
	bne @89BC
	lda ObjectPoseChangeCounter
	bne @89BC
	jsr _func_1DC86
	@89BC:
	lda ObjectXSpeed
	cmp #$02
	beq @89CA
	cmp #$05
	beq @89CA
	jmp Clear_Unknown6Cand6D

	@89CA:
	jmp UnknownContextCAD9_JoyButtons_80_A_pressed_Jump
;------------------------------------------
SimonExecuteCurrentAction2_Jumping_5_Falling:
	lda Input_NewJoyButtonsWork
	and #$40
	beq UnknownContextCAD9_JoyButtons_80_A_pressed_Jump
	jmp @892E
;------------------------------------------
UnknownContextCAD9_JoyButtons_80_A_pressed_Jump:
	lda ObjectYSpeed
	bpl @89EE
	ldy #$F0
	jsr Simon_CheckMapCollision_LeftAndRight
	bne @89E8
	lda $04
	bne @89E8
	beq @89EE
	@89E8:
	lda #$00
	tay
	jsr Object0_SetYVelocity16bit_from_AY
	@89EE:
	 lda #$38
	sta TempPtr08_lo
	ldx #$00
	jsr Object_GravityAccelerateBy_Var08
	bmi @8A0D
	cmp #$03
	bcc @8A04
	ldy #$00
	lda #$03
	jmp Object0_SetYVelocity16bit_from_AY

	@8A04:
	cmp #$02
	bcc @8A0D
	lda #$00
	sta UnknownFlag0446
	@8A0D:
	 rts
;------------------------------------------
SimonExecuteCurrentAction6_TakingDamageThrown:
	lda #$01
	sta UnknownFlag0446
	dec ObjectAIvar6
	bne UnknownContextCAD9_JoyButtons_80_A_pressed_Jump
	lda #$00
	sta UnknownFlag0446
	lda #$02
	jmp Object_SetCurrentActionType_For_Simon
;------------------------------------------
SimonExecuteCurrentAction7_PositionSimonForStairs:
	lda ObjectAIvar4
	beq @8A3A
	dec ObjectAIvar4
	lda ObjectAIvar5
	beq @8A33
	ldy #$FF
	bne @8A35

	@8A33:
	ldy #$01
	@8A35:
	 lda #$00
	jmp ItemMenuPauseScreen_CursorMovement_Horizontal_ByY

	@8A3A:
	  jsr Clear_Unknown6Cand6D
	lda #$00
	jsr CheckIfBoneHeld_SetSimonAutomaticSprite_To_Table_Atimes2plusBone
	lda #$08
	jmp Object_SetCurrentActionType_For_Simon
;------------------------------------------
SimonExecuteCurrentAction8_BeginStairsClimb:
	lda ObjectEnemyRemainingHP
	bne @8A4F
	jmp Simon_InStairs_JoyButtons_04_Dn_pressed

	@8A4F:
	jmp Simon_InStairs_JoyButtons_08_Up_pressed
;------------------------------------------
SimonExecuteCurrentAction10_StairsClimb_Automatic:
	lda Ending_PrimaryActionIndex
	beq @8A78
	dec Ending_PrimaryActionIndex
	lda ObjectAIvar1
	beq @8A63
	dec ObjectAIvar1
	rts

	@8A63:
	lda ObjectAIvar2
	asl a
	tay
	lda _data_CB76_indexed,y
	sta ObjectCurrentPose1
	lda _data_CB77_indexed,y
	sta ObjectAIvar1
	inc ObjectAIvar2
	rts

	@8A78:
	 lda #$02
	clc
	adc ObjectScreenYCoord
	sta ObjectScreenYCoord
	jsr _func_C4F3
	lda #$00
	sta ObjectScreenXCoordFrac
	sta ObjectScreenYCoordFrac
	lda ObjectYSpeed
	bmi @8ABB
	lda #$00
	ldy #$12
	jsr Simon_CheckMapCollision
	beq @8AD5
	cmp #$03
	beq @8AD5
	lda #$00
	ldy #$1A
	jsr Simon_CheckMapCollision
	beq @8AD5
	cmp #$03
	beq @8AD5
	@8AAB:
	 lda #$00
	jsr CheckIfBoneHeld_SetSimonAutomaticSprite_To_Table_Atimes2plusBone
	lda #$00
	@8AB2:
	sta ObjectCurrentActionType
	jsr Clear_Unknown6Cand6D
	jmp Object0_SetYVelocity16bit_from_AY

	@8ABB:
	lda #$00
	ldy #$12
	jsr Simon_CheckMapCollision
	beq @8AD5
	cmp #$03
	beq @8AD5
	lda #$00
	ldy #$0A
	jsr Simon_CheckMapCollision
	beq @8AAB
	cmp #$03
	beq @8AAB
	@8AD5:
	 lda #$09
	bne @8AB2
;------------------------------------------
SimonExecuteCurrentAction9_StairsStand:
	lda Input_CurrentJoyButtonsWork
	and #$40
	beq @8AE2
	jmp UnknownContextCAD9_JoyButtons_40_B_pressed_UseWeapon

	@8AE2:
	lda Input_CurrentJoyButtonsWork
	lsr a
	bcs Simon_InStairs_JoyButtons_01_Rt_pressed
	lsr a
	bcs Simon_InStairs_JoyButtons_02_Lt_pressed
	lsr a
	bcs Simon_InStairs_JoyButtons_04_Dn_pressed
	lsr a
	bcs Simon_InStairs_JoyButtons_08_Up_pressed
	rts
;------------------------------------------
Simon_InStairs_JoyButtons_01_Rt_pressed:
	lda #$01
	sta ObjectFacingLeft
	lda ObjectAIvar3
	bne @8B02
	ldx #$00
	ldy #$00
	jmp _8B3C

	@8B02:
	ldx #$03
	ldy #$08
	jmp _8B3C
;------------------------------------------
Simon_InStairs_JoyButtons_02_Lt_pressed:
	lda #$00
	tax
	sta ObjectFacingLeft
	ldy #$04
	lda ObjectAIvar3
	bne @8B1A
	ldx #$03
	ldy #$0C
	@8B1A:
	jmp _8B3C		; $8B3C
;------------------------------------------
Simon_InStairs_JoyButtons_08_Up_pressed:
	ldx #$03
	lda ObjectAIvar3
	sta ObjectFacingLeft
	ldy #$08
	bne _loc_CB33
;------------------------------------------
Simon_InStairs_JoyButtons_04_Dn_pressed:
	ldx #$00
	lda ObjectAIvar3
	jsr SimonSetFacingToInverseOfA
	ldy #$00
_loc_CB33:
	lda ObjectFacingLeft
	bne _8B3C
	iny
	iny
	iny
	iny
	_8B3C:
	 stx ObjectAIvar2
	lda _data_CB66_indexed,y
	sta $6D
	lda _data_CB67_indexed,y
	sta $6C
	lda _data_CB68_indexed,y
	sta ObjectYSpeed
	lda _data_CB69_indexed,y
	sta ObjectYSpeedFrac
	lda #$00
	sta ObjectAIvar1
	lda _data_CB65
	sta Ending_PrimaryActionIndex
	lda #$0A
	jmp Object_SetCurrentActionType_For_Simon
;------------------------------------------
_data_CB65:
	.byte $0F
_data_CB66_indexed:
	.byte $00
_data_CB67_indexed:
	.byte $80
_data_CB68_indexed:
	.byte $00
_data_CB69_indexed:
	.byte $80,$FF,$80,$00,$80,$00,$80,$FF,$80,$FF,$80,$FF,$80
_data_CB76_indexed:
	.byte $06
_data_CB77_indexed:
	.byte $04,$07,$08,$06,$FF,$08,$04,$09,$08,$08,$FF
DialogTextTable:
	.word (DialogTextTable_CC74) ;8C74 (CC74) ([8:6][A:7])
	.word (DialogTextTable_CC9B) ;8C9B (CC9B) ([8:6][A:7])
	.word (DialogTextTable_CCCE) ;8CCE (CCCE) ([8:6][A:7])
	.word (DialogTextTable_CCCE) ;8CCE (CCCE) ([8:6][A:7])
	.word (DialogTextTable_CCD7) ;8CD7 (CCD7) ([8:6][A:7])
	.word (DialogTextTable_CCFF) ;8CFF (CCFF) ([8:6][A:7])
	.word (DialogTextTable_CD27) ;8D27 (CD27) ([8:6][A:7])
	.word (DialogTextTable_CD4F) ;8D4F (CD4F) ([8:6][A:7])
	.word (DialogTextTable_CD77) ;8D77 (CD77) ([8:6][A:7])
	.word (DialogTextTable_CD9F) ;8D9F (CD9F) ([8:6][A:7])
	.word (DialogTextTable_CDC7) ;8DC7 (CDC7) ([8:6][A:7])
	.word (DialogTextTable_CDEF) ;8DEF (CDEF) ([8:6][A:7])
	.word (DialogTextTable_CE23) ;8E23 (CE23) ([8:6][A:7])
	.word (DialogTextTable_CE3C) ;8E3C (CE3C) ([8:6][A:7])
	.word (DialogTextTable_CE79) ;8E79 (CE79) ([8:6][A:7])
	.word (DialogTextTable_CEAE) ;8EAE (CEAE) ([8:6][A:7])
	.word (DialogTextTable_CEC8) ;8EC8 (CEC8) ([8:6][A:7])
	.word (DialogTextTable_CEFB) ;8EFB (CEFB) ([8:6][A:7])
	.word (DialogTextTable_CF28) ;8F28 (CF28) ([8:6][A:7])
	.word (DialogTextTable_CF41) ;8F41 (CF41) ([8:6][A:7])
	.word (DialogTextTable_CF58) ;8F58 (CF58) ([8:6][A:7])
	.word (DialogTextTable_CF83) ;8F83 (CF83) ([8:6][A:7])
	.word (DialogTextTable_CF83) ;8F83 (CF83) ([8:6][A:7])
	.word (DialogTextTable_CF83) ;8F83 (CF83) ([8:6][A:7])
	.word (DialogTextTable_CF8C) ;8F8C (CF8C) ([8:6][A:7])
	.word (DialogTextTable_CFAC) ;8FAC (CFAC) ([8:6][A:7])
	.word (DialogTextTable_CFCE) ;8FCE (CFCE) ([8:6][A:7])
	.word (DialogTextTable_CFF2) ;8FF2 (CFF2) ([8:6][A:7])
	.word (DialogTextTable_D013) ;9013 (D013) ([8:6][A:7])
	.word (DialogTextTable_D034) ;9034 (D034) ([8:6][A:7])
	.word (DialogTextTable_D04C) ;904C (D04C) ([8:6][A:7])
	.word (DialogTextTable_D084) ;9084 (D084) ([8:6][A:7])
	.word (DialogTextTable_D0B7) ;90B7 (D0B7) ([8:6][A:7])
	.word (DialogTextTable_D0E1) ;90E1 (D0E1) ([8:6][A:7])
	.word (DialogTextTable_D10D) ;910D (D10D) ([8:6][A:7])
	.word (DialogTextTable_D135) ;9135 (D135) ([8:6][A:7])
	.word (DialogTextTable_D16C) ;916C (D16C) ([8:6][A:7])
	.word (DialogTextTable_D1A1) ;91A1 (D1A1) ([8:6][A:7])
	.word (DialogTextTable_D1C7) ;91C7 (D1C7) ([8:6][A:7])
	.word (DialogTextTable_D1E8) ;91E8 (D1E8) ([8:6][A:7])
	.word (DialogTextTable_D1E8) ;91E8 (D1E8) ([8:6][A:7])
	.word (DialogTextTable_D1E8) ;91E8 (D1E8) ([8:6][A:7])
	.word (DialogTextTable_D1E8) ;91E8 (D1E8) ([8:6][A:7])
	.word (DialogTextTable_D1E8) ;91E8 (D1E8) ([8:6][A:7])
	.word (DialogTextTable_D1E8) ;91E8 (D1E8) ([8:6][A:7])
	.word (DialogTextTable_D1E8) ;91E8 (D1E8) ([8:6][A:7])
	.word (DialogTextTable_D1E8) ;91E8 (D1E8) ([8:6][A:7])
	.word (DialogTextTable_D1F1) ;91F1 (D1F1) ([8:6][A:7])
	.word (DialogTextTable_D20B) ;920B (D20B) ([8:6][A:7])
	.word (DialogTextTable_D223) ;9223 (D223) ([8:6][A:7])
	.word (DialogTextTable_D23A) ;923A (D23A) ([8:6][A:7])
	.word (DialogTextTable_D24F) ;924F (D24F) ([8:6][A:7])
	.word (DialogTextTable_D261) ;9261 (D261) ([8:6][A:7])
	.word (DialogTextTable_D278) ;9278 (D278) ([8:6][A:7])
	.word (DialogTextTable_D290) ;9290 (D290) ([8:6][A:7])
	.word (DialogTextTable_D2A7) ;92A7 (D2A7) ([8:6][A:7])
	.word (DialogTextTable_D2BF) ;92BF (D2BF) ([8:6][A:7])
	.word (DialogTextTable_D2F6) ;92F6 (D2F6) ([8:6][A:7])
	.word (DialogTextTable_D333) ;9333 (D333) ([8:6][A:7])
	.word (DialogTextTable_D36A) ;936A (D36A) ([8:6][A:7])
	.word (DialogTextTable_D39F) ;939F (D39F) ([8:6][A:7])
	.word (DialogTextTable_D3D7) ;93D7 (D3D7) ([8:6][A:7])
	.word (DialogTextTable_D40F) ;940F (D40F) ([8:6][A:7])
	.word (DialogTextTable_D435) ;9435 (D435) ([8:6][A:7])
	.word (DialogTextTable_D468) ;9468 (D468) ([8:6][A:7])
	.word (DialogTextTable_D488) ;9488 (D488) ([8:6][A:7])
	.word (DialogTextTable_D4B6) ;94B6 (D4B6) ([8:6][A:7])
	.word (DialogTextTable_D4ED) ;94ED (D4ED) ([8:6][A:7])
	.word (DialogTextTable_D516) ;9516 (D516) ([8:6][A:7])
	.word (DialogTextTable_D550) ;9550 (D550) ([8:6][A:7])
	.word (DialogTextTable_D584) ;9584 (D584) ([8:6][A:7])
	.word (DialogTextTable_D5AA) ;95AA (D5AA) ([8:6][A:7])
	.word (DialogTextTable_D5C4) ;95C4 (D5C4) ([8:6][A:7])
	.word (DialogTextTable_D5F7) ;95F7 (D5F7) ([8:6][A:7])
	.word (DialogTextTable_D628) ;9628 (D628) ([8:6][A:7])
	.word (DialogTextTable_D646) ;9646 (D646) ([8:6][A:7])
	.word (DialogTextTable_D66B) ;966B (D66B) ([8:6][A:7])
	.word (DialogTextTable_D6A0) ;96A0 (D6A0) ([8:6][A:7])
	.word (DialogTextTable_D6D2) ;96D2 (D6D2) ([8:6][A:7])
	.word (DialogTextTable_D706) ;9706 (D706) ([8:6][A:7])
	.word (DialogTextTable_D739) ;9739 (D739) ([8:6][A:7])
	.word (DialogTextTable_D76C) ;976C (D76C) ([8:6][A:7])
	.word (DialogTextTable_D7A8) ;97A8 (D7A8) ([8:6][A:7])
	.word (DialogTextTable_D7E2) ;97E2 (D7E2) ([8:6][A:7])
	.word (DialogTextTable_D816) ;9816 (D816) ([8:6][A:7])
	.word (DialogTextTable_D84E) ;984E (D84E) ([8:6][A:7])
	.word (DialogTextTable_D883) ;9883 (D883) ([8:6][A:7])
	.word (DialogTextTable_D8B6) ;98B6 (D8B6) ([8:6][A:7])
	.word (DialogTextTable_D8EA) ;98EA (D8EA) ([8:6][A:7])
	.word (DialogTextTable_D91B) ;991B (D91B) ([8:6][A:7])
	.word (DialogTextTable_D941) ;9941 (D941) ([8:6][A:7])
	.word (DialogTextTable_D95B) ;995B (D95B) ([8:6][A:7])
	.word (DialogTextTable_D98D) ;998D (D98D) ([8:6][A:7])
	.word (DialogTextTable_D9C7) ;99C7 (D9C7) ([8:6][A:7])
	.word (DialogTextTable_D9F8) ;99F8 (D9F8) ([8:6][A:7])
	.word (DialogTextTable_DA26) ;9A26 (DA26) ([8:6][A:7])
	.word (DialogTextTable_DA4C) ;9A4C (DA4C) ([8:6][A:7])
	.word (DialogTextTable_DA74) ;9A74 (DA74) ([8:6][A:7])
	.word (DialogTextTable_DAA7) ;9AA7 (DAA7) ([8:6][A:7])
	.word (DialogTextTable_DAC9) ;9AC9 (DAC9) ([8:6][A:7])
	.word (DialogTextTable_DAF5) ;9AF5 (DAF5) ([8:6][A:7])
	.word (DialogTextTable_DAFF) ;9AFF (DAFF) ([8:6][A:7])
	.word (DialogTextTable_DB2D) ;9B2D (DB2D) ([8:6][A:7])
	.word (DialogTextTable_DB64) ;9B64 (DB64) ([8:6][A:7])
	.word (DialogTextTable_DB96) ;9B96 (DB96) ([8:6][A:7])
	.word (DialogTextTable_DBC7) ;9BC7 (DBC7) ([8:6][A:7])
	.word (DialogTextTable_DBF7) ;9BF7 (DBF7) ([8:6][A:7])
	.word (DialogTextTable_DC25) ;9C25 (DC25) ([8:6][A:7])
	.word (DialogTextTable_DC50) ;9C50 (DC50) ([8:6][A:7])
	.word (DialogTextTable_DC50) ;9C50 (DC50) ([8:6][A:7])
	.word (DialogTextTable_DC50) ;9C50 (DC50) ([8:6][A:7])
	.word (DialogTextTable_DC50) ;9C50 (DC50) ([8:6][A:7])
	.word (DialogTextTable_DC50) ;9C50 (DC50) ([8:6][A:7])
	.word (DialogTextTable_DC50) ;9C50 (DC50) ([8:6][A:7])
	.word (DialogTextTable_DC50) ;9C50 (DC50) ([8:6][A:7])
	.word (DialogTextTable_DC50) ;9C50 (DC50) ([8:6][A:7])
	.word (DialogTextTable_DC50) ;9C50 (DC50) ([8:6][A:7])
	.word (DialogTextTable_DC59) ;9C59 (DC59) ([8:6][A:7])
	.word (DialogTextTable_DC8E) ;9C8E (DC8E) ([8:6][A:7])
	.word (DialogTextTable_DCB0) ;9CB0 (DCB0) ([8:6][A:7])
	.word (DialogTextTable_DCD2) ;9CD2 (DCD2) ([8:6][A:7])
DialogTextTable_CC74:
	.byte $17,$08,$01,$14,$00,$01,$FE,$08,$0F,$12,$12,$09,$02,$0C,$05,$FE
	.byte $0E,$09,$07,$08,$14,$00,$14,$0F,$FE,$08,$01,$16,$05,$00,$01,$FE
	.byte $03,$15,$12,$13,$05,$1B,$FF
DialogTextTable_CC9B:
	.byte $14,$08,$05,$00,$0D,$0F,$12,$0E,$09,$0E,$07,$FE,$13,$15,$0E,$00
	.byte $08,$01,$13,$FE,$16,$01,$0E,$11,$15,$09,$13,$08,$05,$04,$FE,$14
	.byte $08,$05,$00,$08,$0F,$12,$12,$09,$02,$0C,$05,$FE,$0E,$09,$07,$08
	.byte $14,$1B,$FF
DialogTextTable_CCCE:
	.byte $0E,$0F,$14,$08,$09,$0E,$07,$1B,$FF
DialogTextTable_CCD7:
	.byte $19,$0F,$15,$12,$00,$0C,$05,$16,$05,$0C,$FE,$0F,$06,$00,$13,$0B
	.byte $09,$0C,$0C,$00,$08,$01,$13,$FE,$09,$0E,$03,$12,$05,$01,$13,$05
	.byte $04,$00,$14,$0F,$FE,$37,$1B,$FF
DialogTextTable_CCFF:
	.byte $19,$0F,$15,$12,$00,$0C,$05,$16,$05,$0C,$FE,$0F,$06,$00,$13,$0B
	.byte $09,$0C,$0C,$00,$08,$01,$13,$FE,$09,$0E,$03,$12,$05,$01,$13,$05
	.byte $04,$00,$14,$0F,$FE,$38,$1B,$FF
DialogTextTable_CD27:
	.byte $19,$0F,$15,$12,$00,$0C,$05,$16,$05,$0C,$FE,$0F,$06,$00,$13,$0B
	.byte $09,$0C,$0C,$00,$08,$01,$13,$FE,$09,$0E,$03,$12,$05,$01,$13,$05
	.byte $04,$00,$14,$0F,$FE,$39,$1B,$FF
DialogTextTable_CD4F:
	.byte $19,$0F,$15,$12,$00,$0C,$05,$16,$05,$0C,$FE,$0F,$06,$00,$13,$0B
	.byte $09,$0C,$0C,$00,$08,$01,$13,$FE,$09,$0E,$03,$12,$05,$01,$13,$05
	.byte $04,$00,$14,$0F,$FE,$3A,$1B,$FF
DialogTextTable_CD77:
	.byte $19,$0F,$15,$12,$00,$0C,$05,$16,$05,$0C,$FE,$0F,$06,$00,$13,$0B
	.byte $09,$0C,$0C,$00,$08,$01,$13,$FE,$09,$0E,$03,$12,$05,$01,$13,$05
	.byte $04,$00,$14,$0F,$FE,$3B,$1B,$FF
DialogTextTable_CD9F:
	.byte $19,$0F,$15,$12,$00,$0C,$05,$16,$05,$0C,$FE,$0F,$06,$00,$13,$0B
	.byte $09,$0C,$0C,$00,$08,$01,$13,$FE,$09,$0E,$03,$12,$05,$01,$13,$05
	.byte $04,$00,$14,$0F,$FE,$3C,$1B,$FF
DialogTextTable_CDC7:
	.byte $19,$0F,$15,$12,$00,$0C,$05,$16,$05,$0C,$FE,$0F,$06,$00,$13,$0B
	.byte $09,$0C,$0C,$00,$08,$01,$13,$FE,$09,$0E,$03,$12,$05,$01,$13,$05
	.byte $04,$00,$14,$0F,$FE,$3D,$1B,$FF
DialogTextTable_CDEF:
	.byte $13,$15,$12,$05,$1E,$00,$09,$1C,$0C,$0C,$FE,$14,$01,$0B,$05,$00
	.byte $19,$0F,$15,$00,$14,$0F,$FE,$01,$00,$07,$0F,$0F,$04,$FE,$10,$0C
	.byte $01,$03,$05,$1B,$00,$08,$05,$08,$40,$FE,$08,$05,$08,$40,$00,$08
	.byte $05,$08,$40,$FF
DialogTextTable_CE23:
	.byte $0C,$05,$14,$00,$0D,$05,$00,$13,$08,$0F,$17,$FE,$19,$0F,$15,$00
	.byte $14,$08,$05,$00,$17,$01,$19,$1B,$FF
DialogTextTable_CE3C:
	.byte $14,$0F,$00,$12,$05,$10,$0C,$05,$0E,$09,$13,$08,$FE,$05,$01,$12
	.byte $14,$08,$00,$1E,$0B,$0E,$05,$05,$0C,$FE,$02,$19,$00,$14,$08,$05
	.byte $00,$0C,$01,$0B,$05,$FE,$17,$09,$14,$08,$00,$14,$08,$05,$FE,$02
	.byte $0C,$15,$05,$00,$03,$12,$19,$13,$14,$01,$0C,$1B,$FF
DialogTextTable_CE79:
	.byte $09,$1C,$0C,$0C,$00,$07,$09,$16,$05,$FE,$19,$0F,$15,$12,$00,$0D
	.byte $0F,$12,$0E,$09,$0E,$07,$FE,$13,$14,$01,$12,$00,$10,$0F,$17,$05
	.byte $12,$FE,$14,$0F,$00,$02,$15,$12,$0E,$00,$01,$17,$01,$19,$FE,$05
	.byte $16,$09,$0C,$1B,$FF
DialogTextTable_CEAE:
	.byte $09,$1C,$0C,$0C,$00,$07,$09,$16,$05,$FE,$19,$0F,$15,$00,$01,$00
	.byte $13,$09,$0C,$0B,$FE,$02,$01,$07,$1B,$FF
DialogTextTable_CEC8:
	.byte $09,$1C,$0C,$0C,$00,$07,$09,$16,$05,$FE,$19,$0F,$15,$00,$14,$08
	.byte $09,$13,$FE,$13,$09,$0C,$16,$05,$12,$00,$0B,$0E,$09,$06,$05,$FE
	.byte $14,$0F,$00,$13,$01,$16,$05,$00,$19,$0F,$15,$12,$FE,$0E,$05,$03
	.byte $0B,$1B,$FF
DialogTextTable_CEFB:
	.byte $04,$12,$01,$03,$15,$0C,$01,$1C,$13,$FE,$05,$16,$09,$0C,$00,$0B
	.byte $0E,$09,$06,$05,$FE,$02,$0C,$15,$12,$13,$FE,$03,$01,$0D,$09,$0C
	.byte $0C,$01,$1C,$13,$FE,$16,$09,$13,$09,$0F,$0E,$1B,$FF
DialogTextTable_CF28:
	.byte $09,$1C,$0C,$0C,$00,$07,$09,$16,$05,$FE,$19,$0F,$15,$00,$01,$FE
	.byte $04,$09,$01,$0D,$0F,$0E,$04,$1B,$FF
DialogTextTable_CF41:
	.byte $09,$1C,$0C,$0C,$00,$13,$08,$0F,$17,$FE,$19,$0F,$15,$00,$14,$08
	.byte $05,$00,$17,$01,$19,$1B,$FF
DialogTextTable_CF58:
	.byte $04,$12,$01,$03,$15,$0C,$01,$1C,$13,$FE,$0E,$01,$09,$0C,$00,$0D
	.byte $01,$19,$FE,$13,$0F,$0C,$16,$05,$FE,$14,$08,$05,$00,$05,$16,$09
	.byte $0C,$FE,$0D,$19,$13,$14,$05,$12,$19,$1B,$FF
DialogTextTable_CF83:
	.byte $0E,$0F,$14,$08,$09,$0E,$07,$1B,$FF
DialogTextTable_CF8C:
	.byte $19,$0F,$15,$00,$0E,$0F,$17,$FE,$10,$12,$0F,$13,$13,$05,$13,$13
	.byte $FE,$04,$12,$01,$03,$15,$0C,$01,$1C,$13,$FE,$12,$09,$02,$1B,$FF
DialogTextTable_CFAC:
	.byte $19,$0F,$15,$00,$0E,$0F,$17,$FE,$10,$12,$0F,$13,$13,$05,$13,$13
	.byte $FE,$04,$12,$01,$03,$15,$0C,$01,$1C,$13,$FE,$08,$05,$01,$12,$14
	.byte $1B,$FF
DialogTextTable_CFCE:
	.byte $19,$0F,$15,$00,$0E,$0F,$17,$FE,$10,$12,$0F,$13,$13,$05,$13,$13
	.byte $FE,$04,$12,$01,$03,$15,$0C,$01,$1C,$13,$FE,$05,$19,$05,$02,$01
	.byte $0C,$0C,$1B,$FF
DialogTextTable_CFF2:
	.byte $19,$0F,$15,$00,$0E,$0F,$17,$FE,$10,$12,$0F,$13,$13,$05,$13,$13
	.byte $FE,$04,$12,$01,$03,$15,$0C,$01,$1C,$13,$FE,$0E,$01,$09,$0C,$1B
	.byte $FF
DialogTextTable_D013:
	.byte $19,$0F,$15,$00,$0E,$0F,$17,$FE,$10,$12,$0F,$13,$13,$05,$13,$13
	.byte $FE,$04,$12,$01,$03,$15,$0C,$01,$1C,$13,$FE,$12,$09,$0E,$07,$1B
	.byte $FF
DialogTextTable_D034:
	.byte $09,$0E,$16,$05,$13,$14,$00,$09,$0E,$00,$01,$0E,$FE,$0F,$01,$0B
	.byte $00,$13,$14,$01,$0B,$05,$5D,$FF
DialogTextTable_D04C:
	.byte $01,$00,$13,$19,$0D,$02,$0F,$0C,$00,$0F,$06,$FE,$05,$16,$09,$0C
	.byte $00,$17,$09,$0C,$0C,$FE,$01,$10,$10,$01,$05,$12,$00,$17,$08,$05
	.byte $0E,$FE,$19,$0F,$15,$00,$13,$14,$12,$09,$0B,$05,$FE,$14,$08,$05
	.byte $00,$13,$14,$01,$0B,$05,$1B,$FF
DialogTextTable_D084:
	.byte $04,$05,$13,$14,$12,$0F,$19,$00,$14,$08,$05,$FE,$03,$15,$12,$13
	.byte $05,$00,$01,$0E,$04,$FE,$19,$0F,$15,$1C,$0C,$0C,$00,$12,$15,$0C
	.byte $05,$FE,$02,$12,$01,$08,$0D,$1C,$13,$FE,$0D,$01,$0E,$13,$09,$0F
	.byte $0E,$1B,$FF
DialogTextTable_D0B7:
	.byte $01,$00,$06,$0C,$01,$0D,$05,$FE,$06,$0C,$09,$03,$0B,$05,$12,$13
	.byte $FE,$09,$0E,$13,$09,$04,$05,$00,$14,$08,$05,$FE,$12,$09,$0E,$07
	.byte $00,$0F,$06,$FE,$06,$09,$12,$05,$1B,$FF
DialogTextTable_D0E1:
	.byte $07,$01,$12,$0C,$09,$03,$00,$09,$0E,$FE,$14,$08,$05,$FE,$07,$12
	.byte $01,$16,$05,$19,$01,$12,$04,$FE,$13,$15,$0D,$0D,$0F,$0E,$13,$00
	.byte $01,$FE,$13,$14,$12,$01,$0E,$07,$05,$12,$1B,$FF
DialogTextTable_D10D:
	.byte $04,$05,$13,$14,$12,$0F,$19,$00,$14,$08,$05,$FE,$03,$15,$12,$13
	.byte $05,$00,$17,$09,$14,$08,$FE,$04,$12,$01,$03,$15,$0C,$01,$1C,$13
	.byte $FE,$08,$05,$01,$12,$14,$1B,$FF
DialogTextTable_D135:
	.byte $10,$0C,$01,$03,$05,$00,$14,$08,$05,$FE,$0C,$01,$15,$12,$05,$0C
	.byte $13,$00,$09,$0E,$00,$01,$FE,$13,$09,$0C,$0B,$00,$02,$01,$07,$00
	.byte $14,$0F,$FE,$02,$12,$09,$0E,$07,$00,$14,$08,$05,$0D,$FE,$14,$0F
	.byte $00,$0C,$09,$06,$05,$1B,$FF
DialogTextTable_D16C:
	.byte $17,$01,$09,$14,$00,$06,$0F,$12,$00,$01,$FE,$13,$0F,$15,$0C,$00
	.byte $17,$09,$14,$08,$00,$01,$FE,$12,$05,$04,$00,$03,$12,$19,$13,$14
	.byte $01,$0C,$FE,$0F,$0E,$00,$04,$05,$02,$0F,$12,$01,$08,$FE,$03,$0C
	.byte $09,$06,$06,$1B,$FF
DialogTextTable_D1A1:
	.byte $14,$08,$05,$00,$03,$15,$12,$13,$05,$FE,$08,$01,$13,$00,$0B,$09
	.byte $0C,$0C,$05,$04,$FE,$14,$08,$05,$00,$0C,$01,$15,$12,$05,$0C,$FE
	.byte $14,$12,$05,$05,$1B,$FF
DialogTextTable_D1C7:
	.byte $19,$0F,$15,$00,$0E,$0F,$17,$FE,$10,$0F,$13,$13,$05,$13,$13,$00
	.byte $14,$08,$05,$FE,$0D,$01,$07,$09,$03,$00,$03,$12,$0F,$13,$13,$1B
	.byte $FF
DialogTextTable_D1E8:
	.byte $0E,$0F,$14,$08,$09,$0E,$07,$1B,$FF
DialogTextTable_D1F1:
	.byte $17,$09,$0C,$0C,$00,$19,$0F,$15,$00,$02,$15,$19,$FE,$13,$0F,$0D
	.byte $05,$00,$07,$01,$12,$0C,$09,$03,$5D,$FF
DialogTextTable_D20B:
	.byte $02,$15,$19,$00,$13,$0F,$0D,$05,$00,$0F,$06,$FE,$0D,$19,$00,$0C
	.byte $01,$15,$12,$05,$0C,$13,$5D,$FF
DialogTextTable_D223:
	.byte $12,$05,$13,$14,$00,$08,$05,$12,$05,$FE,$06,$0F,$12,$00,$01,$00
	.byte $17,$08,$09,$0C,$05,$1B,$FF
DialogTextTable_D23A:
	.byte $02,$15,$19,$00,$01,$00,$17,$08,$09,$14,$05,$FE,$03,$12,$19,$13
	.byte $14,$01,$0C,$5D,$FF
DialogTextTable_D24F:
	.byte $02,$15,$19,$00,$01,$00,$14,$08,$0F,$12,$0E,$FE,$17,$08,$09,$10
	.byte $5D,$FF
DialogTextTable_D261:
	.byte $10,$15,$12,$03,$08,$01,$13,$05,$00,$01,$FE,$03,$08,$01,$09,$0E
	.byte $00,$17,$08,$09,$10,$5D,$FF
DialogTextTable_D278:
	.byte $0D,$0F,$12,$0E,$09,$0E,$07,$00,$13,$14,$01,$12,$FE,$46,$00,$02
	.byte $15,$19,$00,$0F,$0E,$05,$5D,$FF
DialogTextTable_D290:
	.byte $17,$09,$0C,$0C,$00,$19,$0F,$15,$00,$02,$15,$19,$FE,$01,$00,$04
	.byte $01,$07,$07,$05,$12,$5D,$FF
DialogTextTable_D2A7:
	.byte $17,$01,$0E,$14,$00,$14,$0F,$00,$02,$15,$19,$FE,$08,$0F,$0C,$19
	.byte $00,$17,$01,$14,$05,$12,$5D,$FF
DialogTextTable_D2BF:
	.byte $06,$09,$12,$13,$14,$00,$14,$08,$09,$0E,$07,$FE,$14,$0F,$00,$04
	.byte $0F,$00,$09,$0E,$FE,$14,$08,$09,$13,$00,$14,$0F,$17,$0E,$00,$09
	.byte $13,$FE,$02,$15,$19,$00,$01,$00,$17,$08,$09,$14,$05,$FE,$03,$12
	.byte $19,$13,$14,$01,$0C,$1B,$FF
DialogTextTable_D2F6:
	.byte $19,$0F,$15,$1C,$16,$05,$00,$07,$0F,$14,$00,$01,$FE,$06,$12,$09
	.byte $05,$0E,$04,$00,$17,$01,$09,$14,$46,$FE,$09,$0E,$07,$00,$06,$0F
	.byte $12,$00,$19,$0F,$15,$FE,$09,$0E,$00,$14,$08,$05,$00,$14,$0F,$17
	.byte $0E,$FE,$0F,$06,$00,$01,$0C,$0A,$09,$02,$01,$1B,$FF
DialogTextTable_D333:
	.byte $14,$15,$12,$0E,$00,$12,$09,$07,$08,$14,$FE,$06,$0F,$12,$00,$14
	.byte $08,$05,$00,$0A,$0F,$16,$01,$FE,$17,$0F,$0F,$04,$13,$1B,$00,$0C
	.byte $05,$06,$14,$FE,$06,$0F,$12,$00,$02,$05,$0C,$01,$13,$03,$0F,$FE
	.byte $0D,$01,$12,$13,$08,$1B,$FF
DialogTextTable_D36A:
	.byte $14,$15,$12,$0E,$00,$12,$09,$07,$08,$14,$FE,$06,$0F,$12,$00,$04
	.byte $01,$02,$09,$1C,$13,$FE,$10,$01,$14,$08,$00,$0C,$05,$06,$14,$FE
	.byte $06,$0F,$12,$00,$14,$08,$05,$FE,$16,$05,$12,$0F,$13,$00,$17,$0F
	.byte $0F,$04,$13,$1B,$FF
DialogTextTable_D39F:
	.byte $14,$15,$12,$0E,$00,$12,$09,$07,$08,$14,$FE,$06,$0F,$12,$00,$13
	.byte $01,$04,$01,$0D,$FE,$17,$0F,$0F,$04,$13,$1E,$00,$0C,$05,$06,$14
	.byte $FE,$06,$0F,$12,$00,$14,$08,$05,$00,$0A,$01,$0D,$FE,$17,$01,$13
	.byte $14,$05,$0C,$01,$0E,$04,$1B,$FF
DialogTextTable_D3D7:
	.byte $19,$0F,$15,$00,$08,$01,$16,$05,$00,$01,$FE,$06,$12,$09,$05,$0E
	.byte $04,$00,$09,$0E,$FE,$14,$08,$05,$00,$14,$0F,$17,$0E,$00,$0F,$06
	.byte $FE,$01,$0C,$04,$12,$01,$1B,$00,$07,$0F,$00,$01,$0E,$04,$FE,$13
	.byte $05,$05,$00,$08,$09,$0D,$1B,$FF
DialogTextTable_D40F:
	.byte $37,$39,$00,$03,$0C,$15,$05,$13,$FE,$17,$09,$0C,$0C,$00,$13,$0F
	.byte $0C,$16,$05,$FE,$04,$12,$01,$03,$15,$0C,$01,$1C,$13,$FE,$12,$09
	.byte $04,$04,$0C,$05,$1B,$FF
DialogTextTable_D435:
	.byte $01,$00,$0D,$01,$0E,$00,$0C,$09,$16,$09,$0E,$07,$FE,$09,$0E,$00
	.byte $04,$01,$12,$0B,$0E,$05,$13,$13,$FE,$03,$01,$0E,$00,$07,$09,$16
	.byte $05,$FE,$19,$0F,$15,$12,$00,$17,$08,$09,$10,$FE,$10,$0F,$17,$05
	.byte $12,$1B,$FF
DialogTextTable_D468:
	.byte $01,$00,$12,$09,$02,$00,$03,$01,$0E,$FE,$13,$08,$09,$05,$0C,$04
	.byte $00,$19,$0F,$15,$FE,$06,$12,$0F,$0D,$00,$05,$16,$09,$0C,$1B,$FF
DialogTextTable_D488:
	.byte $01,$00,$0D,$01,$07,$09,$03,$FE,$10,$0F,$14,$09,$0F,$0E,$00,$17
	.byte $09,$0C,$0C,$FE,$04,$05,$13,$14,$12,$0F,$19,$00,$14,$08,$05,$FE
	.byte $17,$01,$0C,$0C,$00,$0F,$06,$FE,$05,$16,$09,$0C,$1B,$FF
DialogTextTable_D4B6:
	.byte $03,$0C,$05,$01,$12,$00,$01,$00,$10,$01,$14,$08,$FE,$01,$14,$00
	.byte $02,$05,$12,$0B,$05,$0C,$05,$19,$FE,$0D,$01,$0E,$13,$09,$0F,$0E
	.byte $00,$17,$09,$14,$08,$FE,$01,$00,$17,$08,$09,$14,$05,$FE,$03,$12
	.byte $19,$13,$14,$01,$0C,$1B,$FF
DialogTextTable_D4ED:
	.byte $0C,$01,$15,$12,$05,$0C,$13,$00,$09,$0E,$FE,$19,$0F,$15,$12,$00
	.byte $13,$0F,$15,$10,$FE,$05,$0E,$08,$01,$0E,$03,$05,$13,$00,$09,$14
	.byte $13,$FE,$01,$12,$0F,$0D,$01,$1B,$FF
DialogTextTable_D516:
	.byte $12,$15,$0D,$0F,$12,$00,$08,$01,$13,$00,$09,$14,$FE,$1E,$00,$14
	.byte $08,$05,$00,$06,$05,$12,$12,$19,$46,$FE,$0D,$01,$0E,$00,$01,$14
	.byte $00,$04,$05,$01,$04,$FE,$12,$09,$16,$05,$12,$00,$0C,$0F,$16,$05
	.byte $13,$FE,$07,$01,$12,$0C,$09,$03,$1B,$FF
DialogTextTable_D550:
	.byte $04,$09,$07,$00,$15,$10,$00,$14,$08,$05,$FE,$3A,$14,$08,$00,$07
	.byte $12,$01,$16,$05,$00,$09,$0E,$FE,$14,$08,$05,$00,$03,$05,$0D,$05
	.byte $14,$05,$12,$19,$FE,$06,$0F,$12,$00,$01,$FE,$04,$09,$01,$0D,$0F
	.byte $0E,$04,$1B,$FF
DialogTextTable_D584:
	.byte $02,$05,$0C,$09,$05,$16,$05,$00,$09,$0E,$FE,$0D,$01,$07,$09,$03
	.byte $00,$01,$0E,$04,$FE,$19,$0F,$15,$1C,$0C,$0C,$00,$02,$05,$FE,$13
	.byte $01,$16,$05,$04,$1B,$FF
DialogTextTable_D5AA:
	.byte $14,$01,$0B,$05,$00,$0D,$19,$FE,$04,$01,$15,$07,$08,$14,$05,$12
	.byte $1E,$FE,$10,$0C,$05,$01,$13,$05,$40,$FF
DialogTextTable_D5C4:
	.byte $19,$0F,$15,$00,$0C,$0F,$0F,$0B,$FE,$10,$01,$0C,$05,$1E,$0D,$19
	.byte $00,$13,$0F,$0E,$1B,$FE,$19,$0F,$15,$00,$0D,$15,$13,$14,$FE,$12
	.byte $05,$13,$14,$00,$09,$0E,$00,$14,$08,$05,$FE,$03,$08,$15,$12,$03
	.byte $08,$1B,$FF
DialogTextTable_D5F7:
	.byte $04,$0F,$0E,$1C,$14,$00,$0C,$0F,$0F,$0B,$FE,$09,$0E,$14,$0F,$00
	.byte $14,$08,$05,$FE,$04,$05,$01,$14,$08,$00,$13,$14,$01,$12,$1E,$FE
	.byte $0F,$12,$00,$19,$0F,$15,$00,$17,$09,$0C,$0C,$FE,$04,$09,$05,$1B
	.byte $FF
DialogTextTable_D628:
	.byte $04,$0F,$0E,$1C,$14,$00,$0D,$01,$0B,$05,$FE,$0D,$05,$00,$13,$14
	.byte $01,$19,$1B,$FE,$09,$1C,$0C,$0C,$00,$04,$09,$05,$1B,$FF
DialogTextTable_D646:
	.byte $17,$08,$05,$0E,$00,$09,$00,$17,$01,$13,$FE,$19,$0F,$15,$12,$00
	.byte $01,$07,$05,$1E,$FE,$17,$0F,$0D,$05,$0E,$00,$0C,$0F,$16,$05,$04
	.byte $FE,$0D,$05,$1B,$FF
DialogTextTable_D66B:
	.byte $01,$00,$03,$12,$0F,$0F,$0B,$05,$04,$FE,$14,$12,$01,$04,$05,$12
	.byte $00,$09,$13,$FE,$0F,$06,$06,$05,$12,$09,$0E,$07,$00,$02,$15,$0D
	.byte $FE,$04,$05,$01,$0C,$13,$00,$09,$0E,$FE,$14,$08,$09,$13,$00,$14
	.byte $0F,$17,$0E,$1B,$FF
DialogTextTable_D6A0:
	.byte $01,$00,$06,$0C,$01,$0D,$05,$00,$09,$13,$FE,$0F,$0E,$00,$14,$0F
	.byte $10,$00,$0F,$06,$FE,$14,$08,$05,$00,$3C,$14,$08,$00,$14,$12,$05
	.byte $05,$FE,$09,$0E,$00,$04,$05,$0E,$09,$13,$FE,$17,$0F,$0F,$04,$13
	.byte $1B,$FF
DialogTextTable_D6D2:
	.byte $03,$0C,$15,$05,$13,$00,$14,$0F,$FE,$04,$12,$01,$03,$15,$0C,$01
	.byte $1C,$13,$FE,$12,$09,$04,$04,$0C,$05,$00,$01,$12,$05,$FE,$09,$0E
	.byte $00,$14,$08,$05,$00,$14,$0F,$17,$0E,$FE,$0F,$06,$00,$16,$05,$12
	.byte $0F,$13,$1B,$FF
DialogTextTable_D706:
	.byte $03,$0C,$15,$05,$13,$00,$14,$0F,$FE,$04,$12,$01,$03,$15,$0C,$01
	.byte $1C,$13,$FE,$12,$09,$04,$04,$0C,$05,$00,$01,$12,$05,$FE,$09,$0E
	.byte $00,$14,$08,$05,$00,$14,$0F,$17,$0E,$FE,$0F,$06,$00,$01,$0C,$02
	.byte $01,$1B,$FF
DialogTextTable_D739:
	.byte $03,$0C,$15,$05,$13,$00,$14,$0F,$FE,$04,$12,$01,$03,$15,$0C,$01
	.byte $1C,$13,$FE,$12,$09,$04,$04,$0C,$05,$00,$01,$12,$05,$FE,$09,$0E
	.byte $00,$02,$05,$12,$0B,$05,$0C,$05,$19,$FE,$0D,$01,$0E,$13,$09,$0F
	.byte $0E,$1B,$FF
DialogTextTable_D76C:
	.byte $14,$15,$12,$0E,$00,$12,$09,$07,$08,$14,$FE,$06,$0F,$12,$00,$03
	.byte $01,$0D,$09,$0C,$0C,$01,$FE,$03,$05,$0D,$05,$14,$05,$12,$19,$1E
	.byte $FE,$0C,$05,$06,$14,$00,$06,$0F,$12,$00,$14,$08,$05,$FE,$01,$0C
	.byte $0A,$09,$02,$01,$00,$17,$0F,$0F,$04,$13,$1B,$FF
DialogTextTable_D7A8:
	.byte $14,$15,$12,$0E,$00,$12,$09,$07,$08,$14,$FE,$06,$0F,$12,$00,$14
	.byte $08,$05,$00,$04,$05,$01,$04,$FE,$12,$09,$16,$05,$12,$1E,$00,$0C
	.byte $05,$06,$14,$FE,$06,$0F,$12,$00,$14,$08,$05,$00,$FE,$13,$01,$04
	.byte $01,$0D,$00,$17,$0F,$0F,$04,$13,$1B,$FF
DialogTextTable_D7E2:
	.byte $14,$15,$12,$0E,$00,$0C,$05,$06,$14,$FE,$06,$0F,$12,$00,$14,$08
	.byte $05,$FE,$17,$09,$03,$0B,$05,$04,$00,$04,$09,$14,$03,$08,$FE,$1E
	.byte $00,$12,$09,$07,$08,$14,$00,$14,$0F,$FE,$07,$0F,$00,$0E,$0F,$12
	.byte $14,$08,$1B,$FF
DialogTextTable_D816:
	.byte $14,$15,$12,$0E,$00,$12,$09,$07,$08,$14,$FE,$06,$0F,$12,$00,$16
	.byte $12,$01,$04,$FE,$07,$12,$01,$16,$05,$19,$01,$12,$04,$1E,$FE,$0C
	.byte $05,$06,$14,$00,$06,$0F,$12,$00,$14,$08,$05,$FE,$04,$0F,$12,$01
	.byte $00,$17,$0F,$0F,$04,$13,$1B,$FF
DialogTextTable_D84E:
	.byte $09,$1C,$04,$00,$0C,$09,$0B,$05,$00,$14,$0F,$FE,$05,$18,$03,$08
	.byte $01,$0E,$07,$05,$00,$01,$FE,$17,$08,$09,$14,$05,$FE,$03,$12,$19
	.byte $13,$14,$01,$0C,$00,$06,$0F,$12,$FE,$01,$00,$02,$0C,$15,$05,$00
	.byte $0F,$0E,$05,$1B,$FF
DialogTextTable_D883:
	.byte $09,$1C,$04,$00,$0C,$09,$0B,$05,$00,$14,$0F,$FE,$05,$18,$03,$08
	.byte $01,$0E,$07,$05,$00,$01,$FE,$02,$0C,$15,$05,$00,$03,$12,$19,$13
	.byte $14,$01,$0C,$FE,$06,$0F,$12,$00,$01,$00,$12,$05,$04,$FE,$0F,$0E
	.byte $05,$1B,$FF
DialogTextTable_D8B6:
	.byte $14,$0F,$00,$12,$05,$13,$14,$0F,$12,$05,$FE,$19,$0F,$15,$12,$00
	.byte $0C,$09,$06,$05,$1E,$FE,$13,$08,$0F,$15,$14,$00,$09,$0E,$FE,$06
	.byte $12,$0F,$0E,$14,$00,$0F,$06,$FE,$14,$08,$05,$00,$03,$08,$15,$12
	.byte $03,$08,$1B,$FF
DialogTextTable_D8EA:
	.byte $14,$08,$05,$00,$04,$05,$01,$04,$FE,$12,$09,$16,$05,$12,$00,$17
	.byte $01,$09,$14,$13,$FE,$14,$0F,$00,$02,$05,$00,$06,$12,$05,$05,$04
	.byte $FE,$06,$12,$0F,$0D,$00,$14,$08,$05,$FE,$03,$15,$12,$13,$05,$1B
	.byte $FF
DialogTextTable_D91B:
	.byte $04,$12,$01,$03,$15,$0C,$01,$1C,$13,$FE,$05,$19,$05,$02,$01,$0C
	.byte $0C,$FE,$12,$05,$06,$0C,$05,$03,$14,$13,$FE,$14,$08,$05,$00,$03
	.byte $15,$12,$13,$05,$1B,$FF
DialogTextTable_D941:
	.byte $0C,$05,$14,$1C,$13,$00,$0C,$09,$16,$05,$FE,$08,$05,$12,$05,$FE
	.byte $14,$0F,$07,$05,$14,$08,$05,$12,$1B,$FF
DialogTextTable_D95B:
	.byte $01,$00,$0C,$01,$15,$12,$05,$0C,$00,$FE,$17,$09,$0C,$0C,$00,$10
	.byte $12,$0F,$14,$05,$03,$14,$FE,$19,$0F,$15,$00,$06,$12,$0F,$0D,$00
	.byte $14,$08,$05,$FE,$10,$0F,$09,$13,$0F,$0E,$FE,$0D,$01,$12,$13,$08
	.byte $1B,$FF
DialogTextTable_D98D:
	.byte $01,$0E,$00,$0F,$0C,$04,$00,$07,$19,$10,$13,$19,$FE,$08,$0F,$0C
	.byte $04,$13,$00,$01,$FE,$04,$09,$01,$0D,$0F,$0E,$04,$00,$09,$0E,$FE
	.byte $06,$12,$0F,$0E,$14,$00,$0F,$06,$00,$04,$05,$46,$FE,$02,$0F,$12
	.byte $01,$08,$00,$03,$0C,$09,$06,$06,$1B,$FF
DialogTextTable_D9C7:
	.byte $08,$09,$14,$00,$04,$05,$02,$0F,$12,$01,$08,$FE,$03,$0C,$09,$06
	.byte $06,$00,$17,$09,$14,$08,$FE,$19,$0F,$15,$12,$00,$08,$05,$01,$04
	.byte $00,$14,$0F,$FE,$0D,$01,$0B,$05,$00,$01,$00,$08,$0F,$0C,$05,$1B
	.byte $FF
DialogTextTable_D9F8:
	.byte $01,$06,$14,$05,$12,$FE,$03,$01,$13,$14,$0C,$05,$16,$01,$0E,$09
	.byte $01,$FE,$09,$00,$17,$01,$12,$0E,$05,$04,$00,$19,$0F,$15,$FE,$0E
	.byte $0F,$14,$00,$14,$0F,$FE,$12,$05,$14,$15,$12,$0E,$1B,$FF
DialogTextTable_DA26:
	.byte $13,$0F,$12,$12,$19,$1E,$00,$10,$01,$0C,$1B,$FE,$0E,$0F,$00,$14
	.byte $09,$0D,$05,$00,$0E,$0F,$17,$1E,$FE,$0D,$01,$19,$02,$05,$FE,$0C
	.byte $01,$14,$05,$12,$1B,$FF
DialogTextTable_DA4C:
	.byte $02,$15,$19,$00,$13,$0F,$0D,$05,$FE,$07,$01,$12,$0C,$09,$03,$1B
	.byte $FE,$09,$14,$00,$08,$01,$13,$FE,$13,$10,$05,$03,$09,$01,$0C,$FE
	.byte $10,$0F,$17,$05,$12,$13,$1B,$FF
DialogTextTable_DA74:
	.byte $09,$1C,$16,$05,$00,$02,$05,$05,$0E,$FE,$17,$01,$09,$14,$09,$0E
	.byte $07,$00,$06,$0F,$12,$FE,$01,$00,$07,$0F,$0F,$04,$FE,$0C,$0F,$0F
	.byte $0B,$09,$0E,$07,$00,$07,$15,$19,$FE,$0C,$09,$0B,$05,$00,$19,$0F
	.byte $15,$1B,$FF
DialogTextTable_DAA7:
	.byte $09,$00,$17,$01,$0E,$14,$00,$14,$0F,$FE,$07,$05,$14,$00,$14,$0F
	.byte $00,$0B,$0E,$0F,$17,$FE,$19,$0F,$15,$00,$02,$05,$14,$14,$05,$12
	.byte $1B,$FF
DialogTextTable_DAC9:
	.byte $09,$1C,$0C,$0C,$00,$13,$05,$05,$FE,$19,$0F,$15,$00,$01,$14,$FE
	.byte $0D,$09,$04,$0E,$09,$07,$08,$14,$FE,$0F,$0E,$00,$14,$08,$05,$FE
	.byte $12,$09,$16,$05,$12,$00,$02,$01,$0E,$0B,$1B,$FF
DialogTextTable_DAF5:
	.byte $07,$05,$14,$00,$02,$01,$03,$0B,$40,$FF
DialogTextTable_DAFF:
	.byte $19,$0F,$15,$1C,$16,$05,$FE,$15,$10,$13,$05,$14,$00,$14,$08,$05
	.byte $FE,$10,$05,$0F,$10,$0C,$05,$1B,$FE,$0E,$0F,$17,$00,$07,$05,$14
	.byte $00,$0F,$15,$14,$FE,$0F,$06,$00,$14,$0F,$17,$0E,$40,$FF
DialogTextTable_DB2D:
	.byte $07,$05,$14,$00,$01,$00,$13,$09,$0C,$0B,$FE,$02,$01,$07,$00,$06
	.byte $12,$0F,$0D,$00,$14,$08,$05,$FE,$07,$12,$01,$16,$05,$19,$01,$12
	.byte $04,$FE,$04,$15,$03,$0B,$00,$14,$0F,$00,$0C,$09,$16,$05,$FE,$0C
	.byte $0F,$0E,$07,$05,$12,$1B,$FF
DialogTextTable_DB64:
	.byte $03,$0C,$15,$05,$13,$00,$14,$0F,$FE,$04,$12,$01,$03,$15,$0C,$01
	.byte $1C,$13,$FE,$12,$09,$04,$04,$0C,$05,$00,$01,$12,$05,$FE,$09,$0E
	.byte $00,$14,$08,$05,$00,$16,$05,$12,$0F,$13,$FE,$17,$0F,$0F,$04,$13
	.byte $1B,$FF
DialogTextTable_DB96:
	.byte $03,$0C,$15,$05,$13,$00,$14,$0F,$FE,$04,$12,$01,$03,$15,$0C,$01
	.byte $1C,$13,$FE,$12,$09,$04,$04,$0C,$05,$00,$01,$12,$05,$FE,$09,$0E
	.byte $00,$02,$0F,$04,$0C,$05,$19,$FE,$0D,$01,$0E,$13,$09,$0F,$0E,$1B
	.byte $FF
DialogTextTable_DBC7:
	.byte $03,$0C,$15,$05,$13,$00,$14,$0F,$FE,$04,$12,$01,$03,$15,$0C,$01
	.byte $1C,$13,$FE,$12,$09,$04,$04,$0C,$05,$00,$01,$12,$05,$FE,$09,$0E
	.byte $00,$12,$0F,$16,$05,$12,$FE,$0D,$01,$0E,$13,$09,$0F,$0E,$1B,$FF
DialogTextTable_DBF7:
	.byte $14,$08,$05,$00,$03,$12,$0F,$13,$13,$00,$09,$0E,$FE,$0C,$01,$12
	.byte $15,$02,$01,$1C,$13,$00,$FE,$0D,$01,$0E,$13,$09,$0F,$0E,$00,$0D
	.byte $15,$13,$14,$FE,$02,$05,$00,$06,$0F,$15,$0E,$04,$1B,$FF
DialogTextTable_DC25:
	.byte $09,$00,$12,$05,$06,$15,$13,$05,$00,$14,$0F,$FE,$05,$18,$03,$08
	.byte $01,$0E,$07,$05,$00,$0D,$19,$FE,$03,$12,$19,$13,$14,$01,$0C,$00
	.byte $06,$0F,$12,$FE,$19,$0F,$15,$12,$13,$1B,$FF
DialogTextTable_DC50:
	.byte $0E,$0F,$14,$08,$09,$0E,$07,$1B,$FF
DialogTextTable_DC59:
	.byte $14,$0F,$00,$02,$12,$05,$01,$0B,$00,$0D,$19,$FE,$13,$10,$05,$0C
	.byte $0C,$1E,$00,$03,$0F,$0D,$05,$FE,$02,$01,$03,$0B,$00,$17,$09,$14
	.byte $08,$00,$01,$FE,$10,$0F,$17,$05,$12,$06,$15,$0C,$FE,$17,$05,$01
	.byte $10,$0F,$0E,$1B,$FF
DialogTextTable_DC8E:
	.byte $19,$0F,$15,$00,$0E,$0F,$17,$FE,$10,$0F,$13,$13,$05,$13,$13,$FE
	.byte $14,$08,$05,$00,$13,$01,$03,$12,$05,$04,$FE,$06,$0C,$01,$0D,$05
	.byte $1B,$FF
DialogTextTable_DCB0:
	.byte $19,$0F,$15,$00,$0E,$0F,$17,$FE,$10,$0F,$13,$13,$05,$13,$13,$FE
	.byte $14,$08,$05,$00,$07,$0F,$0C,$04,$05,$0E,$FE,$0B,$0E,$09,$06,$05
	.byte $1B,$FF
DialogTextTable_DCD2:
	.byte $09,$00,$02,$05,$07,$00,$0F,$06,$00,$19,$0F,$15,$FE,$14,$0F,$00
	.byte $14,$01,$0B,$05,$FE,$14,$08,$05,$13,$05,$FE,$0C,$01,$15,$12,$05
	.byte $0C,$13,$1B,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$D8,$78
	.byte $EE,$FF,$FF,$4C,$00,$C0,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$46,$C0,$D0,$FF,$96,$C0
