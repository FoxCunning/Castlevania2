.segment "BANK_01"
; Offset in ROM: $04000
.setcpu "6502X"

.feature org_per_seg
.feature pc_assignment

.include "globals.inc"


; -----------------------------------------------------------------------------
	.export Refresh_CurrentLevelData_Actors_Pointer
Refresh_CurrentLevelData_Actors_Pointer:
	lda CurrentLevelMapType
	asl a
	tay
	lda LevelData_Actors,y
	sta TempPtr00_lo
	lda LevelData_Actors+1,y
	sta TempPtr00_hi
	lda CurrentLevelSceneNumber
	asl a
	tay
	lda (TempPtr00_lo),y
	sta TempPtr08_lo
	iny
	lda (TempPtr00_lo),y
	sta TempPtr08_hi
	lda CurrentLevelSubRoomNumber
	asl a
	tay
	lda (TempPtr08_lo),y
	sta CurrentLevelData_Actors_PointerLo
	iny
	lda (TempPtr08_lo),y
	sta CurrentLevelData_Actors_PointerHi
	rts
;------------------------------------------
	.export _func_4029
_func_4029:
	lda $37
	bne @8036
	lda $3A
	bne @8036
	lda ActorSpawnControlUnknown3C
	bne @8036
	rts

	@8036:
	ldx #$00
	ldy #$FC
	@803A:
	iny
	iny
	iny
	iny
	inx
	lda (CurrentLevelData_Actors_PointerLo),y
	cmp #$FF
	beq _807A
	cmp Unknown39_From_XscrollingPositionDividedBy16
	bcc @803A
	iny
	lda (CurrentLevelData_Actors_PointerLo),y
	dey
	cmp #$FF
	beq _807A
	cmp Unknown3B_From_8C8D_dividedBy16
	bcc @803A
	_8055:
	  lda #$00
	sta TempPtr00_lo
	sta TempPtr08_lo
	lda (CurrentLevelData_Actors_PointerLo),y
	cmp #$FF
	beq _807A
	asl a
	rol TempPtr00_lo
	asl a
	rol TempPtr00_lo
	asl a
	rol TempPtr00_lo
	asl a
	rol TempPtr00_lo
	sec
	sbc CurrentXScrollingPositionPixels
	sta TempPtr00_hi
	lda TempPtr00_lo
	sbc CurrentXScrollingPositionScreens
	beq _8082
	bmi _807F
	_807A:
	  lda #$00
	sta ActorSpawnControlUnknown3C
	rts

	_807F:
	 jmp _loc_4185

	_8082:
	  iny
	lda (CurrentLevelData_Actors_PointerLo),y
	dey
	cmp #$FF
	beq _807A
	asl a
	rol TempPtr08_lo
	asl a
	rol TempPtr08_lo
	asl a
	rol TempPtr08_lo
	asl a
	rol TempPtr08_lo
	sec
	sbc CurrentYScrollingPositionPixels_Mod256
	sta TempPtr08_hi
	lda TempPtr08_lo
	sbc CurrentYScrollingPositionScreens_maybe
	beq @80A4
	jmp _loc_4185

	@80A4:
	lda TempPtr00_hi
	cmp #$FC
	bcs @80BF
	cmp #$04
	bcc @80BF
	lda TempPtr08_hi
	cmp #$FC
	bcs @80BF
	cmp #$04
	bcc @80BF
	lda ActorSpawnControlUnknown3C
	bne @80BF
	jmp _loc_4185

	@80BF:
	stx TempPtr02_lo
	ldx #$11
	lda #$80
	sta TempPtr00_lo
	_80C7:
	 lda ObjectType,x
	bne @80CF
	jmp _loc_418D

	@80CF:
	lda ObjectUnknown432,x
	cmp TempPtr02_lo
	bne _loc_40D9
	jmp _loc_4183
;------------------------------------------
_loc_40D9:
	dex
	cpx #$05
	bne _80C7
	ldx TempPtr00_lo
	bpl _loc_40E5
	jmp _loc_4183
;------------------------------------------
_loc_40E5:
	jsr Object_Erase_And_IfType3C_Set_42to00
	iny
	iny
	lda (CurrentLevelData_Actors_PointerLo),y
	sta $17
	cmp #$BC
	bne @80F6
	lda Unknown42
	bne @8108
	@80F6:
	lda $17
	bmi @814D
	lda CurrentLevelMapType
	bne @810D
	lda $17
	cmp #$27
	beq @810D
	lda IsNightTime
	bne @810D
	@8108:
	   ldx TempPtr02_lo
	jmp _loc_4187

	@810D:
	  lda $17
	sta ObjectType,x
	iny
	lda (CurrentLevelData_Actors_PointerLo),y
	sta Temp93
	lda IsNightTime
	beq @8145
	lda ObjectType,x
	cmp #$21
	beq @8145
	cmp #$22
	beq @8145
	cmp #$25
	bcc @813A
	cmp #$28
	bcc @8145
	cmp #$2D
	bcc @813A
	cmp #$30
	bcc @8145
	cmp #$34
	beq @8145
	@813A:
	lda CurrentLevelMapType
	cmp #$01
	beq @8145
	lda Temp93
	asl a
	sta Temp93
	@8145:
	 lda Temp93
	sta ObjectEnemyRemainingHP,x
	jmp _loc_4168

	@814D:
	   lda CurrentLevelMapType
	bne @815B
	lda $17
	cmp #$A4
	beq @815B
	lda IsNightTime
	bne @8108
	@815B:
	lda $17
	and #$7F
	sta ObjectType,x
	iny
	lda (CurrentLevelData_Actors_PointerLo),y
	sta ObjectDialogTextIndex,x
_loc_4168:
	lda TempPtr00_hi
	sta ObjectScreenXCoord,x
	lda TempPtr08_hi
	sta ObjectScreenYCoord,x
	lda ObjectCurrentActionType,x
	ora #$08
	sta ObjectCurrentActionType,x
	lda TempPtr02_lo
	sta ObjectUnknown432,x
	tax
	jmp _loc_4188
;------------------------------------------
_loc_4183:
	ldx TempPtr02_lo
_loc_4185:
	iny
	iny
_loc_4187:
	iny
_loc_4188:
	iny
	inx
	jmp _8055
;------------------------------------------
_loc_418D:
	stx TempPtr00_lo
	jmp _loc_40D9
;------------------------------------------
LevelData_Actors:
	.word (LevelData_Actors_0_Towns) ;8EAB (4EAB) ()
	.word (LevelData_Actors_1_Mansions) ;92B5 (52B5) ()
	.word (LevelData_Actors_2_ForestsAndBridges) ;9FB0 (5FB0) ()
	.word (LevelData_Actors_3_Wilderness) ;ADF9 (6DF9) ()
	.word (LevelData_Actors_4_Wastelands) ;A829 (6829) ()
	.word (LevelData_Actors_5_Ruins) ;B3F8 (73F8) ()
; -----------------------------------------
	.export _func_419E
_func_419E:
	ldx #$06
	@81A0:
	lda ObjectType,x
	beq @81C7
	bmi @81C7
	jsr _func_1E08C
	lda ObjectDialogStatusFlag,x
	and #$42
	bne @81C7
	lda ObjectStunCounter,x
	bne @81C1
	lda #$00
	sta ObjectPaletteIndex,x
	jsr _func_41CD
	jmp @81C7

	@81C1:
	dec ObjectStunCounter,x
	jsr Object_FlashPalette
	@81C7:
	 inx
	cpx #$12
	bne @81A0
	rts
;------------------------------------------
_func_41CD:
	lda ObjectType,x
	jsr JumpWithParams
_JumpPointerTable_41D3:
	.word (ObjectAI_object00_23)
	.word (ObjectAI_object01) ;8FAA (4FAA) ()
	.word (ObjectAI_object02_Leech) ;A513 (6513) ()
	.word (ObjectAI_object03_Skeleton) ;83B4 (43B4) ()
	.word (ObjectAI_object04_FishMan) ;A27E (627E) ()
	.word (ObjectAI_object05_Knight) ;93E1 (53E1) ()
	.word (ObjectAI_object06_TwoHeadedCreature) ;A3E8 (63E8) ()
	.word (ObjectAI_object07_WaterSplash) ;840F (440F) ()
	.word (ObjectAI_object08_Eyeball) ;A7CA (67CA) ()
	.word (ObjectAI_object09) ;A7F2 (67F2) ()
	.word (ObjectAI_object0A_MedusaHead) ;AA45 (6A45) ()
	.word (TempPtr00_lo) ;0 (0) ()
	.word (ObjectAI_object0C_ThrownBone) ;9562 (5562) ()
	.word (ObjectAI_object0D_JumpingSkeleton) ;9622 (5622) ()
	.word (ObjectAI_object0E) ;8425 (4425) ()
	.word (ObjectAI_object0F) ;945B (545B) ()
	.word (ObjectAI_object10_Skull) ;B2E2 (72E2) ()
	.word (ObjectAI_object11) ;9934 (5934) ()
	.word (ObjectAI_object12_Wolf) ;A185 (6185) ()
	.word (ObjectAI_object13_Werewolf) ;A210 (6210) ()
	.word (ObjectAI_object14) ;9362 (5362) ()
	.word (ObjectAI_object15_Mudman) ;A367 (6367) ()
	.word (ObjectAI_object16_HoodedSkeleton) ;B092 (7092) ()
	.word (ObjectAI_object17_TownZombie) ;8F8C (4F8C) ()
	.word (ObjectAI_object18) ;AE95 (6E95) ()
	.word (ObjectAI_object19_DragonBones_Part1) ;B070 (7070) ()
	.word (ObjectAI_object1A) ;84EA (44EA) ()
	.word (ObjectAI_object1B_Raven) ;AB0C (6B0C) ()
	.word (ObjectAI_object1C) ;A9F4 (69F4) ()
	.word (ObjectAI_object1D_FlamingMan) ;B30A (730A) ()
	.word (ObjectAI_object1E) ;B1BD (71BD) ()
	.word (ObjectAI_object1F_SlimeyMansion) ;97D3 (57D3) ()
	.word (ObjectAI_object20) ;9762 (5762) ()
	.word (ObjectAI_object21_22_34_FloatingPlatform) ;854B (454B) ()
	.word (ObjectAI_object21_22_34_FloatingPlatform) ;854B (454B) ()
	.word (ObjectAI_object00_23)
	.word (ObjectAI_object24_TownSign) ;905A (505A) ()
	.word (ObjectAI_object25_CrystalBallAndBodypartBag) ;93BF (53BF) ()
	.word (ObjectAI_object26_27_ClueBook) ;8335 (4335) ()
	.word (ObjectAI_object26_27_ClueBook) ;8335 (4335) ()
	.word (ObjectAI_object28) ;8EE2 (4EE2) ()
	.word (ObjectAI_object29_2B_35_TownMonkAndLady) ;8F50 (4F50) ()
	.word (ObjectAI_object2A_TownBoy) ;8F0B (4F0B) ()
	.word (ObjectAI_object29_2B_35_TownMonkAndLady) ;8F50 (4F50) ()
	.word (ObjectAI_object2C_TownSittingMan) ;8F7D (4F7D) ()
	.word (ObjectAI_object2D_2E_2F_VendorAndPriest) ;83CC (43CC) ()
	.word (ObjectAI_object2D_2E_2F_VendorAndPriest) ;83CC (43CC) ()
	.word (ObjectAI_object2D_2E_2F_VendorAndPriest) ;83CC (43CC) ()
	.word (ObjectAI_object30_31_33_Fireball) ;838F (438F) ()
	.word (ObjectAI_object30_31_33_Fireball) ;838F (438F) ()
	.word (ObjectAI_object32) ;B386 (7386) ()
	.word (ObjectAI_object30_31_33_Fireball) ;838F (438F) ()
	.word (ObjectAI_object21_22_34_FloatingPlatform) ;854B (454B) ()
	.word (ObjectAI_object29_2B_35_TownMonkAndLady) ;8F50 (4F50) ()
	.word (ObjectAI_object36_MonsterDiedFlame) ;826F (426F) ()
	.word (ObjectAI_object37_Heart) ;829B (429B) ()
	.word (ObjectAI_object38) ;AE66 (6E66) ()
	.word (ObjectAI_object39_FlamingFlyingPirateSkeleton) ;AA6F (6A6F) ()
	.word (ObjectAI_object3A_Mummy) ;AD11 (6D11) ()
	.word (ObjectAI_object3B_Gargoyle) ;AC1E (6C1E) ()
	.word (ObjectAI_object3C_Ferryman_Part1) ;A431 (6431) ()
	.word (ObjectAI_object3D_Ferryman_Part2) ;A4DC (64DC) ()
	.word (ObjectAI_object3E_FallingStone) ;96E1 (56E1) ()
	.word (ObjectAI_object3F_Plant) ;AAA0 (6AA0) ()
	.word (ObjectAI_object40) ;AE21 (6E21) ()
	.word (ObjectAI_object41_SlimeyOutside) ;B119 (7119) ()
	.word (ObjectAI_object42) ;9CD8 (5CD8) ()
	.word (ObjectAI_object43_Maybe_Swamp) ;836C (436C) ()
	.word (ObjectAI_object44) ;9E1B (5E1B) ()
	.word (ObjectAI_object45) ;9DD2 (5DD2) ()
	.word (ObjectAI_object46) ;9EDD (5EDD) ()
	.word (ObjectAI_object47_DraculaMaybe) ;B594 (7594) ()
	.word (ObjectAI_object48) ;B68A (768A) ()
	.word (ObjectAI_object49) ;92FD (52FD) ()
	.word (ObjectAI_object4A_DragonBones_Part2) ;AFF4 (6FF4) ()
	.word (ObjectAI_object4B) ;B50A (750A) ()
	.word (ObjectAI_object4C) ;B577 (7577) ()
	.word (ObjectAI_object4D_DraculasDeath) ;B69F (769F) ()
ObjectAI_object36_MonsterDiedFlame:
	lda ObjectCurrentActionType,x
	bne @827C
	jsr Object_SetCurrentActionType_to_80
	lda #$20
	jmp SetObjectIndexToAutomaticSpriteDataTable_to_A_and_PaletteIndexTo0_and_RefreshSprite

	@827C:
	jsr ObjectLoadAutomaticSpriteNumber
	lda ObjectAIvar1,x
	cmp #$18
	bne @8297
	jsr Object_SetXandYVelocity16bit_ToZero
	jsr _func_1DFAD
	sta ObjectCurrentActionType,x
	lda #$37
	sta ObjectType,x
	jmp _82A0

	@8297:
	inc ObjectAIvar1,x
ObjectAI_object00_23:
	rts
;------------------------------------------
ObjectAI_object37_Heart:
	lda ObjectCurrentActionType,x
	bne _82E0
	_82A0:
	 lda #$04
	sta ObjectCurrentActionType,x
	lda RandomSeed
	and #$01
	bne Monster_BecomeHeart
_loc_42AB:
	jmp Object_Erase_And_IfType3C_Set_42to00
;------------------------------------------
Monster_BecomeHeart:
	lda ObjectAIvar2,x
	lsr a
	php
	 tay
	 lda CurrentLevelMapType
	 cmp #$01
	 beq @82C3
	 lda IsNightTime
	 bne @82C3
	 lda MonsterHeartTypeTable_At_Day,y
	 bne @82C6
	@82C3:
	 lda MonsterHeartTypeTable_At_Night_Or_InMansion,y
	@82C6:
	 plp
	bcs @82CE
	jsr Math_divAby16
	bne @82D0
	@82CE:
	and #$0F
	@82D0:
	 ora #$80
	sta ObjectCurrentPose1,x
	lda #$F0
	sta ObjectAIvar1,x
	lda #$00
	sta ObjectFacingLeft,x
	rts

	_82E0:
	  lda ObjectAIvar1,x
	beq _loc_42AB
	dec ObjectAIvar1,x
	rts
;------------------------------------------
MonsterHeartTypeTable_At_Day:
	.byte $BB,$BB,$BC,$CB,$BB,$BB,$BB,$BC,$BB,$BB,$CC,$CB,$CB,$BB,$BC,$BB
	.byte $BB,$BB,$BB,$BB,$BB,$BB,$BB,$BB,$BB,$BB,$BB,$BB,$BC,$DD,$BB,$BD
	.byte $CC,$BB,$BB,$BB,$BB,$C0
MonsterHeartTypeTable_At_Night_Or_InMansion:
	.byte $BC,$CC,$CC,$CB,$CC,$CC,$CC,$CD,$CC,$CC,$CD,$DC,$DB,$CC,$CD,$CB
	.byte $CC,$CC,$CC,$CC,$CC,$CC,$CC,$CC,$CC,$CC,$CC,$CC,$CD,$DD,$CC,$CD
	.byte $CC,$CC,$CC,$CC,$CC,$C0
ObjectAI_object26_27_ClueBook:
	lda ObjectCurrentActionType,x
	bne @8354
	lda #$04
	sta ObjectCurrentActionType,x
	lda #$08
	sta ObjectDialogStatusFlag,x
	lda ObjectType,x
	cmp #$27
	beq @834F
	lda #$20
	bne @8351

	@834F:
	lda #$3B
	@8351:
	 jmp SetObjectIndexToAutomaticSpriteDataTable_to_A_and_PaletteIndexTo0_and_RefreshSprite

	@8354:
	  lda ObjectAIvar1,x
	bne @8369
	lda ObjectDialogStatusFlag,x
	and #$F7
	ldy InventoryBodyPartSelection
	cpy #$03
	beq @8366
	ora #$08
	@8366:
	sta ObjectDialogStatusFlag,x
	@8369:
	 jmp ObjectLoadAutomaticSpriteNumber
;------------------------------------------
ObjectAI_object43_Maybe_Swamp:
	lda ObjectCurrentActionType,x
	bne @8378
	lda #$82
	ldy #$00
	jmp Object_SetCurrentActionType_And_Y_as_Pose1

	@8378:
	ldy #$18
	@837A:
	lda ObjectScreenYCoord,x
	sta $0200,y
	lda ObjectScreenXCoord,x
	sta $0203,y
	iny
	iny
	iny
	iny
	cpy #$38
	bcc @837A
	rts
;------------------------------------------
ObjectAI_object30_31_33_Fireball:
	lda ObjectCurrentActionType,x
	bne @83B1
	lda #$02
	sta ObjectCurrentActionType,x
	lda ObjectType,x
	cmp #$33
	bne @83A9
	lda #$01
	sta ObjectEnemyRemainingHP,x
	lda #$48
	bne @83AB

	@83A9:
	lda #$29
	@83AB:
	 sta ObjectCurrentPose1,x
	jmp Object_SetFacing_FaceTowardsSimon

	@83B1:
	  jmp Object_GeneringXYmovementEngine
;------------------------------------------
ObjectAI_object03_Skeleton:
	lda ObjectCurrentActionType,x
	bne @83C6
	jsr Object_SetCurrentActionType_to_01
	lda #$05
	jsr SetObjectIndexToAutomaticSpriteDataTable_to_A_and_PaletteIndexTo0_and_RefreshSprite
	lda #$80
	jmp _func_1DE6F

	@83C6:
	jsr ObjectLoadAutomaticSpriteNumber
	jmp _func_4629
;------------------------------------------
ObjectAI_object2D_2E_2F_VendorAndPriest:
	lda ObjectCurrentActionType,x
	bne _83F6
	lda #$40
	sta ObjectCurrentActionType,x
	lda ObjectType,x
	sec
	sbc #$2D
	tay
	lda _data_43F3_indexed,y
	sta Temp93
	cmp #$0F
	bne @83EE
	lda CurrentLevelMapType
	beq @83EE
	lda #$0B
	sta Temp93
	@83EE:
	lda Temp93
	jmp SetObjectIndexToAutomaticSpriteDataTable_to_A_and_PaletteIndexTo0_and_RefreshSprite
;------------------------------------------
_data_43F3_indexed:
	.byte $0C,$0B,$0F
	_83F6:
	 jsr ObjectLoadAutomaticSpriteNumber
	lda ObjectAIvar1,x
	cmp #$50
	bne @8408
	jsr _func_1DFAD
	lda #$80
	jsr _func_1DE6F
	@8408:
	jsr _func_4629
	inc ObjectAIvar1,x
	rts
;------------------------------------------
ObjectAI_object07_WaterSplash:
	lda ObjectCurrentActionType,x
	bne @841B
	lda #$82
	ldy #$5C
	jmp Object_SetCurrentActionType_And_Y_as_Pose1

	@841B:
	lda #$18
	sta TempPtr08_lo
	jsr Object_GravityAccelerateBy_Var08
	jmp Object_GeneringXYmovementEngine
;------------------------------------------
ObjectAI_object0E:
	lda ObjectCurrentActionType,x
	bne @8432
	jsr Object_SetCurrentActionType_to_01
	lda #$23
	jmp SetObjectIndexToAutomaticSpriteDataTable_to_A_and_PaletteIndexTo0_and_RefreshSprite

	@8432:
	jsr ObjectLoadAutomaticSpriteNumber
	lda ObjectDialogTextIndex,x
	cmp #$80
	bne @8452
	asl a
	sta ObjectDialogTextIndex,x
	lda ObjectDialogStatusFlag,x
	bne @8452
	lda #$1C
	jsr AnyBankPlayTracks
	jsr Object_ComparePositionToSimonPosition
	lda #$33
	jmp Object_CreateProjectileTowardsSimon

	@8452:
	inc ObjectDialogTextIndex,x
	lda ObjectAIvar1,x
	jsr JumpWithParams
ObjectAI_object0E_actions:
	.word (ObjectAI_object0E_actions_4463) ;8463 (4463) ()
	.word (ObjectAI_object0E_actions_446C) ;846C (446C) ()
	.word (ObjectAI_object0E_actions_447F) ;847F (447F) ()
	.word (ObjectAI_object0E_actions_44B9) ;84B9 (44B9) ()
ObjectAI_object0E_actions_4463:
	lda #$C0
	jsr _func_1DE6F
_loc_4468:
	inc ObjectAIvar1,x
	rts
;------------------------------------------
ObjectAI_object0E_actions_446C:
	inc ObjectAIvar2,x
	lda ObjectAIvar2,x
	cmp #$30
	beq _loc_4468
	lda CurrentLevelMapType
	cmp #$01
	bne _loc_44D7
	jmp _func_4629
;------------------------------------------
ObjectAI_object0E_actions_447F:
	stx Unknown10_CollisionAndScrollingTemp
	lda #$00
	sta ObjectAIvar2,x
	sta ObjectXSpeed,x
	sta ObjectXSpeedFrac,x
	jsr Object_FindUnusedSlot
	bcs @84B1
	ldy Unknown10_CollisionAndScrollingTemp
	lda ObjectDialogStatusFlag,y
	bne @84B1
	lda #$1A
	jsr _func_1DE7B
	lda Unknown10_CollisionAndScrollingTemp
	sta ObjectAIvar1,x
	lda #$01
	sta ObjectYSpeed,y
	txa
	sta ObjectAIvar4,y
	ldx Unknown10_CollisionAndScrollingTemp
	inc ObjectAIvar1,x
	rts

	@84B1:
	ldx Unknown10_CollisionAndScrollingTemp
	lda #$00
	sta ObjectAIvar1,x
	rts
;------------------------------------------
ObjectAI_object0E_actions_44B9:
	inc ObjectAIvar3,x
	lda ObjectAIvar3,x
	cmp #$40
	bne _loc_44D7
	inc Ending_PrimaryActionIndex,x
	lda Ending_PrimaryActionIndex,x
	cmp #$02
	beq _84DA
	lda #$00
	sta ObjectAIvar3,x
	lda #$FF
	sta ObjectYSpeed,x
_loc_44D7:
	jmp Object_GeneringXYmovementEngine

	_84DA:
	jsr _func_1DFA3
	sta Ending_PrimaryActionIndex,x
	sta ObjectAIvar4,x
	sta ObjectYSpeed,x
	inc ObjectScreenYCoord,x
_loc_44E9:
	rts
;------------------------------------------
ObjectAI_object1A:
	lda ObjectCurrentActionType,x
	bne @84F6
	lda #$80
	ldy #$75
	jmp Object_SetCurrentActionType_And_Y_as_Pose1

	@84F6:
	stx Unknown10_CollisionAndScrollingTemp
	ldy Unknown10_CollisionAndScrollingTemp
	lda ObjectAIvar1,x
	tax
	lda ObjectType,x
	beq @853E
	lda ObjectType,x
	cmp #$36
	beq @853E
	lda ObjectDialogStatusFlag,x
	sta ObjectDialogStatusFlag,y
	lda ObjectStunCounter,x
	sta ObjectStunCounter,y
	ldx Unknown10_CollisionAndScrollingTemp
	inc ObjectAIvar3,x
	lda ObjectAIvar3,x
	cmp #$10
	bne _loc_44E9
	lda #$00
	sta ObjectAIvar3,x
	lda ObjectAIvar2,x
	tay
	lda _data_4543_indexed,y
	sta ObjectCurrentPose1,x
	inc ObjectAIvar2,x
	lda ObjectAIvar2,x
	cmp #$08
	bne _loc_44E9
	jmp _loc_1DF7F

	@853E:
	ldx Unknown10_CollisionAndScrollingTemp
	jmp Object_Erase_And_IfType3C_Set_42to00
;------------------------------------------
_data_4543_indexed:
	.byte $76,$77,$85,$85,$77,$76,$75,$00
ObjectAI_object21_22_34_FloatingPlatform:
	lda ObjectAIvar4,x
	beq @8553
	dec ObjectAIvar4,x
	@8553:
	lda ObjectCurrentActionType,x
	bne _85A5
	jsr Object_SetCurrentActionType_to_80
	lda ObjectType,x
	cmp #$22
	beq @856E
	cmp #$34
	beq @856A
	lda #$51
	bne @8570

	@856A:
	lda #$1B
	bne @8570

	@856E:
	 lda #$43
	@8570:
	  sta ObjectCurrentPose1,x
	lda ObjectEnemyRemainingHP,x
	and #$0F
	jsr JumpWithParams
ObjectAI_object21_22_34_actions1:
	.word (ObjectAI_object21_22_34_actions1_4589) ;8589 (4589) ()
	.word (ObjectAI_object21_22_34_actions1_4589) ;8589 (4589) ()
	.word (ObjectAI_object21_22_34_actions1_4590) ;8590 (4590) ()
	.word (ObjectAI_object21_22_34_actions1_4594) ;8594 (4594) ()
	.word (ObjectAI_object21_22_34_actions1_4589) ;8589 (4589) ()
	.word (ObjectAI_object21_22_34_actions1_459A) ;859A (459A) ()
	.word (ObjectAI_object21_22_34_actions1_459E) ;859E (459E) ()
ObjectAI_object21_22_34_actions1_4589:
	lda #$00
	ldy #$80
	jmp Object_SetYVelocity16bit_from_AY
;------------------------------------------
ObjectAI_object21_22_34_actions1_4590:
	lda #$00
	beq _loc_4596
;------------------------------------------
ObjectAI_object21_22_34_actions1_4594:
	lda #$FF
_loc_4596:
	ldy #$80
	bne _loc_45A2
;------------------------------------------
ObjectAI_object21_22_34_actions1_459A:
	lda #$01
	bne _loc_45A0
;------------------------------------------
ObjectAI_object21_22_34_actions1_459E:
	lda #$FF
_loc_45A0:
	ldy #$00
_loc_45A2:
	jmp Object_SetXVelocity16bit_from_AY_invert_if_ObjectFacingLeft_set

	_85A5:
	   lda ObjectEnemyRemainingHP,x
	and #$0F
	jsr JumpWithParams
ObjectAI_object21_22_34_actions2:
	.word (ObjectAI_object21_22_34_actions2_45BB) ;85BB (45BB) ()
	.word (ObjectAI_object21_22_34_actions2_45BB) ;85BB (45BB) ()
	.word (ObjectAI_object21_22_34_actions2_45D1) ;85D1 (45D1) ()
	.word (ObjectAI_object21_22_34_actions2_45D1) ;85D1 (45D1) ()
	.word (ObjectAI_object21_22_34_actions2_45FE) ;85FE (45FE) ()
	.word (ObjectAI_object21_22_34_actions2_4616) ;8616 (4616) ()
	.word (ObjectAI_object21_22_34_actions2_4616) ;8616 (4616) ()
ObjectAI_object21_22_34_actions2_45BB:
	lda ObjectAIvar2,x
	bne _loc_45CB
	lda ObjectEnemyRemainingHP,x
	and #$F0
	sta ObjectAIvar2,x
	jmp Object_SetYVelocity16bit_InvertCurrent
;------------------------------------------
_loc_45CB:
	dec ObjectAIvar2,x
	jmp Object_GeneringXYmovementEngine
;------------------------------------------
ObjectAI_object21_22_34_actions2_45D1:
	lda InventoryBodyPartSelection
	cmp #$06
	beq @85DE
	lda ObjectDialogStatusFlag,x
	ora #$20
	bne @85E3
	@85DE:
	lda ObjectDialogStatusFlag,x
	and #$DF
	@85E3:
	 sta ObjectDialogStatusFlag,x
	lda ObjectXSpeed,x
	bmi @85EF
	lda #$0D
	bne @85F1

	@85EF:
	lda #$F3
	@85F1:
	 ldy #$00
	jsr Object_GenericCollisionHelper_ParamAY_ReturnCarry_IfFrameOddThenDefaultSEC
	bcs @85FB
	jsr Object_SetXVelocity16bit_InvertCurrent
	@85FB:
	jmp Object_GeneringXYmovementEngine
;------------------------------------------
ObjectAI_object21_22_34_actions2_45FE:
	lda InventoryBodyPartSelection
	cmp #$06
	beq @860B
	lda ObjectDialogStatusFlag,x
	ora #$20
	bne @8610
	@860B:
	lda ObjectDialogStatusFlag,x
	and #$DF
	@8610:
	 sta ObjectDialogStatusFlag,x
	jmp ObjectAI_object21_22_34_actions2_45BB
;------------------------------------------
ObjectAI_object21_22_34_actions2_4616:
	lda ObjectAIvar2,x
	bne _loc_45CB
	lda ObjectEnemyRemainingHP,x
	and #$F0
	sta ObjectAIvar2,x
	jsr Object_SetXVelocity16bit_InvertCurrent
	jmp _loc_45CB
;------------------------------------------
_func_4629:
	jsr _func_1DE8B
	jsr _func_1DEA1
	jmp Object_GeneringXYmovementEngine
;------------------------------------------
PickUpBodyPartTable:
	.byte $01,$02,$04,$08,$10,$20,$40,$80
; -----------------------------------------
	.export _func_463A
_func_463A:
	jsr Run_Actions_For_Weapons
	jsr Run_Maybe_CheckDialogActivation
	jmp _loc_488D
;------------------------------------------
Run_Maybe_CheckDialogActivation:
	lda DeathStateRelatedFlagMaybe
	beq :+
	rts

	; Elapse Simon's Invulnerability counter
:	lda ObjectStunCounter
	beq @8650
	dec ObjectStunCounter
	@8650:
	lda FrameCounter
	and #$01
	bne @865A
	lda #$06
	bne @865C

	@865A:
	lda #$07
	@865C:
	 tax
	_865D:
	 lda ObjectType,x
	bmi @8664
	bne @8667
	@8664:
	  jmp _loc_4855

	@8667:
	 lda ObjectDialogStatusFlag,x
	bne @8664
	lda #$00
	sta TempPtr02_lo
	jsr ObjectLoadHitbox
	lda ObjectScreenXCoord
	sec
	sbc ObjectScreenXCoord,x
	bpl @8681
	jsr Math_NegateA
	inc TempPtr02_lo
	@8681:
	sec
	sbc ObstaclePointerLo
	sec
	sbc #$06
	bmi @868C
	jmp _loc_4855

	@868C:
	lda ObjectScreenYCoord,x
	clc
	adc TempPtr08_lo
	sta TempPtr00_lo
	lda ObjectScreenYCoord
	clc
	adc #$03
	sec
	sbc TempPtr00_lo
	bpl @86A2
	jsr Math_NegateA
	@86A2:
	sec
	sbc TempPtr08_hi
	sec
	sbc #$0A
	bmi @86AD
	jmp _loc_4855

	@86AD:
	lda ObjectCurrentActionType,x
	and #$80
	bne _872C
	lda ObjectCurrentActionType,x
	and #$40
	beq _872D
	lda Unknown43
	beq @86C3
	lda Unknown41
	bne _872C
	@86C3:
	lda #$80
	sta TimeRelated3F
	lda ObjectType,x
	cmp #$2E
	beq NPC_SelectDialogForVendor
	cmp #$2F
	beq NPC_SelectDialogForObject2F_or_1E
	cmp #$1E
	beq NPC_SelectDialogForObject2F_or_1E
	cmp #$3C
	beq NPC_SelectDialogForFerryMan
NPC_SelectDialogForEveryoneElse:
	lda ObjectDialogTextIndex,x
	sta DialogTextID
	lda ObjectType,x
	cmp #$2D
	beq @86EA
	lda #$00
	beq _872A

	@86EA:
	lda #$A0
	bne _872A
;------------------------------------------
NPC_SelectDialogForFerryMan:
	ldy #$00
	lda InventoryBodyPartSelection
	cmp #$02
	bne NPC_SelectDialog_FerrymanDefault
	lda CurrentLevelSceneNumber
	cmp #$07
	bne NPC_SelectDialog_FerrymanDefault
	lda CurrentLevelSubRoomNumber
	and #$01
	beq NPC_SelectDialog_FerrymanDefault
NPC_SelectDialog_FerrymanSpecial:
	lda #$0C
	ldy #$01
	bne _loc_470A
;------------------------------------------
NPC_SelectDialog_FerrymanDefault:
	lda #$0B
_loc_470A:
	sta DialogTextID
	sty Unknown04EC
	lda #$C0
	bne _872A
;------------------------------------------
NPC_SelectDialogForObject2F_or_1E:
	lda #$40
	sta TempPtr08_lo
	bne _loc_4725
;------------------------------------------
NPC_SelectDialogForVendor:
	ldy ObjectDialogTextIndex,x
	lda NPC_VendorTextIndexTable,y
	sta DialogTextID
	lda #$20
	sta TempPtr08_lo
_loc_4725:
	lda ObjectDialogTextIndex,x
	ora TempPtr08_lo
	_872A:
	 sta DialogActivationState
	_872C:
	  rts

	_872D:
	   lda ObjectCurrentActionType,x
	and #$04
	bne @8737
	jmp HandleSimonAndEnemyObjectCollision

	@8737:
	lda ObjectCurrentPose1,x
	cmp #$8B
	bne _loc_4744
PickupSmallHeart:
	lda #$02
	ldy #$01
	bne IncreaseHeartsCounter
;------------------------------------------
_loc_4744:
	lda ObjectCurrentPose1,x
	cmp #$8C
	bne _loc_4751
PickupHalfHeart:
	lda #$04
	ldy #$03
	bne IncreaseHeartsCounter
;------------------------------------------
_loc_4751:
	lda ObjectCurrentPose1,x
	cmp #$8D
	bne _loc_4784
PickupFullHeart:
	lda #$06
	ldy #$05
IncreaseHeartsCounter:
	sta TempPtr08_lo
	lda HeartsDigits0011
	sta TempPtr08_hi
	jsr MathBCD_addition_In_Var08_Var09_Out_AandCarry_Temp_Var0A_Var0B
	sta HeartsDigits0011
	bcc @8776
	lda #$01
	sta TempPtr08_lo
	lda HeartsDigits1100
	sta TempPtr08_hi
	jsr MathBCD_addition_In_Var08_Var09_Out_AandCarry_Temp_Var0A_Var0B
	sta HeartsDigits1100
	@8776:
	jsr ClampHeartCounterAt256
	jsr GiveExperience_valueInY
	lda #$1F
	jsr AnyBankPlayTracks
	jmp Object_Erase_And_IfType3C_Set_42to00
;------------------------------------------
_loc_4784:
	lda ObjectType,x
	cmp #$25
	bne PickUpClueBookOrOtherItem
	lda ObjectEnemyRemainingHP,x
	and #$0F
	sec
	sbc #$08
	tay
	lda PickUpBodyPartTable,y
	ora InventoryBodyParts1
	sta InventoryBodyParts1
PickUpClueBookOrOtherItem:
	lda #$22
	jsr AnyBankPlayTracks
	lda #$80
	sta TimeRelated3F
	lda ObjectEnemyRemainingHP,x
	sta DialogTextID
	lda ObjectType,x
	cmp #$27
	beq _loc_47D7
	cmp #$26
	beq @87CD
	cmp #$49
	bne @87D3
	lda ObjectEnemyRemainingHP,x
	cmp #$26
	bne @87C7
	lda InventoryMiscItems1
	ora #$02
	sta InventoryMiscItems1
	bne @87D3
	@87C7:
	lda InventoryMiscItems2
	ora #$04
	bne @87D1
	@87CD:
	 lda InventoryMiscItems2
	ora #$20
	@87D1:
	  sta InventoryMiscItems2
	@87D3:
	   lda #$60
	bne _loc_47D9
;------------------------------------------
_loc_47D7:
	lda #$80
_loc_47D9:
	sta DialogActivationState
	jmp Object_Erase_And_IfType3C_Set_42to00
;------------------------------------------
HandleSimonAndEnemyObjectCollision:
	lda UnknownFlag04D6
	beq @880D
	lda ObjectCurrentActionType,x
	and #$02
	beq @880D
	lda ObjectType,x
	cmp #$30
	beq @87F5
	cmp #$31
	bne @880D
	@87F5:
	lda ObjectFacingLeft
	cmp ObjectFacingLeft,x
	beq @880D
	lda #$14
	jsr AnyBankPlayTracks
	lda ObjectCurrentActionType,x
	ora #$80
	sta ObjectCurrentActionType,x
	jmp Object_SetXVelocity16bit_InvertCurrent

	@880D:
	 lda RemainingLaurelPower
	bne @8817
	lda ObjectStunCounter
	beq @8818
	@8817:
	rts

	@8818:
	 lda CurrentLevel
	asl a
	tay
	lda HPreductionTable,y
	sta TempPtr08_lo
	lda HPreductionTable+1,y
	sta TempPtr08_hi
	lda ObjectType,x
	lsr a
	tay
	lda HPcostByMonsterHit,y
	bcs @8835
	jsr Math_divAby16
	bne @8837
	@8835:
	and #$0F
	@8837:
	 tay
	lda (TempPtr08_lo),y
	sta TempPtr08_lo
	jsr DecreaseHPbyVar08
	lda #$40
	sta ObjectStunCounter
	ldy #$00
	lda ObjectScreenXCoord,x
	cmp ObjectScreenXCoord
	bcc @884F
	iny
	@884F:
	sty ObjectFacingLeft
	jmp SimonDamageKnockBack
;------------------------------------------
_loc_4855:
	inx
	inx
	cpx #$12
	bcs @885E
	jmp _865D

	@885E:
	clc
	rts
;------------------------------------------
ClampHeartCounterAt256:
	lda HeartsDigits1100
	cmp #$02
	bcc @8870
	lda HeartsDigits0011
	cmp #$56
	bcc @8870
	lda #$56
	sta HeartsDigits0011
	@8870:
	rts
;------------------------------------------
NPC_VendorTextIndexTable:
	.byte $30,$01,$2F,$37,$36,$10,$1D,$32,$33,$34,$35

; -----------------------------------------------------------------------------
	.export NPCtalkAction_Do
NPCtalkAction_Do:
	jsr JumpWithParams
_JumpPointerTable_487F:
	.word (NPCtalkAction_GiftGiver_Diamond) ;AA3A (6A3A) ()
	.word (NPCtalkAction_GiftGiver_Laurels) ;9347 (5347) ()
	.word (NPCtalkAction_GiftGiver_Silkbag) ;AE03 (6E03) ()
	.word (NPCtalkAction_CrystalExchanger_Blue) ;906F (506F) ()
	.word (NPCtalkAction_CrystalExchanger_Red) ;9088 (5088) ()
	.word (NPCtalkAction_FireWhipUpgrader) ;8C72 (4C72) ()
	.word (NPCtalkAction_GiftGiver_SilverKnife) ;AE12 (6E12) ()
_loc_488D:
	lda $0445
	cmp #$03
	beq @8895
	rts

	@8895:
	lda ObjectFacingLeft
	bne @889E
	lda #$EA
	bne @88A0

	@889E:
	lda #$16
	@88A0:
	 sta Unknown11_CollisionAndScrollingTemp
	lda ObjectScreenYCoord
	clc
	adc #$FC
	sta Unknown10_CollisionAndScrollingTemp
	lda ObjectScreenXCoord
	clc
	adc Unknown11_CollisionAndScrollingTemp
	sta Unknown11_CollisionAndScrollingTemp
	ldy CurrentWhipLevel
	lda WhipHitDistanceTable,y
	sta Unknown12_CollisionAndScrollingTemp
	lda WhipPowerByLevelTable,y
	sta Unknown13_Horizontal_32pixelUnitForObject
	ldx #$06
_loc_48C1:
	lda ObjectType,x
	bpl @88C9
	jmp _895F

	@88C9:
	lda ObjectStunCounter,x
	bne @88D9
	lda ObjectType,x
	cmp #$36
	beq @88D9
	cmp #$37
	bne @88DC
	@88D9:
	  jmp _895F

	@88DC:
	 lda ObjectCurrentActionType,x
	and #$C4
	bne @88D9
	lda ObjectDialogStatusFlag,x
	bne @88D9
	jsr ObjectLoadHitbox
	lda Unknown11_CollisionAndScrollingTemp
	sec
	sbc ObjectScreenXCoord,x
	bpl @88F6
	jsr Math_NegateA
	@88F6:
	sec
	sbc ObstaclePointerLo
	sec
	sbc Unknown12_CollisionAndScrollingTemp
	bpl _895F
	lda ObjectScreenYCoord,x
	clc
	adc TempPtr08_lo
	sta Unknown14_Horizontal_256pixelUnitForObject
	lda Unknown10_CollisionAndScrollingTemp
	sec
	sbc Unknown14_Horizontal_256pixelUnitForObject
	bpl @8910
	jsr Math_NegateA
	@8910:
	sec
	sbc TempPtr08_hi
	sec
	sbc #$04
	bpl _895F
	lda ObjectEnemyRemainingHP,x
	beq _loc_4971
	sec
	sbc Unknown13_Horizontal_32pixelUnitForObject
	sta ObjectEnemyRemainingHP,x
	bcc @8927
	bne _8967
	@8927:
	lda ObjectType,x
	cmp #$42
	beq _loc_4972
	cmp #$44
	beq _loc_4972
	cmp #$47
	bne @8939
	jmp _loc_4AA6

	@8939:
	lda #$1A
	jsr AnyBankPlayTracks
	lda ObjectCurrentActionType,x
	and #$02
	bne _895C
	_8945:
	   lda ObjectType,x
	sta ObjectAIvar2,x
	jsr Object_SetXandYVelocity16bit_ToZero
	lda #$00
	sta ObjectCurrentActionType,x
	sta ObjectAIvar1,x
	lda #$36
	sta ObjectType,x
	rts

	_895C:
	jmp Object_Erase_And_IfType3C_Set_42to00

	_895F:
	  inx
	cpx #$12
	beq _loc_4971
	jmp _loc_48C1

	_8967:
	   lda #$18
	jsr AnyBankPlayTracks
	lda #$10
	sta ObjectStunCounter,x
_loc_4971:
	rts
;------------------------------------------
_loc_4972:
	jsr Object_Erase_And_IfType3C_Set_42to00
	lda #$49
	sta ObjectType,x
	lda #$21
	jmp AnyBankPlayTracks
;------------------------------------------
Run_Actions_For_Weapons:
	ldx #$03
	_8981:
	  lda ObjectType,x
	beq @898B
	lda ObjectDialogStatusFlag,x
	beq @898E
	@898B:
	jmp _loc_4A89

	@898E:
	 lda ObjectType,x
	cmp #$02
	beq @89AA
	cmp #$03
	beq @89AA
	cmp #$05
	beq @89AA
	cmp #$06
	beq @89AA
	tay
	lda _data_4BE7_indexed,y
	sta ObstaclePointerHi
	jmp @89BE

	@89AA:
	ldy CurrentWhipLevel
	lda WhipPowerByLevelTable,y
	sta ObstaclePointerHi
	lda ObjectType,x
	cmp #$03
	beq @89BE
	lda ObstaclePointerHi
	lsr a
	sta ObstaclePointerHi
	@89BE:
	 ldy #$06
	@89C0:
	 lda ObjectType,y
	bne @89C8
	@89C5:
	jmp @8A81

	@89C8:
	cmp #$36
	beq @89C5
	cmp #$37
	beq @89C5
	cmp #$25
	beq @89E0
	lda ObjectDialogStatusFlag,y
	bne @89C5
	lda ObjectCurrentActionType,y
	and #$C2
	bne @89C5
	@89E0:
	lda ObjectStunCounter,y
	beq @89E8
	jmp @8A81

	@89E8:
	sty Temp97
	stx Temp93
	tya
	tax
	jsr ObjectLoadHitbox
	ldx Temp93
	ldy Temp97
	lda ObjectScreenXCoord,x
	sec
	sbc ObjectScreenXCoord,y
	bpl @8A03
	jsr Math_NegateA
	inc TempPtr02_lo
	@8A03:
	sec
	sbc ObstaclePointerLo
	sec
	sbc #$04
	bmi @8A0E
	jmp @8A81

	@8A0E:
	lda ObjectScreenYCoord,y
	clc
	adc TempPtr08_lo
	sta TempPtr00_lo
	lda ObjectScreenYCoord,x
	sec
	sbc TempPtr00_lo
	bpl @8A21
	jsr Math_NegateA
	@8A21:
	sec
	sbc TempPtr08_hi
	sec
	sbc #$04
	bmi @8A2B
	bne @8A81
	@8A2B:
	lda ObjectType,x
	cmp #$03
	bne @8A44
	lda ObjectCurrentActionType,y
	and #$04
	bne @8A81
	lda ObjectEnemyRemainingHP,x
	bne @8A41
	inc ObjectEnemyRemainingHP,x
	@8A41:
	jmp @8A52

	@8A44:
	 cmp #$07
	beq _loc_4A9C
	lda ObjectType,y
	cmp #$42
	bne @8A52
	jmp @8A81

	@8A52:
	  lda ObjectCurrentActionType,y
	and #$04
	bne @8A81
	lda ObjectEnemyRemainingHP,y
	beq @8A81
	sec
	sbc ObstaclePointerHi
	sta ObjectEnemyRemainingHP,y
	bcc @8A68
	bne _loc_4A91
	@8A68:
	lda ObjectType,y
	cmp #$42
	beq _loc_4A9F
	cmp #$44
	beq _loc_4A9F
	cmp #$47
	beq _loc_4AA4
	lda #$1A
	jsr AnyBankPlayTracks
	tya
	tax
	jmp _8945

	@8A81:
	   iny
	cpy #$12
	beq _loc_4A89
	jmp @89C0
;------------------------------------------
_loc_4A89:
	inx
	cpx #$06
	beq _loc_4A9B
	jmp _8981
;------------------------------------------
_loc_4A91:
	lda #$18
	jsr AnyBankPlayTracks
	lda #$20
	sta ObjectStunCounter,y
_loc_4A9B:
	rts
;------------------------------------------
_loc_4A9C:
	jmp _loc_52CD
;------------------------------------------
_loc_4A9F:
	tya
	tax
	jmp _loc_4972
;------------------------------------------
_loc_4AA4:
	tya
	tax
_loc_4AA6:
	stx $96
	jsr AnyBankTerminateSound
	lda #$21
	jsr AnyBankPlayTracks
	ldx $96
	lda #$4D
	sta ObjectType,x
	lda #$00
	sta ObjectCurrentActionType,x
	sta ObjectEnemyRemainingHP,x
	rts
;------------------------------------------
Actor_HitboxTable:
	.word (HitboxTypes_For_Object00_and_47) ;8B56 (4B56) ()
	.word (HitboxTypes_For_Object01_08_09_0A_0C_0E_12_1A_20_33_3E_45) ;8B5E (4B5E) ()
	.word (HitboxTypes_For_Object02_40) ;8B5C (4B5C) ()
	.word (HitboxTypes_For_Object03_07_0B_0D_0F_10_13_14_16_17_1C_1D_1E_21_22_23_24_28_29_2A_2B_2C_2D_2E_2F_34_35_36_37_39_3B_3C_3D_43) ;8B57 (4B57) ()
	.word (HitboxTypes_For_Object04) ;8B77 (4B77) ()
	.word (HitboxTypes_For_Object05_06_11) ;8B61 (4B61) ()
	.word (HitboxTypes_For_Object05_06_11) ;8B61 (4B61) ()
	.word (HitboxTypes_For_Object03_07_0B_0D_0F_10_13_14_16_17_1C_1D_1E_21_22_23_24_28_29_2A_2B_2C_2D_2E_2F_34_35_36_37_39_3B_3C_3D_43) ;8B57 (4B57) ()
	.word (HitboxTypes_For_Object01_08_09_0A_0C_0E_12_1A_20_33_3E_45) ;8B5E (4B5E) ()
	.word (HitboxTypes_For_Object01_08_09_0A_0C_0E_12_1A_20_33_3E_45) ;8B5E (4B5E) ()
	.word (HitboxTypes_For_Object01_08_09_0A_0C_0E_12_1A_20_33_3E_45) ;8B5E (4B5E) ()
	.word (HitboxTypes_For_Object03_07_0B_0D_0F_10_13_14_16_17_1C_1D_1E_21_22_23_24_28_29_2A_2B_2C_2D_2E_2F_34_35_36_37_39_3B_3C_3D_43) ;8B57 (4B57) ()
	.word (HitboxTypes_For_Object01_08_09_0A_0C_0E_12_1A_20_33_3E_45) ;8B5E (4B5E) ()
	.word (HitboxTypes_For_Object03_07_0B_0D_0F_10_13_14_16_17_1C_1D_1E_21_22_23_24_28_29_2A_2B_2C_2D_2E_2F_34_35_36_37_39_3B_3C_3D_43) ;8B57 (4B57) ()
	.word (HitboxTypes_For_Object01_08_09_0A_0C_0E_12_1A_20_33_3E_45) ;8B5E (4B5E) ()
	.word (HitboxTypes_For_Object03_07_0B_0D_0F_10_13_14_16_17_1C_1D_1E_21_22_23_24_28_29_2A_2B_2C_2D_2E_2F_34_35_36_37_39_3B_3C_3D_43) ;8B57 (4B57) ()
	.word (HitboxTypes_For_Object03_07_0B_0D_0F_10_13_14_16_17_1C_1D_1E_21_22_23_24_28_29_2A_2B_2C_2D_2E_2F_34_35_36_37_39_3B_3C_3D_43) ;8B57 (4B57) ()
	.word (HitboxTypes_For_Object05_06_11) ;8B61 (4B61) ()
	.word (HitboxTypes_For_Object01_08_09_0A_0C_0E_12_1A_20_33_3E_45) ;8B5E (4B5E) ()
	.word (HitboxTypes_For_Object03_07_0B_0D_0F_10_13_14_16_17_1C_1D_1E_21_22_23_24_28_29_2A_2B_2C_2D_2E_2F_34_35_36_37_39_3B_3C_3D_43) ;8B57 (4B57) ()
	.word (HitboxTypes_For_Object03_07_0B_0D_0F_10_13_14_16_17_1C_1D_1E_21_22_23_24_28_29_2A_2B_2C_2D_2E_2F_34_35_36_37_39_3B_3C_3D_43) ;8B57 (4B57) ()
	.word (HitboxTypes_For_Object15_18) ;8B64 (4B64) ()
	.word (HitboxTypes_For_Object03_07_0B_0D_0F_10_13_14_16_17_1C_1D_1E_21_22_23_24_28_29_2A_2B_2C_2D_2E_2F_34_35_36_37_39_3B_3C_3D_43) ;8B57 (4B57) ()
	.word (HitboxTypes_For_Object03_07_0B_0D_0F_10_13_14_16_17_1C_1D_1E_21_22_23_24_28_29_2A_2B_2C_2D_2E_2F_34_35_36_37_39_3B_3C_3D_43) ;8B57 (4B57) ()
	.word (HitboxTypes_For_Object15_18) ;8B64 (4B64) ()
	.word (HitboxTypes_For_Object19_30_31_46) ;8B6F (4B6F) ()
	.word (HitboxTypes_For_Object01_08_09_0A_0C_0E_12_1A_20_33_3E_45) ;8B5E (4B5E) ()
	.word (HitboxTypes_For_Object1B) ;8B67 (4B67) ()
	.word (HitboxTypes_For_Object03_07_0B_0D_0F_10_13_14_16_17_1C_1D_1E_21_22_23_24_28_29_2A_2B_2C_2D_2E_2F_34_35_36_37_39_3B_3C_3D_43) ;8B57 (4B57) ()
	.word (HitboxTypes_For_Object03_07_0B_0D_0F_10_13_14_16_17_1C_1D_1E_21_22_23_24_28_29_2A_2B_2C_2D_2E_2F_34_35_36_37_39_3B_3C_3D_43) ;8B57 (4B57) ()
	.word (HitboxTypes_For_Object03_07_0B_0D_0F_10_13_14_16_17_1C_1D_1E_21_22_23_24_28_29_2A_2B_2C_2D_2E_2F_34_35_36_37_39_3B_3C_3D_43) ;8B57 (4B57) ()
	.word (HitboxTypes_For_Object1F_32_41_48) ;8B65 (4B65) ()
	.word (HitboxTypes_For_Object01_08_09_0A_0C_0E_12_1A_20_33_3E_45) ;8B5E (4B5E) ()
	.word (HitboxTypes_For_Object03_07_0B_0D_0F_10_13_14_16_17_1C_1D_1E_21_22_23_24_28_29_2A_2B_2C_2D_2E_2F_34_35_36_37_39_3B_3C_3D_43) ;8B57 (4B57) ()
	.word (HitboxTypes_For_Object03_07_0B_0D_0F_10_13_14_16_17_1C_1D_1E_21_22_23_24_28_29_2A_2B_2C_2D_2E_2F_34_35_36_37_39_3B_3C_3D_43) ;8B57 (4B57) ()
	.word (HitboxTypes_For_Object03_07_0B_0D_0F_10_13_14_16_17_1C_1D_1E_21_22_23_24_28_29_2A_2B_2C_2D_2E_2F_34_35_36_37_39_3B_3C_3D_43) ;8B57 (4B57) ()
	.word (HitboxTypes_For_Object03_07_0B_0D_0F_10_13_14_16_17_1C_1D_1E_21_22_23_24_28_29_2A_2B_2C_2D_2E_2F_34_35_36_37_39_3B_3C_3D_43) ;8B57 (4B57) ()
	.word (HitboxTypes_For_Object25) ;8B6A (4B6A) ()
	.word (HitboxTypes_For_Object26_27_49) ;8B6C (4B6C) ()
	.word (HitboxTypes_For_Object26_27_49) ;8B6C (4B6C) ()
	.word (HitboxTypes_For_Object03_07_0B_0D_0F_10_13_14_16_17_1C_1D_1E_21_22_23_24_28_29_2A_2B_2C_2D_2E_2F_34_35_36_37_39_3B_3C_3D_43) ;8B57 (4B57) ()
	.word (HitboxTypes_For_Object03_07_0B_0D_0F_10_13_14_16_17_1C_1D_1E_21_22_23_24_28_29_2A_2B_2C_2D_2E_2F_34_35_36_37_39_3B_3C_3D_43) ;8B57 (4B57) ()
	.word (HitboxTypes_For_Object03_07_0B_0D_0F_10_13_14_16_17_1C_1D_1E_21_22_23_24_28_29_2A_2B_2C_2D_2E_2F_34_35_36_37_39_3B_3C_3D_43) ;8B57 (4B57) ()
	.word (HitboxTypes_For_Object03_07_0B_0D_0F_10_13_14_16_17_1C_1D_1E_21_22_23_24_28_29_2A_2B_2C_2D_2E_2F_34_35_36_37_39_3B_3C_3D_43) ;8B57 (4B57) ()
	.word (HitboxTypes_For_Object03_07_0B_0D_0F_10_13_14_16_17_1C_1D_1E_21_22_23_24_28_29_2A_2B_2C_2D_2E_2F_34_35_36_37_39_3B_3C_3D_43) ;8B57 (4B57) ()
	.word (HitboxTypes_For_Object03_07_0B_0D_0F_10_13_14_16_17_1C_1D_1E_21_22_23_24_28_29_2A_2B_2C_2D_2E_2F_34_35_36_37_39_3B_3C_3D_43) ;8B57 (4B57) ()
	.word (HitboxTypes_For_Object03_07_0B_0D_0F_10_13_14_16_17_1C_1D_1E_21_22_23_24_28_29_2A_2B_2C_2D_2E_2F_34_35_36_37_39_3B_3C_3D_43) ;8B57 (4B57) ()
	.word (HitboxTypes_For_Object03_07_0B_0D_0F_10_13_14_16_17_1C_1D_1E_21_22_23_24_28_29_2A_2B_2C_2D_2E_2F_34_35_36_37_39_3B_3C_3D_43) ;8B57 (4B57) ()
	.word (HitboxTypes_For_Object19_30_31_46) ;8B6F (4B6F) ()
	.word (HitboxTypes_For_Object19_30_31_46) ;8B6F (4B6F) ()
	.word (HitboxTypes_For_Object1F_32_41_48) ;8B65 (4B65) ()
	.word (HitboxTypes_For_Object01_08_09_0A_0C_0E_12_1A_20_33_3E_45) ;8B5E (4B5E) ()
	.word (HitboxTypes_For_Object03_07_0B_0D_0F_10_13_14_16_17_1C_1D_1E_21_22_23_24_28_29_2A_2B_2C_2D_2E_2F_34_35_36_37_39_3B_3C_3D_43) ;8B57 (4B57) ()
	.word (HitboxTypes_For_Object03_07_0B_0D_0F_10_13_14_16_17_1C_1D_1E_21_22_23_24_28_29_2A_2B_2C_2D_2E_2F_34_35_36_37_39_3B_3C_3D_43) ;8B57 (4B57) ()
	.word (HitboxTypes_For_Object03_07_0B_0D_0F_10_13_14_16_17_1C_1D_1E_21_22_23_24_28_29_2A_2B_2C_2D_2E_2F_34_35_36_37_39_3B_3C_3D_43) ;8B57 (4B57) ()
	.word (HitboxTypes_For_Object03_07_0B_0D_0F_10_13_14_16_17_1C_1D_1E_21_22_23_24_28_29_2A_2B_2C_2D_2E_2F_34_35_36_37_39_3B_3C_3D_43) ;8B57 (4B57) ()
	.word (HitboxTypes_For_Object38) ;8B7A (4B7A) ()
	.word (HitboxTypes_For_Object03_07_0B_0D_0F_10_13_14_16_17_1C_1D_1E_21_22_23_24_28_29_2A_2B_2C_2D_2E_2F_34_35_36_37_39_3B_3C_3D_43) ;8B57 (4B57) ()
	.word (HitboxTypes_For_Object3A) ;8B74 (4B74) ()
	.word (HitboxTypes_For_Object03_07_0B_0D_0F_10_13_14_16_17_1C_1D_1E_21_22_23_24_28_29_2A_2B_2C_2D_2E_2F_34_35_36_37_39_3B_3C_3D_43) ;8B57 (4B57) ()
	.word (HitboxTypes_For_Object03_07_0B_0D_0F_10_13_14_16_17_1C_1D_1E_21_22_23_24_28_29_2A_2B_2C_2D_2E_2F_34_35_36_37_39_3B_3C_3D_43) ;8B57 (4B57) ()
	.word (HitboxTypes_For_Object03_07_0B_0D_0F_10_13_14_16_17_1C_1D_1E_21_22_23_24_28_29_2A_2B_2C_2D_2E_2F_34_35_36_37_39_3B_3C_3D_43) ;8B57 (4B57) ()
	.word (HitboxTypes_For_Object01_08_09_0A_0C_0E_12_1A_20_33_3E_45) ;8B5E (4B5E) ()
	.word (HitboxTypes_For_Object3F) ;8B73 (4B73) ()
	.word (HitboxTypes_For_Object02_40) ;8B5C (4B5C) ()
	.word (HitboxTypes_For_Object1F_32_41_48) ;8B65 (4B65) ()
	.word (HitboxTypes_For_Object42_44) ;8B6E (4B6E) ()
	.word (HitboxTypes_For_Object03_07_0B_0D_0F_10_13_14_16_17_1C_1D_1E_21_22_23_24_28_29_2A_2B_2C_2D_2E_2F_34_35_36_37_39_3B_3C_3D_43) ;8B57 (4B57) ()
	.word (HitboxTypes_For_Object42_44) ;8B6E (4B6E) ()
	.word (HitboxTypes_For_Object01_08_09_0A_0C_0E_12_1A_20_33_3E_45) ;8B5E (4B5E) ()
	.word (HitboxTypes_For_Object19_30_31_46) ;8B6F (4B6F) ()
	.word (HitboxTypes_For_Object00_and_47) ;8B56 (4B56) ()
	.word (HitboxTypes_For_Object1F_32_41_48) ;8B65 (4B65) ()
	.word (HitboxTypes_For_Object26_27_49) ;8B6C (4B6C) ()
	.word (HitboxTypes_For_Object4A) ;8B7C (4B7C) ()
HitboxTypes_For_Object00_and_47:
	.byte $0B
HitboxTypes_For_Object03_07_0B_0D_0F_10_13_14_16_17_1C_1D_1E_21_22_23_24_28_29_2A_2B_2C_2D_2E_2F_34_35_36_37_39_3B_3C_3D_43:
	.byte $00,$00,$00,$00,$00
HitboxTypes_For_Object02_40:
	.byte $05,$05
HitboxTypes_For_Object01_08_09_0A_0C_0E_12_1A_20_33_3E_45:
	.byte $04,$04,$04
HitboxTypes_For_Object05_06_11:
	.byte $08,$08,$08
HitboxTypes_For_Object15_18:
	.byte $12
HitboxTypes_For_Object1F_32_41_48:
	.byte $06,$06
HitboxTypes_For_Object1B:
	.byte $10,$09,$10
HitboxTypes_For_Object25:
	.byte $0F,$0F
HitboxTypes_For_Object26_27_49:
	.byte $01,$01
HitboxTypes_For_Object42_44:
	.byte $07
HitboxTypes_For_Object19_30_31_46:
	.byte $03,$03,$03,$03
HitboxTypes_For_Object3F:
	.byte $0C
HitboxTypes_For_Object3A:
	.byte $0E,$0E,$0E
HitboxTypes_For_Object04:
	.byte $11,$11,$11
HitboxTypes_For_Object38:
	.byte $0A,$0A
HitboxTypes_For_Object4A:
	.byte $0D,$0D
HitboxSizes_0:
	.byte $FC
HitboxSizes_1:
	.byte $0C
HitboxSizes_2:
	.byte $06
HitboxSizes_contd:
	.byte $FC,$04,$04, $FC,$02,$02, $02,$02,$02, $00,$04,$04
	.byte $00,$0F,$04, $00,$06,$06, $00,$14,$0C, $FC,$0C,$08
	.byte $05,$06,$06, $0D,$04,$04, $F0,$20,$20, $FC,$0C,$0E
	.byte $F2,$04,$04, $F4,$13,$07, $04,$06,$06, $05,$0C,$06
	.byte $FD,$0C,$06, $00,$10,$06
HPcostByMonsterHit:
	.byte $00,$11,$12,$21,$00,$10,$11,$13,$11,$11,$43,$31,$11,$12,$12,$11
	.byte $31,$11,$14,$10,$21,$11,$11,$11,$11,$21,$11,$11,$13,$44,$11,$34
	.byte $23,$51,$53,$27,$51,$20
WhipHitDistanceTable:
	.byte $10,$18,$18,$20,$20
WhipPowerByLevelTable:
	.byte $01,$02,$04,$08,$0F
_data_4BE7_indexed:
	.byte $01,$02,$04,$08,$01,$04,$04,$01,$01,$01
HPreductionTable:
	.word (HPreductionAtLevel0_mul4) ;8BFF (4BFF) ()
	.word (HPreductionAtLevel1_mul3) ;8C09 (4C09) ()
	.word (HPreductionAtLevel2_mul2) ;8C13 (4C13) ()
	.word (HPreductionAtLevel3_mul1) ;8C1D (4C1D) ()
	.word (HPreductionAtLevel4_div2) ;8C27 (4C27) ()
	.word (HPreductionAtLevel5_div3) ;8C31 (4C31) ()
	.word (HPreductionAtLevel6_div4) ;8C3B (4C3B) ()
HPreductionAtLevel0_mul4:
	.byte $04,$08,$0C,$10,$20,$30,$40,$50,$60,$80
HPreductionAtLevel1_mul3:
	.byte $03,$06,$09,$0C,$18,$24,$30,$3C,$48,$60
HPreductionAtLevel2_mul2:
	.byte $02,$04,$06,$08,$10,$18,$20,$28,$30,$40
HPreductionAtLevel3_mul1:
	.byte $01,$02,$03,$04,$08,$0C,$10,$14,$18,$20
HPreductionAtLevel4_div2:
	.byte $01,$01,$02,$02,$04,$06,$08,$0A,$0C,$10
HPreductionAtLevel5_div3:
	.byte $01,$01,$01,$02,$02,$04,$05,$06,$08,$0A
HPreductionAtLevel6_div4:
	.byte $01,$01,$01,$01,$02,$03,$04,$05,$06,$08
ObjectLoadHitbox:
                            ; In:  X = Which object, index to ObjectType:
                            ; Out: $08 = +ycoord, $09 = height-10, $0A = width-6 (ALL MAYBE):
	lda ObjectType,x
	asl a
	tay
	lda Actor_HitboxTable,y
	sta TempPtr00_lo
	lda Actor_HitboxTable+1,y
	sta TempPtr00_hi
	ldy ObjectCurrentPose2,x
	beq @8C5A
	dey
	@8C5A:
	lda (TempPtr00_lo),y
	sta TempPtr00_lo
	asl a
	adc TempPtr00_lo
	tay
	lda HitboxSizes_0,y
	sta TempPtr08_lo
	lda HitboxSizes_1,y
	sta TempPtr08_hi
	lda HitboxSizes_2,y
	sta ObstaclePointerLo
	rts
;------------------------------------------
NPCtalkAction_FireWhipUpgrader:
	lda CurrentWhipLevel
	cmp #$03
	bne @8C85
	inc CurrentWhipLevel
	lda #$22
	jsr AnyBankPlayTracks
	lda #$0E
	bne @8C87

	@8C85:
	lda #$75
	@8C87:
	 sta DialogTextID
	rts
;------------------------------------------
Object_ComparePositionToSimonPosition:
                            ; Compares object X's position to Simon's position.:
                            ; Returns the following::
                            ;  ($00)     = absolute difference between X coordinates:
                            ;  ($01)     = absolute difference between Y coordinates:
                            ;              If object is below Simon (Y & 2)=0, Simon's coordinate += 8:
                            ;              So that the object will aim for the torso, not feet.:
                            ;  (Y & 1)   if theirX >= simonX:
                            ;  (Y & 2)   if theirY >= simonY:
                            ;            In other words, depending on object's positioning towards Simon::
                            ;                  Y=0 for top-left,    Y=1 for top-right:
                            ;                  Y=2 for bottom-left, Y=3 for bottom-right:
                            ;  If A&2, then:
                            ;            - X difference was not smaller than Y diffence:
                            ;            - ($04 & 2) is clear:
                            ;            - ($04 & 1) if theirY < simonY:
                            ;            - (A   & 1) if theirX < simonX:
                            ;  else:
                            ;            - ($04 & 2) is set:
                            ;            - ($04 & 1) if theirX < simonX:
                            ;            - (A   & 1) if theirY < simonY:
	lda ObjectScreenXCoord,x
	sta $04
	lda ObjectScreenYCoord,x
	sta $05
	ldy #$00
	lda ObjectScreenXCoord
	sta TempPtr00_lo
	lda ObjectScreenYCoord
	sta TempPtr00_hi
	lda $04
	cmp TempPtr00_lo
	bcs @8CB2
	sta TempPtr00_lo
	lda ObjectScreenXCoord
	sta $04
	lda #$03
	jmp @8CB6

	@8CB2:
	ldy #$01
	lda #$02
	@8CB6:
	 sta TempPtr02_lo
	lda $04
	sec
	sbc TempPtr00_lo
	sta TempPtr00_lo
	lda $05
	sta $04
	cmp TempPtr00_hi
	bcs @8CD5
	sta TempPtr00_hi
	lda ObjectScreenYCoord
	adc #$08
	sta $04
	lda #$01
	jmp @8CDB

	@8CD5:
	tya
	ora #$02
	tay
	lda #$00
	@8CDB:
	 sta TempPtr02_hi
	lda $04
	sec
	sbc TempPtr00_hi
	sta TempPtr00_hi
	lda TempPtr00_lo
	cmp TempPtr00_hi
	bcc @8CF1
	lda TempPtr02_hi
	sta $04
	lda TempPtr02_lo
	rts

	@8CF1:
	lda TempPtr02_lo
	sta $04
	lda TempPtr02_hi
	rts
;------------------------------------------
	.export Object_SetCarry_If_OnRightSideOfSimon
Object_SetCarry_If_OnRightSideOfSimon:
	lda ObjectScreenXCoord,x
	cmp ObjectScreenXCoord
	bcc @8D09
	lda ObjectDialogStatusFlag,x
	and #$01
	bne @8D10
	@8D07:
	sec
	rts

	@8D09:
	lda ObjectDialogStatusFlag,x
	and #$01
	bne @8D07
	@8D10:
	 clc
	rts
;------------------------------------------
_func_4D12:
	lda ObjectScreenYCoord,x
	cmp ObjectScreenYCoord
	rts
;------------------------------------------
Object_SetVelocityAndAngle_Aangle_Yspeed:
                            ; A = Angle (00..3F):
                            ; Y = Speed (0,1,2,3,4 mean 1, 0.25, 0.5, 1.5, 2, 4 respectively):
                            ; Xvelocity = cos(angle) * speed:
                            ; Yvelocity = -sin(angle) * speed:
	sty TempPtr02_lo
	pha
	 jsr Math_CalculateCosine_Scale
	 jsr Object_SetXVelocity16bit_from_00
	pla
	sec
	sbc #$10
	and #$3F
	jsr Math_CalculateCosine_Scale
	ldy TempPtr00_lo
	lda TempPtr00_hi
	jmp Object_SetYVelocity16bit_from_AY
;------------------------------------------
Math_CalculateCosine_Scale:
                            ; Return value is 16-bit value in $00::
                            ;      round(0xFF * cos(A * 2pi / 0x40)):
                            ; Valid range for A: 00..3F. 0x40 = 360 degrees:
                            ; $02 scales the result::
                            ;      0 = scale by 1 (that is, no scaling):
                            ;      1 = scale by 0.25 (round towards zero):
                            ;      2 = scale by 0.5 (round towards zero):
                            ;      3 = scale by 1.5 (round away from zero):
                            ;      4 = scale by 2:
                            ;      5 = scale by 4:
	tay
	and #$0F
	sta TempPtr00_lo
	tya
	jsr Math_divAby16
	sta Temp07
	and #$01
	bne @8D46
	lda TempPtr00_lo
	jmp @8D4B

	@8D46:
	lda #$10
	sec
	sbc TempPtr00_lo
	@8D4B:
	 tay
	lda Math_CosineTable,y
	sta TempPtr00_lo
	lda #$00
	sta TempPtr00_hi
	lda TempPtr02_lo
	jsr Math_MultiplyOrDivideDependingOnA
	lda Temp07
	beq _loc_4DA9
	cmp #$03
	beq _loc_4DA9
	jmp Math_Negate16bitWordAt00
;------------------------------------------
Math_CosineTable:
                            ; Perfectly matches round(0xFF*cos(a*pi/0x20)) with a = 0..16:
	.byte $FF,$FE,$FA,$F4,$EC,$E1,$D4,$C5,$B4,$A2,$8E,$78,$62,$4A,$32,$19
	.byte $00
Math_CalculateAtan2:
                            ; Y = quadrant identifier (&1 = bottom, &2 = right):
                            ; $00 = absolute X (xdiff):
                            ; $01 = absolute Y (ydiff):
                            ; Only the most significant 3 bits of each coordinate are considered.:
                            ; Result = A = angle (00..3F):
                            ;     When Y=0: A = (0x00 + ArctanTable[xdiff/32*8 + ydiff/32]):
                            ;     When Y=1: A = (0x10 + ArctanTable[ydiff/32*8 + xdiff/32]):
                            ;     When Y=2: A = (0x30 + ArctanTable[ydiff/32*8 + xdiff/32]) & 0x3F:
                            ;     When Y=3: A = (0x20 + ArctanTable[xdiff/32*8 + ydiff/32]):
	tya
	sec
	sbc #$01
	cmp #$02
	bcs @8D8A
	lda TempPtr00_lo
	sta TempPtr02_lo
	lda TempPtr00_hi
	sta TempPtr00_lo
	lda TempPtr02_lo
	sta TempPtr00_hi
	@8D8A:
	lda Math_Atan2Offsets,y
	sta TempPtr02_lo
	lda TempPtr00_lo
	jsr Math_divAby16
	lsr a
	sta TempPtr00_lo
	lda TempPtr00_hi
	lsr a
	lsr a
	and #$F8
	clc
	adc TempPtr00_lo
	tay
	lda Math_ArctanTable,y
	clc
	adc TempPtr02_lo
	and #$3F
_loc_4DA9:
	rts
;------------------------------------------
Math_ArctanTable:
                            ; Perfectly matches round(0x20/pi * atan(((a>>3) + 0.11):
                            ;                                       / ((a&7) + 0.11))) where a=0..63:
                            ;  or equivalently: round(0x20/pi * atan2((a>>3) + 0.11, (a&7) + 0.11)):
	.byte $08,$01,$01,$00,$00,$00,$00,$00, $0F,$08,$05,$03,$03,$02,$02,$02
	.byte $0F,$0B,$08,$06,$05,$04,$03,$03, $10,$0D,$0A,$08,$07,$06,$05,$04
	.byte $10,$0D,$0B,$09,$08,$07,$06,$05, $10,$0E,$0C,$0A,$09,$08,$07,$06
	.byte $10,$0E,$0D,$0B,$0A,$09,$08,$07, $10,$0E,$0D,$0C,$0B,$0A,$09,$08
Math_Atan2Offsets:
	.byte $00,$10,$30,$20
Math_MultiplyOrDivideDependingOnA:
	asl a
	tay
	lda _JumpPointerTable_4DFD,y
	sta TempPtr08_lo
	lda _JumpPointerTable_4DFD+1,y
	sta TempPtr08_hi
	jmp (TempPtr08_lo)
_JumpPointerTable_4DFD:
	.word Math_ShiftNothing
	.word (Math_div00by4) ;8E09 (4E09) ()
	.word (Math_div00by2) ;8E0B (4E0B) ()
	.word (Math_0001mulby1p5_RoundUp) ;8E0E (4E0E) ()
	.word (Math_0001mulby2) ;8E1C (4E1C) ()
	.word (Math_0001mulby4) ;8E18 (4E18) ()
Math_div00by4:
	lsr TempPtr00_lo
Math_div00by2:
	lsr TempPtr00_lo
Math_ShiftNothing:
	rts
;------------------------------------------
Math_0001mulby1p5_RoundUp:
	lda TempPtr00_lo
	lsr a
	adc TempPtr00_lo
	sta TempPtr00_lo
	rol TempPtr00_hi
	rts
;------------------------------------------
Math_0001mulby4:
	asl TempPtr00_lo
	rol TempPtr00_hi
Math_0001mulby2:
	asl TempPtr00_lo
	rol TempPtr00_hi
	rts
;------------------------------------------
Object_CreateProjectileTowardsPredefinedAngle:
	stx $17
	jmp _loc_4E2D
;------------------------------------------
Object_CreateProjectileTowardsSimon:
                            ; $05       = Object type:
                            ; X         = Which object is shooting:
                            ; Y,$00,$01 = Results from Object_ComparePositionToSimonPosition:
                            ;             that are fed directly to Math_CalculateAtan2:
                            ; LevelData_ProjectileVelocities will be used:
                            ; to scale the projectile speed.:
                            ; $17 will be used as a temporary to store the value of X.:
	stx $17
	sta $05
	jsr Math_CalculateAtan2
_loc_4E2D:
	sta $06
	asl a
	tay
	lda ObjectScreenXCoord,x
	sta TempPtr00_lo
	lda ObjectScreenYCoord,x
	sta TempPtr00_hi
	jsr Object_FindUnusedSlot
	bcs @8E76
	lda $05
	sta ObjectType,x
	lda CurrentLevelMapType
	asl a
	tay
	lda LevelData_ProjectileVelocities,y
	sta TempPtr08_lo
	iny
	lda LevelData_ProjectileVelocities,y
	sta TempPtr08_hi
	lda CurrentLevelSceneNumber
	lsr a
	tay
	lda (TempPtr08_lo),y
	bcs @8E61
	jsr Math_divAby16
	bne @8E63
	@8E61:
	and #$0F
	@8E63:
	 tay
	lda TempPtr00_lo
	sta ObjectScreenXCoord,x
	lda TempPtr00_hi
	sec
	sbc #$08
	sta ObjectScreenYCoord,x
	lda $06
	jsr Object_SetVelocityAndAngle_Aangle_Yspeed
	@8E76:
	  ldx $17
	rts
;------------------------------------------
Unused4E79:
	sta TempPtr08_lo
	jmp _loc_1DFE8
;------------------------------------------
Unused4E7E:
	lda ObjectScreenYCoord,x
	cmp #$40
	bcc @8E88
	cmp #$E0
	rts

	@8E88:
	sec
	rts
;------------------------------------------
LevelData_ProjectileVelocities:
                            ; The first table is indexed by CurrentLevelMapType.:
                            ; The 4-bit table is indexed by CurrentLevelSceneNumber.:
                            ;      0 = scale by 1 (that is, no scaling):
                            ;      1 = scale by 0.25 (round towards zero):
                            ;      2 = scale by 0.5 (round towards zero):
                            ;      3 = scale by 1.5 (round away from zero):
                            ;      4 = scale by 2:
                            ;      5 = scale by 4:
	.word (LevelData_ProjectileVelocities_0_Towns) ;8E96 (4E96) ()
	.word (LevelData_ProjectileVelocities_1_Mansions) ;8E9A (4E9A) ()
	.word (LevelData_ProjectileVelocities_2_ForestsAndBridges) ;8E9D (4E9D) ()
	.word (LevelData_ProjectileVelocities_3_Wilderness) ;8EA2 (4EA2) ()
	.word (LevelData_ProjectileVelocities_4_Wastelands) ;8EA5 (4EA5) ()
	.word (LevelData_ProjectileVelocities_5_Ruins) ;8EA7 (4EA7) ()
LevelData_ProjectileVelocities_0_Towns:
	.byte $43,$33,$34,$40
LevelData_ProjectileVelocities_1_Mansions:
	.byte $33,$34,$40
LevelData_ProjectileVelocities_2_ForestsAndBridges:
	.byte $33,$33,$33,$34,$55
LevelData_ProjectileVelocities_3_Wilderness:
	.byte $44,$45,$40
LevelData_ProjectileVelocities_4_Wastelands:
	.byte $44,$55
LevelData_ProjectileVelocities_5_Ruins:
	.byte $44,$44,$44,$40
LevelData_Actors_0_Towns:
	.word (LevelData_Actors_0_Towns_0aldra) ;909C (509C) ([8:2][A:3])
	.word (LevelData_Actors_0_Towns_1veros) ;9204 (5204) ([8:2][A:3])
	.word (LevelData_Actors_0_Towns_2aljiba) ;9154 (5154) ([8:2][A:3])
	.word (LevelData_Actors_0_Towns_3jova) ;909E (509E) ([8:2][A:3])
	.word (LevelData_Actors_0_Towns_4ondol) ;9206 (5206) ([8:2][A:3])
	.word (LevelData_Actors_0_Towns_5doina) ;9156 (5156) ([8:2][A:3])
	.word (LevelData_Actors_0_Towns_6yomi) ;9158 (5158) ([8:2][A:3])
	.word (LevelData_Actors_0_Towns_7church) ;8EDB (4EDB) ([8:2][A:3])
	.word (LevelData_Actors_0_Towns_8jovaThornWhipSellerRoom) ;90A0 (50A0) ([8:2][A:3])
	.word (LevelData_Actors_0_Towns_9jovaHolyWaterSellerRoom) ;90A2 (50A2) ([8:2][A:3])
	.word (LevelData_Actors_0_Towns_1_Town_UnknownRoom_2rooms) ;9208 (5208) ([8:2][A:3])
	.word (LevelData_Actors_0_Towns_11_Town_UnknownRoom) ;920C (520C) ([8:2][A:3])
	.word (LevelData_Actors_0_Towns_12_Town_UnknownRoom) ;915A (515A) ([8:2][A:3])
	.word (LevelData_Actors_0_Towns_13_Town_UnknownRoom_2rooms) ;915C (515C) ([8:2][A:3])
	.word (LevelData_Actors_0_Towns_14_Town_UnknownRoom_2rooms) ;9160 (5160) ([8:2][A:3])
	.word (LevelData_Actors_0_Towns_15_Town_UnknownRoom_2rooms) ;90A4 (50A4) ([8:2][A:3])
	.word (LevelData_Actors_0_Towns_16_Town_UnknownRoom_2rooms) ;90A8 (50A8) ([8:2][A:3])
	.word (LevelData_Actors_0_Towns_17_Town4ondol_MorningStarSellerRoom_2rooms) ;920E (520E) ([8:2][A:3])
	.word (LevelData_Actors_0_Towns_18_Town4ondol_DeathStarManRoom) ;9212 (5212) ([8:2][A:3])
	.word (LevelData_Actors_0_Towns_19_Town_UnknownRoom_3rooms) ;9214 (5214) ([8:2][A:3])
	.word (LevelData_Actors_0_Towns_20_Town5doina_GetBackManRoom) ;9164 (5164) ([8:2][A:3])
	.word (LevelData_Actors_0_Towns_21_Town5doina_LaurelSellerRoom) ;9166 (5166) ([8:2][A:3])
	.word (LevelData_Actors_0_Towns_22_Town_UnknownRoom) ;9168 (5168) ([8:2][A:3])
	.word (LevelData_Actors_0_Towns_23_Town6yomi_LoneManRoom) ;916A (516A) ([8:2][A:3])
LevelData_Actors_0_Towns_7church:
	.word (LevelData_Actors_0_Towns_7church_4EDD) ;8EDD (4EDD) ([8:2][A:3])
LevelData_Actors_0_Towns_7church_4EDD:
	.byte $08,$08,$AD,$31,$FF
ObjectAI_object28:
	lda ObjectCurrentActionType,x
	bne @8EF1
	lda #$40
	sta ObjectCurrentActionType,x
	lda #$0D
	jmp SetObjectIndexToAutomaticSpriteDataTable_to_A_and_PaletteIndexTo0_and_RefreshSprite

	@8EF1:
	jsr ObjectLoadAutomaticSpriteNumber
	lda ObjectAIvar1,x
	cmp #$50
	bne @8F05
	lda #$00
	sta ObjectAIvar1,x
	lda #$80
	jsr _func_1DE6F
	@8F05:
	inc ObjectAIvar1,x
	jmp _loc_5066
;------------------------------------------
ObjectAI_object2A_TownBoy:
	lda ObjectCurrentActionType,x
	bne @8F1E
	lda #$40
	sta ObjectCurrentActionType,x
	asl a
	jsr _func_1DE6F
	lda #$0D
	jmp SetObjectIndexToAutomaticSpriteDataTable_to_A_and_PaletteIndexTo0_and_RefreshSprite

	@8F1E:
	lda ObjectAIvar2,x
	bne @8F39
	inc ObjectAIvar1,x
	lda ObjectAIvar1,x
	cmp #$50
	bne @8F33
	jsr _func_1DFA8
	inc ObjectAIvar2,x
	@8F33:
	jsr ObjectLoadAutomaticSpriteNumber
	jmp _loc_5066

	@8F39:
	 inc ObjectAIvar1,x
	lda ObjectAIvar1,x
	cmp #$40
	bne @8F46
	jmp _func_1DFA8

	@8F46:
	lda FrameCounter
	and #$0F
	bne @8F4F
	jmp Object_SetXVelocity16bit_InvertCurrent_AndAlso_ObjectFacingLeft

	@8F4F:
	rts
;------------------------------------------
ObjectAI_object29_2B_35_TownMonkAndLady:
	lda ObjectCurrentActionType,x
	bne @8F77
	lda #$40
	sta ObjectCurrentActionType,x
	lda #$80
	jsr _func_1DE6F
	lda ObjectType,x
	cmp #$35
	beq @8F72
	cmp #$29
	beq @8F6E
	lda #$0F
	bne @8F74

	@8F6E:
	lda #$0A
	bne @8F74

	@8F72:
	 lda #$0E
	@8F74:
	  jmp SetObjectIndexToAutomaticSpriteDataTable_to_A_and_PaletteIndexTo0_and_RefreshSprite

	@8F77:
	   jsr ObjectLoadAutomaticSpriteNumber
	jmp _loc_5066
;------------------------------------------
ObjectAI_object2C_TownSittingMan:
	lda ObjectCurrentActionType,x
	bne @8F89
	lda #$40
	ldy #$28
	jmp Object_SetCurrentActionType_And_Y_as_Pose1

	@8F89:
	jmp Object_SetFacing_FaceTowardsSimon
;------------------------------------------
ObjectAI_object17_TownZombie:
	lda ObjectCurrentActionType,x
	bne @8F9E
	jsr Object_SetCurrentActionType_to_01
	lda #$C0
	jsr _func_1DE6F
	lda #$37
	jsr SetObjectIndexToAutomaticSpriteDataTable_to_A_and_PaletteIndexTo0_and_RefreshSprite
	@8F9E:
	jsr ObjectLoadAutomaticSpriteNumber
	jsr Object_GeneringXYmovementEngine
	jsr _func_1DE8B
	jmp _func_1DEA1
;------------------------------------------
ObjectAI_object01:
	lda ObjectCurrentActionType,x
	bne @8FBC
	jsr Object_SetCurrentActionType_to_01
	lda #$08
	jsr SetObjectIndexToAutomaticSpriteDataTable_to_A_and_PaletteIndexTo0_and_RefreshSprite
	lda #$05
	sta ObjectScreenYCoord,x
	@8FBC:
	lda ObjectAIvar1,x
	jsr JumpWithParams
ObjectAI_object01_actions:
	.word (ObjectAI_object01_actions_4FCA) ;8FCA (4FCA) ()
	.word (ObjectAI_object01_actions_4FE8) ;8FE8 (4FE8) ()
	.word (ObjectAI_object01_actions_501D) ;901D (501D) ()
	.word (ObjectAI_object01_actions_5054) ;9054 (5054) ()
ObjectAI_object01_actions_4FCA:
	lda ObjectScreenXCoord
	sec
	sbc ObjectScreenXCoord,x
	bcs @8FD6
	jsr Math_NegateA
	@8FD6:
	cmp #$70
	bcs @8FE7
	inc ObjectAIvar1,x
	lda #$40
	jsr _func_1DE6F
	lda #$03
	sta ObjectYSpeed,x
	@8FE7:
	rts
;------------------------------------------
ObjectAI_object01_actions_4FE8:
	jsr Object_GeneringXYmovementEngine
	jsr ObjectLoadAutomaticSpriteNumber
	lda #$06
	sta TempPtr08_lo
	jsr Object_GravityDecelerateBy_Var08
	lda ObjectYSpeed,x
	cmp #$FD
	beq _900F
	lda ObjectYSpeed,x
	bmi _900E
	lda ObjectScreenYCoord,x
	cmp ObjectScreenYCoord
	bcc _900E
	_9009:
	  lda #$00
	sta ObjectYSpeed,x
	_900E:
	   rts

	_900F:
	 inc ObjectAIvar1,x
	lda #$40
	jsr _func_1DE6F
	lda #$FD
	sta ObjectYSpeed,x
_loc_501C:
	rts
;------------------------------------------
ObjectAI_object01_actions_501D:
	jsr Object_GeneringXYmovementEngine
	jsr ObjectLoadAutomaticSpriteNumber
	lda #$06
	sta TempPtr08_lo
	jsr Object_GravityAccelerateBy_Var08
	lda ObjectYSpeed,x
	bpl @9039
	lda ObjectScreenYCoord,x
	cmp #$10
	bcs _loc_501C
	jmp _9009

	@9039:
	lda ObjectScreenYCoord
	cmp ObjectScreenYCoord,x
	bcs _loc_501C
	inc ObjectAIvar1,x
	jsr Object_SetFacing_FaceTowardsSimon
	lda #$03
	ldy #$00
	jsr Object_SetXVelocity16bit_from_AY_invert_if_ObjectFacingLeft_set
	lda #$00
	tay
	jmp Object_SetYVelocity16bit_from_AY
;------------------------------------------
ObjectAI_object01_actions_5054:
	jsr ObjectLoadAutomaticSpriteNumber
	jmp Object_GeneringXYmovementEngine
;------------------------------------------
ObjectAI_object24_TownSign:
	lda ObjectCurrentActionType,x
	bne _loc_501C
	lda #$40
	ldy #$00
	jmp Object_SetCurrentActionType_And_Y_as_Pose1
;------------------------------------------
_loc_5066:
	jsr _func_1DE8B
	jsr _func_1DEA1
	jmp Object_GeneringXYmovementEngine
;------------------------------------------
NPCtalkAction_CrystalExchanger_Blue:
	lda #$20
	bit InventoryBodyParts1
	beq _9083
	bvs _9083
	lda InventoryBodyParts1
	and #$9F
	ora #$40
	sta InventoryBodyParts1
	lda #$55
	bne _loc_5085

	_9083:
	   lda #$6B
_loc_5085:
	sta DialogTextID
	rts
;------------------------------------------
NPCtalkAction_CrystalExchanger_Red:
	lda #$20
	bit InventoryBodyParts1
	bvc _9083
	bne _9083
	lda InventoryBodyParts1
	and #$9F
	ora #$60
	sta InventoryBodyParts1
	lda #$56
	bne _loc_5085
;------------------------------------------
LevelData_Actors_0_Towns_0aldra:
	.word (LevelData_Actors_0_Towns_0aldra_50AC) ;90AC (50AC) ([8:2][A:3])
LevelData_Actors_0_Towns_3jova:
	.word (LevelData_Actors_0_Towns_3jova_50F5) ;90F5 (50F5) ([8:2][A:3])
LevelData_Actors_0_Towns_8jovaThornWhipSellerRoom:
	.word (LevelData_Actors_0_Towns_8jovaThornWhipSellerRoom_513E) ;913E (513E) ([8:2][A:3])
LevelData_Actors_0_Towns_9jovaHolyWaterSellerRoom:
	.word (LevelData_Actors_0_Towns_9jovaHolyWaterSellerRoom_5143) ;9143 (5143) ([8:2][A:3])
LevelData_Actors_0_Towns_15_Town_UnknownRoom_2rooms:
	.word (LevelData_Actors_0_Towns_15_Town_UnknownRoom_2rooms_5148) ;9148 (5148) ([8:2][A:3])
	.word (LevelData_Actors_0_Towns_15_Town_UnknownRoom_2rooms_5149) ;9149 (5149) ([8:2][A:3])
LevelData_Actors_0_Towns_16_Town_UnknownRoom_2rooms:
	.word (LevelData_Actors_0_Towns_16_Town_UnknownRoom_2rooms_514E) ;914E (514E) ([8:2][A:3])
	.word (LevelData_Actors_0_Towns_16_Town_UnknownRoom_2rooms_514F) ;914F (514F) ([8:2][A:3])
LevelData_Actors_0_Towns_0aldra_50AC:
	.byte $04,$0C,$B5,$38, $04,$1A,$B5,$3D, $08,$12,$B5,$3E, $0C,$1A,$A4,$3A
	.byte $0C,$0C,$17,$01, $14,$1A,$B5,$41, $14,$14,$17,$01, $18,$14,$AA,$44
	.byte $18,$0C,$17,$01, $1C,$1A,$17,$01, $24,$0C,$B5,$4C, $28,$14,$AA,$4D
	.byte $2C,$1A,$A8,$4E, $28,$14,$17,$01, $2C,$0C,$17,$01, $34,$12,$AE,$07
	.byte $34,$12,$17,$01, $38,$0C,$17,$01, $FF
LevelData_Actors_0_Towns_3jova_50F5:
	.byte $08,$0C,$A9,$5F, $08,$1A,$A9,$61, $0C,$20,$A9,$62, $0C,$28,$A4,$52
	.byte $0C,$0C,$17,$04, $14,$0C,$A9,$63, $14,$0C,$17,$04, $14,$1A,$17,$04
	.byte $18,$1A,$A9,$66, $1C,$28,$17,$04, $24,$0C,$A9,$5D, $28,$1A,$17,$04
	.byte $2C,$22,$AF,$04, $2C,$0C,$17,$04, $2C,$22,$17,$04, $2C,$28,$17,$04
	.byte $34,$0C,$17,$04, $38,$0C,$A9,$68, $FF
LevelData_Actors_0_Towns_8jovaThornWhipSellerRoom_513E:
	.byte $0C,$0C,$AE,$08,$FF
LevelData_Actors_0_Towns_9jovaHolyWaterSellerRoom_5143:
	.byte $0C,$0C,$AE,$03,$FF
LevelData_Actors_0_Towns_15_Town_UnknownRoom_2rooms_5148:
	.byte $FF
LevelData_Actors_0_Towns_15_Town_UnknownRoom_2rooms_5149:
	.byte $0C,$1A,$AE,$02,$FF
LevelData_Actors_0_Towns_16_Town_UnknownRoom_2rooms_514E:
	.byte $FF
LevelData_Actors_0_Towns_16_Town_UnknownRoom_2rooms_514F:
	.byte $0C,$0C,$AE,$00,$FF
LevelData_Actors_0_Towns_2aljiba:
	.word (LevelData_Actors_0_Towns_2aljiba_516C) ;916C (516C) ([8:2][A:3])
LevelData_Actors_0_Towns_5doina:
	.word (LevelData_Actors_0_Towns_5doina_51A1) ;91A1 (51A1) ([8:2][A:3])
LevelData_Actors_0_Towns_6yomi:
	.word (LevelData_Actors_0_Towns_6yomi_51C6) ;91C6 (51C6) ([8:2][A:3])
LevelData_Actors_0_Towns_12_Town_UnknownRoom:
	.word (LevelData_Actors_0_Towns_12_Town_UnknownRoom_51DF) ;91DF (51DF) ([8:2][A:3])
LevelData_Actors_0_Towns_13_Town_UnknownRoom_2rooms:
	.word (LevelData_Actors_0_Towns_13_Town_UnknownRoom_2rooms_51E4) ;91E4 (51E4) ([8:2][A:3])
	.word (LevelData_Actors_0_Towns_13_Town_UnknownRoom_2rooms_51E9) ;91E9 (51E9) ([8:2][A:3])
LevelData_Actors_0_Towns_14_Town_UnknownRoom_2rooms:
	.word (LevelData_Actors_0_Towns_14_Town_UnknownRoom_2rooms_51EE) ;91EE (51EE) ([8:2][A:3])
	.word (LevelData_Actors_0_Towns_14_Town_UnknownRoom_2rooms_51EF) ;91EF (51EF) ([8:2][A:3])
LevelData_Actors_0_Towns_20_Town5doina_GetBackManRoom:
	.word (LevelData_Actors_0_Towns_20_Town5doina_GetBackManRoom_51F4) ;91F4 (51F4) ([8:2][A:3])
LevelData_Actors_0_Towns_21_Town5doina_LaurelSellerRoom:
	.word (LevelData_Actors_0_Towns_21_Town5doina_LaurelSellerRoom_51F9) ;91F9 (51F9) ([8:2][A:3])
LevelData_Actors_0_Towns_22_Town_UnknownRoom:
	.word (LevelData_Actors_0_Towns_22_Town_UnknownRoom_51FE) ;91FE (51FE) ([8:2][A:3])
LevelData_Actors_0_Towns_23_Town6yomi_LoneManRoom:
	.word (LevelData_Actors_0_Towns_23_Town6yomi_LoneManRoom_51FF) ;91FF (51FF) ([8:2][A:3])
LevelData_Actors_0_Towns_2aljiba_516C:
	.byte $08,$0C,$AF,$03,$08,$0C,$17,$02,$0C,$0C,$AA,$57,$0C,$1A,$A4,$51
	.byte $14,$0C,$17,$02,$18,$0C,$A9,$58,$1C,$0C,$B5,$5B,$24,$1A,$17,$05
	.byte $28,$1A,$AA,$60,$2C,$0C,$17,$02,$34,$0C,$B5,$69,$34,$12,$AA,$67
	.byte $38,$0C,$17,$02,$FF
LevelData_Actors_0_Towns_5doina_51A1:
	.byte $04,$0C,$B5,$5E,$0C,$0C,$A4,$53,$14,$0C,$17,$08,$1C,$06,$B5,$65
	.byte $1C,$0C,$17,$08,$24,$0C,$17,$08,$28,$0C,$B5,$6A,$2C,$0C,$17,$08
	.byte $34,$0C,$17,$08,$FF
LevelData_Actors_0_Towns_6yomi_51C6:
	.byte $0C,$0C,$A4,$54,$14,$0C,$01,$08,$18,$06,$01,$08,$24,$0C,$01,$08
	.byte $2C,$0C,$01,$08,$38,$0C,$01,$08,$FF
LevelData_Actors_0_Towns_12_Town_UnknownRoom_51DF:
	.byte $0C,$1A,$AE,$02,$FF
LevelData_Actors_0_Towns_13_Town_UnknownRoom_2rooms_51E4:
	.byte $03,$15,$27,$5C,$FF
LevelData_Actors_0_Towns_13_Town_UnknownRoom_2rooms_51E9:
	.byte $0C,$1A,$AC,$59,$FF
LevelData_Actors_0_Towns_14_Town_UnknownRoom_2rooms_51EE:
	.byte $FF
LevelData_Actors_0_Towns_14_Town_UnknownRoom_2rooms_51EF:
	.byte $0C,$1A,$AE,$00,$FF
LevelData_Actors_0_Towns_20_Town5doina_GetBackManRoom_51F4:
	.byte $0C,$0C,$AC,$64,$FF
LevelData_Actors_0_Towns_21_Town5doina_LaurelSellerRoom_51F9:
	.byte $0C,$1A,$AE,$00,$FF
LevelData_Actors_0_Towns_22_Town_UnknownRoom_51FE:
	.byte $FF
LevelData_Actors_0_Towns_23_Town6yomi_LoneManRoom_51FF:
	.byte $0C,$0C,$AC,$5A,$FF
LevelData_Actors_0_Towns_1veros:
	.word (LevelData_Actors_0_Towns_1veros_521A) ;921A (521A) ([8:2][A:3])
LevelData_Actors_0_Towns_4ondol:
	.word (LevelData_Actors_0_Towns_4ondol_524F) ;924F (524F) ([8:2][A:3])
LevelData_Actors_0_Towns_1_Town_UnknownRoom_2rooms:
	.word (LevelData_Actors_0_Towns_1_Town_UnknownRoom_2rooms_5294) ;9294 (5294) ([8:2][A:3])
	.word (LevelData_Actors_0_Towns_1_Town_UnknownRoom_2rooms_5295) ;9295 (5295) ([8:2][A:3])
LevelData_Actors_0_Towns_11_Town_UnknownRoom:
	.word (LevelData_Actors_0_Towns_11_Town_UnknownRoom_529A) ;929A (529A) ([8:2][A:3])
LevelData_Actors_0_Towns_17_Town4ondol_MorningStarSellerRoom_2rooms:
	.word (LevelData_Actors_0_Towns_17_Town4ondol_MorningStarSellerRoom_2rooms_52A3) ;92A3 (52A3) ([8:2][A:3])
	.word (LevelData_Actors_0_Towns_17_Town4ondol_MorningStarSellerRoom_2rooms_52A4) ;92A4 (52A4) ([8:2][A:3])
LevelData_Actors_0_Towns_18_Town4ondol_DeathStarManRoom:
	.word (LevelData_Actors_0_Towns_18_Town4ondol_DeathStarManRoom_52A9) ;92A9 (52A9) ([8:2][A:3])
LevelData_Actors_0_Towns_19_Town_UnknownRoom_3rooms:
	.word (LevelData_Actors_0_Towns_19_Town_UnknownRoom_3rooms_52AE) ;92AE (52AE) ([8:2][A:3])
	.word (LevelData_Actors_0_Towns_19_Town_UnknownRoom_3rooms_52AF) ;92AF (52AF) ([8:2][A:3])
	.word (LevelData_Actors_0_Towns_19_Town_UnknownRoom_3rooms_52B0) ;92B0 (52B0) ([8:2][A:3])
LevelData_Actors_0_Towns_1veros_521A:
	.byte $04,$0C,$AA,$40,$04,$08,$01,$02,$0C,$0C,$AA,$43,$0D,$0C,$A4,$3B
	.byte $14,$0C,$AA,$48,$1A,$0C,$A9,$4F,$18,$0C,$17,$02,$1C,$0C,$B5,$50
	.byte $24,$0C,$B5,$39,$28,$0C,$17,$02,$2C,$0C,$17,$02,$34,$08,$17,$02
	.byte $34,$0C,$01,$02,$FF
LevelData_Actors_0_Towns_4ondol_524F:
	.byte $08,$0C,$B5,$3F,$0C,$28,$A4,$3C,$0C,$0C,$17,$04,$14,$0C,$AA,$45
	.byte $14,$1A,$AA,$46,$18,$0C,$17,$04,$18,$18,$17,$04,$1C,$28,$17,$04
	.byte $24,$0C,$17,$04,$24,$14,$17,$04,$28,$14,$B5,$47,$28,$24,$B5,$4A
	.byte $2C,$1A,$17,$04,$34,$0C,$B5,$4B,$34,$12,$17,$04,$38,$0C,$17,$04
	.byte $38,$1A,$17,$04,$FF
LevelData_Actors_0_Towns_1_Town_UnknownRoom_2rooms_5294:
	.byte $FF
LevelData_Actors_0_Towns_1_Town_UnknownRoom_2rooms_5295:
	.byte $0C,$0C,$AE,$04,$FF
LevelData_Actors_0_Towns_11_Town_UnknownRoom_529A:
	.byte $0A,$1A,$AE,$09,$0D,$17,$27,$42,$FF
LevelData_Actors_0_Towns_17_Town4ondol_MorningStarSellerRoom_2rooms_52A3:
	.byte $FF
LevelData_Actors_0_Towns_17_Town4ondol_MorningStarSellerRoom_2rooms_52A4:
	.byte $0C,$1A,$AE,$0A,$FF
LevelData_Actors_0_Towns_18_Town4ondol_DeathStarManRoom_52A9:
	.byte $0C,$0C,$AC,$49,$FF
LevelData_Actors_0_Towns_19_Town_UnknownRoom_3rooms_52AE:
	.byte $FF
LevelData_Actors_0_Towns_19_Town_UnknownRoom_3rooms_52AF:
	.byte $FF
LevelData_Actors_0_Towns_19_Town_UnknownRoom_3rooms_52B0:
	.byte $0C,$0C,$AE,$00,$FF
LevelData_Actors_1_Mansions:
	.word (LevelData_Actors_1_Mansions_012345) ;9344 (5344) ([8:2][A:3])
	.word (LevelData_Actors_1_Mansions_012345) ;9344 (5344) ([8:2][A:3])
	.word (LevelData_Actors_1_Mansions_012345) ;9344 (5344) ([8:2][A:3])
	.word (LevelData_Actors_1_Mansions_012345) ;9344 (5344) ([8:2][A:3])
	.word (LevelData_Actors_1_Mansions_012345) ;9344 (5344) ([8:2][A:3])
	.word (LevelData_Actors_1_Mansions_012345) ;9344 (5344) ([8:2][A:3])
	.word (LevelData_Actors_1_Mansions_6laruba_4rooms) ;9A00 (5A00) ([8:2][A:3])
	.word (LevelData_Actors_1_Mansions_7berkeley_2rooms) ;9AC0 (5AC0) ([8:2][A:3])
	.word (LevelData_Actors_1_Mansions_8rover_2rooms) ;9B8E (5B8E) ([8:2][A:3])
	.word (LevelData_Actors_1_Mansions_9brahm_4rooms) ;9C48 (5C48) ([8:2][A:3])
	.word (LevelData_Actors_1_Mansions_Abodley_2rooms) ;9EFA (5EFA) ([8:2][A:3])
	.byte $00,$00
_loc_52CD:
	lda ObjectType,y
	cmp #$25
	bne @92F3
	jsr Object_Erase_And_IfType3C_Set_42to00
	lda #$01
	sta ObjectAIvar1,y
	sta ObjectPaletteIndex,y
	jsr AnyBankTerminateSound
	lda #$2F
	jsr AnyBankPlayTracks
	lda #$0C
	sta PlotAction05_GameLoop_WhichAction
	lda #$00
	sta TimeRelated2B
	lda #$80
	sta TimeRelated2A
	@92F3:
	rts
;------------------------------------------
UnusedObjectAI_52F4_DevolvesIntoDraculasFireball:
	jsr Object_Erase_And_IfType3C_Set_42to00
	lda #$4D
	sta ObjectType,x
	rts
;------------------------------------------
ObjectAI_object49:
	lda ObjectCurrentActionType,x
	bne @932C
	lda #$04
	sta ObjectCurrentActionType,x
	lda CurrentLevelSceneNumber
	cmp #$06
	beq @9313
	lda #$AD
	ldy #$77
	bne @9317

	@9313:
	ldy #$26
	lda #$DE
	@9317:
	 sta ObjectCurrentPose1,x
	tya
	sta ObjectEnemyRemainingHP,x
	lda #$01
	sta ObjectYSpeed,x
	lda #$80
	sta ObjectScreenYCoord,x
	sta ObjectScreenXCoord,x
	rts

	@932C:
	  jsr Object_FlashPalette
	lda ObjectAIvar1,x
	bne @9343
	lda #$00
	ldy #$10
	jsr Object_GenericCollisionHelper_ParamAY_ReturnCarry_IfFrameOddThenDefaultSEC
	bcs @9340
	inc ObjectAIvar1,x
	@9340:
	jmp Object_GeneringXYmovementEngine

	@9343:
	 rts
;------------------------------------------
LevelData_Actors_1_Mansions_012345:
	.word (LevelData_Actors_1_Mansions_012345_5346) ;9346 (5346) ([8:2][A:3])
LevelData_Actors_1_Mansions_012345_5346:
	.byte $FF
NPCtalkAction_GiftGiver_Laurels:
	lda #$78
	sta DialogTextID
	lda InventoryMiscItems1
	ora #$04
	sta InventoryMiscItems1
	and #$01
	beq @9359
	lda #$08
	bne @935B

	@9359:
	lda #$04
	@935B:
	 sta InventoryNumLaurels
	lda #$22
	jmp AnyBankPlayTracks
;------------------------------------------
ObjectAI_object14:
	lda ObjectCurrentActionType,x
	bne @9374
	jsr Object_SetCurrentActionType_to_01
	lda #$80
	jsr _func_1DE6F
	lda #$09
	jmp SetObjectIndexToAutomaticSpriteDataTable_to_A_and_PaletteIndexTo0_and_RefreshSprite

	@9374:
	jsr ObjectLoadAutomaticSpriteNumber
	lda ObjectAIvar1,x
	jsr JumpWithParams
ObjectAI_object14_actions:
	.word (ObjectAI_object14_actions_5383) ;9383 (5383) ()
	.word (ObjectAI_object14_actions_538D) ;938D (538D) ()
	.word (ObjectAI_object14_actions_53A2) ;93A2 (53A2) ()
ObjectAI_object14_actions_5383:
	inc ObjectAIvar1,x
	lda #$FC
	ldy #$00
	jmp Object_SetYVelocity16bit_from_AY
;------------------------------------------
ObjectAI_object14_actions_538D:
	lda #$20
	sta TempPtr08_lo
	jsr Object_GravityAccelerateBy_Var08
	lda ObjectYSpeed,x
	bpl @939C
	jsr _func_1DE8B
	@939C:
	inc ObjectAIvar1,x
	jmp Object_GeneringXYmovementEngine
;------------------------------------------
ObjectAI_object14_actions_53A2:
	lda #$28
	sta TempPtr08_lo
	jsr Object_GravityAccelerateBy_Var08
	jsr Object_GeneringXYmovementEngine
	jsr _func_1DE8B
	lda #$00
	ldy #$10
	jsr Object_GenericCollisionHelper_ParamAY_ReturnCarry_IfFrameOddThenDefaultSEC
	bcs @93BE
	jsr _func_1D3F6
	jmp _func_1DFAD

	@93BE:
	rts
;------------------------------------------
ObjectAI_object25_CrystalBallAndBodypartBag:
	lda ObjectCurrentActionType,x
	bne @93CB
	lda #$84
	ldy #$3B
	jmp Object_SetCurrentActionType_And_Y_as_Pose1

	@93CB:
	ldy ObjectAIvar1,x
	beq @93D4
	dey
	beq @93D7
	rts

	@93D4:
	jmp Object_FlashPalette

	@93D7:
	 lda #$04
	ldy #$A1
	jsr Object_SetCurrentActionType_And_Y_as_Pose1
	jmp Object_FlashPalette
;------------------------------------------
ObjectAI_object05_Knight:
	lda ObjectCurrentActionType,x
	bne @93EE
	jsr Object_SetCurrentActionType_to_01
	lda #$13
	jmp SetObjectIndexToAutomaticSpriteDataTable_to_A_and_PaletteIndexTo0_and_RefreshSprite

	@93EE:
	jsr ObjectLoadAutomaticSpriteNumber
	jsr Object_SetFacing_FaceTowardsSimon
	inc ObjectAIvar1,x
	lda ObjectAIvar1,x
	cmp #$20
	bne @942E
	jsr _func_1DFAD
	lda RandomSeed
	and #$01
	bne @9418
	lda ObjectFacingLeft,x
	bne @9412
	lda #$FF
	ldy #$20
	bne @9427

	@9412:
	lda #$00
	ldy #$E0
	bne @9427

	@9418:
	 lda ObjectFacingLeft,x
	bne @9423
	lda #$00
	ldy #$40
	bne @9427

	@9423:
	lda #$FF
	ldy #$C0
	@9427:
	  sta ObjectXSpeed,x
	tya
	sta ObjectXSpeedFrac,x
	@942E:
	   lda ObjectXSpeed,x
	bmi @9437
	lda #$06
	bne @9439

	@9437:
	lda #$FA
	@9439:
	 ldy #$00
	jsr Object_GenericCollisionHelper_ParamAY_ReturnCarry_IfFrameOddThenDefaultSEC
	bcs @9443
	jsr Object_SetXVelocity16bit_InvertCurrent
	@9443:
	lda ObjectXSpeed,x
	bmi @944C
	lda #$06
	bne @944E

	@944C:
	lda #$FA
	@944E:
	 ldy #$13
	jsr Object_GenericCollisionHelper_ParamAY_ReturnCarry_IfFrameOddThenDefaultCLC
	bcc @9458
	jsr Object_SetXVelocity16bit_InvertCurrent
	@9458:
	jmp Object_GeneringXYmovementEngine
;------------------------------------------
ObjectAI_object0F:
	stx Unknown10_CollisionAndScrollingTemp
	lda ObjectCurrentActionType,x
	bne @946A
	jsr Object_SetCurrentActionType_to_01
	lda #$12
	jmp SetObjectIndexToAutomaticSpriteDataTable_to_A_and_PaletteIndexTo0_and_RefreshSprite

	@946A:
	inc ObjectDialogTextIndex,x
	lda ObjectDialogTextIndex,x
	cmp #$80
	bne @94A5
	lda ObjectDialogStatusFlag,x
	bne @94A5
	lda #$00
	sta ObjectDialogTextIndex,x
	lda #$30
	sta $05
	lda ObjectFacingLeft,x
	beq @948B
	lda #$02
	bne @948D

	@948B:
	lda #$1E
	@948D:
	 jsr Object_CreateProjectileTowardsPredefinedAngle
	lda #$30
	sta $05
	lda ObjectFacingLeft,x
	beq @949D
	lda #$3E
	bne @949F

	@949D:
	lda #$22
	@949F:
	 jsr Object_CreateProjectileTowardsPredefinedAngle
	ldx Unknown10_CollisionAndScrollingTemp
	rts

	@94A5:
	  jsr ObjectLoadAutomaticSpriteNumber
	jsr Object_GeneringXYmovementEngine
	lda ObjectAIvar1,x
	jsr JumpWithParams
ObjectAI_object0F_actions:
	.word (ObjectAI_object0F_actions_54B7) ;94B7 (54B7) ()
	.word (ObjectAI_object0F_actions_54D7) ;94D7 (54D7) ()
	.word (ObjectAI_object0F_actions_553E) ;953E (553E) ()
ObjectAI_object0F_actions_54B7:
	lda RandomSeed
	and #$01
	bne @94C8
	lda #$FD
	ldy #$00
	jsr Object_SetYVelocity16bit_from_AY
	lda #$01
	bne @94CF

	@94C8:
	lda #$40
	sta ObjectAIvar2,x
	lda #$02
	@94CF:
	 sta ObjectAIvar1,x
	lda #$C0
	jmp _func_1DE6F
;------------------------------------------
ObjectAI_object0F_actions_54D7:
	lda #$31
	sta ObjectCurrentPose1,x
	lda #$20
	sta TempPtr08_lo
	jsr Object_GravityAccelerateBy_Var08
	lda ObjectYSpeed,x
	beq _951F
	bpl _951F
	lda #$F4
	ldy #$F0
	jsr Object_GenericCollisionHelper_ParamAY_ReturnCarry_IfFrameOddThenDefaultSEC
	bcs @94F6
	jmp @94FF

	@94F6:
	lda #$0C
	ldy #$F0
	jsr Object_GenericCollisionHelper_ParamAY_ReturnCarry_IfFrameOddThenDefaultSEC
	bcs _func_5506
	@94FF:
	 lda #$01
	ldy #$00
	jsr Object_SetYVelocity16bit_from_AY
_func_5506:
	lda #$0C
	ldy #$00
	jsr Object_GenericCollisionHelper_ParamAY_ReturnCarry_IfFrameOddThenDefaultSEC
	bcs @9512
	jsr Object_SetXVelocity16bit_InvertCurrent_AndAlso_ObjectFacingLeft
	@9512:
	lda #$F4
	ldy #$00
	jsr Object_GenericCollisionHelper_ParamAY_ReturnCarry_IfFrameOddThenDefaultSEC
	bcs @951E
	jsr Object_SetXVelocity16bit_InvertCurrent_AndAlso_ObjectFacingLeft
	@951E:
	rts

	_951F:
	  jsr _func_5506
	lda #$F4
	ldy #$10
	jsr Object_GenericCollisionHelper_ParamAY_ReturnCarry_IfFrameOddThenDefaultSEC
	bcc @9535
	lda #$0C
	ldy #$10
	jsr Object_GenericCollisionHelper_ParamAY_ReturnCarry_IfFrameOddThenDefaultSEC
	bcc @9535
	rts

	@9535:
	jsr _func_1DE62
	jsr _func_1DFA3
	jmp Object_SetXandYVelocity16bit_ToZero
;------------------------------------------
ObjectAI_object0F_actions_553E:
	jsr _func_5506
	lda ObjectFacingLeft,x
	bne @954A
	lda #$F4
	bne @954C

	@954A:
	lda #$0C
	@954C:
	 ldy #$13
	jsr Object_GenericCollisionHelper_ParamAY_ReturnCarry_IfFrameOddThenDefaultCLC
	bcc @9556
	jsr Object_SetXVelocity16bit_InvertCurrent_AndAlso_ObjectFacingLeft
	@9556:
	lda ObjectAIvar2,x
	beq @955F
	dec ObjectAIvar2,x
	rts

	@955F:
	jmp _func_1DFAD
;------------------------------------------
ObjectAI_object0C_ThrownBone:
	lda ObjectCurrentActionType,x
	bne @957C
	jsr Object_SetCurrentActionType_to_02
	lda #$14
	jsr SetObjectIndexToAutomaticSpriteDataTable_to_A_and_PaletteIndexTo0_and_RefreshSprite
	lda #$FC
	ldy #$00
	jsr Object_SetYVelocity16bit_from_AY
	lda #$01
	sta ObjectEnemyRemainingHP,x
	rts

	@957C:
	jsr ObjectLoadAutomaticSpriteNumber
	lda ObjectAIvar1,x
	jsr JumpWithParams
ObjectAI_object0C_actions:
	.word (ObjectAI_object0C_actions_558B) ;958B (558B) ()
	.word (ObjectAI_object0C_actions_55E3) ;95E3 (55E3) ()
	.word (ObjectAI_object0C_actions_5601) ;9601 (5601) ()
ObjectAI_object0C_actions_558B:
	lda ObjectScreenXCoord
	sec
	sbc ObjectScreenXCoord,x
	bmi @95B6
	and #$F0
	jsr Math_divAby16
	cmp #$C0
	bcc @95A4
	lda #$01
	ldy #$00
	jmp @95D8

	@95A4:
	cmp #$80
	bcc @95AF
	lda #$00
	ldy #$C0
	jmp @95D8

	@95AF:
	lda #$00
	ldy #$80
	jmp @95D8

	@95B6:
	 jsr Math_NegateA
	and #$F0
	jsr Math_divAby16
	cmp #$C0
	bcc @95C9
	lda #$FF
	ldy #$00
	jmp @95D8

	@95C9:
	cmp #$80
	bcc @95D4
	lda #$FF
	ldy #$20
	jmp @95D8

	@95D4:
	lda #$FF
	ldy #$80
	@95D8:
	  sta ObjectXSpeed,x
	tya
	sta ObjectXSpeedFrac,x
	inc ObjectAIvar1,x
	rts
;------------------------------------------
ObjectAI_object0C_actions_55E3:
	lda #$20
	sta TempPtr08_lo
	jsr Object_GravityAccelerateBy_Var08
	lda ObjectYSpeed,x
	bmi @95FE
	lda #$00
	ldy #$04
	jsr Object_GenericCollisionHelper_ParamAY_ReturnCarry_IfFrameOddThenDefaultSEC
	bcs @95FE
	jsr _func_1DE62
	inc ObjectAIvar1,x
	@95FE:
	jmp Object_GeneringXYmovementEngine
;------------------------------------------
ObjectAI_object0C_actions_5601:
	lda ObjectAIvar2,x
	bne @9614
	lda #$20
	jsr SetObjectIndexToAutomaticSpriteDataTable_to_A_and_PaletteIndexTo0
	lda ObjectScreenYCoord,x
	sec
	sbc #$08
	sta ObjectScreenYCoord,x
	@9614:
	inc ObjectAIvar2,x
	lda ObjectAIvar2,x
	cmp #$30
	bne @9621
	jmp Object_Erase_And_IfType3C_Set_42to00

	@9621:
	rts
;------------------------------------------
ObjectAI_object0D_JumpingSkeleton:
	stx Unknown10_CollisionAndScrollingTemp
	lda ObjectCurrentActionType,x
	bne @9636
	lda #$01
	sta ObjectPaletteIndex,x
	jsr Object_SetCurrentActionType_to_01
	lda #$05
	jmp SetObjectIndexToAutomaticSpriteDataTable_to_A_and_PaletteIndexTo0_and_RefreshSprite

	@9636:
	inc ObjectDialogTextIndex,x
	lda ObjectDialogTextIndex,x
	cmp #$40
	bne @9656
	lda #$00
	sta ObjectDialogTextIndex,x
	lda ObjectDialogStatusFlag,x
	bne @9656
	jsr Object_FindUnusedSlot
	bcs @9656
	ldy Unknown10_CollisionAndScrollingTemp
	lda #$0C
	jmp _func_1DE7B

	@9656:
	ldx Unknown10_CollisionAndScrollingTemp
	jsr ObjectLoadAutomaticSpriteNumber
	lda ObjectAIvar1,x
	jsr JumpWithParams
ObjectAI_object0D_actions:
	.word (ObjectAI_object0D_actions_5667) ;9667 (5667) ()
	.word (ObjectAI_object0D_actions_5672) ;9672 (5672) ()
	.word (ObjectAI_object0D_actions_56AA) ;96AA (56AA) ()
ObjectAI_object0D_actions_5667:
	lda #$C0
	jsr _func_1DE6F
	inc ObjectAIvar1,x
	jmp Object_SetYVelocity16bit_ToZero
;------------------------------------------
ObjectAI_object0D_actions_5672:
	jsr Object_GeneringXYmovementEngine
	lda ObjectAIvar2,x
	cmp #$40
	bne @967F
	jmp _func_1DFAD

	@967F:
	lda ObjectScreenXCoord,x
	sec
	sbc ObjectScreenXCoord
	bcs @968B
	jsr Math_NegateA
	@968B:
	cmp #$28
	bcs @96A4
	jsr Object_SetFacing_FaceTowardsSimon
	lda #$FF
	ldy #$00
	jsr Object_SetXVelocity16bit_from_AY_invert_if_ObjectFacingLeft_set
	lda #$FE
	ldy #$00
	jsr Object_SetYVelocity16bit_from_AY
	inc ObjectAIvar1,x
	rts

	@96A4:
	jsr _func_1DE8B
	jmp _func_1DEA1
;------------------------------------------
ObjectAI_object0D_actions_56AA:
	lda #$10
	sta TempPtr08_lo
	jsr Object_GravityAccelerateBy_Var08
	lda ObjectXSpeed,x
	bmi @96BA
	lda #$06
	bne @96BC

	@96BA:
	lda #$FA
	@96BC:
	 ldy #$00
	jsr Object_GenericCollisionHelper_ParamAY_ReturnCarry_IfFrameOddThenDefaultSEC
	bcs @96C6
	jsr Object_SetXVelocity16bit_InvertCurrent
	@96C6:
	lda ObjectYSpeed,x
	bmi @96D4
	lda #$00
	ldy #$10
	jsr Object_GenericCollisionHelper_ParamAY_ReturnCarry_IfFrameOddThenDefaultSEC
	bcc @96D7
	@96D4:
	jmp Object_GeneringXYmovementEngine

	@96D7:
	 jsr _func_1DE62
	jsr _func_1DFA8
	jmp Object_SetXandYVelocity16bit_ToZero
;------------------------------------------
UnusedObjectAI_56E0_DoesNothing:
	rts
;------------------------------------------
ObjectAI_object3E_FallingStone:
	lda ObjectCurrentActionType,x
	bne @96F3
	jsr Object_SetCurrentActionType_to_80
	lda #$10
	sta ObjectScreenYCoord,x
	lda #$2F
	jmp SetObjectIndexToAutomaticSpriteDataTable_to_A_and_PaletteIndexTo0_and_RefreshSprite

	@96F3:
	jsr Object_GeneringXYmovementEngine
	lda ObjectAIvar1,x
	jsr JumpWithParams
ObjectAI_object3E_actions:
	.word (ObjectAI_object3E_actions_5702) ;9702 (5702) ()
	.word (ObjectAI_object3E_actions_5720) ;9720 (5720) ()
	.word (ObjectAI_object3E_actions_574A) ;974A (574A) ()
ObjectAI_object3E_actions_5702:
	lda ObjectScreenXCoord,x
	sec
	sbc ObjectScreenXCoord
	bcs @970E
	jsr Math_NegateA
	@970E:
	cmp #$10
	bcc @9713
	rts

	@9713:
	inc ObjectAIvar1,x
	jsr Object_SetCurrentActionType_to_01
	lda #$FF
	ldy #$00
	jmp Object_SetYVelocity16bit_from_AY
;------------------------------------------
ObjectAI_object3E_actions_5720:
	jsr ObjectLoadAutomaticSpriteNumber
	lda #$20
	sta TempPtr08_lo
	jsr Object_GravityAccelerateBy_Var08
	lda #$00
	ldy #$08
	jsr Object_GenericCollisionHelper_ParamAY_ReturnCarry_IfFrameOddThenDefaultCLC
	bcc @9734
	rts

	@9734:
	lda #$02
	sta ObjectAIvar1,x
	lda #$FF
	ldy #$00
	jsr Object_SetYVelocity16bit_from_AY
	lda #$00
	sta ObjectAIvar4,x
	lda #$80
	jmp _func_1DE6F
;------------------------------------------
ObjectAI_object3E_actions_574A:
	jsr ObjectLoadAutomaticSpriteNumber
	lda #$20
	sta TempPtr08_lo
	jsr Object_GravityAccelerateBy_Var08
	lda ObjectAIvar4,x
	cmp #$38
	bne @975E
	jsr _func_1DEA1
	@975E:
	inc ObjectAIvar4,x
	rts
;------------------------------------------
ObjectAI_object20:
	lda ObjectCurrentActionType,x
	bne @9780
	lda #$82
	sta ObjectCurrentActionType,x
	lda ObjectEnemyRemainingHP,x
	bne @9775
	lda #$9F
	bne @9777

	@9775:
	lda #$9F
	@9777:
	 sta ObjectCurrentPose1,x
	lda #$10
	sta ObjectDialogStatusFlag,x
	rts

	@9780:
	  lda ObjectAIvar1,x
	jsr JumpWithParams
ObjectAI_object20_actions:
	.word (ObjectAI_object20_actions_578C) ;978C (578C) ()
	.word (ObjectAI_object20_actions_57B0) ;97B0 (57B0) ()
	.word (ObjectAI_object20_actions_57CD) ;97CD (57CD) ()
ObjectAI_object20_actions_578C:
	lda ObjectScreenXCoord,x
	sec
	sbc ObjectScreenXCoord
	bcs @9798
	jsr Math_NegateA
	@9798:
	cmp #$20
	bcc @979D
	rts

	@979D:
	inc ObjectAIvar1,x
	lda ObjectDialogStatusFlag,x
	and #$EF
	sta ObjectDialogStatusFlag,x
	lda ObjectCurrentActionType,x
	and #$7F
	jmp Object_SetCurrentActionType
;------------------------------------------
ObjectAI_object20_actions_57B0:
	lda ObjectAIvar2,x
	cmp #$20
	bne @97CA
	inc ObjectAIvar1,x
	lda ObjectEnemyRemainingHP,x
	beq @97C3
	lda #$02
	bne @97C5

	@97C3:
	lda #$FE
	@97C5:
	 ldy #$80
	jmp Object_SetYVelocity16bit_from_AY

	@97CA:
	  inc ObjectAIvar2,x
ObjectAI_object20_actions_57CD:
	jsr Object_FlashPalette
	jmp Object_GeneringXYmovementEngine
;------------------------------------------
ObjectAI_object1F_SlimeyMansion:
	lda ObjectCurrentActionType,x
	bne @97E4
	lda #$00
	sta ObjectCurrentPose2,x
	lda #$01
	ldy #$3C
	jmp Object_SetCurrentActionType_And_Y_as_Pose1

	@97E4:
	lda ObjectAIvar1,x
	jsr JumpWithParams
ObjectAI_object1F_actions:
	.word (ObjectAI_object1F_actions_57F6) ;97F6 (57F6) ()
	.word (ObjectAI_object1F_actions_5804) ;9804 (5804) ()
	.word (ObjectAI_object1F_actions_5870) ;9870 (5870) ()
	.word (ObjectAI_object1F_actions_5849) ;9849 (5849) ()
	.word (ObjectAI_object1F_actions_5908) ;9908 (5908) ()
	.word (ObjectAI_object1F_actions_58BC) ;98BC (58BC) ()
ObjectAI_object1F_actions_57F6:
	inc ObjectAIvar1,x
	lda RandomSeed
	and #$1F
	clc
	adc #$03
	sta ObjectAIvar3,x
	rts
;------------------------------------------
ObjectAI_object1F_actions_5804:
	lda ObjectAIvar2,x
	cmp ObjectAIvar3,x
	beq @9829
	inc ObjectAIvar2,x
	lda ObjectAIvar2,x
	and #$03
	bne @9824
	lda ObjectCurrentPose1,x
	cmp #$88
	beq @9825
	cmp #$3D
	beq @9825
	inc ObjectCurrentPose1,x
	@9824:
	rts

	@9825:
	 dec ObjectCurrentPose1,x
	rts

	@9829:
	  lda #$00
	sta ObjectAIvar2,x
	sta ObjectAIvar3,x
	lda RandomSeed
	bmi _loc_58A0
	lda ObjectCurrentPose1,x
	bmi _loc_5861
	lda #$8A
	sta ObjectCurrentPose1,x
	lda #$00
	sta ObjectCurrentPose2,x
	lda #$03
	sta ObjectAIvar1,x
ObjectAI_object1F_actions_5849:
	jsr Object_GeneringXYmovementEngine
	inc ObjectAIvar2,x
	lda #$10
	sta TempPtr08_lo
	jsr Object_GravityDecelerateBy_Var08
	lda ObjectAIvar2,x
	cmp #$08
	bmi _loc_5860
	jmp _loc_5924
;------------------------------------------
_loc_5860:
	rts
;------------------------------------------
_loc_5861:
	lda #$8A
	sta ObjectCurrentPose1,x
	lda #$00
	sta ObjectCurrentPose2,x
	lda #$02
	sta ObjectAIvar1,x
ObjectAI_object1F_actions_5870:
	jsr Object_GeneringXYmovementEngine
	inc ObjectAIvar2,x
	lda #$10
	sta TempPtr08_lo
	jsr Object_GravityAccelerateBy_Var08
	lda ObjectAIvar2,x
	cmp #$08
	bmi _loc_5860
	jmp _98CF

	_9887:
	 lda #$88
	bne _988D
;------------------------------------------
_loc_588B:
	lda #$3C
	_988D:
	sta ObjectCurrentPose1,x
	lda #$00
	sta ObjectCurrentPose2,x
	jsr _func_1D3F6
	lda #$0B
	jsr AnyBankPlayTracks
	jmp _loc_5931	; -> rts
;------------------------------------------
_loc_58A0:
	lda ObjectCurrentPose1,x
	bmi _loc_58E2
	lda #$05
	sta ObjectAIvar1,x
	lda #$3E
	sta ObjectCurrentPose1,x
	lda #$00
	sta ObjectCurrentPose2,x
	lda #$FD
	sta ObjectYSpeed,x
	jmp _loc_58F4
;------------------------------------------
ObjectAI_object1F_actions_58BC:
	jsr Object_GeneringXYmovementEngine
	lda Ending_PrimaryActionIndex,x
	sta TempPtr08_lo
	jsr Object_GravityAccelerateBy_Var08
	jsr _func_1DE8B
	lda ObjectYSpeed,x
	bmi _loc_5860
	_98CF:
	 lda ObjectFacingLeft,x
	bne @98D8
	lda #$FA
	bne @98DA

	@98D8:
	lda #$06
	@98DA:
	 ldy #$00
	jsr Object_GenericCollisionHelper_ParamAY_ReturnCarry_IfFrameOddThenDefaultSEC
	bcc _loc_588B
	rts
;------------------------------------------
_loc_58E2:
	lda #$04
	sta ObjectYSpeed,x
	sta ObjectAIvar1,x
	lda #$89
	sta ObjectCurrentPose1,x
	lda #$01
	sta ObjectCurrentPose2,x
_loc_58F4:
	lda RandomSeed
	and #$1F
	clc
	adc #$30
	sta Ending_PrimaryActionIndex,x
	jsr Object_SetFacing_FaceTowardsSimon
	lda #$01
	ldy #$40
	jmp Object_SetXVelocity16bit_from_AY_invert_if_ObjectFacingLeft_set
;------------------------------------------
ObjectAI_object1F_actions_5908:
	jsr Object_GeneringXYmovementEngine
	lda Ending_PrimaryActionIndex,x
	sta TempPtr08_lo
	jsr Object_GravityDecelerateBy_Var08
	jsr _func_1DE8B
	lda ObjectYSpeed,x
	bpl _9930
	lda ObjectFacingLeft,x
	bne _loc_5924
	lda #$FA
	bne _9926
;------------------------------------------
_loc_5924:
	lda #$06
	_9926:
	ldy #$F8
	jsr Object_GenericCollisionHelper_ParamAY_ReturnCarry_IfFrameOddThenDefaultSEC
	bcs _9930
	jmp _9887

	_9930:
	 rts
;------------------------------------------
_loc_5931:
	jmp _loc_1DF7F
;------------------------------------------
ObjectAI_object11:
	lda ObjectCurrentActionType,x
	bne @9941
	jsr Object_SetCurrentActionType_to_01
	lda #$07
	jmp SetObjectIndexToAutomaticSpriteDataTable_to_A_and_PaletteIndexTo0_and_RefreshSprite

	@9941:
	jsr Object_SetFacing_FaceTowardsSimon
	lda ObjectAIvar1,x
	jsr JumpWithParams
ObjectAI_object11_actions:
	.word (ObjectAI_object11_actions_5950) ;9950 (5950) ()
	.word (ObjectAI_object11_actions_596D) ;996D (596D) ()
	.word (ObjectAI_object11_actions_5989) ;9989 (5989) ()
ObjectAI_object11_actions_5950:
	inc ObjectAIvar2,x
	lda ObjectAIvar2,x
	cmp #$50
	bne @9967
	inc ObjectAIvar1,x
	lda #$00
	sta ObjectAIvar2,x
	lda #$80
	sta ObjectYSpeedFrac,x
	@9967:
	lda #$14
	sta ObjectCurrentPose1,x
	rts
;------------------------------------------
ObjectAI_object11_actions_596D:
	jsr ObjectLoadAutomaticSpriteNumber
	inc ObjectAIvar2,x
	lda ObjectAIvar2,x
	cmp #$30
	bne @9986
	inc ObjectAIvar1,x
	lda #$00
	sta ObjectYSpeedFrac,x
	sta ObjectAIvar2,x
	rts

	@9986:
	jmp Object_GeneringXYmovementEngine
;------------------------------------------
ObjectAI_object11_actions_5989:
	jsr ObjectLoadAutomaticSpriteNumber
	inc ObjectAIvar2,x
	lda ObjectAIvar2,x
	cmp #$18
	bne @99B8
	lda #$00
	sta ObjectAIvar2,x
	lda ObjectAIvar4,x
	beq @99E3
	lda RandomSeed
	and #$3F
	ldy #$02
	jsr Object_SetVelocityAndAngle_Aangle_Yspeed
	inc ObjectAIvar4,x
	lda ObjectAIvar4,x
	cmp #$03
	bne @99B8
	lda #$00
	sta ObjectAIvar4,x
	@99B8:
	  lda Ending_PrimaryActionIndex,x
	beq @99C8
	lda #$FA
	ldy #$F0
	jsr Object_GenericCollisionHelper_ParamAY_ReturnCarry_IfFrameOddThenDefaultSEC
	bcc @99DA
	bcs @99D7
	@99C8:
	inc ObjectAIvar3,x
	lda ObjectAIvar3,x
	cmp #$60
	bne @99D7
	lda #$01
	sta Ending_PrimaryActionIndex,x
	@99D7:
	 jmp Object_GeneringXYmovementEngine

	@99DA:
	  jsr _func_1DFA3
	sta Ending_PrimaryActionIndex,x
	jmp Object_SetXandYVelocity16bit_ToZero

	@99E3:
	   lda #$C0
	jsr _func_1DE6F
	jsr _func_4D12
	bcs @99F3
	lda #$00
	ldy #$C0
	bne @99F7

	@99F3:
	lda #$FF
	ldy #$40
	@99F7:
	 jsr Object_SetYVelocity16bit_from_AY
	inc ObjectAIvar4,x
	jmp @99B8
;------------------------------------------
LevelData_Actors_1_Mansions_6laruba_4rooms:
	.word (LevelData_Actors_1_Mansions_6laruba_4rooms_5A08) ;9A08 (5A08) ([8:2][A:3])
	.word (LevelData_Actors_1_Mansions_6laruba_4rooms_5A55) ;9A55 (5A55) ([8:2][A:3])
	.word (LevelData_Actors_1_Mansions_6laruba_4rooms_5AB6) ;9AB6 (5AB6) ([8:2][A:3])
	.word (LevelData_Actors_1_Mansions_6laruba_4rooms_5ABB) ;9ABB (5ABB) ([8:2][A:3])
LevelData_Actors_1_Mansions_6laruba_4rooms_5A08:
	.byte $04,$04,$03,$1E,$04,$0E,$03,$1E,$08,$1A,$03,$1E,$0C,$0C,$03,$1E
	.byte $0C,$1A,$03,$1E,$14,$04,$03,$1E,$14,$0C,$03,$1E,$18,$12,$05,$1E
	.byte $18,$1A,$05,$1E,$1C,$0C,$03,$1E,$1C,$1A,$0D,$1E,$24,$08,$03,$1E
	.byte $24,$12,$05,$1E,$28,$18,$03,$1E,$2C,$08,$03,$1E,$34,$04,$0D,$1E
	.byte $34,$14,$03,$1E,$38,$0E,$0D,$1E,$3C,$14,$05,$1E,$FF
LevelData_Actors_1_Mansions_6laruba_4rooms_5A55:
	.byte $02,$34,$AF,$01,$03,$12,$03,$1E,$03,$1A,$03,$1E,$03,$22,$03,$1E
	.byte $08,$0E,$03,$1E,$08,$1E,$0D,$1E,$08,$28,$03,$1E,$09,$36,$22,$65
	.byte $0A,$37,$20,$00,$0D,$37,$20,$00,$13,$37,$20,$00,$14,$0C,$03,$1E
	.byte $14,$2B,$0E,$1E,$15,$36,$22,$66,$1C,$2B,$0E,$1E,$1D,$0C,$AE,$06
	.byte $24,$12,$03,$1E,$24,$26,$0D,$1E,$28,$0C,$0D,$1E,$28,$16,$0D,$1E
	.byte $28,$20,$05,$1E,$2A,$30,$05,$1E,$2C,$12,$03,$1E,$2C,$20,$03,$1E
	.byte $FF
LevelData_Actors_1_Mansions_6laruba_4rooms_5AB6:
	.byte $08,$0A,$42,$F0,$FF
LevelData_Actors_1_Mansions_6laruba_4rooms_5ABB:
	.byte $0D,$07,$25,$1C,$FF
LevelData_Actors_1_Mansions_7berkeley_2rooms:
	.word (LevelData_Actors_1_Mansions_7berkeley_2rooms_5AC4) ;9AC4 (5AC4) ([8:2][A:3])
	.word (LevelData_Actors_1_Mansions_7berkeley_2rooms_5B2D) ;9B2D (5B2D) ([8:2][A:3])
LevelData_Actors_1_Mansions_7berkeley_2rooms_5AC4:
	.byte $04,$0E,$05,$02,$05,$28,$22,$A4,$08,$10,$03,$02,$08,$14,$03,$02
	.byte $0C,$08,$03,$02,$0C,$1E,$05,$02,$14,$0E,$1F,$01,$14,$18,$0F,$02
	.byte $18,$08,$03,$02,$18,$1E,$03,$02,$18,$26,$03,$02,$1C,$0E,$1F,$01
	.byte $1C,$18,$1F,$01,$24,$0E,$1F,$01,$24,$18,$1F,$01,$28,$08,$03,$02
	.byte $28,$18,$1F,$01,$28,$1E,$03,$02,$2C,$0E,$1F,$01,$2C,$26,$0F,$02
	.byte $34,$0C,$03,$02,$34,$26,$03,$02,$38,$06,$03,$02,$3C,$0C,$03,$02
	.byte $3C,$22,$03,$02,$3E,$0C,$27,$1E,$FF
LevelData_Actors_1_Mansions_7berkeley_2rooms_5B2D:
	.byte $01,$0C,$27,$1F,$04,$26,$0F,$02,$07,$0C,$AE,$06,$08,$22,$05,$02
	.byte $0C,$06,$0D,$02,$0C,$26,$0F,$02,$14,$1C,$03,$02,$14,$22,$05,$02
	.byte $14,$26,$05,$02,$18,$06,$0D,$02,$18,$16,$03,$02,$1C,$0C,$03,$02
	.byte $1C,$12,$03,$02,$1C,$26,$05,$02,$28,$12,$03,$02,$28,$1E,$03,$02
	.byte $28,$24,$03,$02,$2C,$16,$1F,$01,$2C,$1A,$03,$02,$2C,$26,$03,$02
	.byte $2E,$16,$27,$20,$34,$26,$1F,$01,$38,$26,$1F,$01,$3D,$15,$25,$18
	.byte $FF
LevelData_Actors_1_Mansions_8rover_2rooms:
	.word (LevelData_Actors_1_Mansions_8rover_2rooms_5B92) ;9B92 (5B92) ([8:2][A:3])
	.word (LevelData_Actors_1_Mansions_8rover_2rooms_5BF7) ;9BF7 (5BF7) ([8:2][A:3])
LevelData_Actors_1_Mansions_8rover_2rooms_5B92:
	.byte $04,$0A,$05,$04,$08,$10,$03,$04,$08,$18,$03,$04,$08,$28,$05,$04
	.byte $0C,$0A,$03,$04,$0C,$20,$03,$04,$0C,$28,$0D,$04,$14,$0A,$0F,$04
	.byte $14,$0C,$11,$04,$14,$16,$11,$04,$14,$28,$0D,$04,$18,$10,$05,$04
	.byte $18,$16,$11,$04,$18,$28,$03,$04,$1C,$0A,$0F,$04,$1C,$0C,$11,$04
	.byte $1C,$16,$11,$04,$1C,$20,$03,$04,$23,$1E,$03,$04,$24,$0A,$03,$04
	.byte $24,$10,$03,$04,$27,$1C,$03,$04,$28,$0A,$03,$04,$2C,$16,$03,$04
	.byte $2C,$22,$03,$04,$FF
LevelData_Actors_1_Mansions_8rover_2rooms_5BF7:
	.byte $03,$28,$0D,$04,$07,$28,$0D,$04,$14,$14,$03,$04,$14,$1C,$03,$04
	.byte $18,$16,$03,$04,$18,$22,$03,$04,$24,$08,$03,$04,$24,$12,$03,$04
	.byte $24,$1A,$05,$04,$24,$25,$21,$85,$28,$0E,$03,$04,$28,$1A,$05,$04
	.byte $2C,$08,$03,$04,$34,$08,$05,$04,$34,$28,$0D,$04,$38,$22,$03,$04
	.byte $38,$28,$AE,$06,$3D,$15,$25,$19,$3E,$08,$27,$21,$3E,$22,$27,$22
	.byte $FF
LevelData_Actors_1_Mansions_9brahm_4rooms:
	.word (LevelData_Actors_1_Mansions_9brahm_4rooms_5C50) ;9C50 (5C50) ([8:2][A:3])
	.word (LevelData_Actors_1_Mansions_9brahm_4rooms_5CB1) ;9CB1 (5CB1) ([8:2][A:3])
	.word (LevelData_Actors_1_Mansions_9brahm_4rooms_5CCE) ;9CCE (5CCE) ([8:2][A:3])
	.word (LevelData_Actors_1_Mansions_9brahm_4rooms_5CD3) ;9CD3 (5CD3) ([8:2][A:3])
LevelData_Actors_1_Mansions_9brahm_4rooms_5C50:
	.byte $01,$10,$27,$23,$03,$10,$03,$08,$04,$2E,$03,$08,$08,$1E,$03,$08
	.byte $08,$2A,$1F,$04,$0C,$16,$03,$08,$0C,$24,$1F,$04,$0C,$30,$05,$08
	.byte $14,$0E,$03,$08,$14,$24,$05,$08,$18,$08,$0F,$08,$18,$16,$03,$08
	.byte $18,$2A,$03,$08,$18,$30,$05,$08,$1C,$0E,$03,$08,$1C,$1E,$03,$08
	.byte $23,$16,$AE,$06,$24,$20,$05,$08,$24,$30,$1F,$04,$24,$36,$1F,$04
	.byte $28,$08,$05,$08,$28,$18,$05,$08,$28,$1C,$05,$08,$2C,$26,$03,$08
	.byte $FF
LevelData_Actors_1_Mansions_9brahm_4rooms_5CB1:
	.byte $04,$0C,$0F,$08,$04,$16,$05,$08,$04,$32,$11,$04,$08,$32,$11,$04
	.byte $0C,$0C,$0F,$08,$0C,$32,$11,$04,$0E,$18,$27,$24,$FF
LevelData_Actors_1_Mansions_9brahm_4rooms_5CCE:
	.byte $08,$08,$44,$80,$FF
LevelData_Actors_1_Mansions_9brahm_4rooms_5CD3:
	.byte $0D,$07,$25,$1A,$FF
ObjectAI_object42:
	lda ObjectCurrentActionType,x
	bne @9CEF
	lda #$01
	ldy #$CA
	jsr Object_SetCurrentActionType_And_Y_as_Pose1
	lda #$80
	sta ObjectScreenXCoord,x
	lda #$A0
	sta ObjectScreenYCoord,x
	rts

	@9CEF:
	lda ObjectAIvar1,x
	jsr JumpWithParams
ObjectAI_object42_actions:
	.word (ObjectAI_object42_actions_5CFF) ;9CFF (5CFF) ()
	.word (ObjectAI_object42_actions_5D0E) ;9D0E (5D0E) ()
	.word (ObjectAI_object42_actions_5D22) ;9D22 (5D22) ()
	.word (ObjectAI_object42_actions_5D3B) ;9D3B (5D3B) ()
	.word (ObjectAI_object42_actions_5D61) ;9D61 (5D61) ()
ObjectAI_object42_actions_5CFF:
	lda #$78
	sta ObjectAIvar2,x
	inc ObjectAIvar1,x
	lda #$FF
	ldy #$80
	jmp Object_SetYVelocity16bit_from_AY
;------------------------------------------
ObjectAI_object42_actions_5D0E:
	lda ObjectAIvar2,x
	bne @9D1C
	jsr _func_5D2E
	inc ObjectAIvar1,x
	jmp Object_SetXandYVelocity16bit_ToZero

	@9D1C:
	dec ObjectAIvar2,x
_loc_5D1F:
	jmp Object_GeneringXYmovementEngine
;------------------------------------------
ObjectAI_object42_actions_5D22:
	lda RandomSeed
	and #$01
	bne _9D37
	inc ObjectAIvar1,x
	inc ObjectAIvar1,x
_func_5D2E:
	lda #$00
	sta ObjectAIvar2,x
	sta ObjectAIvar3,x
	rts

	_9D37:
	inc ObjectAIvar1,x
	rts
;------------------------------------------
ObjectAI_object42_actions_5D3B:
	inc ObjectAIvar2,x
	lda ObjectAIvar2,x
	cmp #$C0
	beq @9D53
	lda ObjectDialogTextIndex,x
	cmp #$20
	bne @9D4F
	jmp _9D9D

	@9D4F:
	inc ObjectDialogTextIndex,x
	rts

	@9D53:
	 lda #$02
	sta ObjectAIvar1,x
	lda #$00
	sta ObjectAIvar2,x
	sta ObjectDialogTextIndex,x
	rts
;------------------------------------------
ObjectAI_object42_actions_5D61:
	ldy #$03
	lda ObjectAIvar2,x
	jsr Object_SetVelocityAndAngle_Aangle_Yspeed
	lda FrameCounter
	and #$01
	bne _loc_5D1F
	inc ObjectAIvar2,x
	lda ObjectAIvar2,x
	cmp #$40
	bne @9D81
	lda #$00
	sta ObjectAIvar2,x
	inc ObjectAIvar3,x
	@9D81:
	lda ObjectAIvar3,x
	cmp #$02
	bne _loc_5D1F
	lda #$80
	sta ObjectScreenXCoord,x
	lda #$64
	sta ObjectScreenYCoord,x
	jsr _func_5D2E
	lda #$02
	sta ObjectAIvar1,x
	jmp Object_SetXandYVelocity16bit_ToZero

	_9D9D:
	  stx Unknown10_CollisionAndScrollingTemp
	lda ObjectAIvar3,x
	cmp #$20
	bne @9DCA
	lda #$00
	sta ObjectAIvar3,x
	sta ObjectDialogTextIndex,x
	jsr Object_FindUnusedSlot
	bcs @9DCA
	lda #$45
	sta ObjectType,x
	ldy Unknown10_CollisionAndScrollingTemp
	lda ObjectScreenXCoord,y
	clc
	adc #$04
	sta ObjectScreenXCoord,x
	lda ObjectScreenYCoord,y
	sta ObjectScreenYCoord,x
	rts

	@9DCA:
	ldx Unknown10_CollisionAndScrollingTemp
	inc ObjectAIvar3,x
	jmp Object_FlashPalette
;------------------------------------------
ObjectAI_object45:
	stx Unknown10_CollisionAndScrollingTemp
	lda ObjectCurrentActionType,x
	bne @9DE0
	lda #$02
	ldy #$DF
	jmp Object_SetCurrentActionType_And_Y_as_Pose1

	@9DE0:
	lda #$02
	sta ObjectYSpeed,x
	lda #$00
	ldy #$0A
	jsr Object_GenericCollisionHelper_ParamAY_ReturnCarry_IfFrameOddThenDefaultSEC
	bcc @9DF1
	jmp Object_GeneringXYmovementEngine

	@9DF1:
	lda #$09
	jsr AnyBankPlayTracks
	jsr _func_5DFE
	ldx Unknown10_CollisionAndScrollingTemp
	jmp Object_Erase_And_IfType3C_Set_42to00
;------------------------------------------
_func_5DFE:
	ldy #$04
	sty $0196
	@9E03:
	lda #$30
	sta $05
	ldy $0196
	lda _data_5E16_indexed,y
	jsr Object_CreateProjectileTowardsPredefinedAngle
	dec $0196
	bpl @9E03
	rts
;------------------------------------------
_data_5E16_indexed:
	.byte $21,$28,$30,$38,$3F
ObjectAI_object44:
	lda ObjectCurrentActionType,x
	bne @9E27
	lda #$01
	ldy #$44
	jmp Object_SetCurrentActionType_And_Y_as_Pose1

	@9E27:
	inc ObjectDialogTextIndex,x
	lda ObjectDialogTextIndex,x
	cmp #$40
	bne @9E41
	lda #$00
	sta ObjectDialogTextIndex,x
	lda ObjectDialogStatusFlag,x
	bne @9E5A
	lda #$44
	sta ObjectCurrentPose1,x
	rts

	@9E41:
	cmp #$30
	bne @9E5A
	jsr Object_SetFacing_FaceTowardsSimon
	lda #$45
	sta ObjectCurrentPose1,x
	jsr Object_ComparePositionToSimonPosition
	lda #$46
	jsr Object_CreateProjectileTowardsSimon
	lda #$08
	jmp AnyBankPlayTracks

	@9E5A:
	 lda FrameCounter
	and #$0F
	beq @9E7B
	inc ObjectAIvar1,x
	lda ObjectAIvar1,x
	cmp #$30
	bne @9E92
	lda #$00
	sta ObjectAIvar1,x
	ldy #$02
	lda RandomSeed
	and #$3F
	jsr Object_SetVelocityAndAngle_Aangle_Yspeed
	jmp @9E92

	@9E7B:
	jsr _func_4D12
	bcc @9E86
	lda #$FF
	ldy #$C0
	bne @9E8A

	@9E86:
	lda #$00
	ldy #$40
	@9E8A:
	 jsr Object_SetYVelocity16bit_from_AY
	lda #$40
	jsr _func_1DE6F
	@9E92:
	  jsr Object_GeneringXYmovementEngine
	ldy #$03
	sty $0196
	@9E9A:
	ldy $0196
	lda _data_5ED2_indexed,y
	pha
	 lda _data_5ED5_indexed,y
	 tay
	pla
	jsr Object_GenericCollisionHelper_ParamAY_ReturnCarry_IfFrameOddThenDefaultSEC
	bcs @9EAE
	jsr Object_SetYVelocity16bit_InvertCurrent
	@9EAE:
	dec $0196
	bpl @9E9A
	ldy #$03
	sty $0196
	@9EB8:
	ldy $0196
	lda _data_5ED9_indexed,y
	pha
	 lda _data_5ED5_indexed,y
	 tay
	pla
	jsr Object_GenericCollisionHelper_ParamAY_ReturnCarry_IfFrameOddThenDefaultSEC
	bcs @9ECC
	jsr Object_SetXVelocity16bit_InvertCurrent
	@9ECC:
	dec $0196
	bpl @9EB8
	rts
;------------------------------------------
_data_5ED2_indexed:
	.byte $F0,$F0,$10
_data_5ED5_indexed:
	.byte $10,$F0,$10,$F0
_data_5ED9_indexed:
	.byte $EC,$EC,$14,$14
ObjectAI_object46:
	lda ObjectCurrentActionType,x
	bne @9EF4
	lda #$02
	sta ObjectCurrentActionType,x
	lda #$05
	sta ObjectEnemyRemainingHP,x
	lda #$3C
	jsr SetObjectIndexToAutomaticSpriteDataTable_to_A_and_PaletteIndexTo0
	jmp ObjectLoadAutomaticSpriteNumber

	@9EF4:
	jsr ObjectLoadAutomaticSpriteNumber
	jmp Object_GeneringXYmovementEngine
;------------------------------------------
LevelData_Actors_1_Mansions_Abodley_2rooms:
	.word (LevelData_Actors_1_Mansions_Abodley_2rooms_5EFE) ;9EFE (5EFE) ([8:2][A:3])
	.word (LevelData_Actors_1_Mansions_Abodley_2rooms_5F57) ;9F57 (5F57) ([8:2][A:3])
LevelData_Actors_1_Mansions_Abodley_2rooms_5EFE:
	.byte $04,$0C,$03,$0F,$08,$28,$05,$0F,$09,$0C,$3E,$00,$0A,$0C,$3E,$00
	.byte $0B,$0C,$3E,$00,$0C,$0C,$3E,$00,$0D,$0C,$3E,$00,$0E,$0C,$3E,$00
	.byte $0F,$0C,$3E,$00,$14,$12,$1F,$08,$14,$28,$03,$0F,$18,$0C,$03,$0F
	.byte $18,$1A,$03,$0F,$18,$20,$03,$0F,$1C,$12,$1F,$08,$24,$08,$03,$0F
	.byte $24,$28,$03,$0F,$28,$06,$03,$0F,$28,$20,$03,$0F,$34,$0C,$03,$0F
	.byte $34,$20,$03,$0F,$3C,$06,$03,$0F,$FF
LevelData_Actors_1_Mansions_Abodley_2rooms_5F57:
	.byte $04,$0C,$03,$0F,$04,$14,$03,$0F,$04,$2E,$03,$0F,$08,$06,$03,$0F
	.byte $08,$14,$03,$0F,$08,$1A,$03,$0F,$08,$20,$03,$0F,$08,$2C,$03,$0F
	.byte $0C,$0C,$03,$0F,$0C,$36,$03,$0F,$14,$36,$03,$0F,$18,$30,$03,$0F
	.byte $18,$2A,$AE,$06,$1C,$1A,$03,$0F,$1C,$36,$03,$0F,$28,$1A,$03,$0F
	.byte $2C,$16,$27,$25,$2D,$31,$25,$1B,$34,$28,$0D,$06,$38,$14,$05,$0F
	.byte $38,$1A,$05,$0F,$3C,$20,$05,$0F,$FF
LevelData_Actors_2_ForestsAndBridges:
	.word (LevelData_Actors_2_ForestsAndBridges_0aldraRightsideVerosLeftside_4rooms) ;9FC4 (5FC4) ([8:2][A:3])
	.word (LevelData_Actors_2_ForestsAndBridges_1verosForest) ;9FCC (5FCC) ([8:2][A:3])
	.word (LevelData_Actors_2_ForestsAndBridges_2) ;A648 (6648) ([8:2][A:3])
	.word (LevelData_Actors_2_ForestsAndBridges_3_4rooms) ;A64A (664A) ([8:2][A:3])
	.word (LevelData_Actors_2_ForestsAndBridges_4_2rooms) ;A652 (6652) ([8:2][A:3])
	.word (LevelData_Actors_2_ForestsAndBridges_5_2rooms) ;A656 (6656) ([8:2][A:3])
	.word (LevelData_Actors_2_ForestsAndBridges_6) ;9FCE (5FCE) ([8:2][A:3])
	.word (LevelData_Actors_2_ForestsAndBridges_7_3rooms) ;9FD0 (5FD0) ([8:2][A:3])
	.word (LevelData_Actors_2_ForestsAndBridges_8_4rooms) ;9FDC (5FDC) ([8:2][A:3])
	.word (LevelData_Actors_2_ForestsAndBridges_9_3rooms) ;9FD6 (5FD6) ([8:2][A:3])
LevelData_Actors_2_ForestsAndBridges_0aldraRightsideVerosLeftside_4rooms:
	.word (LevelData_Actors_2_ForestsAndBridges_0aldraRightsideVerosLeftside_4rooms_5FE4) ;9FE4 (5FE4) ([8:2][A:3])
	.word (LevelData_Actors_2_ForestsAndBridges_0aldraRightsideVerosLeftside_4rooms_6009) ;A009 (6009) ([8:2][A:3])
	.word (LevelData_Actors_2_ForestsAndBridges_0aldraRightsideVerosLeftside_4rooms_6032) ;A032 (6032) ([8:2][A:3])
	.word (LevelData_Actors_2_ForestsAndBridges_0aldraRightsideVerosLeftside_4rooms_604F) ;A04F (604F) ([8:2][A:3])
LevelData_Actors_2_ForestsAndBridges_1verosForest:
	.word (LevelData_Actors_2_ForestsAndBridges_1verosForest_6068) ;A068 (6068) ([8:2][A:3])
LevelData_Actors_2_ForestsAndBridges_6:
	.word (LevelData_Actors_2_ForestsAndBridges_7_3rooms_6079) ;A079 (6079) ([8:2][A:3])
LevelData_Actors_2_ForestsAndBridges_7_3rooms:
	.word (LevelData_Actors_2_ForestsAndBridges_7_3rooms_6079) ;A079 (6079) ([8:2][A:3])
	.word (LevelData_Actors_2_ForestsAndBridges_7_3rooms_608E) ;A08E (608E) ([8:2][A:3])
	.word (LevelData_Actors_2_ForestsAndBridges_7_3rooms_60A3) ;A0A3 (60A3) ([8:2][A:3])
LevelData_Actors_2_ForestsAndBridges_9_3rooms:
	.word (LevelData_Actors_2_ForestsAndBridges_9_3rooms_6153) ;A153 (6153) ([8:2][A:3])
	.word (LevelData_Actors_2_ForestsAndBridges_9_3rooms_6133) ;A133 (6133) ([8:2][A:3])
	.word (LevelData_Actors_2_ForestsAndBridges_9_3rooms_6154) ;A154 (6154) ([8:2][A:3])
LevelData_Actors_2_ForestsAndBridges_8_4rooms:
	.word (LevelData_Actors_2_ForestsAndBridges_8_4rooms_60D0) ;A0D0 (60D0) ([8:2][A:3])
	.word (LevelData_Actors_2_ForestsAndBridges_8_4rooms_6101) ;A101 (6101) ([8:2][A:3])
	.word (LevelData_Actors_2_ForestsAndBridges_8_4rooms_611A) ;A11A (611A) ([8:2][A:3])
	.word (LevelData_Actors_2_ForestsAndBridges_8_4rooms_6132) ;A132 (6132) ([8:2][A:3])
LevelData_Actors_2_ForestsAndBridges_0aldraRightsideVerosLeftside_4rooms_5FE4:
	.byte $08,$0C,$13,$02,$0C,$0C,$03,$01,$14,$0C,$13,$02,$18,$0A,$03,$01
	.byte $1C,$08,$13,$02,$28,$0A,$03,$01,$2C,$0C,$03,$01,$34,$0A,$03,$01
	.byte $3C,$0B,$03,$01,$FF
LevelData_Actors_2_ForestsAndBridges_0aldraRightsideVerosLeftside_4rooms_6009:
	.byte $04,$0A,$03,$01,$0C,$09,$03,$01,$0E,$0C,$04,$01,$15,$0C,$04,$01
	.byte $1A,$0C,$04,$01,$25,$0C,$04,$01,$2A,$0C,$04,$01,$34,$09,$03,$01
	.byte $35,$0C,$04,$01,$38,$0A,$03,$01,$FF
LevelData_Actors_2_ForestsAndBridges_0aldraRightsideVerosLeftside_4rooms_6032:
	.byte $08,$06,$03,$01,$08,$0C,$03,$01,$0C,$0D,$43,$00,$14,$06,$03,$01
	.byte $18,$0C,$03,$01,$19,$06,$03,$01,$1D,$08,$03,$01,$FF
LevelData_Actors_2_ForestsAndBridges_0aldraRightsideVerosLeftside_4rooms_604F:
	.byte $04,$0A,$03,$01,$08,$0B,$03,$01,$0C,$0C,$03,$01,$14,$0D,$43,$00
	.byte $14,$0A,$03,$01,$18,$0A,$03,$01,$FF
LevelData_Actors_2_ForestsAndBridges_1verosForest_6068:
	.byte $04,$0A,$03,$01,$0A,$0C,$04,$01,$14,$0A,$03,$01,$18,$0A,$03,$01
	.byte $FF
LevelData_Actors_2_ForestsAndBridges_7_3rooms_6079:
	.byte $04,$0B,$06,$04,$08,$0B,$06,$04,$12,$0C,$BC,$01,$18,$0C,$04,$04
	.byte $1C,$0C,$04,$04,$FF
LevelData_Actors_2_ForestsAndBridges_7_3rooms_608E:
	.byte $04,$0C,$04,$04,$08,$0C,$04,$04,$0E,$0C,$BC,$00,$18,$0B,$06,$04
	.byte $1A,$0B,$06,$04,$FF
LevelData_Actors_2_ForestsAndBridges_7_3rooms_60A3:
	.byte $06,$0D,$02,$04,$08,$0D,$43,$00,$0A,$0C,$15,$04,$0C,$0C,$15,$04
	.byte $14,$0D,$43,$00,$16,$0C,$15,$04,$1D,$08,$12,$04,$28,$0A,$12,$04
	.byte $2C,$0C,$06,$04,$34,$0C,$06,$04,$38,$0C,$06,$04,$FF
LevelData_Actors_2_ForestsAndBridges_8_4rooms_60D0:
	.byte $08,$09,$03,$0F,$0C,$09,$03,$0F,$0E,$0C,$04,$0F,$15,$0C,$04,$0F
	.byte $18,$0B,$22,$41,$1A,$0C,$04,$0F,$25,$0C,$04,$0F,$28,$0B,$22,$41
	.byte $2A,$0C,$04,$0F,$34,$09,$03,$0F,$35,$0C,$04,$0F,$38,$0A,$03,$0F
	.byte $FF
LevelData_Actors_2_ForestsAndBridges_8_4rooms_6101:
	.byte $04,$0A,$06,$0F,$08,$0A,$06,$0F,$0C,$0B,$06,$0F,$14,$0D,$43,$00
	.byte $18,$0C,$06,$0F,$1C,$08,$06,$0F,$FF
LevelData_Actors_2_ForestsAndBridges_8_4rooms_611A:
	.byte $04,$0A,$03,$0F,$08,$0B,$03,$0F,$0C,$0C,$03,$0F,$14,$0A,$03,$0F
	.byte $16,$0D,$43,$00,$18,$0A,$03,$0F
LevelData_Actors_2_ForestsAndBridges_8_4rooms_6132:
	.byte $FF
LevelData_Actors_2_ForestsAndBridges_9_3rooms_6133:
	.byte $0C,$0C,$04,$0F,$14,$0C,$04,$0F,$18,$0C,$04,$0F,$1C,$0C,$04,$0F
	.byte $24,$0C,$04,$0F,$28,$0C,$04,$0F,$2C,$0C,$04,$0F,$34,$0C,$04,$0F
LevelData_Actors_2_ForestsAndBridges_9_3rooms_6153:
	.byte $FF
LevelData_Actors_2_ForestsAndBridges_9_3rooms_6154:
	.byte $04,$0C,$03,$0F,$08,$06,$03,$0F,$08,$0D,$43,$00,$0A,$0C,$15,$0F
	.byte $12,$06,$03,$0F,$18,$0D,$43,$00,$1A,$0C,$15,$0F,$23,$06,$03,$0F
	.byte $28,$0D,$43,$00,$2A,$0C,$15,$0F,$36,$0D,$43,$00,$38,$0C,$15,$0F
	.byte $FF
ObjectAI_object12_Wolf:
	lda ObjectCurrentActionType,x
	bne @A19C
	jsr Object_SetCurrentActionType_to_01
	jsr Object_SetFacing_FaceTowardsSimon
	lda #$02
	ldy #$00
	jsr Object_SetXVelocity16bit_from_AY_invert_if_ObjectFacingLeft_set
	lda #$1D
	jmp SetObjectIndexToAutomaticSpriteDataTable_to_A_and_PaletteIndexTo0_and_RefreshSprite

	@A19C:
	lda ObjectAIvar1,x
	bne @A1D6
	lda ObjectFacingLeft,x
	bne @A1AA
	lda #$F0
	bne @A1AC

	@A1AA:
	lda #$10
	@A1AC:
	 ldy #$00
	jsr Object_GenericCollisionHelper_ParamAY_ReturnCarry_IfFrameOddThenDefaultSEC
	bcs @A1B6
	jsr Object_SetXVelocity16bit_InvertCurrent_AndAlso_ObjectFacingLeft
	@A1B6:
	lda ObjectFacingLeft,x
	bne @A1BF
	lda #$F0
	bne @A1C1

	@A1BF:
	lda #$10
	@A1C1:
	 ldy #$10
	jsr Object_GenericCollisionHelper_ParamAY_ReturnCarry_IfFrameOddThenDefaultCLC
	bcs @A1CB
	jmp _func_6642

	@A1CB:
	lda #$01
	sta ObjectAIvar1,x
	lda #$FE
	sta ObjectYSpeed,x
	rts

	@A1D6:
	  lda #$20
	sta TempPtr08_lo
	jsr Object_GravityAccelerateBy_Var08
	lda ObjectFacingLeft,x
	bne @A1E6
	lda #$F0
	bne @A1E8

	@A1E6:
	lda #$10
	@A1E8:
	 ldy #$00
	jsr Object_GenericCollisionHelper_ParamAY_ReturnCarry_IfFrameOddThenDefaultSEC
	bcs @A1F2
	jsr Object_SetXVelocity16bit_InvertCurrent_AndAlso_ObjectFacingLeft
	@A1F2:
	lda ObjectFacingLeft,x
	bne @A1FB
	lda #$EC
	bne @A1FD

	@A1FB:
	lda #$14
	@A1FD:
	 ldy #$10
	jsr Object_GenericCollisionHelper_ParamAY_ReturnCarry_IfFrameOddThenDefaultSEC
	bcs @A20D
	jsr _func_1DE62
	jsr Object_SetYVelocity16bit_ToZero
	jmp _func_1DFAD

	@A20D:
	jmp Object_GeneringXYmovementEngine
;------------------------------------------
ObjectAI_object13_Werewolf:
	lda ObjectCurrentActionType,x
	bne @A21D
	jsr Object_SetCurrentActionType_to_01
	lda #$1E
	jmp SetObjectIndexToAutomaticSpriteDataTable_to_A_and_PaletteIndexTo0_and_RefreshSprite

	@A21D:
	jsr ObjectLoadAutomaticSpriteNumber
	lda ObjectAIvar1,x
	jsr JumpWithParams
ObjectAI_object13_actions:
	.word (ObjectAI_object13_actions_622C) ;A22C (622C) ()
	.word (ObjectAI_object13_actions_6234) ;A234 (6234) ()
	.word (ObjectAI_object13_actions_625C) ;A25C (625C) ()
ObjectAI_object13_actions_622C:
	inc ObjectAIvar1,x
	lda #$60
	jmp _func_1DE6F
;------------------------------------------
ObjectAI_object13_actions_6234:
	lda ObjectScreenXCoord,x
	sec
	sbc ObjectScreenXCoord
	bcs @A240
	jsr Math_NegateA
	@A240:
	cmp #$20
	bcc @A24D
	jsr Object_GeneringXYmovementEngine
	jsr _func_1DE8B
	jmp _func_1DEA1

	@A24D:
	inc ObjectAIvar1,x
	lda #$FD
	ldy #$00
	jsr Object_SetYVelocity16bit_from_AY
	lda #$80
	jmp _func_1DE6F
;------------------------------------------
ObjectAI_object13_actions_625C:
	lda #$20
	sta TempPtr08_lo
	jsr Object_GravityAccelerateBy_Var08
	jsr Object_GeneringXYmovementEngine
	jsr _func_1DE8B
	lda #$00
	ldy #$10
	jsr Object_GenericCollisionHelper_ParamAY_ReturnCarry_IfFrameOddThenDefaultSEC
	bcs @A27D
	lda #$00
	sta ObjectAIvar1,x
	jsr Object_SetYVelocity16bit_ToZero
	jmp _func_1DE62

	@A27D:
	rts
;------------------------------------------
ObjectAI_object04_FishMan:
	lda ObjectCurrentActionType,x
	bne @A286
	jmp Object_SetCurrentActionType_to_01

	@A286:
	lda ObjectAIvar1,x
	jsr JumpWithParams
ObjectAI_object04_actions:
	.word (ObjectAI_object04_actions_6296) ;A296 (6296) ()
	.word (ObjectAI_object04_actions_62CC) ;A2CC (62CC) ()
	.word (ObjectAI_object04_actions_62E0) ;A2E0 (62E0) ()
	.word (ObjectAI_object04_actions_6302) ;A302 (6302) ()
	.word (ObjectAI_object04_actions_634A) ;A34A (634A) ()
ObjectAI_object04_actions_6296:
	inc ObjectAIvar2,x
	lda ObjectAIvar2,x
	cmp #$40
	beq @A2A8
	lda ObjectCurrentActionType,x
	ora #$80
	jmp Object_SetCurrentActionType

	@A2A8:
	lda ObjectCurrentActionType,x
	and #$7F
	sta ObjectCurrentActionType,x
	lda ObjectDialogStatusFlag,x
	bne @A2B8
	jsr Object_CreateThreeWaterSplashes_AroundObjectX
	@A2B8:
	inc ObjectAIvar1,x
	lda #$FC
	ldy #$80
	jsr Object_SetYVelocity16bit_from_AY
	lda #$00
	sta ObjectAIvar2,x
	lda #$06
	jmp SetObjectIndexToAutomaticSpriteDataTable_to_A_and_PaletteIndexTo0_and_RefreshSprite
;------------------------------------------
ObjectAI_object04_actions_62CC:
	jsr _func_6642
	lda #$10
	sta TempPtr08_lo
	jsr Object_GravityAccelerateBy_Var08
	lda ObjectYSpeed,x
	bpl @A2DC
	rts

	@A2DC:
	inc ObjectAIvar1,x
	rts
;------------------------------------------
ObjectAI_object04_actions_62E0:
	jsr _func_6642
	lda #$20
	sta TempPtr08_lo
	jsr Object_GravityAccelerateBy_Var08
	lda #$00
	ldy #$10
	jsr Object_GenericCollisionHelper_ParamAY_ReturnCarry_IfFrameOddThenDefaultSEC
	bcs @A301
	jsr _func_1D3F6
	inc ObjectAIvar1,x
	jsr Object_SetYVelocity16bit_ToZero
	lda #$80
	jsr _func_1DE6F
	@A301:
	rts
;------------------------------------------
ObjectAI_object04_actions_6302:
	jsr ObjectLoadAutomaticSpriteNumber
	inc ObjectAIvar2,x
	lda ObjectAIvar2,x
	cmp #$FF
	beq @A338
	lda ObjectDialogTextIndex,x
	cmp #$60
	bne @A332
	lda #$00
	sta ObjectDialogTextIndex,x
	lda ObjectDialogStatusFlag,x
	bne @A332
	lda #$80
	jsr _func_1DE6F
	lda #$67
	sta ObjectCurrentPose1,x
	jsr Object_ComparePositionToSimonPosition
	lda #$30
	jmp Object_CreateProjectileTowardsSimon

	@A332:
	inc ObjectDialogTextIndex,x
	jmp _A639

	@A338:
	 inc ObjectAIvar1,x
	lda #$00
	sta ObjectAIvar2,x
	jsr Object_SetXandYVelocity16bit_ToZero
	lda #$FF
	ldy #$00
	jmp Object_SetYVelocity16bit_from_AY
;------------------------------------------
ObjectAI_object04_actions_634A:
	jsr _func_6642
	lda #$20
	sta TempPtr08_lo
	jsr Object_GravityAccelerateBy_Var08
	lda ObjectScreenYCoord,x
	cmp #$C8
	bcs @A35C
	rts

	@A35C:
	lda ObjectDialogStatusFlag,x
	bne @A364
	jsr Object_CreateThreeWaterSplashes_AroundObjectX
	@A364:
	jmp Object_Erase_And_IfType3C_Set_42to00
;------------------------------------------
ObjectAI_object15_Mudman:
	lda ObjectCurrentActionType,x
	bne @A36F
	jmp Object_SetCurrentActionType_to_01

	@A36F:
	lda ObjectAIvar1,x
	jsr JumpWithParams
ObjectAI_object15_actions_lo:
	.byte < (ObjectAI_object15_actions_637B)
	.byte $A3
	.byte < (ObjectAI_object15_actions_63A0)
ObjectAI_object15_actions_hi:
	.byte > (ObjectAI_object15_actions_637B)
	.byte < ($1DBE)
	.byte > (ObjectAI_object15_actions_63A0)
ObjectAI_object15_actions_637B:
	lda FrameCounter
	and #$07
	bne @A39D
	ldy ObjectAIvar2,x
	lda _data_63E4_indexed,y
	sta ObjectCurrentPose1,x
	inc ObjectAIvar2,x
	lda ObjectAIvar2,x
	cmp #$04
	bne @A39D
	dec ObjectAIvar2,x
	inc ObjectAIvar1,x
	jmp Object_SetCurrentActionType_to_01

	@A39D:
	jmp Object_SetCurrentActionType_to_80
;------------------------------------------
ObjectAI_object15_actions_63A0:
	jsr Object_SetFacing_FaceTowardsSimon
	lda #$30
	sta $05
	lda ObjectDialogStatusFlag,x
	bne @A3BA
	lda ObjectFacingLeft,x
	bne @A3B5
	lda #$20
	bne @A3B7

	@A3B5:
	lda #$00
	@A3B7:
	 jsr Object_CreateProjectileTowardsPredefinedAngle
	@A3BA:
	  inc ObjectAIvar1,x
	rts
;------------------------------------------
UnusedObjectAI_63BE_DealsWithMudmanSprites:
	lda ObjectAIvar3,x
	cmp #$30
	bne @A3E0
	lda FrameCounter
	and #$07
	bne @A3DF
	ldy ObjectAIvar2,x
	lda _data_63E4_indexed,y
	sta ObjectCurrentPose1,x
	dec ObjectAIvar2,x
	lda ObjectAIvar2,x
	bpl @A3DF
	jsr _func_1DFA3
	@A3DF:
	rts

	@A3E0:
	 inc ObjectAIvar3,x
	rts
;------------------------------------------
_data_63E4_indexed:
	.byte $00,$59,$5A,$5B
ObjectAI_object06_TwoHeadedCreature:
	lda ObjectCurrentActionType,x
	bne @A3FA
	jsr Object_SetCurrentActionType_to_01
	lda #$F0
	jsr _func_1DE6F
	lda #$1A
	jmp SetObjectIndexToAutomaticSpriteDataTable_to_A_and_PaletteIndexTo0_and_RefreshSprite

	@A3FA:
	jsr ObjectLoadAutomaticSpriteNumber
	lda ObjectDialogTextIndex,x
	cmp #$40
	bne @A425
	lda #$00
	sta ObjectDialogTextIndex,x
	lda ObjectDialogStatusFlag,x
	bne @A425
	lda #$F0
	jsr _func_1DE6F
	lda #$30
	sta $05
	lda ObjectFacingLeft,x
	bne @A420
	lda #$20
	bne @A422

	@A420:
	lda #$00
	@A422:
	 jmp Object_CreateProjectileTowardsPredefinedAngle

	@A425:
	  inc ObjectDialogTextIndex,x
	jsr _func_1DE8B
	jsr _func_1DEA1
	jmp Object_GeneringXYmovementEngine
;------------------------------------------
ObjectAI_object3C_Ferryman_Part1:
	lda ObjectCurrentActionType,x
	bne @A450
	lda #$40
	sta ObjectCurrentActionType,x
	lda #$7F
	sta ObjectCurrentPose1,x
	lda ObjectDialogTextIndex,x
	sta ObjectFacingLeft,x
	lda ObjectScreenYCoord,x
	sec
	sbc #$06
	sta ObjectScreenYCoord,x
	rts

	@A450:
	lda ObjectAIvar1,x
	jsr JumpWithParams
ObjectAI_object3C_actions:
	.word (ObjectAI_object3C_actions_645C) ;A45C (645C) ()
	.word ObjectAI_object3C_actions_64AB
	.word (ObjectAI_object3C_actions_64AC) ;A4AC (64AC) ()
ObjectAI_object3C_actions_645C:
	stx Unknown10_CollisionAndScrollingTemp
	jsr Object_FindUnusedSlot
	ldy Unknown10_CollisionAndScrollingTemp
	lda #$3D
	sta ObjectType,x
	lda ObjectScreenYCoord,y
	clc
	adc #$10
	sta ObjectScreenYCoord,x
	lda ObjectFacingLeft,y
	sta ObjectFacingLeft,x
	bne @A487
	lda #$14
	clc
	adc ObjectScreenXCoord,y
	sta ObjectScreenXCoord,x
	bcc @A497
	jmp @A492

	@A487:
	lda #$EC
	clc
	adc ObjectScreenXCoord,y
	sta ObjectScreenXCoord,x
	bcs @A497
	@A492:
	 lda #$01
	sta ObjectDialogStatusFlag,x
	@A497:
	  lda Unknown10_CollisionAndScrollingTemp
	sta ObjectAIvar2,x
	tax
	inc ObjectAIvar1,x
	lda #$01
	sta Unknown42
	lda #$01
	ldy #$00
	jmp Object_SetXVelocity16bit_from_AY_invert_if_ObjectFacingLeft_set
;------------------------------------------
ObjectAI_object3C_actions_64AB:
	rts
;------------------------------------------
ObjectAI_object3C_actions_64AC:
	lda ObjectFacingLeft,x
	bne @A4B5
	lda #$F0
	bne @A4B7

	@A4B5:
	lda #$10
	@A4B7:
	 ldy #$14
	jsr Object_GenericCollisionHelper_ParamAY_ReturnCarry_IfFrameOddThenDefaultSEC
	bcs @A4C4
	jsr Object_SetXVelocity16bit_InvertCurrent
	jmp @A4D9

	@A4C4:
	lda ObjectFacingLeft,x
	bne @A4CD
	lda #$18
	bne @A4CF

	@A4CD:
	lda #$E8
	@A4CF:
	 ldy #$14
	jsr Object_GenericCollisionHelper_ParamAY_ReturnCarry_IfFrameOddThenDefaultSEC
	bcs @A4D9
	jsr Object_SetXVelocity16bit_InvertCurrent
	@A4D9:
	  jmp Object_GeneringXYmovementEngine
;------------------------------------------
ObjectAI_object3D_Ferryman_Part2:
	lda ObjectAIvar4,x
	beq @A4E4
	dec ObjectAIvar4,x
	@A4E4:
	lda ObjectCurrentActionType,x
	bne @A4EF
	lda #$80
	tay
	jmp Object_SetCurrentActionType_And_Y_as_Pose1

	@A4EF:
	ldy ObjectAIvar1,x
	beq @A4F8
	dey
	beq @A4F9
	rts

	@A4F8:
	rts

	@A4F9:
	 ldy ObjectAIvar2,x
	lda ObjectType,y
	beq @A510
	lda ObjectXSpeed,y
	sta ObjectXSpeed,x
	lda ObjectXSpeedFrac,y
	sta ObjectXSpeedFrac,x
	jmp Object_GeneringXYmovementEngine

	@A510:
	jmp Object_Erase_And_IfType3C_Set_42to00
;------------------------------------------
ObjectAI_object02_Leech:
	lda ObjectCurrentActionType,x
	bne @A520
	jsr Object_SetCurrentActionType_to_80
	lda #$1C
	jmp SetObjectIndexToAutomaticSpriteDataTable_to_A_and_PaletteIndexTo0_and_RefreshSprite

	@A520:
	jsr ObjectLoadAutomaticSpriteNumber
	lda ObjectAIvar1,x
	bne @A54E
	lda ObjectScreenXCoord,x
	sec
	sbc ObjectScreenXCoord
	bcs @A534
	jsr Math_NegateA
	@A534:
	cmp #$50
	bcc @A539
	rts

	@A539:
	lda #$FA
	sta ObjectYSpeed,x
	jsr Object_SetCurrentActionType_to_02
	inc ObjectAIvar1,x
	lda #$40
	jsr _func_1DE6F
	lda #$1D
	jmp AnyBankPlayTracks

	@A54E:
	 lda #$40
	sta TempPtr08_lo
	jsr Object_GravityAccelerateBy_Var08
	jmp Object_GeneringXYmovementEngine
;------------------------------------------
UnusedObjectAI_6558_SkeletonThatBehavesLikeFlamingMan:
	stx Unknown10_CollisionAndScrollingTemp
	lda ObjectCurrentActionType,x
	bne @A567
	jsr Object_SetCurrentActionType_to_01
	lda #$05
	jmp SetObjectIndexToAutomaticSpriteDataTable_to_A_and_PaletteIndexTo0_and_RefreshSprite

	@A567:
	jsr ObjectLoadAutomaticSpriteNumber
	lda ObjectAIvar1,x
	jsr JumpWithParams
UnusedObjectAI_6558_actions:
	.word (UnusedObjectAI_6558_actions_6578) ;A578 (6578) ()
	.word (UnusedObjectAI_6558_actions_6586) ;A586 (6586) ()
	.word (UnusedObjectAI_6558_actions_6594) ;A594 (6594) ()
	.word (UnusedObjectAI_6558_actions_65BC) ;A5BC (65BC) ()
UnusedObjectAI_6558_actions_6578:
	lda #$80
	jsr _func_1DE6F
	inc ObjectAIvar1,x
	lda #$50
	sta ObjectAIvar2,x
	rts
;------------------------------------------
UnusedObjectAI_6558_actions_6586:
	dec ObjectAIvar2,x
	bne @A591
	inc ObjectAIvar1,x
	jmp Object_SetXandYVelocity16bit_ToZero

	@A591:
	jmp _A639
;------------------------------------------
UnusedObjectAI_6558_actions_6594:
	jsr Object_SetFacing_FaceTowardsSimon
	lda ObjectDialogStatusFlag,x
	bne _loc_65C1
	jsr Object_FindUnusedSlot
	bcs _loc_65C1
	ldy Unknown10_CollisionAndScrollingTemp
	lda #$32
	jsr _func_1DE7B
	lda ObjectScreenYCoord,y
	sec
	sbc #$02
	sta ObjectScreenYCoord,x
	ldx Unknown10_CollisionAndScrollingTemp
	inc ObjectAIvar1,x
	lda #$30
	sta ObjectAIvar2,x
	rts
;------------------------------------------
UnusedObjectAI_6558_actions_65BC:
	dec ObjectAIvar2,x
	bne _A5C6
_loc_65C1:
	ldx Unknown10_CollisionAndScrollingTemp
	jsr _func_1DFA8
	_A5C6:
	rts
;------------------------------------------
UnusedObjectAI_65C7_StationaryFireball:
	lda ObjectCurrentActionType,x
	bne @A5D6
	lda #$02
	ldy #$29
	jsr Object_SetCurrentActionType_And_Y_as_Pose1
	jmp Object_SetFacing_FaceTowardsSimon

	@A5D6:
	jsr Object_GeneringXYmovementEngine
	lda ObjectAIvar1,x
	jsr JumpWithParams
UnusedObjectAI_65C7_actions:
	.word (UnusedObjectAI_65C7_actions_65E5) ;A5E5 (65E5) ()
	.word (UnusedObjectAI_65C7_actions_65F4) ;A5F4 (65F4) ()
	.word (UnusedObjectAI_65C7_actions_660E) ;A60E (660E) ()
UnusedObjectAI_65C7_actions_65E5:
	inc ObjectAIvar1,x
	lda #$FD
	ldy #$00
	jsr Object_SetYVelocity16bit_from_AY
	lda #$E0
	jmp _func_1DE6F
;------------------------------------------
UnusedObjectAI_65C7_actions_65F4:
	lda #$20
	sta TempPtr08_lo
	jsr Object_GravityAccelerateBy_Var08
	lda #$00
	ldy #$08
	jsr Object_GenericCollisionHelper_ParamAY_ReturnCarry_IfFrameOddThenDefaultSEC
	bcs @A60D
	inc ObjectAIvar1,x
	jsr _func_1D3F6
	jmp Object_SetYVelocity16bit_ToZero

	@A60D:
	rts
;------------------------------------------
UnusedObjectAI_65C7_actions_660E:
	lda #$00
	ldy #$00
	jsr Object_GenericCollisionHelper_ParamAY_ReturnCarry_IfFrameOddThenDefaultSEC
	bcc @A636
	lda ObjectFacingLeft,x
	bne @A620
	lda #$FA
	bne @A622

	@A620:
	lda #$06
	@A622:
	 ldy #$08
	jsr Object_GenericCollisionHelper_ParamAY_ReturnCarry_IfFrameOddThenDefaultCLC
	bcs @A62A
	rts

	@A62A:
	lda #$01
	sta ObjectAIvar1,x
	lda #$FF
	ldy #$80
	jmp Object_SetYVelocity16bit_from_AY

	@A636:
	  jmp Object_Erase_And_IfType3C_Set_42to00

	_A639:
	   jsr _func_1DE8B
	jsr _func_1DEA1
	jmp Object_GeneringXYmovementEngine
;------------------------------------------
_func_6642:
	jsr ObjectLoadAutomaticSpriteNumber
	jmp Object_GeneringXYmovementEngine
;------------------------------------------
LevelData_Actors_2_ForestsAndBridges_2:
	.word (LevelData_Actors_2_ForestsAndBridges_2_665A) ;A65A (665A) ([8:2][A:3])
LevelData_Actors_2_ForestsAndBridges_3_4rooms:
	.word (LevelData_Actors_2_ForestsAndBridges_3_4rooms_666F) ;A66F (666F) ([8:2][A:3])
	.word (LevelData_Actors_2_ForestsAndBridges_3_4rooms_66A0) ;A6A0 (66A0) ([8:2][A:3])
	.word (LevelData_Actors_2_ForestsAndBridges_3_4rooms_66C1) ;A6C1 (66C1) ([8:2][A:3])
	.word (LevelData_Actors_2_ForestsAndBridges_3_4rooms_66DE) ;A6DE (66DE) ([8:2][A:3])
LevelData_Actors_2_ForestsAndBridges_4_2rooms:
	.word (LevelData_Actors_2_ForestsAndBridges_4_2rooms_66F3) ;A6F3 (66F3) ([8:2][A:3])
	.word (LevelData_Actors_2_ForestsAndBridges_4_2rooms_6724) ;A724 (6724) ([8:2][A:3])
LevelData_Actors_2_ForestsAndBridges_5_2rooms:
	.word (LevelData_Actors_2_ForestsAndBridges_5_2rooms_6739) ;A739 (6739) ([8:2][A:3])
	.word (LevelData_Actors_2_ForestsAndBridges_5_2rooms_6766) ;A766 (6766) ([8:2][A:3])
LevelData_Actors_2_ForestsAndBridges_2_665A:
	.byte $08,$06,$0E,$02,$0C,$0C,$03,$02,$14,$0A,$03,$02,$18,$06,$0E,$02
	.byte $1C,$0B,$03,$02,$FF
LevelData_Actors_2_ForestsAndBridges_3_4rooms_666F:
	.byte $04,$1B,$43,$00,$08,$0C,$03,$02,$08,$12,$08,$02,$08,$18,$03,$02
	.byte $0C,$06,$08,$02,$0C,$18,$03,$02,$13,$1B,$43,$00,$14,$0C,$08,$02
	.byte $14,$1A,$03,$02,$18,$06,$08,$02,$18,$16,$03,$02,$1C,$0C,$08,$02
	.byte $FF
LevelData_Actors_2_ForestsAndBridges_3_4rooms_66A0:
	.byte $01,$0C,$26,$76,$04,$04,$08,$02,$04,$0C,$09,$02,$0C,$06,$08,$02
	.byte $0C,$0C,$09,$02,$14,$06,$08,$02,$14,$0C,$09,$02,$1C,$0C,$09,$02
	.byte $FF
LevelData_Actors_2_ForestsAndBridges_3_4rooms_66C1:
	.byte $04,$04,$0E,$02,$05,$0D,$27,$0D,$08,$08,$03,$02,$0C,$06,$0E,$02
	.byte $14,$06,$0E,$02,$18,$0A,$03,$02,$1C,$08,$03,$02,$FF
LevelData_Actors_2_ForestsAndBridges_3_4rooms_66DE:
	.byte $04,$08,$03,$02,$08,$0A,$03,$02,$0C,$0C,$03,$02,$14,$0C,$03,$02
	.byte $18,$0A,$03,$02,$FF
LevelData_Actors_2_ForestsAndBridges_4_2rooms_66F3:
	.byte $04,$0A,$03,$02,$08,$0A,$03,$02,$0C,$0B,$03,$02,$14,$08,$03,$02
	.byte $16,$0C,$09,$02,$18,$06,$03,$02,$1C,$0D,$43,$02,$24,$06,$03,$02
	.byte $24,$0D,$43,$00,$28,$08,$03,$02,$2C,$08,$03,$02,$2D,$0C,$09,$02
	.byte $FF
LevelData_Actors_2_ForestsAndBridges_4_2rooms_6724:
	.byte $04,$06,$0E,$02,$08,$0C,$03,$02,$0C,$06,$0E,$02,$14,$06,$0E,$02
	.byte $18,$0A,$03,$02,$FF
LevelData_Actors_2_ForestsAndBridges_5_2rooms_6739:
	.byte $08,$0A,$03,$02,$0C,$08,$03,$02,$14,$0C,$08,$02,$18,$06,$03,$02
	.byte $1C,$06,$03,$02,$1D,$0C,$08,$02,$24,$06,$03,$02,$29,$0D,$22,$45
	.byte $2C,$04,$03,$02,$37,$0D,$22,$46,$38,$06,$03,$02,$FF
LevelData_Actors_2_ForestsAndBridges_5_2rooms_6766:
	.byte $FF
; -----------------------------------------------------------------------------

	.export InhibitScrollingIf_Scene_02_05_01_YubaLake
InhibitScrollingIf_Scene_02_05_01_YubaLake:
	ldy #$00
	ldx #$00
	lda CurrentLevelSceneNumber
	cmp #$05
	bne @A77F
	lda CurrentLevelSubRoomNumber
	and #$7F
	cmp #$01
	bne @A77F
	iny
	lda Current_WhatUnknown57
	bne @A77F
	inx
	@A77F:
	sty Unknown194_PossiblyScrollingRelated
	stx ScrollingIsLocked
	rts
;------------------------------------------
	.export CheckKneelingWithBlueCrystal_EnableScroll_YubaLake
CheckKneelingWithBlueCrystal_EnableScroll_YubaLake:
	jsr _func_67B8
	lda Unknown195_PossiblyScrollingRelated
	beq @A7B7
	lda InventoryBodyPartSelection
	cmp #$06
	bne @A7B7
	lda InventoryBodyParts1
	and #$60
	cmp #$40
	bcc @A7B7
	lda ObjectCurrentActionType
	cmp #$03
	bne @A7B7
	dec KneelingCounter
	bne @A7B7
	lda #$01
	sta CurrentYScrollingPositionPixels_Mod240
	lda #$00
	sta Unknown195_PossiblyScrollingRelated
	sta ScrollingIsLocked
	lda #$29
	jsr AnyBankPlayTracks
	@A7B7:
	rts
;------------------------------------------
_func_67B8:
	ldy #$00
	lda Unknown194_PossiblyScrollingRelated
	beq @A7C6
	lda CurrentYScrollingPositionPixels_Mod240
	ora Current_WhatUnknown57
	bne @A7C6
	iny
	@A7C6:
	sty Unknown195_PossiblyScrollingRelated
	rts
;------------------------------------------
ObjectAI_object08_Eyeball:
	lda ObjectCurrentActionType,x
	bne @A7D7
	jsr Object_SetCurrentActionType_to_01
	lda #$39
	jmp SetObjectIndexToAutomaticSpriteDataTable_to_A_and_PaletteIndexTo0_and_RefreshSprite

	@A7D7:
	jsr ObjectLoadAutomaticSpriteNumber
	lda #$80
	jsr _func_1DE6F
	jsr _func_4D12
	bcc @A7E8
	lda #$FF
	bne @A7EA

	@A7E8:
	lda #$00
	@A7EA:
	 ldy #$80
	jsr Object_SetYVelocity16bit_from_AY
	jmp Object_GeneringXYmovementEngine
;------------------------------------------
ObjectAI_object09:
	lda ObjectCurrentActionType,x
	bne @A816
	jsr Object_SetCurrentActionType_to_01
	lda #$20
	sta ObjectAIvar1,x
	lda #$FE
	ldy #$80
	jsr Object_SetYVelocity16bit_from_AY
	lda #$C0
	jsr _func_1DE6F
	lda ObjectScreenYCoord
	sta ObjectScreenYCoord,x
	lda #$3A
	jmp SetObjectIndexToAutomaticSpriteDataTable_to_A_and_PaletteIndexTo0_and_RefreshSprite

	@A816:
	jsr ObjectLoadAutomaticSpriteNumber
	dec ObjectAIvar1,x
	bne @A826
	lda #$20
	sta ObjectAIvar1,x
	jmp Object_SetYVelocity16bit_InvertCurrent

	@A826:
	jmp Object_GeneringXYmovementEngine
;------------------------------------------
LevelData_Actors_4_Wastelands:
	.word (LevelData_Actors_4_Wastelands_0_DiamondGiverPlace) ;A831 (6831) ([8:2][A:3])
	.word (LevelData_Actors_4_Wastelands_1_SolidCliff) ;A835 (6835) ([8:2][A:3])
	.word (LevelData_Actors_4_Wastelands_2_WickedDitch) ;A839 (6839) ([8:2][A:3])
	.word (LevelData_Actors_4_Wastelands_3_VladGraveyard) ;A83B (683B) ([8:2][A:3])
LevelData_Actors_4_Wastelands_0_DiamondGiverPlace:
	.word (LevelData_Actors_4_Wastelands_0_DiamondGiverPlace_683F) ;A83F (683F) ([8:2][A:3])
	.word (LevelData_Actors_4_Wastelands_0_DiamondGiverPlace_6864) ;A864 (6864) ([8:2][A:3])
LevelData_Actors_4_Wastelands_1_SolidCliff:
	.word (LevelData_Actors_4_Wastelands_3_VladGraveyard_68A9) ;A8A9 (68A9) ([8:2][A:3])
	.word (LevelData_Actors_4_Wastelands_1_SolidCliff_6885) ;A885 (6885) ([8:2][A:3])
LevelData_Actors_4_Wastelands_2_WickedDitch:
	.word (LevelData_Actors_4_Wastelands_2_WickedDitch_68AA) ;A8AA (68AA) ([8:2][A:3])
LevelData_Actors_4_Wastelands_3_VladGraveyard:
	.word (LevelData_Actors_4_Wastelands_3_VladGraveyard_68D3) ;A8D3 (68D3) ([8:2][A:3])
	.word (LevelData_Actors_4_Wastelands_3_VladGraveyard_68A9) ;A8A9 (68A9) ([8:2][A:3])
LevelData_Actors_4_Wastelands_0_DiamondGiverPlace_683F:
	.byte $04,$0A,$AF,$00,$14,$0C,$0A,$04,$18,$0A,$0A,$04,$1C,$0A,$3F,$04
	.byte $24,$0A,$39,$04,$2C,$0A,$39,$04,$34,$0B,$1B,$04,$38,$0C,$3A,$04
	.byte $3C,$0B,$1B,$04,$FF
LevelData_Actors_4_Wastelands_0_DiamondGiverPlace_6864:
	.byte $13,$0D,$34,$20,$17,$0D,$34,$20,$1B,$0D,$34,$20,$1F,$0D,$34,$20
	.byte $21,$0D,$34,$20,$25,$0D,$34,$20,$29,$0D,$34,$20,$2D,$0D,$34,$20
	.byte $FF
LevelData_Actors_4_Wastelands_1_SolidCliff_6885:
	.byte $06,$0B,$27,$14,$14,$0D,$34,$20,$18,$0D,$34,$20,$1C,$0D,$34,$20
	.byte $24,$0C,$3A,$08,$28,$0B,$3A,$08,$2C,$0C,$3A,$08,$34,$0A,$39,$08
	.byte $38,$0A,$39,$08
LevelData_Actors_4_Wastelands_3_VladGraveyard_68A9:
	.byte $FF
LevelData_Actors_4_Wastelands_2_WickedDitch_68AA:
	.byte $08,$0C,$3A,$08,$0C,$0B,$3A,$08,$14,$0C,$3A,$08,$18,$0A,$3A,$08
	.byte $1C,$0A,$3F,$08,$24,$0C,$3B,$08,$28,$0C,$3B,$08,$2C,$0C,$3B,$08
	.byte $34,$0C,$0A,$08,$38,$0B,$0A,$08,$FF
LevelData_Actors_4_Wastelands_3_VladGraveyard_68D3:
	.byte $08,$0C,$3A,$0F,$0C,$0C,$3A,$0F,$14,$0C,$1B,$0F,$18,$0C,$3A,$0F
	.byte $1C,$0C,$1B,$0F,$24,$0A,$39,$0F,$28,$0A,$39,$0F,$2C,$0A,$39,$0F
	.byte $34,$0A,$39,$0F,$FF

; -----------------------------------------------------------------------------
	.export WestBridge_TestInventoryContents_AllBodyParts_BlueCrystal_AndCross
WestBridge_TestInventoryContents_AllBodyParts_BlueCrystal_AndCross:
	lda CurrentLevelSceneNumber
	cmp #$03
	bne @A913
	lda InventoryBodyParts1
	and #$7F
	cmp #$7F
	bne @A911
	lda InventoryMiscItems1
	and #$02
	beq @A911
	pla
	pla
	jmp _loc_1D672

	@A911:
	pla
	pla
	@A913:
	 rts
;------------------------------------------
	.export CheckKneelingWithRedCrystal
CheckKneelingWithRedCrystal:
	lda ObjectCurrentActionType
	cmp #$0B
	beq @A950
	lda CurrentLevelSceneNumber
	cmp #$01
	bne @A94B
	lda CurrentLevelSubRoomNumber
	and #$7F
	cmp #$01
	bne @A94B
	lda CurrentXScrollingPositionPixels
	ora CurrentXScrollingPositionScreens
	bne @A94B
	lda ObjectScreenXCoord
	cmp #$50
	bcs @A94B
	lda InventoryBodyPartSelection
	cmp #$06
	bne @A94B
	lda InventoryBodyParts1
	and #$60
	cmp #$60
	bcc @A94B
	lda ObjectCurrentActionType
	cmp #$03
	beq @A951
	@A94B:
	lda #$00
	sta KneelingCounter
	@A950:
	   rts

	@A951:
	  dec KneelingCounter
	bne @A950
	lda #$0B
	sta ObjectCurrentActionType
	lda #$00
	sta $03D7
	lda #$1C
	sta $03C5
	lda #$80
	sta $03E9
	lda #$F0
	sta $0359
	lda #$80
	sta $0335
	lda #$9C
	sta $0311
	lda #$00
	sta $0323
	sta $036B
	sta $0347
	lda #$00
	sta $0455
	sta $0467
	lda #$00
	sta $04D3
	jsr AnyBankTerminateSound
	lda #$28
	jmp AnyBankPlayTracks
;------------------------------------------
_loc_6999:
	lda ObjectScreenXCoord
	sec
	sbc ObjectScreenXCoord,x
	bcc @A9A5
	jsr Math_NegateA
	@A9A5:
	cmp #$10
	bcs @A9CB
	lda ObjectScreenYCoord
	sec
	sbc ObjectScreenYCoord,x
	bcc @A9B5
	jsr Math_NegateA
	@A9B5:
	cmp #$10
	bcs @A9CB
	lda #$00
	sta ObjectCurrentPose1
	lda #$80
	sta ObjectPoseChangeCounter
	inc ObjectAIvar1,x
	lda #$2D
	jmp AnyBankPlayTracks

	@A9CB:
	 lda #$C0
	jsr _func_1DE6F
	jsr _func_69E6
	jsr _func_4D12
	bcc @A9DC
	lda #$FF
	bne @A9DE

	@A9DC:
	lda #$00
	@A9DE:
	 ldy #$C0
	jsr Object_SetYVelocity16bit_from_AY
	jmp Object_GeneringXYmovementEngine
;------------------------------------------
_func_69E6:
	ldy #$00
	lda FrameCounter
	and #$02
	beq @A9EF
	iny
	@A9EF:
	tya
	sta ObjectFacingLeft,x
	rts
;------------------------------------------
ObjectAI_object1C:
	jsr _func_69E6
	ldy ObjectAIvar1,x
	beq _loc_6999
	lda ObjectAIvar2,x
	ldy #$04
	jsr Object_SetVelocityAndAngle_Aangle_Yspeed
	lda ObjectXSpeed,x
	sec
	sbc #$01
	sta ObjectXSpeed,x
	lda ObjectXSpeedFrac,x
	sta $6C
	lda ObjectXSpeed,x
	sta $6D
	jsr Object_GeneringXYmovementEngine
	lda ObjectScreenXCoord,x
	sta ObjectScreenXCoord
	lda ObjectScreenYCoord,x
	sta ObjectScreenYCoord
	lda ObjectAIvar1,x
	clc
	adc #$C0
	sta ObjectAIvar1,x
	lda ObjectAIvar2,x
	adc #$00
	and #$3F
	sta ObjectAIvar2,x
	rts
;------------------------------------------
NPCtalkAction_GiftGiver_Diamond:
	lda InventoryMiscItems2
	ora #$10
	sta InventoryMiscItems2
	lda #$12
	sta DialogTextID
	rts
;------------------------------------------
ObjectAI_object0A_MedusaHead:
	lda ObjectCurrentActionType,x
	bne @AA52
	jsr Object_SetCurrentActionType_to_01
	lda #$18
	jmp SetObjectIndexToAutomaticSpriteDataTable_to_A_and_PaletteIndexTo0_and_RefreshSprite

	@AA52:
	jsr ObjectLoadAutomaticSpriteNumber
	lda #$C0
	jsr _func_1DE6F
	jsr _func_4D12
	bcc @AA65
	lda #$FF
	ldy #$40
	bne @AA69

	@AA65:
	lda #$00
	ldy #$C0
	@AA69:
	 jsr Object_SetYVelocity16bit_from_AY
	jmp Object_GeneringXYmovementEngine
;------------------------------------------
ObjectAI_object39_FlamingFlyingPirateSkeleton:
	lda ObjectCurrentActionType,x
	bne @AA8D
	jsr Object_SetCurrentActionType_to_01
	lda #$3F
	jsr SetObjectIndexToAutomaticSpriteDataTable_to_A_and_PaletteIndexTo0_and_RefreshSprite
	lda #$20
	sta ObjectAIvar2,x
	lda #$00
	ldy #$F0
	jsr Object_SetYVelocity16bit_from_AY
	lda #$80
	jmp _func_1DE6F

	@AA8D:
	jsr ObjectLoadAutomaticSpriteNumber
	dec ObjectAIvar2,x
	bne @AA9D
	lda #$20
	sta ObjectAIvar2,x
	jsr Object_SetYVelocity16bit_InvertCurrent
	@AA9D:
	jmp Object_GeneringXYmovementEngine
;------------------------------------------
ObjectAI_object3F_Plant:
	lda ObjectCurrentActionType,x
	bne @AAB0
	lda #$01
	sta ObjectCurrentActionType,x
	lda #$BE
	sta ObjectCurrentPose1,x
	rts

	@AAB0:
	jsr Object_SetFacing_FaceTowardsSimon
	lda ObjectAIvar1,x
	jsr JumpWithParams
ObjectAI_object3F_actions:
	.word (ObjectAI_object3F_actions_6ABF) ;AABF (6ABF) ()
	.word (ObjectAI_object3F_actions_6ADE) ;AADE (6ADE) ()
	.word (ObjectAI_object3F_actions_6AF9) ;AAF9 (6AF9) ()
ObjectAI_object3F_actions_6ABF:
	lda ObjectScreenXCoord
	sec
	sbc ObjectScreenXCoord,x
	bcs @AACB
	jsr Math_NegateA
	@AACB:
	cmp #$40
	bcs @AADD
	lda ObjectDialogStatusFlag,x
	bne @AADD
	lda #$BF
	sta ObjectCurrentPose1,x
	inc ObjectAIvar1,x
	rts

	@AADD:
	rts
;------------------------------------------
ObjectAI_object3F_actions_6ADE:
	lda #$30
	sta $05
	lda ObjectFacingLeft,x
	bne @AAEB
	lda #$20
	bne @AAED

	@AAEB:
	lda #$00
	@AAED:
	 jsr Object_CreateProjectileTowardsPredefinedAngle
	inc ObjectAIvar1,x
	lda #$40
	sta ObjectAIvar2,x
	rts
;------------------------------------------
ObjectAI_object3F_actions_6AF9:
	dec ObjectAIvar2,x
	bne @AB0B
	lda #$00
	sta ObjectAIvar1,x
	sta ObjectAIvar2,x
	lda #$BE
	sta ObjectCurrentPose1,x
	@AB0B:
	rts
;------------------------------------------
ObjectAI_object1B_Raven:
	lda ObjectCurrentActionType,x
	bne @AB19
	jsr Object_SetCurrentActionType_to_01
	lda #$24
	jsr SetObjectIndexToAutomaticSpriteDataTable_to_A_and_PaletteIndexTo0_and_RefreshSprite
	@AB19:
	lda ObjectAIvar1,x
	jsr JumpWithParams
ObjectAI_object1B_actions:
	.word (ObjectAI_object1B_actions_6B2B) ;AB2B (6B2B) ()
	.word (ObjectAI_object1B_actions_6B45) ;AB45 (6B45) ()
	.word (ObjectAI_object1B_actions_6B7F) ;AB7F (6B7F) ()
	.word (ObjectAI_object1B_actions_6BB4) ;ABB4 (6BB4) ()
	.word (ObjectAI_object1B_actions_6BF1) ;ABF1 (6BF1) ()
	.word (ObjectAI_object1B_actions_6C18) ;AC18 (6C18) ()
ObjectAI_object1B_actions_6B2B:
	lda #$30
	sta ObjectScreenYCoord,x
	inc ObjectAIvar1,x
	lda #$40
	jsr _func_1DE6F
	lda #$FF
	ldy #$80
	jsr Object_SetYVelocity16bit_from_AY
	lda #$20
	sta ObjectAIvar2,x
	rts
;------------------------------------------
ObjectAI_object1B_actions_6B45:
	dec ObjectAIvar2,x
	bne @AB53
	jsr Object_SetYVelocity16bit_InvertCurrent
	lda #$20
	sta ObjectAIvar2,x
	rts

	@AB53:
	lda ObjectAIvar2,x
	and #$03
	beq @AB5D
	jsr ObjectLoadAutomaticSpriteNumber
	@AB5D:
	jsr Object_GeneringXYmovementEngine
	lda ObjectScreenXCoord,x
	sec
	sbc ObjectScreenXCoord
	bcs @AB6C
	jsr Math_NegateA
	@AB6C:
	cmp #$40
	bcc _loc_6B71
	rts
;------------------------------------------
_loc_6B71:
	lda #$02
	sta ObjectAIvar1,x
	jsr Object_SetXandYVelocity16bit_ToZero
	lda #$00
	sta ObjectAIvar2,x
	rts
;------------------------------------------
ObjectAI_object1B_actions_6B7F:
	inc ObjectAIvar2,x
	lda ObjectAIvar2,x
	cmp #$50
	beq @AB96
	lda ObjectAIvar2,x
	and #$03
	beq @AB93
	jsr ObjectLoadAutomaticSpriteNumber
	@AB93:
	jmp Object_SetFacing_FaceTowardsSimon

	@AB96:
	 lda ObjectAIvar3,x
	bne _loc_6BD6
	inc ObjectAIvar1,x
	jsr Object_SetFacing_FaceTowardsSimon
	lda #$02
	ldy #$00
	jsr Object_SetXVelocity16bit_from_AY_invert_if_ObjectFacingLeft_set
	lda #$05
	ldy #$80
	jsr Object_SetYVelocity16bit_from_AY
	lda #$91
	sta ObjectCurrentPose1,x
ObjectAI_object1B_actions_6BB4:
	lda #$20
	sta TempPtr08_lo
	jsr Object_GravityDecelerateBy_Var08
	lda ObjectYSpeed,x
	beq @ABCE
	lda ObjectScreenYCoord
	sec
	sbc #$30
	cmp ObjectScreenYCoord,x
	bcc @ABCE
	jmp Object_GeneringXYmovementEngine

	@ABCE:
	lda #$01
	sta ObjectAIvar3,x
	jmp _loc_6B71
;------------------------------------------
_loc_6BD6:
	lda #$04
	sta ObjectAIvar1,x
	jsr Object_SetFacing_FaceTowardsSimon
	lda #$03
	ldy #$00
	jsr Object_SetXVelocity16bit_from_AY_invert_if_ObjectFacingLeft_set
	lda #$03
	ldy #$00
	jsr Object_SetYVelocity16bit_from_AY
	lda #$91
	sta ObjectCurrentPose1,x
ObjectAI_object1B_actions_6BF1:
	lda #$15
	sta TempPtr08_lo
	jsr Object_GravityDecelerateBy_Var08
	lda ObjectYSpeed,x
	beq @AC08
	lda ObjectScreenYCoord
	cmp ObjectScreenYCoord,x
	bcc @AC08
	jmp Object_GeneringXYmovementEngine

	@AC08:
	jsr Object_SetFacing_FaceTowardsSimon
	lda #$03
	ldy #$00
	jsr Object_SetXVelocity16bit_from_AY_invert_if_ObjectFacingLeft_set
	jsr Object_SetYVelocity16bit_ToZero
	inc ObjectAIvar1,x
ObjectAI_object1B_actions_6C18:
	jsr ObjectLoadAutomaticSpriteNumber
	jmp Object_GeneringXYmovementEngine
;------------------------------------------
ObjectAI_object3B_Gargoyle:
	lda ObjectCurrentActionType,x
	bne @AC29
	lda #$01
	sta ObjectCurrentActionType,x
	rts

	@AC29:
	jsr ObjectLoadAutomaticSpriteNumber
	lda ObjectAIvar1,x
	jsr JumpWithParams
ObjectAI_object3B_actions:
	.word (ObjectAI_object3B_actions_6C3C) ;AC3C (6C3C) ()
	.word (ObjectAI_object3B_actions_6C4E) ;AC4E (6C4E) ()
	.word (ObjectAI_object3B_actions_6C72) ;AC72 (6C72) ()
	.word (ObjectAI_object3B_actions_6CB3) ;ACB3 (6CB3) ()
	.word (ObjectAI_object3B_actions_6D04) ;AD04 (6D04) ()
ObjectAI_object3B_actions_6C3C:
	inc ObjectAIvar1,x
	lda #$27
	jsr SetObjectIndexToAutomaticSpriteDataTable_to_A_and_PaletteIndexTo0
	lda #$30
	sta ObjectScreenYCoord,x
	lda #$80
	jmp _func_1DE6F
;------------------------------------------
ObjectAI_object3B_actions_6C4E:
	jsr Object_GeneringXYmovementEngine
	lda ObjectScreenXCoord
	sec
	sbc ObjectScreenXCoord,x
	bcs @AC5D
	jsr Math_NegateA
	@AC5D:
	cmp #$40
	beq @AC64
	bcc @AC64
	rts

	@AC64:
	inc ObjectAIvar1,x
	lda #$40
	jsr _func_1DE6F
	lda #$03
	sta ObjectYSpeed,x
	rts
;------------------------------------------
ObjectAI_object3B_actions_6C72:
	jsr Object_GeneringXYmovementEngine
	lda #$08
	sta TempPtr08_lo
	jsr Object_GravityDecelerateBy_Var08
	jsr _func_1DE8B
	lda #$06
	ldy #$10
	jsr Object_GenericCollisionHelper_ParamAY_ReturnCarry_IfFrameOddThenDefaultSEC
	bcc @AC9E
	lda ObjectFacingLeft,x
	bne @AC91
	lda #$FA
	bne @AC93

	@AC91:
	lda #$06
	@AC93:
	 ldy #$10
	jsr Object_GenericCollisionHelper_ParamAY_ReturnCarry_IfFrameOddThenDefaultSEC
	bcs @AC9D
	jsr Object_SetXVelocity16bit_InvertCurrent_AndAlso_ObjectFacingLeft
	@AC9D:
	rts

	@AC9E:
	  jsr _func_1DE62
	lda #$28
	jsr SetObjectIndexToAutomaticSpriteDataTable_to_A_and_PaletteIndexTo0
	lda #$03
	sta ObjectAIvar1,x
	jsr Object_SetXandYVelocity16bit_ToZero
	lda #$C0
	jmp _func_1DE6F
;------------------------------------------
ObjectAI_object3B_actions_6CB3:
	lda RandomSeed
	and #$3F
	beq @ACC2
	jsr _func_1DE8B
	jsr _func_1DEA1
	jmp Object_GeneringXYmovementEngine

	@ACC2:
	lda ObjectScreenXCoord,x
	cmp ObjectScreenXCoord
	bcc @ACD2
	lda #$20
	sta ObjectAIvar4,x
	jmp @ACD7

	@ACD2:
	lda #$00
	sta ObjectAIvar4,x
	@ACD7:
	 lda #$31
	sta $05
	lda ObjectDialogStatusFlag,x
	bne @ACE6
	lda ObjectAIvar4,x
	jsr Object_CreateProjectileTowardsPredefinedAngle
	@ACE6:
	lda #$04
	sta Ending_PrimaryActionIndex,x
	jsr Object_SetFacing_FaceTowardsSimon
	lda #$01
	ldy #$80
	jsr Object_SetXVelocity16bit_from_AY_invert_if_ObjectFacingLeft_set
	lda #$FE
	sta ObjectYSpeed,x
	lda #$04
	sta ObjectAIvar1,x
	lda #$27
	jsr SetObjectIndexToAutomaticSpriteDataTable_to_A_and_PaletteIndexTo0
ObjectAI_object3B_actions_6D04:
	lda ObjectScreenYCoord,x
	cmp #$20
	bcs @AD0E
	jsr Object_Erase_And_IfType3C_Set_42to00
	@AD0E:
	jmp Object_GeneringXYmovementEngine
;------------------------------------------
ObjectAI_object3A_Mummy:
	lda ObjectCurrentActionType,x
	bne @AD23
	lda #$60
	jsr _func_1DE6F
	jsr Object_SetCurrentActionType_to_01
	lda #$35
	jsr SetObjectIndexToAutomaticSpriteDataTable_to_A_and_PaletteIndexTo0_and_RefreshSprite
	@AD23:
	jsr ObjectLoadAutomaticSpriteNumber
	jsr _func_6D8D
	lda ObjectAIvar1,x
	jsr JumpWithParams
ObjectAI_object3A_actions:
	.word (ObjectAI_object3A_actions_6D37) ;AD37 (6D37) ()
	.word (ObjectAI_object3A_actions_6D47) ;AD47 (6D47) ()
	.word (ObjectAI_object3A_actions_6D66) ;AD66 (6D66) ()
	.word (ObjectAI_object3A_actions_6D7E) ;AD7E (6D7E) ()
ObjectAI_object3A_actions_6D37:
	lda #$01
	sta ObjectAIvar1,x
	lda #$60
	jsr _func_1DE6F
	lda #$30
	sta ObjectAIvar2,x
	rts
;------------------------------------------
ObjectAI_object3A_actions_6D47:
	lda ObjectAIvar2,x
	beq @AD50
	dec ObjectAIvar2,x
	rts

	@AD50:
	lda RandomSeed
	and #$01
	bne @AD59
	jmp _AD8A

	@AD59:
	lda #$02
	sta ObjectAIvar1,x
	lda #$30
	sta ObjectAIvar2,x
	jsr Object_SetXVelocity16bit_InvertCurrent_AndAlso_ObjectFacingLeft
ObjectAI_object3A_actions_6D66:
	lda ObjectAIvar2,x
	beq @AD6F
	dec ObjectAIvar2,x
	rts

	@AD6F:
	lda #$03
	sta ObjectAIvar1,x
	lda #$30
	sta ObjectAIvar3,x
	lda #$F0
	jsr _func_1DE6F
ObjectAI_object3A_actions_6D7E:
	jsr ObjectLoadAutomaticSpriteNumber
	lda ObjectAIvar3,x
	beq _AD8A
	dec ObjectAIvar3,x
	rts

	_AD8A:
	 jmp _loc_1DF7F
;------------------------------------------
_func_6D8D:
	jsr _func_1DE8B
	jsr _func_1DEA1
	jmp Object_GeneringXYmovementEngine
;------------------------------------------

	.export InhibitScrollingIf_Scene_03_03_03_UtaLake
InhibitScrollingIf_Scene_03_03_03_UtaLake:
	ldy #$00
	ldx #$00
	lda CurrentLevelSceneNumber
	cmp #$03
	bne @ADAE
	lda CurrentLevelSubRoomNumber
	and #$7F
	cmp #$03
	bne @ADAE
	iny
	lda Current_WhatUnknown57
	bne @ADAE
	inx
	@ADAE:
	sty Unknown194_PossiblyScrollingRelated
	stx ScrollingIsLocked
	rts
;------------------------------------------
	.export CheckKneelingWithBlueCrystal_EnableScroll_UtaLake
CheckKneelingWithBlueCrystal_EnableScroll_UtaLake:
	jsr _func_6DE7
	lda Unknown195_PossiblyScrollingRelated
	beq @ADE6
	lda InventoryBodyPartSelection
	cmp #$06
	bne @ADE6
	lda InventoryBodyParts1
	and #$60
	cmp #$40
	bcc @ADE6
	lda ObjectCurrentActionType
	cmp #$03
	bne @ADE6
	dec KneelingCounter
	bne @ADE6
	lda #$01
	sta CurrentYScrollingPositionPixels_Mod240
	lda #$00
	sta Unknown195_PossiblyScrollingRelated
	sta ScrollingIsLocked
	lda #$2B
	jsr AnyBankPlayTracks
	@ADE6:
	rts
;------------------------------------------
_func_6DE7:
	ldy #$00
	lda Unknown194_PossiblyScrollingRelated
	beq @ADF5
	lda CurrentYScrollingPositionPixels_Mod240
	ora Current_WhatUnknown57
	bne @ADF5
	iny
	@ADF5:
	sty Unknown195_PossiblyScrollingRelated
	rts
;------------------------------------------
LevelData_Actors_3_Wilderness:
	.word (LevelData_Actors_3_Wilderness_0carmillaCemetery) ;AF16 (6F16) ([8:2][A:3])
	.word (LevelData_Actors_3_Wilderness_1strigoiCemetery) ;AF1A (6F1A) ([8:2][A:3])
	.word (LevelData_Actors_3_Wilderness_2) ;AF1C (6F1C) ([8:2][A:3])
	.word (LevelData_Actors_3_Wilderness_3) ;B211 (7211) ([8:2][A:3])
	.word (LevelData_Actors_3_Wilderness_4) ;AF20 (6F20) ([8:2][A:3])
NPCtalkAction_GiftGiver_Silkbag:
	lda #$0F
	sta DialogTextID
	lda InventoryMiscItems1
	ora #$01
	sta InventoryMiscItems1
	lda #$22
	jmp AnyBankPlayTracks
;------------------------------------------
NPCtalkAction_GiftGiver_SilverKnife:
	lda InventoryMiscItems2
	ora #$02
	sta InventoryMiscItems2
	lda #$10
	sta DialogTextID
	lda #$22
	jmp AnyBankPlayTracks
;------------------------------------------
ObjectAI_object40:
	lda ObjectCurrentActionType,x
	bne @AE2E
	jsr Object_SetCurrentActionType_to_80
	lda #$38
	jsr SetObjectIndexToAutomaticSpriteDataTable_to_A_and_PaletteIndexTo0_and_RefreshSprite
	@AE2E:
	jsr ObjectLoadAutomaticSpriteNumber
	lda ObjectAIvar1,x
	bne @AE5C
	lda ObjectScreenXCoord,x
	sec
	sbc ObjectScreenXCoord
	bcs @AE42
	jsr Math_NegateA
	@AE42:
	cmp #$50
	bcc @AE47
	rts

	@AE47:
	lda #$FA
	sta ObjectYSpeed,x
	inc ObjectAIvar1,x
	jsr Object_SetCurrentActionType_to_02
	lda #$40
	jsr _func_1DE6F
	lda #$1D
	jmp AnyBankPlayTracks

	@AE5C:
	 lda #$20
	sta TempPtr08_lo
	jsr Object_GravityAccelerateBy_Var08
	jmp Object_GeneringXYmovementEngine
;------------------------------------------
ObjectAI_object38:
	lda ObjectCurrentActionType,x
	bne @AE7F
	jsr Object_SetCurrentActionType_to_01
	lda #$20
	sta ObjectAIvar1,x
	lda #$00
	ldy #$30
	jsr Object_SetYVelocity16bit_from_AY
	lda #$17
	jmp SetObjectIndexToAutomaticSpriteDataTable_to_A_and_PaletteIndexTo0_and_RefreshSprite

	@AE7F:
	jsr ObjectLoadAutomaticSpriteNumber
	jsr Object_SetFacing_FaceTowardsSimon
	dec ObjectAIvar1,x
	bne @AE92
	lda #$20
	sta ObjectAIvar1,x
	jmp Object_SetYVelocity16bit_InvertCurrent

	@AE92:
	jmp Object_GeneringXYmovementEngine
;------------------------------------------
ObjectAI_object18:
	lda ObjectCurrentActionType,x
	bne @AE9D
	jmp Object_SetCurrentActionType_to_01

	@AE9D:
	ldy ObjectAIvar1,x
	beq @AEA9
	dey
	beq @AECE
	dey
	beq @AEEC
	rts

	@AEA9:
	lda FrameCounter
	and #$07
	bne @AECB
	ldy ObjectAIvar2,x
	lda _data_6F12_indexed,y
	sta ObjectCurrentPose1,x
	inc ObjectAIvar2,x
	lda ObjectAIvar2,x
	cmp #$04
	bne @AECB
	dec ObjectAIvar2,x
	inc ObjectAIvar1,x
	jmp Object_SetCurrentActionType_to_01

	@AECB:
	jmp Object_SetCurrentActionType_to_80

	@AECE:
	 jsr Object_SetFacing_FaceTowardsSimon
	lda ObjectDialogStatusFlag,x
	bne @AEE8
	lda #$30
	sta $05
	lda ObjectFacingLeft,x
	bne @AEE3
	lda #$20
	bne @AEE5

	@AEE3:
	lda #$00
	@AEE5:
	 jsr Object_CreateProjectileTowardsPredefinedAngle
	@AEE8:
	  inc ObjectAIvar1,x
	rts

	@AEEC:
	   lda ObjectAIvar3,x
	cmp #$30
	bne @AF0E
	lda FrameCounter
	and #$07
	bne @AF0D
	ldy ObjectAIvar2,x
	lda _data_6F12_indexed,y
	sta ObjectCurrentPose1,x
	dec ObjectAIvar2,x
	lda ObjectAIvar2,x
	bpl @AF0D
	jsr _func_1DFA3
	@AF0D:
	rts

	@AF0E:
	 inc ObjectAIvar3,x
	rts
;------------------------------------------
_data_6F12_indexed:
	.byte $00,$C0,$C1,$C2
LevelData_Actors_3_Wilderness_0carmillaCemetery:
	.word (LevelData_Actors_3_Wilderness_0carmillaCemetery_6F22) ;AF22 (6F22) ([8:2][A:3])
	.word (LevelData_Actors_3_Wilderness_0carmillaCemetery_6F4B) ;AF4B (6F4B) ([8:2][A:3])
LevelData_Actors_3_Wilderness_1strigoiCemetery:
	.word (LevelData_Actors_3_Wilderness_1strigoiCemetery_6F78) ;AF78 (6F78) ([8:2][A:3])
LevelData_Actors_3_Wilderness_2:
	.word (LevelData_Actors_3_Wilderness_2_6FB1) ;AFB1 (6FB1) ([8:2][A:3])
	.word (LevelData_Actors_3_Wilderness_2_6FCE) ;AFCE (6FCE) ([8:2][A:3])
LevelData_Actors_3_Wilderness_4:
	.word (LevelData_Actors_3_Wilderness_4_6FE3) ;AFE3 (6FE3) ([8:2][A:3])
LevelData_Actors_3_Wilderness_0carmillaCemetery_6F22:
	.byte $04,$0C,$9E,$06,$08,$0B,$38,$08,$0C,$0B,$38,$08,$0D,$0D,$43,$00
	.byte $24,$0D,$41,$08,$28,$0B,$41,$08,$33,$0D,$43,$00,$34,$0B,$38,$08
	.byte $38,$0B,$38,$08,$3C,$0B,$38,$08,$FF
LevelData_Actors_3_Wilderness_0carmillaCemetery_6F4B:
	.byte $04,$0C,$03,$0F,$0C,$0D,$40,$0F,$0A,$0D,$43,$00,$14,$0C,$18,$0F
	.byte $18,$0D,$43,$00,$1C,$0D,$40,$0F,$24,$0D,$40,$0F,$28,$0D,$43,$00
	.byte $2C,$0C,$18,$0F,$34,$0D,$40,$0F,$38,$0D,$43,$00,$FF
LevelData_Actors_3_Wilderness_1strigoiCemetery_6F78:
	.byte $04,$0C,$9E,$02,$0A,$0B,$38,$08,$0C,$0B,$38,$08,$0D,$0D,$43,$00
	.byte $14,$09,$41,$08,$18,$09,$03,$08,$1C,$0A,$41,$08,$24,$0B,$03,$08
	.byte $28,$0C,$4A,$08,$2C,$0C,$4A,$08,$33,$0D,$43,$00,$34,$0B,$38,$08
	.byte $38,$0B,$38,$08,$3C,$0B,$38,$08,$FF
LevelData_Actors_3_Wilderness_2_6FB1:
	.byte $04,$0A,$03,$04,$08,$0C,$16,$04,$08,$1B,$43,$00,$0C,$0C,$03,$04
	.byte $14,$0C,$16,$04,$18,$0A,$16,$04,$1C,$0A,$03,$04,$FF
LevelData_Actors_3_Wilderness_2_6FCE:
	.byte $04,$08,$03,$04,$08,$0C,$4A,$04,$0C,$0C,$4A,$04,$14,$0C,$41,$04
	.byte $18,$0C,$41,$04,$FF
LevelData_Actors_3_Wilderness_4_6FE3:
	.byte $08,$0C,$41,$02,$0C,$0C,$41,$02,$14,$0C,$41,$02,$1A,$0A,$41,$02
	.byte $FF
ObjectAI_object4A_DragonBones_Part2:
	lda ObjectCurrentActionType,x
	bne @B037
	stx Unknown10_CollisionAndScrollingTemp
	lda #$01
	sta ObjectCurrentActionType,x
	lda #$56
	sta ObjectCurrentPose1,x
	lda #$30
	sta ObjectAIvar2,x
	lda #$20
	jsr _func_1DE6F
	jsr Object_FindUnusedSlot
	bcs @B034
	lda #$19
	sta ObjectType,x
	ldy Unknown10_CollisionAndScrollingTemp
	lda ObjectScreenXCoord,y
	sta ObjectScreenXCoord,x
	lda ObjectScreenYCoord,y
	clc
	adc #$10
	sta ObjectScreenYCoord,x
	lda ObjectDialogStatusFlag,y
	sta ObjectDialogStatusFlag,x
	tya
	sta ObjectAIvar1,x
	@B034:
	ldx Unknown10_CollisionAndScrollingTemp
	rts

	@B037:
	 jsr Object_SetFacing_FaceTowardsSimon
	inc ObjectDialogTextIndex,x
	lda ObjectDialogTextIndex,x
	cmp #$60
	bne @B060
	lda #$00
	sta ObjectDialogTextIndex,x
	lda ObjectDialogStatusFlag,x
	bne @B060
	lda #$30
	sta $05
	lda ObjectFacingLeft,x
	bne @B05B
	lda #$20
	bne @B05D

	@B05B:
	lda #$00
	@B05D:
	 jmp Object_CreateProjectileTowardsPredefinedAngle

	@B060:
	  dec ObjectAIvar2,x
	bne @B06D
	lda #$30
	sta ObjectAIvar2,x
	jmp Object_SetXVelocity16bit_InvertCurrent

	@B06D:
	jmp Object_GeneringXYmovementEngine
;------------------------------------------
ObjectAI_object19_DragonBones_Part1:
	lda ObjectCurrentActionType,x
	bne @B07F
	lda #$80
	sta ObjectCurrentActionType,x
	lda #$3E
	jmp SetObjectIndexToAutomaticSpriteDataTable_to_A_and_PaletteIndexTo0_and_RefreshSprite

	@B07F:
	ldy ObjectAIvar1,x
	lda ObjectType,y
	cmp #$36
	beq @B08F
	jsr Object_SetFacing_FaceTowardsSimon
	jmp ObjectLoadAutomaticSpriteNumber

	@B08F:
	jmp Object_Erase_And_IfType3C_Set_42to00
;------------------------------------------
ObjectAI_object16_HoodedSkeleton:
	lda ObjectCurrentActionType,x
	bne @B09F
	jsr Object_SetCurrentActionType_to_01
	lda #$25
	jmp SetObjectIndexToAutomaticSpriteDataTable_to_A_and_PaletteIndexTo0_and_RefreshSprite

	@B09F:
	jsr ObjectLoadAutomaticSpriteNumber
	lda ObjectAIvar1,x
	jsr JumpWithParams
ObjectAI_object16_actions:
	.word (ObjectAI_object16_actions_70AE) ;B0AE (70AE) ()
	.word (ObjectAI_object16_actions_70BB) ;B0BB (70BB) ()
	.word (ObjectAI_object16_actions_70F0) ;B0F0 (70F0) ()
ObjectAI_object16_actions_70AE:
	inc ObjectAIvar1,x
	lda #$40
	sta ObjectAIvar2,x
	lda #$C0
	jmp _func_1DE6F
;------------------------------------------
ObjectAI_object16_actions_70BB:
	jsr Object_GeneringXYmovementEngine
	jsr _func_1DE8B
	jsr _func_1DEA1
	lda ObjectAIvar2,x
	bne @B0DA
	lda ObjectScreenXCoord
	sec
	sbc ObjectScreenXCoord,x
	bcs @B0D5
	jsr Math_NegateA
	@B0D5:
	cmp #$25
	bcc @B0DE
	rts

	@B0DA:
	 dec ObjectAIvar2,x
	rts

	@B0DE:
	  lda #$30
	sta ObjectAIvar2,x
	inc ObjectAIvar1,x
	lda #$26
	jsr SetObjectIndexToAutomaticSpriteDataTable_to_A_and_PaletteIndexTo0_and_RefreshSprite
	lda #$F0
	jmp _func_1DE6F
;------------------------------------------
ObjectAI_object16_actions_70F0:
	jsr Object_GeneringXYmovementEngine
	jsr _func_1DE8B
	lda ObjectFacingLeft,x
	bne @B0FF
	lda #$F8
	bne @B101

	@B0FF:
	lda #$08
	@B101:
	 ldy #$10
	jsr Object_GenericCollisionHelper_ParamAY_ReturnCarry_IfFrameOddThenDefaultCLC
	bcc @B10B
	jsr Object_SetXVelocity16bit_InvertCurrent_AndAlso_ObjectFacingLeft
	@B10B:
	dec ObjectAIvar2,x
	bne @B118
	jsr _func_1DFA8
	lda #$25
	jmp SetObjectIndexToAutomaticSpriteDataTable_to_A_and_PaletteIndexTo0_and_RefreshSprite

	@B118:
	rts
;------------------------------------------
ObjectAI_object41_SlimeyOutside:
	lda ObjectCurrentActionType,x
	bne @B125
	lda #$01
	ldy #$C3
	jmp Object_SetCurrentActionType_And_Y_as_Pose1

	@B125:
	lda ObjectAIvar1,x
	jsr JumpWithParams
ObjectAI_object41_actions:
	.word (ObjectAI_object41_actions_7131) ;B131 (7131) ()
	.word (ObjectAI_object41_actions_713F) ;B13F (713F) ()
	.word (ObjectAI_object41_actions_7189) ;B189 (7189) ()
ObjectAI_object41_actions_7131:
	inc ObjectAIvar1,x
	lda RandomSeed
	and #$1F
	clc
	adc #$03
	sta ObjectAIvar3,x
	rts
;------------------------------------------
ObjectAI_object41_actions_713F:
	lda ObjectAIvar2,x
	cmp ObjectAIvar3,x
	beq @B160
	inc ObjectAIvar2,x
	lda ObjectAIvar2,x
	and #$03
	bne @B15B
	lda ObjectCurrentPose1,x
	cmp #$C4
	beq @B15C
	inc ObjectCurrentPose1,x
	@B15B:
	rts

	@B15C:
	 dec ObjectCurrentPose1,x
	rts

	@B160:
	  lda #$00
	sta ObjectAIvar2,x
	sta ObjectAIvar3,x
	inc ObjectAIvar1,x
	lda #$C5
	sta ObjectCurrentPose1,x
	lda #$FD
	sta ObjectYSpeed,x
	lda RandomSeed
	and #$3F
	clc
	adc #$10
	sta ObjectAIvar2,x
	jsr Object_SetFacing_FaceTowardsSimon
	lda #$01
	ldy #$40
	jmp Object_SetXVelocity16bit_from_AY_invert_if_ObjectFacingLeft_set
;------------------------------------------
ObjectAI_object41_actions_7189:
	lda ObjectAIvar2,x
	sta TempPtr08_lo
	jsr Object_GravityAccelerateBy_Var08
	jsr _func_1DE8B
	lda ObjectYSpeed,x
	bmi @B1A2
	lda #$00
	ldy #$06
	jsr Object_GenericCollisionHelper_ParamAY_ReturnCarry_IfFrameOddThenDefaultSEC
	bcc @B1A5
	@B1A2:
	jmp Object_GeneringXYmovementEngine

	@B1A5:
	 lda #$C3
	sta ObjectCurrentPose1,x
	jsr _func_1DE62
	lda #$0B
	jsr AnyBankPlayTracks
	lda #$00
	sta ObjectAIvar1,x
	sta ObjectAIvar2,x
	jmp Object_SetYVelocity16bit_ToZero
;------------------------------------------
ObjectAI_object1E:
	lda ObjectCurrentActionType,x
	bne @B1D1
	lda #$40
	sta ObjectCurrentActionType,x
	lda #$20
	sta ObjectDialogStatusFlag,x
	lda #$0B
	jmp SetObjectIndexToAutomaticSpriteDataTable_to_A_and_PaletteIndexTo0_and_RefreshSprite

	@B1D1:
	ldy ObjectAIvar1,x
	beq @B1DD
	dey
	beq @B1FD
	dey
	beq @B20E
	rts

	@B1DD:
	ldy #$03
	@B1DF:
	lda ObjectType,y
	cmp #$09
	beq @B1EC
	iny
	cpy #$06
	bne @B1DF
	rts

	@B1EC:
	inc ObjectAIvar1,x
	lda ObjectDialogStatusFlag,x
	and #$DF
	sta ObjectDialogStatusFlag,x
	lda #$20
	sta ObjectAIvar2,x
	rts

	@B1FD:
	 dec ObjectAIvar2,x
	bne @B20B
	inc ObjectAIvar1,x
	lda #$00
	sta ObjectPaletteIndex,x
	rts

	@B20B:
	jmp Object_FlashPalette

	@B20E:
	  jmp Object_SetFacing_FaceTowardsSimon
;------------------------------------------
LevelData_Actors_3_Wilderness_3:
	.word (LevelData_Actors_3_Wilderness_3_721B) ;B21B (721B) ([8:2][A:3])
	.word (LevelData_Actors_3_Wilderness_3_7244) ;B244 (7244) ([8:2][A:3])
	.word (LevelData_Actors_3_Wilderness_3_727D) ;B27D (727D) ([8:2][A:3])
	.word (LevelData_Actors_3_Wilderness_3_72E1) ;B2E1 (72E1) ([8:2][A:3])
	.word (LevelData_Actors_3_Wilderness_3_72E1) ;B2E1 (72E1) ([8:2][A:3])
LevelData_Actors_3_Wilderness_3_721B:
	.byte $0A,$0D,$43,$00,$0C,$0D,$40,$0F,$14,$0C,$18,$0F,$18
_DataPointerTable_7228:
	.word ($430D) ;430D (0) ([8:2][A:3][C:E][E:F])
	.word ($1C00) ;1C00 (0) ([8:2][A:3][C:E][E:F])
	.word ($400D) ;400D (0) ([8:2][A:3][C:E][E:F])
	.word ($240F) ;240F (0) ([8:2][A:3][C:E][E:F])
	.word ($400D) ;400D (0) ([8:2][A:3][C:E][E:F])
	.word ($260F) ;260F (0) ([8:2][A:3][C:E][E:F])
	.word ($430D) ;430D (0) ([8:2][A:3][C:E][E:F])
	.word ($2C00) ;2C00 (0) ([8:2][A:3][C:E][E:F])
	.word ($180C) ;180C (0) ([8:2][A:3][C:E][E:F])
	.word ($340F) ;340F (0) ([8:2][A:3][C:E][E:F])
	.word ($400D) ;400D (0) ([8:2][A:3][C:E][E:F])
	.word ($360F) ;360F (0) ([8:2][A:3][C:E][E:F])
	.word ($430D) ;430D (0) ([8:2][A:3][C:E][E:F])
	.word (DataTableEntry_1FF00) ;FF00 (1FF00) ([8:2][A:3][C:E][E:F])
LevelData_Actors_3_Wilderness_3_7244:
	.byte $04,$0C,$1D,$0F,$08,$0C,$10,$0F,$0C,$0C,$1D,$0F,$14,$0B,$10,$0F
	.byte $18,$0C,$1D,$0F,$1C,$0B,$10,$0F,$24,$0C,$34,$20,$27,$0C,$34,$20
	.byte $2A,$0C,$34,$20,$2D,$0C,$34,$20,$34,$0C,$10,$0F,$38,$0D,$1D,$0F
	.byte $3A,$0D,$27,$11,$3C,$0D,$10,$0F,$FF
LevelData_Actors_3_Wilderness_3_727D:
	.byte $04,$08,$03,$0F,$04,$22,$03,$0F,$08,$10,$03,$0F,$0C,$06,$03,$0F
	.byte $0C,$14,$10,$0F,$0C,$1C,$03,$0F,$0C,$22,$03,$0F,$14,$08,$03,$0F
	.byte $14,$14,$10,$0F,$16,$28,$AF,$05,$18,$22,$03,$0F,$1C,$1A,$03,$0F
	.byte $21,$28,$22,$20,$24,$06,$03,$0F,$24,$1A,$10,$0F,$25,$28,$22,$20
	.byte $28,$0A,$03,$0F,$28,$1A,$10,$0F,$29,$28,$22,$20,$2D,$28,$22,$20
	.byte $34,$0E,$03,$0F,$34,$1A,$03,$0F,$38,$08,$03,$0F,$38,$24,$03,$0F
	.byte $3C,$14,$03,$0F
LevelData_Actors_3_Wilderness_3_72E1:
	.byte $FF
ObjectAI_object10_Skull:
	lda ObjectCurrentActionType,x
	bne @B2EF
	jsr Object_SetCurrentActionType_to_01
	lda #$16
	jmp SetObjectIndexToAutomaticSpriteDataTable_to_A_and_PaletteIndexTo0_and_RefreshSprite

	@B2EF:
	jsr ObjectLoadAutomaticSpriteNumber
	lda #$80
	jsr _func_1DE6F
	jsr _func_4D12
	bcc @B300
	lda #$FF
	bne @B302

	@B300:
	lda #$00
	@B302:
	 ldy #$80
	jsr Object_SetYVelocity16bit_from_AY
	jmp Object_GeneringXYmovementEngine
;------------------------------------------
ObjectAI_object1D_FlamingMan:
	stx Unknown10_CollisionAndScrollingTemp
	lda ObjectCurrentActionType,x
	bne @B319
	jsr Object_SetCurrentActionType_to_01
	lda #$29
	jmp SetObjectIndexToAutomaticSpriteDataTable_to_A_and_PaletteIndexTo0_and_RefreshSprite

	@B319:
	ldx Unknown10_CollisionAndScrollingTemp
	jsr ObjectLoadAutomaticSpriteNumber
	jsr Object_GeneringXYmovementEngine
	lda ObjectAIvar1,x
	jsr JumpWithParams
ObjectAI_object1D_actions:
	.word (ObjectAI_object1D_actions_732F) ;B32F (732F) ()
	.word (ObjectAI_object1D_actions_733C) ;B33C (733C) ()
	.word (ObjectAI_object1D_actions_734D) ;B34D (734D) ()
	.word (ObjectAI_object1D_actions_737B) ;B37B (737B) ()
ObjectAI_object1D_actions_732F:
	inc ObjectAIvar1,x
	lda #$50
	sta ObjectAIvar2,x
	lda #$80
	jmp _func_1DE6F
;------------------------------------------
ObjectAI_object1D_actions_733C:
	dec ObjectAIvar2,x
	bne @B347
	inc ObjectAIvar1,x
	jmp Object_SetXandYVelocity16bit_ToZero

	@B347:
	jsr _func_1DE8B
	jmp _func_1DEA1
;------------------------------------------
ObjectAI_object1D_actions_734D:
	jsr Object_SetFacing_FaceTowardsSimon
	lda ObjectDialogStatusFlag,x
	bne _loc_7380
	jsr Object_FindUnusedSlot
	bcs _loc_7380
	ldy Unknown10_CollisionAndScrollingTemp
	lda #$32
	sta ObjectType,x
	lda ObjectScreenXCoord,y
	sta ObjectScreenXCoord,x
	lda ObjectScreenYCoord,y
	sec
	sbc #$02
	sta ObjectScreenYCoord,x
	ldx Unknown10_CollisionAndScrollingTemp
	inc ObjectAIvar1,x
	lda #$30
	sta ObjectAIvar2,x
	rts
;------------------------------------------
ObjectAI_object1D_actions_737B:
	dec ObjectAIvar2,x
	bne _B385
_loc_7380:
	ldx Unknown10_CollisionAndScrollingTemp
	jsr _func_1DFA8
	_B385:
	rts
;------------------------------------------
ObjectAI_object32:
	lda ObjectCurrentActionType,x
	bne @B395
	lda #$02
	ldy #$29
	jsr Object_SetCurrentActionType_And_Y_as_Pose1
	jmp Object_SetFacing_FaceTowardsSimon

	@B395:
	jsr Object_GeneringXYmovementEngine
	lda ObjectAIvar1,x
	jsr JumpWithParams
ObjectAI_object32_actions:
	.word (ObjectAI_object32_actions_73A4) ;B3A4 (73A4) ()
	.word (ObjectAI_object32_actions_73B3) ;B3B3 (73B3) ()
	.word (ObjectAI_object32_actions_73CD) ;B3CD (73CD) ()
ObjectAI_object32_actions_73A4:
	inc ObjectAIvar1,x
	lda #$FD
	ldy #$00
	jsr Object_SetYVelocity16bit_from_AY
	lda #$E0
	jmp _func_1DE6F
;------------------------------------------
ObjectAI_object32_actions_73B3:
	lda #$20
	sta TempPtr08_lo
	jsr Object_GravityAccelerateBy_Var08
	lda #$00
	ldy #$08
	jsr Object_GenericCollisionHelper_ParamAY_ReturnCarry_IfFrameOddThenDefaultSEC
	bcs @B3CC
	inc ObjectAIvar1,x
	jsr _func_1D3F6
	jmp Object_SetYVelocity16bit_ToZero

	@B3CC:
	rts
;------------------------------------------
ObjectAI_object32_actions_73CD:
	lda #$00
	ldy #$00
	jsr Object_GenericCollisionHelper_ParamAY_ReturnCarry_IfFrameOddThenDefaultSEC
	bcc @B3F5
	lda ObjectFacingLeft,x
	bne @B3DF
	lda #$FA
	bne @B3E1

	@B3DF:
	lda #$06
	@B3E1:
	 ldy #$08
	jsr Object_GenericCollisionHelper_ParamAY_ReturnCarry_IfFrameOddThenDefaultCLC
	bcs @B3E9
	rts

	@B3E9:
	lda #$01
	sta ObjectAIvar1,x
	lda #$FF
	ldy #$80
	jmp Object_SetYVelocity16bit_from_AY

	@B3F5:
	  jmp Object_Erase_And_IfType3C_Set_42to00
;------------------------------------------
LevelData_Actors_5_Ruins:
	.word (LevelData_Actors_5_Ruins_0) ;B3FA (73FA) ([8:2][A:3])
LevelData_Actors_5_Ruins_0:
	.word (LevelData_Actors_5_Ruins_0_73FE) ;B3FE (73FE) ([8:2][A:3])
	.word (LevelData_Actors_5_Ruins_0_73FE) ;B3FE (73FE) ([8:2][A:3])
LevelData_Actors_5_Ruins_0_73FE:
	.byte $FF
; -----------------------------------------
	.export RunFinalConfrontationActions
RunFinalConfrontationActions:
	lda $04A4
	cmp #$FF
	beq _loc_7458
	jsr JumpWithParams
FinalConfrontationOperations:
	.word (FinalConfrontation_RemoveGarlics_And_DisableInput) ;B415 (7415) ()
	.word (FinalConfrontation_AutoControlSimon) ;B424 (7424) ()
	.word (FinalConfrontation_Maybe_MoveDraculaParts) ;B459 (7459) ()
	.word (FinalConfrontation_Maybe_ExplodeDracula) ;B48F (748F) ()
	.word (FinalConfrontation_Maybe_PauseBeforeAction) ;B4AC (74AC) ()
	.word (FinalConfrontation_Maybe_BeginAction) ;B4E0 (74E0) ()
FinalConfrontation_RemoveGarlics_And_DisableInput:
	lda #$00
	sta InventoryNumGarlics
	lda #$80
	sta $045C
	inc $04A4
	jmp ClearJoyButtonsWork
;------------------------------------------
FinalConfrontation_AutoControlSimon:
	ldy #$00
	ldx #$08
	lda $045C
	beq @B432
	dec $045C
	bne @B454
	@B432:
	  lda #$A0
	sta ObstacleBufferDraculaDoor,y
	tya
	clc
	adc #$08
	tay
	dex
	bne @B432
	ldy #$81
	lda ObjectScreenXCoord
	cmp #$30
	beq @B454
	ldy #$01
	bcc @B454
	cmp #$60
	bcc @B454
	dey
	inc $04A4
	@B454:
	 sty Input_CurrentJoyButtonsWork
	sty Input_NewJoyButtonsWork
_loc_7458:
	rts
;------------------------------------------
FinalConfrontation_Maybe_MoveDraculaParts:
	ldx #$04
	ldy #$F0
	@B45D:
	lda #$4B
	sta $03BB,x
	lda #$82
	sta $03DF,x
	lda #$60
	sta $034F,x
	lda #$AD
	sta $032B,x
	lda #$00
	sta $0307,x
	sta $0427,x
	tya
	sta $045D,x
	sec
	sbc #$30
	tay
	dex
	bpl @B45D
	lda #$40
	sta $045C
	inc $04A4
	jmp ClearJoyButtonsWork
;------------------------------------------
FinalConfrontation_Maybe_ExplodeDracula:
	jsr ClearJoyButtonsWork
	lda $045C
	beq @B49B
	dec $045C
	rts

	@B49B:
	jsr ClearJoyButtonsWork
	lda $03BF
	bne @B4AB
	lda #$20
	sta $045D
	inc $04A4
	@B4AB:
	rts
;------------------------------------------
FinalConfrontation_Maybe_PauseBeforeAction:
	dec $045D
	bne @B4DD
	lda #$4C
	sta $03BB
	lda #$D3
	sta $0307
	lda #$82
	sta $03DF
	lda #$94
	sta $032B
	lda #$00
	sta $0427
	lda #$80
	sta $034F
	sta $045D
	jsr AnyBankTerminateSound
	lda #$32
	jsr AnyBankPlayTracks
	inc $04A4
	@B4DD:
	jmp ClearJoyButtonsWork
;------------------------------------------
FinalConfrontation_Maybe_BeginAction:
	dec $045D
	bne @B507
	ldy #$FF
	sty $04A4
	iny
	sty $03DE
	sty $03DF
	sty $03BB
	sty $0307
	sty Unknown04ED_finalConfrontationRelated
	lda #$47
	sta $03BA
	lda #$80
	sta $032A
	sta $034E
	@B507:
	jmp ClearJoyButtonsWork
;------------------------------------------
ObjectAI_object4B:
	lda ObjectAIvar2,x
	beq @B513
	dec ObjectAIvar2,x
	rts

	@B513:
	lda #$E8
	sta ObjectCurrentPose1,x
	lda ObjectScreenXCoord,x
	cmp #$80
	beq @B53B
	lda FrameCounter
	and #$01
	bne @B53A
	dec ObjectScreenYCoord,x
	lda FrameCounter
	and #$03
	bne @B53A
	inc ObjectScreenXCoord,x
	cpx #$0B
	bne @B53A
	lda #$80
	sta $0473
	@B53A:
	  rts

	@B53B:
	 lda $0353
	cmp #$80
	bne @B53A
	lda FrameCounter
	and #$03
	bne @B553
	inc ObjectPaletteIndex,x
	lda ObjectPaletteIndex,x
	and #$03
	sta ObjectPaletteIndex,x
	@B553:
	lda $0473
	beq @B560
	cpx #$0B
	bne @B53A
	dec $0473
	rts

	@B560:
	lda ObjectScreenYCoord,x
	cmp #$9D
	bcs @B56B
	inc ObjectScreenYCoord,x
	rts

	@B56B:
	lda #$00
	sta ObjectType,x
	sta ObjectCurrentPose1,x
	sta ObjectCurrentActionType,x
	rts
;------------------------------------------
ObjectAI_object4C:
	lda FrameCounter
	and #$07
	bne @B58C
	inc ObjectCurrentPose1,x
	lda ObjectCurrentPose1,x
	cmp #$D7
	bcc @B58C
	lda #$D3
	sta ObjectCurrentPose1,x
	@B58C:
	rts
;------------------------------------------
ClearJoyButtonsWork:
	ldy #$00
	sty Input_CurrentJoyButtonsWork
	sty Input_NewJoyButtonsWork
	rts
;------------------------------------------
ObjectAI_object47_DraculaMaybe:
	lda ObjectCurrentActionType,x
	bne @B5BF
	jsr Object_SetCurrentActionType_to_01
	lda #$00
	sta $0318
	sta $045C
	sta $0402
	sta $0306
	lda #$33
	sta $046E
	sta Ending_RemainingDelayBeforeNextEndingActionIstaken
	lda #$C0
	sta $04B6
	sta TimeRelated2A
	lda #$F0
	sta $04C8
	;@B5BE:
	  rts

	@B5BF:
	lda ObjectAIvar6,x
	beq _B60E
	lda FrameCounter
	and #$01
	bne _B60D
	dec ObjectAIvar6,x
	lda ObjectAIvar6,x
	cmp #$A0
	bcc @B5DB
	bne _B60D
	lda #$4D
	jsr AnyBankPlayTracks
	@B5DB:
	ldy #$00
	lda ObjectAIvar6,x
	cmp #$80
	bcs @B5FB
	iny
	cmp #$60
	bcs @B5FB
	ldy #$03
	cmp #$40
	bcs @B5FB
	ldy #$07
	cmp #$20
	bcs @B5FB
	lda #$33
	sta ObjectCurrentPose1,x
	rts

	@B5FB:
	sty TempPtr00_lo
	and TempPtr00_lo
	bne _B60D
	lda #$33
	ldy ObjectCurrentPose1,x
	beq @B60A
	lda #$00
	@B60A:
	sta ObjectCurrentPose1,x
	_B60D:
	    rts

	_B60E:
	  lda ObjectAIvar3,x
	beq @B620
	dec ObjectAIvar3,x
	lda ObjectAIvar3,x
	and #$0F
	bne _B60D
	jmp @B65D

	@B620:
	lda FrameCounter
	bne @B62F
	lda #$28
	sta ObjectAIvar3,x
	inc ObjectCurrentPose1,x
	jmp @B65D

	@B62F:
	lda #$33
	sta ObjectCurrentPose1,x
	lda FrameCounter
	and #$01
	bne _B60D
	inc ObjectAIvar2,x
	lda ObjectAIvar2,x
	and #$1F
	sta ObjectAIvar2,x
	asl a
	tay
	lda _data_76D9_indexed,y
	sta ObjectScreenXCoord,x
	lda _data_76DA_indexed,y
	sta ObjectScreenYCoord,x
	dec Ending_PrimaryActionIndex,x
	bne _B60D
	lda #$3D
	sta Ending_PrimaryActionIndex,x
	@B65D:
	 jsr Object_ComparePositionToSimonPosition
	lda #$48
	jmp Object_CreateProjectileTowardsSimon
;------------------------------------------
_loc_7665:
	lda FrameCounter
	and #$03
	bne @B67A
	inc ObjectCurrentPose1,x
	lda ObjectCurrentPose1,x
	cmp #$7E
	bcc @B67A
	lda #$7A
	sta ObjectCurrentPose1,x
	@B67A:
	jsr Object_GeneringXYmovementEngine
	lda ObjectScreenYCoord,x
	clc
	adc #$20
	cmp #$31
	bcs _B60D
	jmp Object_Erase_And_IfType3C_Set_42to00
;------------------------------------------
ObjectAI_object48:
	lda ObjectCurrentActionType,x
	bne _loc_7665
	jsr Object_SetCurrentActionType_to_01
	lda #$01
	sta ObjectEnemyRemainingHP,x
	lda #$7A
	sta ObjectCurrentPose1,x
	jmp Object_SetFacing_FaceTowardsSimon
;------------------------------------------
ObjectAI_object4D_DraculasDeath:
	lda ObjectCurrentActionType,x
	bne @B6B1
	lda #$E9
	sta ObjectCurrentPose1,x
	lda #$80
	sta ObjectAIvar2,x
	jmp Object_SetCurrentActionType_to_01

	@B6B1:
	dec ObjectAIvar2,x
	bne @B6C3
	lda #$00
	sta ObjectType,x
	sta ObjectCurrentPose1,x
	lda #$0C
	sta CurrentPlotAction
	rts

	@B6C3:
	lda FrameCounter
	and #$03
	bne @B6D8
	inc ObjectCurrentPose1,x
	lda ObjectCurrentPose1,x
	cmp #$ED
	bcc @B6D8
	lda #$E9
	sta ObjectCurrentPose1,x
	@B6D8:
	rts
;------------------------------------------
_data_76D9_indexed:
	.byte $80
_data_76DA_indexed:
	.byte $D0,$80,$30,$30,$80,$D0,$80,$70,$CE,$90,$31,$31,$70,$CE,$8F,$61
	.byte $C9,$9E,$36,$36,$61,$CA,$9E,$53,$C2,$AC,$3D,$3D,$54,$C2,$AB,$47
	.byte $B8,$B8,$47,$47,$47,$B8,$B8,$3D,$AC,$C2,$53,$53,$3D,$AC,$C2,$36
	.byte $9E,$C9,$61,$61,$36,$9E,$C9,$31,$8F,$CE,$70,$70,$31,$8F,$CE,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$D8,$78,$EE,$FF,$FF,$4C,$00,$C0,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	
.segment "VECT_01"
	;.byte $46,$C0,$D0,$FF,$96,$C0
	.word (_NMI) ;C046 (1C046) ()
	.word (_Reset) ;FFD0 (1FFD0) ()
	.word (_IRQ)