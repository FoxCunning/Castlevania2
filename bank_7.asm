.segment "BANK_07"
; Offset in ROM: $1C000
.setcpu "6502X"

.feature org_per_seg
.feature pc_assignment

.include "globals.inc"


Main_ProgramBegin:
	lda $2002
	bpl Main_ProgramBegin
	@C005:
	lda $2002
	bpl @C005
	ldx #$FF
	txs
	jsr ResetPPUtoKnownState
	jsr ResetAPUtoKnownState
	inx
	txa
	sta TempPtr00_lo
	sta TempPtr00_hi
	ldy #$FE
	@C01B:
	dey
	sta (TempPtr00_lo),y
	bne @C01B
	inc TempPtr00_hi
	ldy #$00
	ldx #$08
	@C026:
	sta (TempPtr00_lo),y
	iny
	bne @C026
	inc TempPtr00_hi
	cpx TempPtr00_hi
	bne @C026
	lda #$1E
	sta Mapper1reg_reg0
	jsr AnyBankTerminateSound
	jsr _func_1C0A8
Main_InfiniteLoop_UpdateRandomSeed:
	lda RandomSeed
	clc
	adc FrameCounter
	sta RandomSeed
	jmp Main_InfiniteLoop_UpdateRandomSeed
;------------------------------------------
_NMI:
	pha
	 txa
	 pha
	  tya
	  pha
	   lda $2002
	   lda #$00
	   sta $2003
	   ldy #$02
	   sty $4014
	   ldy NMI_InProgress
	   bne _C097
	   inc NMI_InProgress
	   jsr ResetPPUtoKnownState
	   jsr NMI_ProcessPPUsendQueue
	   lda PPUdesiredRegister2001
	   ldx ScreenBlankingCounter
	   beq @C070
	   dec ScreenBlankingCounter
	   beq @C070
	   lda #$00
	@C070:
	   sta $2001
	   jsr NMI_MapDesiredVROMpages
	   jsr NMI_UpdatePPUregisters
	   jsr NMI_SoundCodeCall
	   jsr NMI_UpdateInput
	   lda #$00
	   jsr SwitchBank_NewPage
	   jsr NMI_RenderSprites
	   jsr NMI_ExecuteCurrentPlotAction
	   jsr PPU_Text_ExtractAndSend_Finish_Put00
	   lda #$00
	   sta NMI_InProgress
EndNMI:
	pla
	tay
	pla
	tax
	pla
_IRQ:
	rti

	_C097:
	 jsr NMI_SoundCodeCall
	jmp EndNMI
;------------------------------------------
ResetAPUtoKnownState:
	lda #$0F
	sta APU_HW__4015_EnableChannelsMask
	lda #$C0
	sta $4017
	rts
;------------------------------------------
_func_1C0A8:
	lda #$A8
	sta PPUdesiredRegister2000
	sta $2000
	lda #$1E
	sta PPUdesiredRegister2001
_func_1C0B3:
	lda #$05
	sta ScreenBlankingCounter
	rts
;------------------------------------------
NMI_UpdatePPUregisters:
	lda $2002
	lda #$20
	sta $2006
	lda #$00
	sta $2006
	lda $2002
	lda PPUscrollingPositionLo
	sta $2005
	lda PPUscrollingPositionHi
	sta $2005
	lda PPUdesiredRegister2000
	sta $2000
	rts
;------------------------------------------
ResetPPUtoKnownState:
	lda #$00
	sta $2006
	sta $2006
	sta $2000
	sta $2001
	rts
;------------------------------------------
AnyBankTerminateSound:
	lda #$01
	sta InSoundCode
	lda #$00
	jsr SwitchBank_temporary
	jsr Bank0TerminateSound
	jsr SwitchBank_RestorePage
	lda #$00
	sta InSoundCode
	rts
;------------------------------------------
NMI_SoundCodeCall:
	lda ProgrammingMapper
	bne @C117
	lda InSoundCode
	bne @C117
	lda #$01
	sta InSoundCode
	lda #$00
	jsr SwitchBank_temporary
	jsr SoundCode_NMIcallback
	jsr SwitchBank_RestorePage
	lda #$00
	sta InSoundCode
	@C117:
	rts
;------------------------------------------
AnyBankPlayTracks:
	pha
	 lda InSoundCode
	 bne @C13E
	 lda #$01
	 sta InSoundCode
	 lda #$00
	 jsr SwitchBank_temporary
	pla
	sta TempPtr00_lo
	txa
	pha
	 tya
	 pha
	  lda TempPtr00_lo
	  jsr Bank0PlayTracks
	  jsr SwitchBank_RestorePage
	 pla
	 tay
	pla
	tax
	lda #$00
	sta InSoundCode
	rts

	@C13E:
	pla
	rts
;------------------------------------------
NMI_MapDesiredVROMpages:
	lda Mapper1reg_reg0
	sta SoundData4D_DraculaSong_ch1
	lsr a
	sta SoundData4D_DraculaSong_ch1
	lsr a
	sta SoundData4D_DraculaSong_ch1
	lsr a
	sta SoundData4D_DraculaSong_ch1
	lsr a
	sta SoundData4D_DraculaSong_ch1
	lda Mapper1reg_reg1
	sta $BFFF
	lsr a
	sta $BFFF
	lsr a
	sta $BFFF
	lsr a
	sta $BFFF
	lsr a
	sta $BFFF
	lda Mapper1reg_reg2
	sta Main_ProgramBegin
	lsr a
	sta Main_ProgramBegin
	lsr a
	sta Main_ProgramBegin
	lsr a
	sta Main_ProgramBegin
	lsr a
	sta Main_ProgramBegin
	rts
;------------------------------------------
SwitchBank_NewPage:
	sta Mapper1reg_reg3
SwitchBank_RestorePage:
	lda Mapper1reg_reg3
SwitchBank_temporary:
	pha
	 lda #$01
	 sta ProgrammingMapper
	pla
	sta _data_1FFFF
	lsr a
	sta _data_1FFFF
	lsr a
	sta _data_1FFFF
	lsr a
	sta _data_1FFFF
	lsr a
	sta _data_1FFFF
	lda #$00
	sta ProgrammingMapper
	rts
;------------------------------------------
NMI_ExecuteCurrentPlotAction:
	inc FrameCounter
	jsr ResetFirst14sprites
	lda CurrentPlotAction
	beq @C1B7
	cmp #$03
	bcs @C1B7
	jsr TitleScreen_CheckForStartKey
	@C1B7:
	lda CurrentPlotAction
	jsr JumpWithParams
_JumpPointerTable_1C1BC:
	.word (PlotAction00_LoadTitleScreen) ;C1F2 (1C1F2) ()
	.word (PlotAction01_RunTitleScreen) ;C1FF (1C1FF) ()
	.word @C1F1
	.word (PlotAction03_StartKeyPressed_Unused_And_ActivatePlotAction04_With_128FrameDelay) ;C20F (1C20F) ()
	.word (PlotAction04_BeginNewGame) ;C232 (1C232) ()
	.word (PlotAction05_RunGameMaybe) ;CC24 (1CC24) ()
	.word (PlotAction06_DeathSequence) ;C289 (1C289) ()
	.word (PlotAction07_RunGameoverMenuScreen) ;C2C7 (1C2C7) ()
	.word (PlotAction08_RunMainMenuScreen) ;C328 (1C328) ()
	.word (PlotAction09_RunEnding) ;C409 (1C409) ()
	.word (PlotAction0A_RunEndingTextPerhaps) ;C411 (1C411) ()
	.word (PlotAction0B_RunGameoverPasswordScreen) ;C3CB (1C3CB) ()
	.word (PlotAction0C_Goto0D_After_Brief_Pause) ;C436 (1C436) ()
	.word (PlotAction0D_ReprogramMapper_And_ActivatePlotAction09_With_128FrameDelay) ;C424 (1C424) ()
	.word (PlotAction0E_AfterEnding_ActivatePlotAction00_With_128FrameDelay) ;C43D (1C43D) ()
	.word (PlotAction0F_Goto04_After_Brief_Pause) ;C3C2 (1C3C2) ()
ResetFirst14sprites:
	ldx #$00
	ldy #$0E
	@C1E0:
	lda #<_data_1FFF8
	sta $0200,x
	lda #>_data_1FFF8
	sta $0201,x
	inx
	inx
	inx
	inx
	dey
	bne @C1E0
PlotAction02_Nothing:
	rts
;------------------------------------------
PlotAction00_LoadTitleScreen:
	lda #$0F
	sta Mapper1reg_reg1
	lda #$04
	jsr SwitchBank_NewPage
	jmp PlotAction00_Continues
;------------------------------------------
PlotAction01_RunTitleScreen:
	lda #$04
	jsr SwitchBank_NewPage
	jmp PlotAction01_Continues
;------------------------------------------
ActivatePlotAction00_With_128FrameDelay:
	lda #$00
	jsr ActivatePlotAction_With_128FrameDelay
	jmp PlotAction00_LoadTitleScreen
;------------------------------------------
PlotAction03_StartKeyPressed_Unused_And_ActivatePlotAction04_With_128FrameDelay:
	ldx CurrentPlotAction_StateWithin
	bne ActivatePlotAction04_With_128FrameDelay
	lda #$00
	sta $1E
	dec TimeRelated2A
	bne @C21E
	jmp @C23C

	@C21E:
	lda #$04
	jsr SwitchBank_NewPage
	lda #$08
	and TimeRelated2A
	jsr Math_mulAby16
	jmp PPU_Text_ExtractAndSend_With_01prefix
;------------------------------------------
ActivatePlotAction04_With_128FrameDelay:
	lda #$04
	jmp ActivatePlotAction_With_128FrameDelay
;------------------------------------------
PlotAction04_BeginNewGame:
	jsr InitializeGameVariablesForBeginning
	lda #$00
	sta PlotAction05_GameLoop_WhichAction
	jmp _loc_1C247

	@C23C:
	 lda #$80
	sta TimeRelated2A
	inc CurrentPlotAction_StateWithin
	rts
;------------------------------------------
UnusedC243:
	lda #$80
	sta TimeRelated2A
_loc_1C247:
	inc CurrentPlotAction
_loc_1C249:
	lda #$00
	sta $20
	sta CurrentPlotAction_StateWithin
	rts
;------------------------------------------
ActivatePlotAction_With_128FrameDelay:
	sta CurrentPlotAction
	lda #$80
	sta TimeRelated2A
	bne _loc_1C249
;------------------------------------------
ResetSimonBackToLevelBeginning_InTheRuins_AfterDeath:
	lda #$00
	sta CurrentLevelSceneNumber
	sta CurrentLevelSubRoomNumber
	sta $52
	sta CurrentXScrollingPositionPixels
	sta CurrentXScrollingPositionScreens
	sta $55
	sta CurrentYScrollingPositionPixels_Mod240
	sta Current_WhatUnknown57
	sta HeartsDigits1100
	lda #$80
	sta ObjectScreenXCoord
	lda #$BD
	sta ObjectScreenYCoord
	jsr _func_1C530
	lda #$FF
	sta $018F
	lda CurrentMaxHP
	sta CurrentHP
	lda #$50
	sta HeartsDigits0011
	jmp _loc_1C2A4
;------------------------------------------
PlotAction06_DeathSequence:
	jsr AnyBankTerminateSound
	jsr PPU_DirectToPPU_Data_ExtractAndSend_Screen0_Blank
	lda #$1E
	jsr PPU_Text_ExtractAndSend_With_01prefix
	dec RemainingLives
	beq _C2AF
	jsr ClearMemory_300_to_3C5
_loc_1C29B:
	lda CurrentLevelMapType
	cmp #$05
	beq ResetSimonBackToLevelBeginning_InTheRuins_AfterDeath
	jsr LetSimonContinueAfterDeath
_loc_1C2A4:
	lda #$05
	sta CurrentPlotAction
	lda #$00
	sta PlotAction05_GameLoop_WhichAction
	jmp PlotAction05_Action00_ShowGameBeginScreenWithRemainingLives

	_C2AF:
	lda #$51
	jsr AnyBankPlayTracks
	jsr ClearMemory_300_to_3C5
	lda #$07
	jsr PPU_Text_ExtractAndSend_With_01prefix
	lda #$00
	sta MainMenuOptionIndex
	jmp _loc_1C247
;------------------------------------------
GameoverMenuScreenCursorXtable:
	.byte $60
GameoverMenuScreenCursorYtable:
	.byte $88,$60,$A0
PlotAction07_RunGameoverMenuScreen:
	ldy CurrentPlotAction_StateWithin
	bne @C2D3
	lda #$1E
	jsr PPU_Text_ExtractAndSend_With_01prefix
	inc CurrentPlotAction_StateWithin
	rts

	@C2D3:
	lda #$8B
	sta $0301
	lda MainMenuOptionIndex
	asl a
	tay
	lda GameoverMenuScreenCursorXtable,y
	sta $0349
	lda GameoverMenuScreenCursorYtable,y
	sta $0325
	lda Input_NewJoyButtonsWork
	and #$10
	bne PlotAction07_RunGameoverMenuScreen_Start_pressed
	lda Input_NewJoyButtonsWork
	and #$20
	beq _loc_1C2FA
PlotAction07_RunGameoverMenuScreen_Select_pressed:
	lda MainMenuOptionIndex
	eor #$01
	sta MainMenuOptionIndex
_loc_1C2FA:
	rts
;------------------------------------------
PlotAction07_RunGameoverMenuScreen_Start_pressed:
	lda #$00
	sta $0301
	lda MainMenuOptionIndex
	beq @C30D
	lda #$0B
	sta CurrentPlotAction
	lda #$00
	sta CurrentPlotAction_StateWithin
	rts

	@C30D:
	jsr PlotAction08_IncrementUsedContinueCount
	lda #$03
	sta RemainingLives
	jsr ResetHeartsAndExp
	jmp _loc_1C29B
;------------------------------------------
PlotAction08_IncrementUsedContinueCount:
	lda $0193
	cmp #$99
	beq @C324
	jsr MathBCD_additionBy1
	@C324:
	sta $0193
	rts
;------------------------------------------
PlotAction08_RunMainMenuScreen:
	ldy CurrentPlotAction_StateWithin
	bne @C331
	inc CurrentPlotAction_StateWithin
	jmp PPU_DirectToPPU_Data_ExtractAndSend_Screen0_Blank

	@C331:
	dey
	bne @C341
	lda #$12
	sta Mapper1reg_reg1
	lda #$5E
	jsr PPU_Text_ExtractAndSend_With_01prefix
	inc CurrentPlotAction_StateWithin
	rts

	@C341:
	dey
	bne @C351
	lda #$04
	jsr SwitchBank_NewPage
	ldx #$0A
	jsr PPU_DirectToPPU_Data_ExtractAndSend_ScreenXdiv2
	inc CurrentPlotAction_StateWithin
	rts

	@C351:
	dey
	bne @C360
	lda #$55
	jsr AnyBankPlayTracks
	lda #$00
	sta MainMenuOptionIndex
	inc CurrentPlotAction_StateWithin
	rts

	@C360:
	dey
	bne _loc_1C3B6
	lda #$F1
	sta $0301
	lda MainMenuOptionIndex
	asl a
	tay
	lda MainMenuScreenCursorXtable,y
	sta $0349
	lda MainMenuScreenCursorYtable,y
	sta $0325
	lda Input_NewJoyButtonsWork
	and #$10
	bne PlotAction08_RunMainMenuScreen_Start_pressed
	lda Input_NewJoyButtonsWork
	and #$20
	beq _loc_1C38F
PlotAction08_RunMainMenuScreen_Select_pressed:
	lda #$05
	jsr AnyBankPlayTracks
	lda MainMenuOptionIndex
	eor #$01
	sta MainMenuOptionIndex
_loc_1C38F:
	rts
;------------------------------------------
PlotAction08_RunMainMenuScreen_Start_pressed:
	lda MainMenuOptionIndex
	beq @C3A9
	ldy #$10
	sty Mapper1reg_reg1
	iny
	sty Mapper1reg_reg2
	lda #$03
	sta ScreenBlankingCounter
	lda #$00
	sta PasswordActionState
	inc CurrentPlotAction_StateWithin
	rts

	@C3A9:
	lda #$01
	sta Sound_FadeMode
	lda #$C0
	sta TimeRelated2A
	lda #$0F
	sta CurrentPlotAction
	rts
;------------------------------------------
_loc_1C3B6:
	lda #$04
	jsr SwitchBank_NewPage
	jmp _loc_12AA2
;------------------------------------------
MainMenuScreenCursorXtable:
	.byte $58
MainMenuScreenCursorYtable:
	.byte $80,$58,$98
PlotAction0F_Goto04_After_Brief_Pause:
	dec TimeRelated2A
	bne @C3CA
	lda #$04
	sta CurrentPlotAction
	@C3CA:
	rts
;------------------------------------------
PlotAction0B_RunGameoverPasswordScreen:
	ldy CurrentPlotAction_StateWithin
	bne @C3E0
	ldy #$10
	sty Mapper1reg_reg1
	iny
	sty Mapper1reg_reg2
	lda #$06
	sta PasswordActionState
	inc CurrentPlotAction_StateWithin
	rts

	@C3E0:
	dey
	bne PlotAction0B_RunGameoverPasswordScreen_GoBackToGameoverMenu
	lda #$04
	jsr SwitchBank_NewPage
	jmp _loc_12AA2
;------------------------------------------
PlotAction0B_RunGameoverPasswordScreen_GoBackToGameoverMenu:
	jsr PPU_DirectToPPU_Data_ExtractAndSend_Screen0_Blank
	ldy #$00
	sty Mapper1reg_reg1
	iny
	sty Mapper1reg_reg2
	lda #$07
	jsr PPU_Text_ExtractAndSend_With_01prefix
	lda #$00
	sta MainMenuOptionIndex
	lda #$07
	sta CurrentPlotAction
	lda #$00
	sta CurrentPlotAction_StateWithin
	rts
;------------------------------------------
PlotAction09_RunEnding:
	lda #$04
	jsr SwitchBank_NewPage
	jmp BeginEnding
;------------------------------------------
PlotAction0A_RunEndingTextPerhaps:
	lda #$04
	jsr SwitchBank_NewPage
	jmp Ending_ChoosePrimaryAction
;------------------------------------------
ResetHeartsAndExp:
	lda #$00
	sta HeartsDigits0011
	sta HeartsDigits1100
	sta Edigits0011
	sta Edigits1100
	rts
;------------------------------------------
PlotAction0D_ReprogramMapper_And_ActivatePlotAction09_With_128FrameDelay:
	ldy #$0D
	sty Mapper1reg_reg1
	iny
	sty Mapper1reg_reg2
	lda #$02
	sta ScreenBlankingCounter
	lda #$09
	jmp ActivatePlotAction_With_128FrameDelay
;------------------------------------------
PlotAction0C_Goto0D_After_Brief_Pause:
	dec TimeRelated2A
	bne @C43C
	inc CurrentPlotAction
	@C43C:
	rts
;------------------------------------------
PlotAction0E_AfterEnding_ActivatePlotAction00_With_128FrameDelay:
	jmp ActivatePlotAction00_With_128FrameDelay
;------------------------------------------
_func_1C440:
	lda TimeRelated2A
	ora TimeRelated2B
	beq @C452
	dec TimeRelated2A
	bne @C452
	lda TimeRelated2B
	beq @C450
	dec TimeRelated2B
	@C450:
	lda #$01
	@C452:
	 rts
;------------------------------------------
NMI_UpdateInput:
                            ; Cycle cost: 756 cycles + JSR+RTS, if DMA doesn't damage input:
                            ; Cycle cost: 701 cycles + JSR+RTS if DMA damaged player1 input:
                            ; Cycle cost: 709 cycles + JSR+RTS if DMA damaged player2 input:
	ldx #$00
	jsr NMI_ReadOneJoypad
	ldx #$02
	jsr NMI_ReadOneJoypad
	lda TempPtr00_lo
	cmp TempPtr02_lo
	bne NMI_BlankNewInputTables
	lda TempPtr00_hi
	cmp TempPtr02_hi
	bne NMI_BlankNewInputTables
	ldx #$00
	jsr NMI_UpdateInputTables
	inx
NMI_UpdateInputTables:
                            ; Cycle cost: 23 cycles  + JSR+RTS:
	lda TempPtr00_lo,x
	tay
	eor Input_CurrentJoyButtonsOrig,x
	and TempPtr00_lo,x
	sta Input_NewJoyButtonsWork,x
	sta Input_NewJoyButtonsOrig,x
	sty Input_CurrentJoyButtonsWork,x
	sty Input_CurrentJoyButtonsOrig,x
	rts
;------------------------------------------
NMI_BlankNewInputTables:
                            ; Cycle cost: 14 cycles  + JSR+RTS:
	lda #$00
	sta Input_NewJoyButtonsWork
	sta Input_NewJoyButtonsOrig
	sta Input_NewJoyButtonsWork_Player2
	sta Input_NewJoyButtonsOrig_Player2
	rts
;------------------------------------------
NMI_ReadOneJoypad:
                            ; Cycle cost: 325 cycles + JSR+RTS:
	ldy #$01
	sty $4016
	dey
	sty $4016
	ldy #$08
	@C495:
	lda $4016
	sta $04
	lsr a
	ora $04
	lsr a
	rol TempPtr00_lo,x
	lda $4017
	sta $05
	lsr a
	ora $05
	lsr a
	rol TempPtr00_hi,x
	dey
	bne @C495
	rts
;------------------------------------------
TitleScreen_CheckForStartKey:
	lda Input_NewJoyButtonsWork
	and #$30
	beq @C4D5
	jsr _func_1C4EC
	and #$10
	beq @C4D6
	lda PPUscrollingPositionLo
	bne @C4D6
	lda PPUdesiredRegister2000
	and #$01
	bne @C4D6
	ldx #$05
	lda #$00
	@C4CA:
	sta $0301,x
	dex
	bpl @C4CA
	lda #$08
	jmp ActivatePlotAction_With_128FrameDelay

	@C4D5:
	rts

	@C4D6:
	 lda PPUdesiredRegister2000
	and #$FE
	sta PPUdesiredRegister2000
	lda #$04
	jsr SwitchBank_NewPage
	jsr Display_PrologueTextPart2
	dec Ending_TypeDependingOnDays
	ldx #$01
	stx CurrentPlotAction
	rts
;------------------------------------------
_func_1C4EC:
	ldx #$00
	stx TimeRelated2A
	inx
	stx TimeRelated2B
	rts
;------------------------------------------
LetSimonContinueAfterDeath:
	lda CurrentXScrollingPositionPixels_BackupForDeath
	sta CurrentXScrollingPositionPixels
	lda CurrentXScrollingPositionScreens_BackupForDeath
	sta CurrentXScrollingPositionScreens
	lda CurrentYScrollingPositionPixels_Mod240_BackupForDeath
	sta CurrentYScrollingPositionPixels_Mod240
	lda Current_WhatUnknown57_BackupForDeath
	sta Current_WhatUnknown57
	lda SimonScreenXCoord_BackupForDeath
	sta ObjectScreenXCoord
	lda SimonScreenYCoord_BackupForDeath
	sta ObjectScreenYCoord
	lda CurrentLevelMapType_BackupForDeath
	sta CurrentLevelMapType
	lda CurrentLevelSceneNumber_BackupForDeath
	sta CurrentLevelSceneNumber
	lda CurrentLevelSubroomNumber_BackupForDeath
	sta CurrentLevelSubRoomNumber
	jsr _func_1C530
	lda #$FF
	sta $018F
	lda CurrentMaxHP
	sta CurrentHP
	rts
;------------------------------------------
_func_1C530:
	lda #$00
	sta DeathStateRelatedFlagMaybe
	sta Unknown41
	sta ObjectCurrentActionType
	sta ObjectDialogStatusFlag
	sta GameInDeathState
	sta $24
	sta Unknown42
	sta UnknownFlag0446
	lda #$78
	sta ObjectStunCounter
	rts
;------------------------------------------
InitializeGameVariablesForBeginning:
	jsr ResetAllRAM_from_1D_to_98_and_300_to_6FF
	lda #$00
	sta $1E
	lda #$03
	sta RemainingLives
	jsr ResetSimonTo_80BD_Hour12
	lda #$50
	sta HeartsDigits0011
	lda #$30
	sta CurrentHP
	sta CurrentMaxHP
	rts
;------------------------------------------
ResetSimonTo_80BD_Hour12:
	lda #$80
	sta ObjectScreenXCoord
	lda #$BD
	sta ObjectScreenYCoord
	lda #$12
	sta CurrentHourBCD
	lda #$00
	sta $018F
	rts
;------------------------------------------
_func_1C578:
	jsr ResetPPUtoKnownState
	ldx #$00
	txa
	@C57E:
	sta ClearedFakeBlockListY,x
	inx
	cpx #$15
	bcc @C57E
	lda #$05
	sta TempPtr00_hi
	lda #$00
	sta TempPtr00_lo
	ldy #$20
	ldx #$07
	jmp _loc_1C5AD
;------------------------------------------
ResetAllRAM_from_1D_to_98_and_300_to_6FF:
	ldx #$1D
	jsr ResetPPUtoKnownState
	@C59A:
	sta TempPtr00_lo,x
	inx
	cpx #$99
	bne @C59A
ResetAllRAM_from_300_to_6FF:
	lda #$00
	ldx #$07
	ldy #$03
	sty TempPtr00_hi
	sta TempPtr00_lo
	ldy #$00
_loc_1C5AD:
	sta (TempPtr00_lo),y
	iny
	bne _loc_1C5AD
	inc TempPtr00_hi
	cpx TempPtr00_hi
	bne _loc_1C5AD
	jmp _func_1C0A8
;------------------------------------------
JumpWithParams:
	asl a
	stx TempPtr02_hi
	sty TempPtr02_lo
	tay
	iny
	pla
	sta TempPtr00_lo
	pla
	sta TempPtr00_hi
	lda (TempPtr00_lo),y
	tax
	iny
	lda (TempPtr00_lo),y
	sta TempPtr00_hi
	stx TempPtr00_lo
	ldy TempPtr02_lo
	ldx TempPtr02_hi
	jmp (TempPtr00_lo)
Inc16bitPointerAtX_by_A:
	clc
	adc TempPtr00_lo,x
	sta TempPtr00_lo,x
	bcc @C5E2
	inc TempPtr00_hi,x
	@C5E2:
	rts
;------------------------------------------
Dec16bitPointerAtX_by_A:
	eor #$FF
	sec
	adc TempPtr00_lo,x
	sta TempPtr00_lo,x
	bcs @C5EE
	dec TempPtr00_hi,x
	@C5EE:
	rts
;------------------------------------------
ClearMemory_300_to_3C5:
	lda #$00
	ldx #$03
	ldy #$C5
	bne ClearMemory_XA_Ybytes
;------------------------------------------
ClearMemory_XA_256bytes_unused:
	ldy #$FF
	bne ClearMemory_XA_Ybytes
;------------------------------------------
ClearMemory_20_to_97_UNUSED:
	lda #$20
	ldy #$77
	bne ClearMemory_X00_Ybytes_UNUSED
;------------------------------------------
ClearMemory_30_to_97_UNUSED:
	lda #$30
	ldy #$67
ClearMemory_X00_Ybytes_UNUSED:
	ldx #$00
ClearMemory_XA_Ybytes:
	sta TempPtr00_lo
	stx TempPtr00_hi
	lda #$00
	@C60D:
	sta (TempPtr00_lo),y
	dey
	cpy #$FF
	bne @C60D
	rts
;------------------------------------------
RenderHPbar:
	lda CurrentMaxHP
	jsr Math_divAby16
	sta TempPtr00_lo
	lda #$10
	sta TempPtr00_hi
	ldx #$00
	lda CurrentHP
	jsr Math_divAby16
	tay
	@C628:
	beq @C650
	lda TempPtr00_hi
	jsr AppendSpriteTableByte
	lda #$61
	jsr AppendSpriteTableByte
	lda #$00
	jsr AppendSpriteTableByte
	lda #$10
	jsr AppendSpriteTableByte
	lda TempPtr00_hi
	clc
	adc #$10
	sta TempPtr00_hi
	dec TempPtr00_lo
	bne @C64C
	jmp @C692

	@C64C:
	dey
	jmp @C628

	@C650:
	 ldy #$00
	lda CurrentHP
	and #$0F
	beq @C66C
	iny
	iny
	cmp #$05
	bcc @C66C
	iny
	iny
	cmp #$09
	bcc @C66C
	iny
	iny
	cmp #$0D
	bcc @C66C
	iny
	iny
	@C66C:
	  lda TempPtr00_hi
	jsr AppendSpriteTableByte
	lda _data_1C693_indexed,y
	jsr AppendSpriteTableByte
	lda _data_1C694_indexed,y
	jsr AppendSpriteTableByte
	lda #$10
	jsr AppendSpriteTableByte
	lda TempPtr00_hi
	clc
	adc #$10
	sta TempPtr00_hi
	dec TempPtr00_lo
	beq @C692
	ldy #$00
	jmp @C66C

	@C692:
	  rts
;------------------------------------------
_data_1C693_indexed:
	.byte $61
_data_1C694_indexed:
	.byte $01,$63,$01,$65,$80,$63,$80,$61,$00
AppendSpriteTableByte:
	sta $0200,x
	inx
	rts
;------------------------------------------
TitleScreen_ClearAndRender:
	jsr ClearMemory_300_to_3C5
	lda #$1E
	sta PPUdesiredRegister2001
	ldx #$02
	jsr PPU_DirectToPPU_Data_ExtractAndSend_ScreenXdiv2
	lda #$06
	jsr PPU_Text_ExtractAndSend_With_01prefix
	rts
;------------------------------------------
PPU_DirectToPPU_Data_ExtractAndSend_Screen0_Blank:
	ldx #$00
PPU_DirectToPPU_Data_ExtractAndSend_ScreenXdiv2:
	lda PPU_DirectToPPU_Data_ScreensList,x
	sta TempPtr00_lo
	lda PPU_DirectToPPU_Data_ScreensList+1,x
	sta TempPtr00_hi
	jsr ResetPPUtoKnownState
	sta PPUsendQueueHead
	sta PPUscrollingPositionHi
	sta PPUscrollingPositionLo
	@C6C9:
	   lda $2002
	ldy #$01
	lda (TempPtr00_lo),y
	sta $2006
	dey
	lda (TempPtr00_lo),y
	sta $2006
	ldx #$00
	lda #$02
	jsr Inc16bitPointerAtX_by_A
	@C6E0:
	  ldy #$00
	lda (TempPtr00_lo),y
	cmp #$FF
	beq @C726
	cmp #$7F
	beq @C71E
	tay
	bpl @C70C
	and #$7F
	sta TempPtr02_lo
	ldy #$01
	@C6F5:
	lda (TempPtr00_lo),y
	sta $2007
	cpy TempPtr02_lo
	beq @C701
	iny
	bne @C6F5
	@C701:
	lda #$01
	clc
	adc TempPtr02_lo
	@C706:
	 jsr Inc16bitPointerAtX_by_A
	jmp @C6E0

	@C70C:
	 ldy #$01
	sta TempPtr02_lo
	lda (TempPtr00_lo),y
	ldy TempPtr02_lo
	@C714:
	sta $2007
	dey
	bne @C714
	lda #$02
	bne @C706

	@C71E:
	  lda #$01
	jsr Inc16bitPointerAtX_by_A
	jmp @C6C9

	@C726:
	   jmp _func_1C0A8
;------------------------------------------
PPU_DirectToPPU_Data_ScreensList:
	.word (PPU_DirectToPPU_Data_ScreensList_0_blank) ;C735 (1C735) ([8:8][A:9])
	.word (PPU_DirectToPPU_Data_ScreensList_1_title) ;8000 (10000) ([8:8][A:9])
	.word (PPU_DirectToPPU_Data_ScreensList_2) ;A88C (1288C) ([8:8][A:9])
	.word (PPU_DirectToPPU_Data_ScreensList_3_passwordentry) ;B328 (13328) ([8:8][A:9])
	.word (PPU_DirectToPPU_Data_ScreensList_4_yourpassword) ;B621 (13621) ([8:8][A:9])
	.word (PPU_DirectToPPU_Data_ScreensList_5_mainmenu) ;B8EA (138EA) ([8:8][A:9])
PPU_DirectToPPU_Data_ScreensList_0_blank:
	.byte $00,$20,$78,$00,$78,$00,$78,$00,$78,$00,$78,$00,$78,$00,$78,$00
	.byte $78,$00,$40,$00,$7F,$00,$24,$78,$00,$78,$00,$78,$00,$78,$00,$78
	.byte $00,$78,$00,$78,$00,$78,$00,$40,$00,$FF
_func_1C75F:
	lda SwampFlashCounter
	beq @C79F
	and #$7F
	tay
	dey
	beq @C797
	sty SwampFlashCounter
	lda FrameCounter
	and #$03
	bne @C79F
	ldx PPUsendQueueHead
	sta Unknown10_CollisionAndScrollingTemp
	jsr LoadAndApplyCurrentLevelPalette
	lda FrameCounter
	and #$08
	beq @C790
	ldx Unknown10_CollisionAndScrollingTemp
	lda #$15
	sta $0704,x
	sta $0708,x
	sta $070C,x
	sta $0710,x
	@C790:
	lda SwampFlashCounter
	ora #$80
	bne @C79C
	@C797:
	 jsr LoadAndApplyCurrentLevelPalette
	lda #$00
	@C79C:
	  sta SwampFlashCounter
	@C79F:
	   rts
;------------------------------------------
LightsOut:
	ldx PPUsendQueueHead
	stx $17
	jsr LoadAndApplyCurrentLevelPalette
	lda $17
	clc
	adc #$04
	tax
	lda #$08
	sta $06
	@C7B1:
	 lda #$03
	sta Temp07
	@C7B5:
	lda PPUsendQueue,x
	and #$0F
	ora DayNightTransition_PaletteBitmask
	cmp PPUsendQueue,x
	bcs @C7C4
	sta PPUsendQueue,x
	@C7C4:
	inx
	dec Temp07
	bne @C7B5
	inx
	dec $06
	bne @C7B1
	rts
;------------------------------------------
LoadCurrentLevelPalettePointer:
                            ; Loads the pointer to palette for current room according to current values of $30,$50,$51 and IsNightTime.:
                            ; Output: $08,y  Pointer to two PPU_Text indexes in page 2 (some are in common page).:
                            ; The first number (lda $08,y) is the background palette.:
                            ; The second number (iny; lda $08,y) is the object palette.:
                            ; The palette strings are in page 4.:
	lda #$02
	jsr SwitchBank_NewPage
	lda CurrentLevelMapType
	asl a
	tay
	lda LevelData_Palettes,y
	sta TempPtr00_lo
	lda LevelData_Palettes+1,y
	sta TempPtr00_hi
	lda CurrentLevelSceneNumber
	asl a
	asl a
	tay
	lda IsNightTime
	beq @C7ED
	iny
	iny
	@C7ED:
	lda (TempPtr00_lo),y
	sta TempPtr08_lo
	iny
	lda (TempPtr00_lo),y
	sta TempPtr08_hi
	lda CurrentLevelSubRoomNumber
	and #$7F
	asl a
	tay
	rts
;------------------------------------------
LoadAndApplyCurrentLevelPalette:
	jsr LoadCurrentLevelPalettePointer
	sty Temp97
	lda #$0C
	jsr PPU_Text_ExtractAndSend_With_01prefix
	ldy Temp97
	jsr LoadAndApplyOnePalette
	lda #$0A
	jsr PPU_Text_ExtractAndSend
	lda #$02
	jsr SwitchBank_NewPage
	ldy Temp97
	iny
LoadAndApplyOnePalette:
	lda (TempPtr08_lo),y
	pha
	 lda #$04
	 jsr SwitchBank_NewPage
	pla
	jmp PPU_Text_ExtractAndSend
;------------------------------------------
UnusedC825:
	stx $04
	jsr PPU_Text_ExtractAndSend_With_01prefix
	lda $04
	bne PPU_Text_ExtractAndSend
PPU_Text_ExtractAndSend_With_01prefix:
	pha
	 lda #$02
	 sta TempPtr02_hi
	 lda #$01
	 jsr PPU_Text_ExtractAndSend_Finish_PutA
	pla
PPU_Text_ExtractAndSend:
	sta TempPtr02_lo
	asl a
	tax
	lda PPU_Text_StringsList,x
	sta TempPtr00_lo
	lda PPU_Text_StringsList+1,x
	sta TempPtr00_hi
	ldx PPUsendQueueHead
	ldy #$00
PPU_Text_ExtractAndSend_Loop:
	lda (TempPtr00_lo),y
	iny
	cmp #$FF
	beq PPU_Text_ExtractAndSend_Finish
	cmp #$FE
	beq PPU_Text_ExtractAndSend_FE_putsFF_finish
	cmp #$FD
	beq PPU_Text_ExtractAndSend_FD_putsFF_and_01
	sta PPUsendQueue,x
	lda TempPtr02_lo
	bpl @C86F
	lda TempPtr02_hi
	bne @C86D
	lda #$C1
	sta PPUsendQueue,x
	jmp @C86F

	@C86D:
	dec TempPtr02_hi
	@C86F:
	 inx
	bne PPU_Text_ExtractAndSend_Loop
PPU_Text_ExtractAndSend_FE_putsFF_finish:
	lda #$FF
	bne PPU_Text_ExtractAndSend_Finish_PutA_at_X
;------------------------------------------
PPU_Text_ExtractAndSend_FD_putsFF_and_01:
	lda #$FF
	jsr PPU_Text_ExtractAndSend_Finish_PutA_at_X
	lda #$02
	sta TempPtr02_hi
	lda #$01
	jsr PPU_Text_ExtractAndSend_Finish_PutA_at_X
	bne PPU_Text_ExtractAndSend_Loop
PPU_Text_PutFF:
	lda #$FF
	bne PPU_Text_ExtractAndSend_Finish_PutA
;------------------------------------------
PPU_Text_ExtractAndSend_Finish_Put00:
	lda #$00
PPU_Text_ExtractAndSend_Finish_PutA:
	ldx PPUsendQueueHead
PPU_Text_ExtractAndSend_Finish_PutA_at_X:
	sta PPUsendQueue,x
	inx
PPU_Text_ExtractAndSend_Finish:
	stx PPUsendQueueHead
	rts
;------------------------------------------
PPU_Text_StringsList:
	.word (PPU_Text_StringsList_00_bank4_PushStartKey) ;840C (1040C) ([8:8][A:9])
	.word (TempPtr00_lo) ;0 (0) ([8:8][A:9])
	.word (TempPtr00_lo) ;0 (0) ([8:8][A:9])
	.word (TempPtr00_lo) ;0 (0) ([8:8][A:9])
	.word (PPU_Text_StringsList_04_bank7_unknown228A) ;C9D6 (1C9D6) ([8:8][A:9])
	.word (PPU_Text_StringsList_05_bank7_Palette3F00_unknown) ;CADA (1CADA) ([8:8][A:9])
	.word (PPU_Text_StringsList_06_bank7_TitleScreenPalette) ;CAB7 (1CAB7) ([8:8][A:9])
	.word (PPU_Text_StringsList_07_bank7_GameOver_Continue_Password) ;C96B (1C96B) ([8:8][A:9])
	.word (PPU_Text_StringsList_08_bank7_unknown2284) ;C9CD (1C9CD) ([8:8][A:9])
	.word (PPU_Text_StringsList_09_bank4_ProloguePart1) ;8356 (10356) ([8:8][A:9])
	.word (PPU_Text_StringsList_0A_bank7_ObjectPalette_First8entries_ForInGame) ;CAAE (1CAAE) ([8:8][A:9])
	.word (PPU_Text_StringsList_0B_bank7_GameStart_Player) ;C953 (1C953) ([8:8][A:9])
	.word (PPU_Text_StringsList_0C_bank7_Palette3F00_0bytes) ;CAAB (1CAAB) ([8:8][A:9])
	.word (PPU_Text_StringsList_0D_bank4_palettesWithoutPrefix) ;9F33 (11F33) ([8:8][A:9])
	.word (PPU_Text_StringsList_0E_bank4_palettesWithoutPrefix) ;9F44 (11F44) ([8:8][A:9])
	.word (PPU_Text_StringsList_0F_bank4_palettesWithoutPrefix) ;9F5E (11F5E) ([8:8][A:9])
	.word (PPU_Text_StringsList_10_bank4_palettesWithoutPrefix) ;9F78 (11F78) ([8:8][A:9])
	.word (PPU_Text_StringsList_11and12_bank4_palettesWithoutPrefix) ;9F92 (11F92) ([8:8][A:9])
	.word (PPU_Text_StringsList_11and12_bank4_palettesWithoutPrefix) ;9F92 (11F92) ([8:8][A:9])
	.word (PPU_Text_StringsList_13_bank4_palettesWithoutPrefix) ;9FAC (11FAC) ([8:8][A:9])
	.word (PPU_Text_StringsList_14_bank4_palettesWithoutPrefix) ;9E80 (11E80) ([8:8][A:9])
	.word (PPU_Text_StringsList_15_bank4_palettesWithoutPrefix) ;9E91 (11E91) ([8:8][A:9])
	.word (PPU_Text_StringsList_16_bank4_palettesWithoutPrefix) ;9EA2 (11EA2) ([8:8][A:9])
	.word (PPU_Text_StringsList_17_bank4_palettesWithoutPrefix) ;9EB3 (11EB3) ([8:8][A:9])
	.word (PPU_Text_StringsList_18_bank4_palettesWithoutPrefix) ;9EC4 (11EC4) ([8:8][A:9])
	.word (PPU_Text_StringsList_19_bank4_palettesWithoutPrefix) ;9ED5 (11ED5) ([8:8][A:9])
	.word (PPU_Text_StringsList_1A_bank4_palettesWithoutPrefix) ;9EE6 (11EE6) ([8:8][A:9])
	.word (PPU_Text_StringsList_1B_bank4_palettesWithoutPrefix) ;9EF7 (11EF7) ([8:8][A:9])
	.word (PPU_Text_StringsList_1C_bank4_palettesWithoutPrefix) ;9F08 (11F08) ([8:8][A:9])
	.word (PPU_Text_StringsList_1D_bank4_palettesWithoutPrefix) ;9F19 (11F19) ([8:8][A:9])
	.word (PPU_Text_StringsList_1E_bank7_Palette3F00_16bytes) ;CAE0 (1CAE0) ([8:8][A:9])
	.word (PPU_Text_StringsList_1F_bank7_palettesWithoutPrefix) ;CAF3 (1CAF3) ([8:8][A:9])
	.word (PPU_Text_StringsList_20_bank7_palettesWithoutPrefix) ;CB04 (1CB04) ([8:8][A:9])
	.word (PPU_Text_StringsList_21_bank7_palettesWithoutPrefix) ;CB15 (1CB15) ([8:8][A:9])
	.word (PPU_Text_StringsList_22_bank4_palettesWithoutPrefix) ;9FC6 (11FC6) ([8:8][A:9])
	.word (PPU_Text_StringsList_23_bank4_palettesWithoutPrefix) ;9FD7 (11FD7) ([8:8][A:9])
	.word (PPU_Text_StringsList_24_bank4_palettesWithoutPrefix) ;9FE8 (11FE8) ([8:8][A:9])
	.word (PPU_Text_StringsList_25_bank4_palettesWithoutPrefix) ;9FF9 (11FF9) ([8:8][A:9])
	.word (PPU_Text_StringsList_26_bank4_palettesWithoutPrefix) ;A00A (1200A) ([8:8][A:9])
	.word (PPU_Text_StringsList_27_bank4_palettesWithoutPrefix) ;A01B (1201B) ([8:8][A:9])
	.word (PPU_Text_StringsList_28_bank4_palettesWithoutPrefix) ;A02C (1202C) ([8:8][A:9])
	.word (PPU_Text_StringsList_29_bank4_palettesWithoutPrefix) ;A03D (1203D) ([8:8][A:9])
	.word (PPU_Text_StringsList_2A_bank4_palettesWithoutPrefix) ;A04E (1204E) ([8:8][A:9])
	.word (PPU_Text_StringsList_2B_bank4_palettesWithoutPrefix) ;A05F (1205F) ([8:8][A:9])
	.word (PPU_Text_StringsList_2C_bank4_palettesWithoutPrefix) ;A070 (12070) ([8:8][A:9])
	.word (PPU_Text_StringsList_2D_bank4_palettesWithoutPrefix) ;A081 (12081) ([8:8][A:9])
	.word (PPU_Text_StringsList_2E_bank4_palettesWithoutPrefix) ;9F2A (11F2A) ([8:8][A:9])
	.word (PPU_Text_StringsList_2F_bank7_palettesWithoutPrefix) ;CB26 (1CB26) ([8:8][A:9])
	.word (PPU_Text_StringsList_30_bank7_palettesWithoutPrefix) ;CB2F (1CB2F) ([8:8][A:9])
	.word (PPU_Text_StringsList_31_bank7_palettesWithoutPrefix) ;CB38 (1CB38) ([8:8][A:9])
	.word (PPU_Text_StringsList_32_bank7_palettesWithoutPrefix) ;CB41 (1CB41) ([8:8][A:9])
	.word (PPU_Text_StringsList_33_bank7_palettesWithoutPrefix) ;CB4A (1CB4A) ([8:8][A:9])
	.word (PPU_Text_StringsList_34_bank7_palettesWithoutPrefix) ;CB53 (1CB53) ([8:8][A:9])
	.word (PPU_Text_StringsList_35_bank4_palettesWithoutPrefix) ;A0C5 (120C5) ([8:8][A:9])
	.word (PPU_Text_StringsList_36_bank4_palettesWithoutPrefix) ;A0CE (120CE) ([8:8][A:9])
	.word (PPU_Text_StringsList_37_bank7_palettesWithoutPrefix) ;CB5C (1CB5C) ([8:8][A:9])
	.word (PPU_Text_StringsList_38_bank4_palettesWithoutPrefix) ;A0D7 (120D7) ([8:8][A:9])
	.word (PPU_Text_StringsList_39_bank7_unknown2284) ;C98D (1C98D) ([8:8][A:9])
	.word (PPU_Text_StringsList_3A_bank7_unknown2284) ;C9A0 (1C9A0) ([8:8][A:9])
	.word (PPU_Text_StringsList_3B_bank7_unknown2284) ;C9B4 (1C9B4) ([8:8][A:9])
	.word (PPU_Text_StringsList_3C_bank4_palettesWithoutPrefix) ;A092 (12092) ([8:8][A:9])
	.word (PPU_Text_StringsList_3D_bank4_palettesWithoutPrefix) ;A0A3 (120A3) ([8:8][A:9])
	.word (PPU_Text_StringsList_3E_bank4_palettesWithoutPrefix) ;A0B4 (120B4) ([8:8][A:9])
	.word (PPU_Text_StringsList_3F_bank4_palettesWithoutPrefix) ;A0E0 (120E0) ([8:8][A:9])
	.word (PPU_Text_StringsList_40_bank4_palettesWithoutPrefix) ;A0F1 (120F1) ([8:8][A:9])
	.word (PPU_Text_StringsList_41_bank4_palettesWithoutPrefix) ;A102 (12102) ([8:8][A:9])
	.word (PPU_Text_StringsList_42_bank4_palettesWithoutPrefix) ;A113 (12113) ([8:8][A:9])
	.word (PPU_Text_StringsList_43_bank4_palettesWithoutPrefix) ;A124 (12124) ([8:8][A:9])
	.word (PPU_Text_StringsList_44_bank4_palettesWithoutPrefix) ;A135 (12135) ([8:8][A:9])
	.word (PPU_Text_StringsList_45_bank4_palettesWithoutPrefix) ;A13E (1213E) ([8:8][A:9])
	.word (PPU_Text_StringsList_46_bank4_palettesWithoutPrefix) ;A147 (12147) ([8:8][A:9])
	.word (PPU_Text_StringsList_47_bank4_palettesWithoutPrefix) ;9F55 (11F55) ([8:8][A:9])
	.word (PPU_Text_StringsList_48_bank4_palettesWithoutPrefix) ;9F6F (11F6F) ([8:8][A:9])
	.word (PPU_Text_StringsList_49_bank4_palettesWithoutPrefix) ;9F89 (11F89) ([8:8][A:9])
	.word (PPU_Text_StringsList_4A_bank4_palettesWithoutPrefix) ;9FA3 (11FA3) ([8:8][A:9])
	.word (PPU_Text_StringsList_4B_bank4_palettesWithoutPrefix) ;9FBD (11FBD) ([8:8][A:9])
	.word (PPU_Text_StringsList_4C_bank4_palettesWithoutPrefix) ;A161 (12161) ([8:8][A:9])
	.word (PPU_Text_StringsList_4D_bank4_Palette3F00_16bytes) ;A7B1 (127B1) ([8:8][A:9])
	.word (PPU_Text_StringsList_4E_bank4_Palette3F00_32bytes) ;A7C4 (127C4) ([8:8][A:9])
	.word (PPU_Text_StringsList_4F_bank4_Palette3F00_32bytes) ;A7E7 (127E7) ([8:8][A:9])
	.word (PPU_Text_StringsList_50_bank4_Palette3F00_16bytes) ;A80A (1280A) ([8:8][A:9])
	.word (PPU_Text_StringsList_51_bank4_Palette3F00_16bytes) ;A81D (1281D) ([8:8][A:9])
	.word (PPU_Text_StringsList_52_bank4_Palette3F00_16bytes) ;A830 (12830) ([8:8][A:9])
	.word (PPU_Text_StringsList_53_bank4_Palette3F00_16bytes) ;A843 (12843) ([8:8][A:9])
	.word (PPU_Text_StringsList_54_bank4_Palette3F00_16bytes) ;A856 (12856) ([8:8][A:9])
	.word (PPU_Text_StringsList_55_bank4_Palette3F00_32bytes) ;A869 (12869) ([8:8][A:9])
	.word (PPU_Text_StringsList_56_bank4_ProloguePart2) ;8392 (10392) ([8:8][A:9])
	.word (PPU_Text_StringsList_57_bank4_palettesWithoutPrefix) ;A150 (12150) ([8:8][A:9])
	.word (PPU_Text_StringsList_58_bank7_PleaseWait) ;C9BF (1C9BF) ([8:8][A:9])
	.word (PPU_Text_StringsList_59_bank7_PasswordError) ;C9EA (1C9EA) ([8:8][A:9])
	.word (PPU_Text_StringsList_5A_bank7_EntryCompleted) ;CA04 (1CA04) ([8:8][A:9])
	.word (PPU_Text_StringsList_5B_bank7_EnterYourPassword) ;CA1E (1CA1E) ([8:8][A:9])
	.word (PPU_Text_StringsList_5C_bank7_Palette3F00_32bytes) ;CA37 (1CA37) ([8:8][A:9])
	.word (PPU_Text_StringsList_5D_bank7_Palette3F00_32bytes) ;CA5A (1CA5A) ([8:8][A:9])
	.word (PPU_Text_StringsList_5E_bank7_Palette3F00_32bytes) ;CA7D (1CA7D) ([8:8][A:9])
PPU_Text_StringsList_0B_bank7_GameStart_Player:
	.byte $21,$CB,$07,$01,$0D,$05,$00,$13,$14,$01,$12,$14,$FD,$22,$2B,$10
	.byte $0C,$01,$19,$05,$12,$00,$00,$FE
PPU_Text_StringsList_07_bank7_GameOver_Continue_Password:
	.byte $21,$CB,$07,$01,$0D,$05,$00,$0F,$16,$05,$12,$FD,$22,$2D,$03,$0F
	.byte $0E,$14,$09,$0E,$15,$05,$FD,$22,$8D,$10,$01,$13,$13,$17,$0F,$12
	.byte $04,$FE
PPU_Text_StringsList_39_bank7_unknown2284:
	.byte $22,$84,$04,$46,$22,$2E,$2D,$00,$0E,$33,$14,$0C,$13,$08,$10,$35
	.byte $0B,$02,$FE
PPU_Text_StringsList_3A_bank7_unknown2284:
	.byte $22,$84,$1B,$35,$46,$22,$2E,$2D,$00,$0E,$33,$14,$0C,$13,$08,$10
	.byte $35,$0B,$02,$FE
PPU_Text_StringsList_3B_bank7_unknown2284:
	.byte $22,$84,$05,$1F,$11,$08,$10,$35,$0B,$02,$FE
PPU_Text_StringsList_58_bank7_PleaseWait:
	.byte $22,$84,$10,$0C,$05,$01,$13,$05,$00,$17,$01,$09,$14,$FE
PPU_Text_StringsList_08_bank7_unknown2284:
	.byte $22,$84,$04,$27,$46,$00,$00,$00,$FE
PPU_Text_StringsList_04_bank7_unknown228A:
	.byte $22,$8A,$D3,$D8,$D6,$CB,$00,$D6,$D7,$C4,$D5,$D7,$00,$C5,$D8,$D7
	.byte $D7,$DE,$D2,$FE
PPU_Text_StringsList_59_bank7_PasswordError:
	.byte $20,$CC,$00,$00,$0D,$09,$13,$13,$00,$00,$00,$00,$FD,$21,$0C,$00
	.byte $05,$0E,$14,$12,$19,$29,$2A,$00,$00,$FE
PPU_Text_StringsList_5A_bank7_EntryCompleted:
	.byte $20,$CC,$00,$00,$05,$0E,$14,$12,$19,$00,$00,$00,$FD,$21,$0C,$03
	.byte $0F,$0D,$10,$0C,$05,$14,$05,$04,$7D,$FE
PPU_Text_StringsList_5B_bank7_EnterYourPassword:
	.byte $20,$CC,$05,$0E,$14,$05,$12,$7E,$7F,$80,$81,$82,$FD,$21,$0C,$10
	.byte $01,$13,$13,$17,$0F,$12,$04,$7D,$FE
PPU_Text_StringsList_5C_bank7_Palette3F00_32bytes:
	.byte $3F,$00,$0F,$00,$03,$20,$0F,$00,$1B,$10,$0F,$09,$10,$23,$0F,$23
	.byte $03,$13,$0F,$15,$26,$20,$0F,$15,$2C,$16,$0F,$15,$26,$30,$0F,$15
	.byte $30,$30,$FE
PPU_Text_StringsList_5D_bank7_Palette3F00_32bytes:
	.byte $3F,$00,$0F,$00,$03,$20,$0F,$00,$1B,$10,$0F,$28,$18,$08,$0F,$23
	.byte $03,$13,$0F,$15,$26,$20,$0F,$15,$2C,$16,$0F,$15,$26,$30,$0F,$15
	.byte $30,$30,$FE
PPU_Text_StringsList_5E_bank7_Palette3F00_32bytes:
	.byte $3F,$00,$0F,$28,$0A,$20,$0F,$00,$0C,$10,$0F,$28,$0A,$0C,$0F,$28
	.byte $18,$0C,$0F,$15,$26,$16,$0F,$15,$2C,$16,$0F,$15,$26,$16,$0F,$15
	.byte $30,$16,$FE
UnknownData1CAA0:
	.byte $21,$E9,$14,$35,$27,$07,$31,$27,$00,$38,$FE
PPU_Text_StringsList_0C_bank7_Palette3F00_0bytes:
	.byte $3F,$00,$FF
PPU_Text_StringsList_0A_bank7_ObjectPalette_First8entries_ForInGame:
	.byte $0F,$0F,$16,$20,$0F,$27,$20,$16,$FF
PPU_Text_StringsList_06_bank7_TitleScreenPalette:
	.byte $3F,$00,$0F,$28,$0A,$0C,$0F,$28,$16,$0C,$0F,$10,$16,$28,$0F,$00
	.byte $05,$27,$0F,$15,$15,$15,$0F,$15,$15,$15,$0F,$15,$15,$15,$0F,$15
	.byte $15,$15,$FD
PPU_Text_StringsList_05_bank7_Palette3F00_unknown:
	.byte $3F,$00,$FD,$00,$00,$FE
PPU_Text_StringsList_1E_bank7_Palette3F00_16bytes:
	.byte $3F,$00,$0F,$20,$20,$20,$0F,$20,$20,$20,$0F,$20,$20,$20,$0F,$20
	.byte $20,$20,$FE
PPU_Text_StringsList_1F_bank7_palettesWithoutPrefix:
	.byte $0F,$00,$3B,$0A, $0F,$16,$1A,$06, $0F,$22,$20,$1A, $0F,$11,$20,$15
	.byte $FF
PPU_Text_StringsList_20_bank7_palettesWithoutPrefix:
	.byte $0F,$00,$3B,$0A, $0F,$17,$1C,$07, $0F,$23,$20,$1C, $0F,$11,$20,$15
	.byte $FF
PPU_Text_StringsList_21_bank7_palettesWithoutPrefix:
	.byte $0F,$00,$2B,$0B, $0F,$11,$1C,$01, $0F,$02,$13,$0C, $0F,$01,$31,$05
	.byte $FF
PPU_Text_StringsList_2F_bank7_palettesWithoutPrefix:
	.byte $0F,$15,$35,$0F, $0F,$21,$20,$0F, $FE
PPU_Text_StringsList_30_bank7_palettesWithoutPrefix:
	.byte $0F,$16,$36,$0F, $0F,$23,$20,$0F, $FE
PPU_Text_StringsList_31_bank7_palettesWithoutPrefix:
	.byte $0F,$17,$37,$0F, $0F,$00,$20,$0F, $FE
PPU_Text_StringsList_32_bank7_palettesWithoutPrefix:
	.byte $0F,$14,$34,$0F, $0F,$23,$20,$0F, $FE
PPU_Text_StringsList_33_bank7_palettesWithoutPrefix:
	.byte $0F,$18,$38,$0F, $0F,$17,$20,$0F, $FE
PPU_Text_StringsList_34_bank7_palettesWithoutPrefix:
	.byte $0F,$1C,$3C,$0F, $0F,$17,$37,$0F, $FE
PPU_Text_StringsList_37_bank7_palettesWithoutPrefix:
	.byte $0F,$1A,$2A,$0F, $0F,$03,$20,$0F
_data_1CB64_indexed:
	.byte $FE,$00,$04,$00,$00
NMI_ProcessPPUsendQueue:
	ldy #$00
	sty TempPtr08_lo
	@CB6D:
	   lda TempPtr08_lo
	cmp #$3F
	bne @CB81
	sta $2006
	lda #$00
	sta $2006
	sta $2006
	sta $2006
	@CB81:
	    ldx PPUsendQueue,y
	beq @CBAE
	lda PPUdesiredRegister2000
	and #$18
	ora _data_1CB64_indexed,x
	sta $2000
	iny
	cpx #$04
	beq @CBE1
	lda $2002
	lda PPUsendQueue,y
	sta TempPtr08_lo
	sta $2006
	iny
	lda PPUsendQueue,y
	sta $2006
	iny
	cpx #$03
	beq @CBD1
	bne @CBC0
	
	@CBAE:
	; Done. Clear the queue.
	lda #$00
	sta PPUsendQueue
	sta PPUsendQueueHead
	lda PPUdesiredRegister2000
	sta $2000
	rts

	@CBBB:
	; Send literal FF
	lda #$FF
	@CBBD:
	sta $2007
	@CBC0:
	; Process FF-terminated string
	lda PPUsendQueue,y
	iny
	cmp #$FF
	bne @CBBD
	lda PPUsendQueue,y
	cmp #$05
	bcs @CBBB
	bcc @CB6D
	
	@CBD1:
	; Process $03 BEint16bitWord Count Byte
	ldx PPUsendQueue,y
	iny
	lda PPUsendQueue,y
	iny
	@CBD9:
	sta $2007
	dex
	bne @CBD9
	beq @CB6D
	
	@CBE1:
	; Process $04 BEint16bitWord BitNo Bits
	lda $2002
	lda PPUsendQueue,y
	sta TempPtr08_lo
	sta $2006
	lda $0701,y
	sta $2006
	lda $2007
	lda $2007
	ldx $0702,y
	and _data_1CC1E_indexed,x
	ora $0703,y
	sta TempPtr00_lo
	lda $2002
	lda PPUsendQueue,y
	sta $2006
	iny
	lda PPUsendQueue,y
	sta $2006
	lda TempPtr00_lo
	sta $2007
	iny
	iny
	iny
	jmp @CB81
;------------------------------------------
_data_1CC1E_indexed:
	.byte $FC,$F3,$CF,$3F,$F0,$0F
PlotAction05_RunGameMaybe:
	lda PlotAction05_GameLoop_WhichAction
	cmp #$03
	bne @CC35
	jsr RenderHPbar
	jsr GameLoop_CheckIfPauseEnteredOrActive
	lda GamePaused
	beq @CC35
	rts

	@CC35:
	lda PlotAction05_GameLoop_WhichAction
	jsr JumpWithParams
_JumpPointerTable_1CC3A:
	.word (PlotAction05_Action00_ShowGameBeginScreenWithRemainingLives) ;CC54 (1CC54) ()
	.word (PlotAction05_Action01_LevelLoad_ResetNPCs) ;CC7E (1CC7E) ()
	.word (PlotAction05_Action02_LevelLoad_Part2) ;CC9A (1CC9A) ()
	.word (PlotAction05_Action03_GameActive) ;CDD5 (1CDD5) ()
	.word (PlotAction05_Action04_NightTimeTransition_Begin) ;CEA2 (1CEA2) ()
	.word (PlotAction05_Action05_NightTimeTransition_FadeOutLoop) ;CEB8 (1CEB8) ()
	.word (PlotAction05_Action06_NightTimeTransition_Middle) ;CECF (1CECF) ()
	.word (PlotAction05_Action07_NightTimeTransition_FadeInLoop) ;CEF4 (1CEF4) ()
	.word (PlotAction05_Action08_RelocateSimonLevelBeginningMaybe) ;CF8C (1CF8C) ()
	.word (PlotAction05_Action09_EnterOrExitRoom) ;D03A (1D03A) ()
	.word (PlotAction05_Action0A_RelocateSimonLevelBeginningMaybe) ;D075 (1D075) ()
	.word (PlotAction05_Action0B) ;D003 (1D003) ()
	.word (PlotAction05_Action0C) ;CE79 (1CE79) ()
PlotAction05_Action00_ShowGameBeginScreenWithRemainingLives:
	lda #$00
	sta Mapper1reg_reg1
	lda #$01
	sta Mapper1reg_reg2
	jsr PPU_DirectToPPU_Data_ExtractAndSend_Screen0_Blank
	lda #$3C
	sta TimeRelated2A
	lda #$00
	sta TimeRelated2B
	inc PlotAction05_GameLoop_WhichAction
	lda #$1E
	jsr PPU_Text_ExtractAndSend_With_01prefix
	lda #$0B
	jsr PPU_Text_ExtractAndSend_With_01prefix
	lda RemainingLives
	clc
	adc #$36
	sta PPUsendQueueMinus2,x
	rts
;------------------------------------------
PlotAction05_Action01_LevelLoad_ResetNPCs:
	jsr _func_1C440
	bne _loc_1CC99
	jsr PPU_DirectToPPU_Data_ExtractAndSend_Screen0_Blank
	jsr _func_1D15B
	jsr _func_1E775
	jsr LoadAndApplyCurrentLevelPalette
	lda $018F
	bne @CC97
	jsr _func_1C578
	@CC97:
	inc PlotAction05_GameLoop_WhichAction
_loc_1CC99:
	rts
;------------------------------------------
PlotAction05_Action02_LevelLoad_Part2:
	jsr Check_UpdateScrolling_Maybe
	jsr _func_1E869
	jsr _func_1C0B3
	lda $65
	cmp #$10
	bne _loc_1CC99
	lda $018F
	beq @CCB6
	jsr _func_1D403
	lda #$00
	sta $018F
	@CCB6:
	jsr _func_1CD42
	jsr _func_1CDAE
	jsr DeleteAllMonstersExceptFerryManAndHisBoat
	jsr _func_1CDCA
	jsr _func_1CD01
	lda CurrentLevelMapType
	asl a
	tay
	lda LevelData_MapperConfigurations_VROMpage0,y
	sta Mapper1reg_reg1
	lda LevelData_MapperConfigurations_VROMpage1,y
	sta Mapper1reg_reg2
	lda CurrentLevelMapType
	cmp #$01
	bne @CCE6
	lda CurrentLevelSceneNumber
	cmp #$06
	bne @CCE6
	lda #$0A
	sta Mapper1reg_reg2
	@CCE6:
	inc PlotAction05_GameLoop_WhichAction
	rts
;------------------------------------------
LevelData_MapperConfigurations_VROMpage0:
	.byte $00
LevelData_MapperConfigurations_VROMpage1:
	.byte $01,$08,$09,$02,$03,$04,$05,$06,$07,$0B,$0C
SongTableDayNight:
	.byte $39,$41,$3D,$41,$3D,$41,$3D,$41,$3D,$41,$49,$49
_func_1CD01:
	ldy $24
	beq LoadAndPlayCurrentLevelSong
	dey
	beq @CD09
	rts

	@CD09:
	lda #$45
	sta $0F
	jmp _loc_1CD35
;------------------------------------------
LoadAndPlayCurrentLevelSong:
	lda CurrentLevelMapType
	cmp #$01
	bne @CD23
	lda TimeFlag8F_TimeIsStopped
	cmp #$81
	bne @CD23
	lda #$45
	sta $0F
	jmp _loc_1CD35

	@CD23:
	lda CurrentLevelMapType
	asl a
	tay
	lda IsNightTime
	beq @CD2C
	iny
	@CD2C:
	lda SongTableDayNight,y
	sta $0F
	cmp Sound_CurrentSongNumber_Channel2_triangle
	beq _CD3D
_loc_1CD35:
	jsr AnyBankTerminateSound
	lda $0F
	jsr AnyBankPlayTracks
	_CD3D:
	lda #$FF
	sta $24
	rts
;------------------------------------------
_func_1CD42:
	lda #$01
	jsr SwitchBank_NewPage
	ldx #$00
	stx Unknown04ED_finalConfrontationRelated
	ldy #$00
	lda CurrentLevelMapType
	beq _CDA0
	cmp #$01
	beq @CD5A
	ldy #$41
	bne _loc_1CD63

	@CD5A:
	ldy #$80
	lda CurrentLevelSceneNumber
	cmp #$06
	bcc _loc_1CD63
	iny
_loc_1CD63:
	sty TimeFlag8F_TimeIsStopped
	stx ScrollingIsLocked
	lda #$00
	sta KneelingCounter
	lda CurrentLevelMapType
	cmp #$02
	bne @CD7F
	lda CurrentLevelSceneNumber
	cmp #$02
	bcc @CD9A
	cmp #$06
	bcs @CD9A
	jmp _loc_2767

	@CD7F:
	cmp #$03
	bne @CD86
	jmp _loc_2D96

	@CD86:
	cmp #$05
	bne @CD9A
	lda CurrentLevelSubRoomNumber
	and #$7F
	beq @CD9A
	lda #$FF
	sta Unknown04ED_finalConfrontationRelated
	lda #$00
	sta $04A4
	@CD9A:
	 lda #$00
	sta Unknown194_PossiblyScrollingRelated
	rts

	_CDA0:
	  lda CurrentLevelSceneNumber
	cmp #$07
	bcc _loc_1CD63
	iny
	lda CurrentLevelSubRoomNumber
	bne _loc_1CD63
InhibitScrollingIf_Scene_00_07plus_00_ChurchesVendorsEtc:
	inx
	bne _loc_1CD63
_func_1CDAE:
	jsr DeleteAllMonstersExceptFerryManAndHisBoat
	lda #$01
_func_1CDB3:
	sta ActorSpawnControlUnknown3C
	lda #$01
	jsr SwitchBank_NewPage
	jsr Refresh_CurrentLevelData_Actors_Pointer
	ldx #$08
	lda #$00
	@CDC1:
	sta ObjectUnknown432,x
	inx
	cpx #$12
	bcc @CDC1
	rts
;------------------------------------------
_func_1CDCA:
	lda #$00
	sta $6B
	sta $67
	sta $68
	sta TimeRelated3F
	rts
;------------------------------------------
PlotAction05_Action03_GameActive:
	lda TimeRelated3F
	cmp #$FF

	beq _CE12
	lda TimeRelated3F
	bne Check_For_B_ButtonActivatedDialog
	@CDDF:
	 jsr AccumulateClockTime
	jsr _func_1C75F
	jsr Check_UpdateScrolling_Maybe
	jsr CheckKneelingWithCrystal_ThoseThreeLocations
	jsr Check_RunFinalConfrontationActions
	jsr _func_1D34C
	jsr _func_1DBB4
	jsr SpecialWeaponAI_Run
	jsr CheckIfNailHeld_WhipWallBreaking
	jsr _func_1E3A5
	jsr _func_1D2A1
	jsr Update_39_and_3B
	lda #$01
	jsr SwitchBank_NewPage
	jsr _func_4029
	jsr _func_419E
	jsr _func_463A
_loc_1CE11:
	rts

	_CE12:
	lda #$03
	jsr SwitchBank_NewPage
	jmp DialogChooseAndExecuteAction
;------------------------------------------
Check_For_B_ButtonActivatedDialog:
	lda DialogActivationState
	and #$E0
	cmp #$60
	beq @CE36
	cmp #$80
	beq @CE36
	lda Input_NewJoyButtonsWork
	and #$40
	bne @CE36
	lda TimeRelated3F
	sec
	sbc #$40
	sta TimeRelated3F
	jmp @CDDF

	@CE36:
	lda #$00
	sta DialogActionState
	lda #$FF
	sta TimeRelated3F
	sta GameInDeathState
_loc_1CE40:
	rts
;------------------------------------------
Check_RunFinalConfrontationActions:
	lda #$01
	jsr SwitchBank_NewPage
	lda Unknown04ED_finalConfrontationRelated
	beq _loc_1CE40
	jmp RunFinalConfrontationActions
;------------------------------------------
CheckKneelingWithCrystal_ThoseThreeLocations:
	lda #$01
	jsr SwitchBank_NewPage
	lda #$00
	sta Unknown195_PossiblyScrollingRelated
	lda CurrentLevelMapType
	cmp #$04
	bne @CE61
	jmp CheckKneelingWithRedCrystal

	@CE61:
	cmp #$02
	bne @CE72
	ldy CurrentLevelSceneNumber
	cpy #$02
	bcc _loc_1CE40
	cpy #$06
	bcs _loc_1CE40
	jmp CheckKneelingWithBlueCrystal_EnableScroll_YubaLake

	@CE72:
	cmp #$03
	bne _loc_1CE40
	jmp CheckKneelingWithBlueCrystal_EnableScroll_UtaLake
;------------------------------------------
PlotAction05_Action0C:
	jsr _func_1C440
	beq @CE9D
	lda CurrentXScrollingPositionPixels
	sta $06
	lda CurrentXScrollingPositionScreens
	sta Temp07
	lda FrameCounter
	and #$01
	asl a
	clc
	ldx #$53
	jsr Inc16bitPointerAtX_by_A
	jsr Check_UpdateScrolling_Maybe
	lda $06
	sta CurrentXScrollingPositionPixels
	lda Temp07
	sta CurrentXScrollingPositionScreens
	rts

	@CE9D:
	lda #$03
	sta PlotAction05_GameLoop_WhichAction
	rts
;------------------------------------------
PlotAction05_Action04_NightTimeTransition_Begin:
	lda TimeRelated3F
	beq @CEAE
	lda #$03
	jsr SwitchBank_NewPage
	jmp DayNightTransition_ShowDialog

	@CEAE:
	lda #$30
	sta DayNightTransition_PaletteBitmask
	lda #$10
	sta DayNightTransitionDelayCounter
	bne _loc_1CECC
;------------------------------------------
PlotAction05_Action05_NightTimeTransition_FadeOutLoop:
	lda DayNightTransitionDelayCounter
	beq @CEBF
	dec DayNightTransitionDelayCounter
	rts

	@CEBF:
	lda DayNightTransition_PaletteBitmask
	bmi @CEC8
	lda #$F0
	jmp DayNightTransition_GoNextPaletteFrame

	@CEC8:
	lda #$3C
	sta DayNightTransitionDelayCounter
_loc_1CECC:
	inc PlotAction05_GameLoop_WhichAction
	rts
;------------------------------------------
PlotAction05_Action06_NightTimeTransition_Middle:
	dec DayNightTransitionDelayCounter
	beq @CED8
	lda #$02
	sta ScreenBlankingCounter
	rts

	@CED8:
	lda IsNightTime
	eor #$01
	sta IsNightTime
	lda CurrentLevelMapType
	bne @CEE5
	jsr DeleteAllMonstersExceptFerryManAndHisBoat
	@CEE5:
	lda #$00
	jsr _func_1CDB3
	lda #$00
	sta DayNightTransition_PaletteBitmask
	lda #$00
	sta DayNightTransitionDelayCounter
	beq _loc_1CECC
;------------------------------------------
PlotAction05_Action07_NightTimeTransition_FadeInLoop:
	lda DayNightTransitionDelayCounter
	beq @CEFB
	dec DayNightTransitionDelayCounter
	rts

	@CEFB:
	lda DayNightTransition_PaletteBitmask
	cmp #$30
	beq @CF06
	lda #$10
	jmp DayNightTransition_GoNextPaletteFrame

	@CF06:
	jsr LoadAndApplyCurrentLevelPalette
	jsr LoadAndPlayCurrentLevelSong
	lda #$03
	sta PlotAction05_GameLoop_WhichAction
	rts
;------------------------------------------
DayNightTransition_GoNextPaletteFrame:
	pha
	 jsr LightsOut
	pla
	clc
	adc DayNightTransition_PaletteBitmask
	sta DayNightTransition_PaletteBitmask
	lda #$10
	sta DayNightTransitionDelayCounter
	rts

	_CF20:
	  ldx #$06
	@CF22:
	 lda ObjectType,x
	cmp #$3C
	beq @CF4B
	cmp #$3D
	beq @CF4B
	@CF2D:
	inx
	cpx #$12
	bcc @CF22
	lda Unknown04EC
	beq _CF93
	lda #$00
	sta Unknown04EC
	lda #$06
	sta CurrentLevelSceneNumber
	lda #$2D
	jsr AnyBankPlayTracks
	jsr _func_1D15B
	jmp @CFAA

	@CF4B:
	lda ObjectDialogStatusFlag,x
	and #$01
	beq @CF5F
	lda ObjectScreenXCoord,x
	cmp #$80
	bcs @CF5D
	lda #$01
	bne @CF5F

	@CF5D:
	lda #$FF
	@CF5F:
	 sta Temp93
	lda ObjectScreenXCoord
	sec
	sbc ObjectScreenXCoord,x
	sta Temp94
	lda #$00
	sbc Temp93
	sta Temp95
	lda CurrentLevelSubRoomNumber
	bmi @CF78
	lda #$10
	bne @CF7A

	@CF78:
	lda #$F0
	@CF7A:
	 sec
	sbc Temp94
	sta ObjectScreenXCoord,x
	lda #$00
	sbc Temp95
	and #$01
	sta ObjectDialogStatusFlag,x
	jmp @CF2D
;------------------------------------------
PlotAction05_Action08_RelocateSimonLevelBeginningMaybe:
	jsr PPU_DirectToPPU_Data_ExtractAndSend_Screen0_Blank
	ldy Unknown41
	bne _CF20
	_CF93:
	  lda CurrentLevelMapType
	cmp #$02
	bne @CFA7
	lda CurrentLevelSceneNumber
	cmp #$06
	bne @CFA7
	lda CurrentLevelSubRoomNumber
	cmp #$01
	bne @CFA7
	inc CurrentLevelSceneNumber
	@CFA7:
	jsr _func_1D136
	@CFAA:
	jsr _func_1E789
	lda ObjectCurrentActionType
	cmp #$0B
	bne @CFCE
	ldx #$06
	@CFB6:
	lda ObjectType,x
	cmp #$1C
	beq @CFC4
	inx
	cpx #$12
	bcc @CFB6
	bcs @CFCE
	@CFC4:
	lda #$00
	sta ObjectDialogStatusFlag,x
	lda #$EA
	sta ObjectScreenXCoord,x
	@CFCE:
	 lda CurrentLevelSubRoomNumber
	bmi @CFEE
	lda CurrentLevelMapType
	cmp #$05
	bne @CFE8
	lda #$00
	sta ObjectCurrentActionType
	sta ObjectYSpeed
	sta ObjectYSpeedFrac
	lda #$BD
	sta ObjectScreenYCoord
	@CFE8:
	ldy #$01
	lda #$10
	bne _loc_1CFF2

	@CFEE:
	 ldy #$00
	lda #$E9
_loc_1CFF2:
	sta ObjectScreenXCoord
	sty ObjectFacingLeft
	jsr LoadAndApplyCurrentLevelPalette
	jsr _func_1C578
	lda #$02
	sta PlotAction05_GameLoop_WhichAction
	rts
;------------------------------------------
PlotAction05_Action0B:
	jsr PPU_DirectToPPU_Data_ExtractAndSend_Screen0_Blank
	lda TimeFlag8F_TimeIsStopped
	eor #$01
	sta TimeFlag8F_TimeIsStopped
	lda TimeFlag8F_TimeIsStopped
	and #$01
	beq @D022
	jsr _func_1D136
	jsr _func_1E7C9
	lda #$01
	sta $24
	ldy #$01
	lda #$10
	bne _loc_1CFF2

	@D022:
	jsr _func_1D136
	jsr _func_1E7DD
	lda #$00
	sta $24
	lda SimonScreenYCoord_BackupForExitRoom
	sta ObjectScreenYCoord
	ldy #$01
	lda SimonScreenXCoord_BackupForExitRoom
	jmp _loc_1CFF2
;------------------------------------------
PlotAction05_Action09_EnterOrExitRoom:
	jsr PPU_DirectToPPU_Data_ExtractAndSend_Screen0_Blank
	lda TimeFlag8F_TimeIsStopped
	eor #$01
	sta TimeFlag8F_TimeIsStopped
	and #$01
	beq @D059
	jsr _func_1D136
	jsr _func_1E76B
	lda #$BD
	sta ObjectScreenYCoord
	ldy #$01
	lda #$10
	jmp _loc_1CFF2

	@D059:
	lda CurrentLevelSceneNumber_BackupForExitRoom
	sta CurrentLevelSceneNumber
	lda #$00
	sta CurrentLevelSubRoomNumber
	jsr _func_1D15B
	jsr _func_1E7DD
	lda SimonScreenYCoord_BackupForExitRoom
	sta ObjectScreenYCoord
	ldy #$01
	lda SimonScreenXCoord_BackupForExitRoom
	jmp _loc_1CFF2
;------------------------------------------
PlotAction05_Action0A_RelocateSimonLevelBeginningMaybe:
	jsr _func_1CD42
	lda #$00
	sta $24
	jsr _func_1D21C
	lda CurrentLevelMapType
	cmp #$01
	bne @D097
	lda #$00
	sta CurrentYScrollingPositionPixels_Mod240
	sta ObjectCurrentActionType
	sta ObjectYSpeed
	sta ObjectYSpeedFrac
	lda #$BD
	sta ObjectScreenYCoord
	@D097:
	lda CurrentLevelSubRoomNumber
	bpl @D0A7
	lda $89
	cmp #$80
	bne @D0A7
	jsr LoadLevelData_ScreenNumbers_PointerForCurrentLevelSceneNumber_Storeto02
	jsr _func_1D234
	@D0A7:
	jsr _func_1D15B
	ldx #$11
	jsr Object_Erase
	jmp @CFAA
;------------------------------------------
_loc_1D0B2:
	ldy #$06
	bne _D0B8
;------------------------------------------
_loc_1D0B6:
	ldy #$03
	_D0B8:
	lda (TempPtr02_lo),y
	cmp #$FF
	beq @D109
	cmp #$FC
	beq @D0F9
	cmp #$FB
	beq @D0E9
	cmp #$FA
	beq @D0D9
	iny
	iny
	lda (TempPtr02_lo),y
	sta CurrentLevelSceneNumber
	jsr _func_1D21C
	jsr _func_1D230
	jmp _loc_1D14C

	@D0D9:
	iny
	iny
	lda (TempPtr02_lo),y
	sta CurrentLevelSceneNumber
	jsr _func_1D21C
	lda #$01
	sta $89
	jmp _loc_1D14C

	@D0E9:
	 iny
	lda (TempPtr02_lo),y
	sta CurrentLevelSceneNumber
	iny
	lda (TempPtr02_lo),y
	sta CurrentLevelSubRoomNumber
	jsr LoadLevelData_ScreenNumbers_PointerForCurrentLevelSceneNumber_Storeto02
	jmp _loc_1D14C

	@D0F9:
	  iny
	lda (TempPtr02_lo),y
	sta CurrentLevelMapType
	iny
	lda (TempPtr02_lo),y
	sta CurrentLevelSceneNumber
	lda #$01
	sta $89
	bne _loc_1D11B

	@D109:
	   iny
	lda (TempPtr02_lo),y
	sta CurrentLevelMapType
	iny
	lda (TempPtr02_lo),y
	sta CurrentLevelSceneNumber
	lda CurrentLevelSubRoomNumber
	bpl _loc_1D11B
	lda #$80
	sta $89
_loc_1D11B:
	lda #$00
	sta $8E
	lda #$0A
	sta PlotAction05_GameLoop_WhichAction
	pla
	pla
	rts

	@D126:
	   iny
	lda ($04),y
	sta CurrentLevelMapType
	iny
	lda ($04),y
	sta CurrentLevelSceneNumber
	lda #$FF
	sta $89
	bne _loc_1D11B
;------------------------------------------
_func_1D136:
	jsr LoadLevelData_ScreenNumbers_PointerForCurrentLevelSceneNumber_Storeto02
	jsr _func_1D234
	lda $8E
	beq @D143
	jmp _loc_1D1C7

	@D143:
	    lda CurrentLevelSubRoomNumber
	cmp #$FF
	bne _loc_1D14C
	jmp _loc_1D0B6
;------------------------------------------
_loc_1D14C:
	ldy #$02
	lda CurrentLevelSubRoomNumber
	and #$7F
	cmp (TempPtr02_lo),y
	beq _func_1D15B
	bcc _func_1D15B
	jmp _loc_1D0B2
;------------------------------------------
_func_1D15B:
	jsr LoadLevelData_ScreenNumbers_PointerForCurrentLevelSceneNumber_Storeto02
	lda CurrentLevelSubRoomNumber
	and #$7F
	asl a
	clc
	adc #$09
	tay
	lda (TempPtr02_lo),y
	sta TempPtr00_lo
	iny
	lda (TempPtr02_lo),y
	sta TempPtr00_hi
	ldy #$00
	lda (TempPtr00_lo),y
	cmp #$FE
	beq @D180
	cmp #$FD
	beq @D180
	lda #$00
	beq @D181

	@D180:
	iny
	@D181:
	 sta $8E
	lda (TempPtr00_lo),y
	sta Temp93
	lda CurrentLevelMapType
	asl a
	tay
	lda LevelData_Screens,y
	sta $04
	lda LevelData_Screens+1,y
	sta $05
	lda Temp93
	asl a
	asl a
	tay
	lda ($04),y
	sta LevelData_Screens_pointerLo
	iny
	lda ($04),y
	sta LevelData_Screens_pointerHi
	iny
	lda ($04),y
	sta LevelData_Stairs_pointerLo
	iny
	lda ($04),y
	sta LevelData_Stairs_pointerHi
	lda CurrentLevelMapType
	asl a
	asl a
	tay
	lda LevelData_MetaTiles,y
	sta LevelData_MetaTiles_pointerLo
	lda LevelData_MetaTiles+1,y
	sta LevelData_MetaTiles_pointerHi
	lda LevelData_CategoryThresholds,y
	sta LevelData_CategoryThresholds_pointerLo
	lda LevelData_CategoryThresholds+1,y
	sta LevelData_CategoryThresholds_pointerHi
	rts
;------------------------------------------
_loc_1D1C7:
	cmp #$FD
	beq @D208
	lda CurrentLevelSubRoomNumber
	bpl @D1D2
	jmp @D143

	@D1D2:
	lda Current_WhatUnknown57
	bne @D1D9
	jmp @D143

	@D1D9:
	ldy CurrentLevelSubRoomNumber
	dey
	@D1DC:
	tya
	and #$7F
	asl a
	clc
	adc #$09
	tay
	lda (TempPtr02_lo),y
	sta $04
	iny
	lda (TempPtr02_lo),y
	sta $05
	ldy #$02
	lda ($04),y
	cmp #$FF
	bne @D1F8
	jmp @D126

	@D1F8:
	iny
	iny
	lda ($04),y
	sta CurrentLevelSceneNumber
	jsr _func_1D21C
	lda #$FF
	sta $89
	jmp _loc_1D14C

	@D208:
	 lda CurrentLevelSubRoomNumber
	bmi @D20F
	jmp @D143

	@D20F:
	lda Current_WhatUnknown57
	bne @D216
	jmp @D143

	@D216:
	ldy CurrentLevelSubRoomNumber
	iny
	jmp @D1DC
;------------------------------------------
_func_1D21C:
	lda CurrentLevelSubRoomNumber
	bpl @D22C
	jsr LoadLevelData_ScreenNumbers_PointerForCurrentLevelSceneNumber_Storeto02
	ldy #$02
	lda (TempPtr02_lo),y
	ora #$80
	@D229:
	sta CurrentLevelSubRoomNumber
	rts

	@D22C:
	lda #$00
	beq @D229
;------------------------------------------
_func_1D230:
	lda CurrentLevelSubRoomNumber
	bpl _D256
_func_1D234:
	ldy #$00
	lda (TempPtr02_lo),y
	sta $04
	iny
	lda (TempPtr02_lo),y
	sta $05
	lda CurrentLevelSubRoomNumber
	bmi @D24A
	tay
	dey
	lda ($04),y
	jmp @D254

	@D24A:
	and #$7F
	tay
	lda ($04),y
	eor #$FF
	clc
	adc #$01
	@D254:
	 sta $89
	_D256:
	  rts
;------------------------------------------
LoadLevelData_ScreenNumbers_PointerForCurrentLevelSceneNumber_Storeto02:
	lda #$02
	jsr SwitchBank_NewPage
	lda CurrentLevelMapType
	asl a
	tay
	lda LevelData_ScreenNumbers,y
	sta TempPtr00_lo
	lda LevelData_ScreenNumbers+1,y
	sta TempPtr00_hi
	lda CurrentLevelSceneNumber
	asl a
	tay
	lda (TempPtr00_lo),y
	sta TempPtr02_lo
	iny
	lda (TempPtr00_lo),y
	sta TempPtr02_hi
	rts
;------------------------------------------
Update_39_and_3B:
	lda CurrentXScrollingPositionPixels
	and #$F0
	jsr Math_divAby16
	sta TempPtr08_lo
	lda CurrentXScrollingPositionScreens
	and #$0F
	jsr Math_mulAby16
	ora TempPtr08_lo
	sta Unknown39_From_XscrollingPositionDividedBy16
	lda CurrentYScrollingPositionPixels_Mod256
	and #$F0
	jsr Math_divAby16
	sta TempPtr08_lo
	lda CurrentYScrollingPositionScreens_maybe
	and #$0F
	jsr Math_mulAby16
	ora TempPtr08_lo
	sta Unknown3B_From_8C8D_dividedBy16
	rts
;------------------------------------------
_func_1D2A1:
	lda #$00
	sta CurrentYScrollingPositionScreens_maybe
	ldy Current_WhatUnknown57
	@D2A7:
	dey
	bmi @D2B4
	clc
	adc #$E0
	bcc @D2B1
	inc CurrentYScrollingPositionScreens_maybe
	@D2B1:
	jmp @D2A7

	@D2B4:
	 clc
	adc CurrentYScrollingPositionPixels_Mod240
	sta CurrentYScrollingPositionPixels_Mod256
	bcc @D2BD
	inc CurrentYScrollingPositionScreens_maybe
	@D2BD:
	rts
;------------------------------------------
Check_UpdateScrolling_Maybe:
	ldy Current_WhatUnknown57
	lda #$00
	sta Temp95
	@D2C4:
	dey
	bmi @D2D0
	clc
	adc #$E0
	bcc @D2C4
	inc Temp95
	bne @D2C4
	@D2D0:
	clc
	adc CurrentYScrollingPositionPixels_Mod240
	bcc @D2D7
	inc Temp95
	@D2D7:
	sta Temp94
	@D2D9:
	lda Temp94
	sec
	sbc #$F0
	bcs @D2E4
	dec Temp95
	bmi @D2E9
	@D2E4:
	sta Temp94
	jmp @D2D9

	@D2E9:
	 lda Temp94
	sec
	sbc #$0D
	bcs @D2F3
	sec
	sbc #$10
	@D2F3:
	sta PPUscrollingPositionHi
	lda CurrentXScrollingPositionPixels
	sta PPUscrollingPositionLo
	lda CurrentXScrollingPositionScreens
	and #$01
	sta Temp93
	lda PPUdesiredRegister2000
	and #$FC
	ora Temp93
	sta PPUdesiredRegister2000
	rts
;------------------------------------------
GameLoop_CheckIfPauseEnteredOrActive:
	lda ObjectCurrentActionType
	cmp #$0B
	beq @D32D
	lda Unknown04ED_finalConfrontationRelated
	bne @D32D
	lda $1E
	ora GameInDeathState
	ora ScreenBlankingCounter
	bne @D32D
	lda Input_NewJoyButtonsWork
	ldy GamePaused
	beq Check_IfPauseEntered
	dey
	beq @D349
SelectButtonPauseScreen_Run:
	and #$20
	beq @D32D
	lda #$00
	sta GamePaused
_loc_1D32D:
	rts
;------------------------------------------
Check_IfPauseEntered:
	and #$10
	bne PauseEntered_WithStart
	lda Input_NewJoyButtonsWork
	and #$20
	beq @D32D
	lda #$02
	bne PauseEntered_WithSelect
;------------------------------------------
PauseEntered_WithStart:
	lda #$01
PauseEntered_WithSelect:
	sta GamePaused
	lda #$00
	sta DialogActionState
	lda #$60
	jmp AnyBankPlayTracks
;------------------------------------------
_loc_1D349:
	jmp ItemMenuPauseScreen_Run
;------------------------------------------
_func_1D34C:
	lda #$03
	jsr SwitchBank_NewPage
	jmp _loc_C155
;------------------------------------------
DecreaseHPbyA:
	sta TempPtr08_lo
DecreaseHPbyVar08:
	lda CurrentHP
	sec
	sbc TempPtr08_lo
	bcs @D35F
	lda #$00
	@D35F:
	sta CurrentHP
	rts
;------------------------------------------
Object0_SetYVelocity16bit_from_AY:
	sta ObjectYSpeed
	tya
	sta ObjectYSpeedFrac
	rts
;------------------------------------------
ItemMenuPauseScreen_CursorMovement_Horizontal_ByY:
	sta $6C
	sty $6D
	rts
;------------------------------------------
SimonDamageKnockBack:
	lda ObjectFacingLeft
	beq @D37A
	ldy #$FF
	lda #$00
	beq @D37E

	@D37A:
	ldy #$01
	lda #$00
	@D37E:
	 jsr ItemMenuPauseScreen_CursorMovement_Horizontal_ByY
	lda #$FD
	ldy #$80
	jsr Object0_SetYVelocity16bit_from_AY
	lda #$1F
	jsr SetObjectIndexToAutomaticSpriteDataTable_to_A_for_Simon
	jsr DeleteSimonWhipObject
	lda #$06
	sta ObjectCurrentActionType
	lda #$20
	sta ObjectAIvar6
	jsr FindIfThereIsAFloatingPlatform
	bcc @D3A6
	lda #$00
	sta Ending_PrimaryActionIndex,x
	sta Unknown41
	@D3A6:
	lda #$5F
	jsr AnyBankPlayTracks
	rts
;------------------------------------------
Simon_CheckMapCollision:
	clc
	adc ObjectScreenXCoord
	sta TempPtr02_lo
	lda #$00
	sta TempPtr02_hi
	tya
	clc
	adc ObjectScreenYCoord
	sta TempPtr00_lo
	jmp LoadObstacleBufferBits
;------------------------------------------
CheckIfBoneHeld_SetSimonAutomaticSprite_To_Table_Atimes2plusBone:
	asl a
	tay
	lda InventoryBodyPartSelection
	cmp #$01
	bne @D3C9
	iny
	@D3C9:
	lda _data_1D3CF_indexed,y
	jmp SetObjectIndexToAutomaticSpriteDataTable_to_A_for_Simon
;------------------------------------------
_data_1D3CF_indexed:
	.byte $11,$2C,$01,$2B
FindIfThereIsAFloatingPlatform:
	ldx #$06
	@D3D5:
	 lda ObjectType,x
	cmp #$21
	beq @D3EF
	cmp #$22
	beq @D3EF
	cmp #$34
	beq @D3EF
	cmp #$3D
	beq @D3EF
	@D3E8:
	inx
	cpx #$12
	bcc @D3D5
	clc
	rts

	@D3EF:
	lda Ending_PrimaryActionIndex,x
	beq @D3E8
	sec
	rts
;------------------------------------------
_func_1D3F6:
	lda #$03
	jsr SwitchBank_NewPage
	jsr _func_C4F5
	lda #$01
	jmp SwitchBank_NewPage
;------------------------------------------
_func_1D403:
	lda #$03
	jsr SwitchBank_NewPage
	jmp Simon_TryAvoidCollision
;------------------------------------------
_loc_1D40B:
	rts
;------------------------------------------
LoadLevelDataScreensPointerLo_Byte1_minus1_storeInY:
	lda #$02
	jsr SwitchBank_NewPage
	ldy #$01
	lda (LevelData_Screens_pointerLo),y
	jmp _loc_1D421
;------------------------------------------
LoadLevelDataScreensPointerLo_Byte0_minus1_storeInY:
	lda #$02
	jsr SwitchBank_NewPage
	ldy #$00
	lda (LevelData_Screens_pointerLo),y
_loc_1D421:
	tay
	dey
	lda #$03
	jmp SwitchBank_NewPage
;------------------------------------------
UnknownFunc1D428:
	sta $98
	jsr $88A2
	ldy #$00
	sty Temp97
	lda #$02
	jsr SwitchBank_NewPage
	@D436:
	lda #$00
	sta $05
	lda (LevelData_Stairs_pointerLo),y
	cmp #$FF
	bne @D445
	lda #$03
	jmp SwitchBank_NewPage

	@D445:
	asl a
	ldx $98
	bne @D44E
	bcs @D453
	bcc @D450
	@D44E:
	bcc @D453
	@D450:
	 jsr _func_1D470
	@D453:
	  inc Temp97
	lda Temp97
	asl a
	tay
	jmp @D436
;------------------------------------------
Math_04word_mul2_and_subtract_00word:
                            ; $05:$04  = ($05:A << 2) - ($01:$00):
	asl a
	rol $05
	asl a
	rol $05
	sta $04
	sec
	sbc TempPtr00_lo,x
	sta $04
	lda $05
	sbc TempPtr00_hi,x
	sta $05
	rts
;------------------------------------------
_func_1D470:
	rol ObjectEnemyRemainingHP
	pha
	 lda ObjectEnemyRemainingHP
	 and #$01
	 sta ObjectEnemyRemainingHP
	pla
	ldx #$00
	stx $96
	ldx #$02
	jsr Math_04word_mul2_and_subtract_00word
	bpl @D494
	inc $96
	jsr Math_Invert16bitWordAt04
	ldx #$04
	lda #$01
	jsr Inc16bitPointerAtX_by_A
	@D494:
	lda $05
	bne @D4EB
	lda $04
	cmp #$0C
	bcs @D4EB
	sta ObjectAIvar4
	lda $96
	sta ObjectAIvar5
	iny
	lda #$00
	sta $05
	lda (LevelData_Stairs_pointerLo),y
	asl a
	ldx #$00
	jsr Math_04word_mul2_and_subtract_00word
	bpl @D4B8
	jsr Math_Invert16bitWordAt04
	@D4B8:
	lda $05
	bne @D4EB
	lda $04
	cmp #$04
	bcs @D4EB
	lda (LevelData_Stairs_pointerLo),y
	asl a
	rol ObjectAIvar3
	lda ObjectAIvar3
	and #$01
	sta ObjectAIvar3
	lda ObjectAIvar5
	eor #$01
	sta ObjectFacingLeft
	lda #$00
	jsr SetObjectIndexToAutomaticSpriteDataTable_to_A_for_Simon
	lda #$07
	sta ObjectCurrentActionType
	pla
	pla
	pla
	pla
	lda #$03
	jsr SwitchBank_NewPage
	@D4EB:
	 rts
;------------------------------------------
Math_Invert16bitWordAt04:
	eor #$FF
	sta $05
	lda $04
	eor #$FF
	sta $04
	rts
;------------------------------------------
GiveExperience_valueInY:
	sty Temp93
	txa
	pha
	 lda CurrentLevelMapType
	 asl a
	 tay
	 lda LevelData_MaxLevelUp,y
	 sta TempPtr00_lo
	 lda LevelData_MaxLevelUp+1,y
	 sta TempPtr00_hi
	 lda CurrentLevelSceneNumber
	 lsr a
	 tay
	 lda (TempPtr00_lo),y
	 bcs @D516
	 jsr Math_divAby16
	 bne GiveExperience_TestMaxLevelReached
	@D516:
	 and #$0F
GiveExperience_TestMaxLevelReached:
	cmp CurrentLevel
	beq _loc_1D546
	bcc _loc_1D546
GiveExperience_DoAddExp:
	lda Temp93
	sta TempPtr08_lo
	lda Edigits0011
	sta TempPtr08_hi
	jsr MathBCD_addition_In_Var08_Var09_Out_AandCarry_Temp_Var0A_Var0B
	sta Edigits0011
	bcc @D53A
	lda #$01
	sta TempPtr08_lo
	lda Edigits1100
	sta TempPtr08_hi
	jsr MathBCD_addition_In_Var08_Var09_Out_AandCarry_Temp_Var0A_Var0B
	sta Edigits1100
	@D53A:
	lda CurrentLevel
	cmp #$06
	bcc TestLevelUp
	lda #$00
	sta Edigits0011
	sta Edigits1100
_loc_1D546:
	pla
	tax
	rts
;------------------------------------------
TestLevelUp:
	lda Edigits0011
	sta TempPtr08_lo
	lda CurrentLevel
	asl a
	clc
	adc CurrentLevel
	tay
	lda LevelExpThreshold_lo,y
	sta TempPtr08_hi
	jsr MathBCD_subtract
	sta Unknown10_CollisionAndScrollingTemp
	ldx LevelExpThreshold_hi,y
	bcs @D564
	inx
	@D564:
	stx TempPtr08_hi
	lda Edigits1100
	sta TempPtr08_lo
	jsr MathBCD_subtract
	bcc _loc_1D546
	sta Edigits1100
	lda Unknown10_CollisionAndScrollingTemp
	sta Edigits0011
	lda LevelExp_increaseMaxHPflag,y
	beq @D581
	lda CurrentMaxHP
	clc
	adc #$10
	sta CurrentMaxHP
	@D581:
	inc CurrentLevel
	lda #$FF
	sta TimeRelated3F
	sta GameInDeathState
	lda #$E0
	sta DialogActivationState
	lda #$00
	sta DialogActionState
	lda #$3C
	sta DialogText_BeginX
	bne _loc_1D546
;------------------------------------------
LevelExpThreshold_lo:
	.byte $00
LevelExpThreshold_hi:
	.byte $01
LevelExp_increaseMaxHPflag:
	.byte $00,$50,$01,$01,$00,$02,$00,$50,$02,$01,$00,$03,$00,$50,$03,$01
LevelData_MaxLevelUp:
	.word (LevelData_MaxLevelUp_0_Towns) ;D5B5 (1D5B5) ()
	.word (LevelData_MaxLevelUp_1_Mansions) ;D5B9 (1D5B9) ()
	.word (LevelData_MaxLevelUp_2_ForestsAndBridges) ;D5BF (1D5BF) ()
	.word (LevelData_MaxLevelUp_3_Wilderness) ;D5C4 (1D5C4) ()
	.word (LevelData_MaxLevelUp_4_Wastelands_and_5_Ruins) ;D5C7 (1D5C7) ()
	.word (LevelData_MaxLevelUp_4_Wastelands_and_5_Ruins) ;D5C7 (1D5C7) ()
LevelData_MaxLevelUp_0_Towns:
	.byte $12,$23,$34,$50
LevelData_MaxLevelUp_1_Mansions:
	.byte $61,$23,$40,$61,$23,$40
LevelData_MaxLevelUp_2_ForestsAndBridges:
	.byte $11,$22,$22,$35,$50
LevelData_MaxLevelUp_3_Wilderness:
	.byte $64,$36,$30
LevelData_MaxLevelUp_4_Wastelands_and_5_Ruins:
	.byte $34,$45
_func_1D5C9:
	ldx #$06
	@D5CB:
	 lda ObjectType,x
	cmp #$21
	beq @D5D8
	@D5D2:
	inx
	cpx #$12
	bcc @D5CB
	rts

	@D5D8:
	lda ObjectDialogStatusFlag,x
	bne @D5D2
	ldy #$00
	lda ObjectScreenXCoord,x
	sec
	sbc ObjectScreenXCoord
	bcs @D5EC
	jsr Math_NegateA
	iny
	@D5EC:
	cmp #$0D
	bcc @D5D2
	cmp #$10
	bcs @D5D2
	sty Temp93
	lda ObjectScreenYCoord,x
	clc
	adc #$10
	sec
	sbc ObjectScreenYCoord
	bcs @D605
	jsr Math_NegateA
	@D605:
	cmp #$18
	bcs @D5D2
	lda #$10
	ldy Temp93
	bne @D611
	lda #$F0
	@D611:
	clc
	adc ObjectScreenXCoord,x
	sta ObjectScreenXCoord
	rts
;------------------------------------------
_func_1D619:
	lda Unknown14_Horizontal_256pixelUnitForObject
	asl a
	asl a
	asl a
	clc
	adc Unknown13_Horizontal_32pixelUnitForObject
	asl a
	rts
;------------------------------------------
CheckIfNailHeld_WhipWallBreaking:
	lda InventoryBodyPartSelection
	cmp #$04
	bne @D663
	lda #$00
	sta Temp97
	lda $0445
	cmp #$03
	bne @D663
	ldy #$01
	lda CurrentWhipLevel
	beq @D641
	iny
	cmp #$03
	bcc @D641
	iny
	@D641:
	sty $98
	lda #$00
	sta $17
	@D647:
	lda $17
	clc
	adc #$10
	sta $17
	ldy ObjectFacingLeft
	bne @D656
	jsr Math_NegateA
	@D656:
	ldy #$FE
	jsr Simon_CheckMapCollision
	cmp #$01
	beq SpecialWeaponAI_Bottle_CheckWallBreaking
	dec $98
	bne @D647
	@D663:
	 rts
;------------------------------------------
SpecialWeaponAI_Bottle_CheckWallBreaking:
	lda CurrentLevelMapType
	cmp #$04
	bne _loc_1D672
	lda #$01
	jsr SwitchBank_NewPage
	jsr WestBridge_TestInventoryContents_AllBodyParts_BlueCrystal_AndCross
_loc_1D672:
	lda #$1E
	jsr AnyBankPlayTracks
	ldx ClearedFakeBlockListLength
	lda Unknown6A_ScrollingRelated
	lsr a
	sta ClearedFakeBlockListY,x
	inx
	jsr _func_1D619
	tay
	lda TempPtr02_lo
	and #$02
	beq @D68C
	iny
	@D68C:
	tya
	sta ClearedFakeBlockListY,x
	inx
	stx ClearedFakeBlockListLength
	ldy #$00
	lda NameTableAddressLo
	and #$20
	bne @D69E
	ldy #$08
	@D69E:
	sty $15
	ldy #$00
	lda NameTableAddressLo
	and #$01
	bne @D6AA
	ldy #$08
	@D6AA:
	sty Unknown14_Horizontal_256pixelUnitForObject
	lda NameTableAddressLo
	and #$DE
	sta NameTableAddressLo
	ldy #$0F
	lda NameTableAddressLo
	and #$02
	beq @D6BC
	ldy #$F0
	@D6BC:
	sty $16
	lda #$02
	sta Temp07
	@D6C2:
	jsr PPU_Text_Put3bytes_01_and_NameTableAddress
	lda #$00
	jsr PPU_Text_PutA
	jsr PPU_Text_PutAandFF
	jsr Convert_NameTableAddress_To_ObstacleBufferAddress
	ldy #$00
	lda (ObstaclePointerLo),y
	and $16
	sta (ObstaclePointerLo),y
	jsr Inc_NameTableAddress_by_0020
	dec Temp07
	bne @D6C2
	lda NameTableAddressLo
	sta $16
	lda NameTableAddressHi
	sta $17
	ldx #$06
	@D6E9:
	  lda ObjectType,x
	cmp #$27
	beq @D6FA
	cmp #$26
	beq @D6FA
	@D6F4:
	 inx
	cpx #$12
	bcc @D6E9
	rts

	@D6FA:
	lda Temp97
	bne @D742
	lda #$00
	ldy #$08
	jsr SpecialWeapon_CheckMapCollision
	lda NameTableAddressLo
	and #$0F
	sta TempPtr00_lo
	lda $16
	and #$0F
	sec
	sbc TempPtr00_lo
	bcs @D717
	jsr Math_NegateA
	@D717:
	cmp #$05
	bcs @D6F4
	lda NameTableAddressLo
	and #$F0
	sta TempPtr00_lo
	lda $16
	and #$F0
	sec
	sbc TempPtr00_lo
	bcs @D72D
	jsr Math_NegateA
	@D72D:
	cmp #$50
	bcs @D6F4
	lda NameTableAddressHi
	cmp $17
	bne @D6F4
	@D737:
	lda #$00
	sta ObjectDialogStatusFlag,x
	lda #$FF
	sta ObjectAIvar1,x
	rts

	@D742:
	 ldy $96
	lda ObjectScreenXCoord,x
	sec
	sbc ObjectScreenXCoord,y
	bcs @D750
	jsr Math_NegateA
	@D750:
	cmp #$10
	bcs @D764
	lda ObjectScreenYCoord,x
	sec
	sbc ObjectScreenYCoord,y
	bcs @D760
	jsr Math_NegateA
	@D760:
	cmp #$10
	bcc @D737
	@D764:
	 jmp @D6F4
;------------------------------------------
AccumulateClockTime:
	lda CurrentLevelMapType
	cmp #$05
	beq @D79D
	lda ObjectCurrentActionType
	cmp #$0B
	beq @D79D
	lda DeathStateRelatedFlagMaybe
	bne @D79D
	lda TimeFlag8F_TimeIsStopped
	cmp #$81
	beq @D79D
	cmp #$01
	beq @D79D
	ldy CurrentTimeWaitCounter
	iny
	cpy #$0F
	bcs @D78E
	sty CurrentTimeWaitCounter
	jmp @D79D

	@D78E:
	lda #$00
	sta CurrentTimeWaitCounter
	lda CurrentMinuteBCD
	jsr MathBCD_additionBy1
	cmp #$60
	bcs @D79E
	sta CurrentMinuteBCD
_loc_1D79D:
	rts

	@D79E:
	lda #$00
	sta CurrentMinuteBCD
	lda CurrentHourBCD
	jsr MathBCD_additionBy1
	cmp #$24
	bcs IncreaseDayByOne
	sta CurrentHourBCD
	cmp #$06
	beq TriggerDayNightTransition
	cmp #$18
	beq TriggerDayNightTransition
	jmp @D79D
;------------------------------------------
IncreaseDayByOne:
	lda #$00
	sta CurrentHourBCD
	lda CurrentDayBCD
	cmp #$99
	beq @D7C5
	jsr MathBCD_additionBy1
	@D7C5:
	sta CurrentDayBCD
	jmp @D79D
;------------------------------------------
MathBCD_additionBy1:
	sta TempPtr08_lo
	lda #$01
	sta TempPtr08_hi
	jmp MathBCD_addition_In_Var08_Var09_Out_AandCarry_Temp_Var0A_Var0B
;------------------------------------------
TriggerDayNightTransition:
	lda #$FF
	sta TimeRelated3F
	lda #$00
	sta DialogActionState
	lda #$04
	sta PlotAction05_GameLoop_WhichAction
	lda #$01
	sta Sound_FadeMode
	pla
	pla
	jmp @CE11
;------------------------------------------
SpecialWeaponUse_CreateObject:
	lda InventoryCursorSelected1
	sta ObjectType,x
	lda #$00
	sta ObjectEnemyRemainingHP,x
	sta ObjectDialogStatusFlag,x
	lda #$82
	sta ObjectCurrentActionType,x
	lda ObjectFacingLeft
	sta ObjectFacingLeft,x
	lda ObjectScreenXCoord
	sta ObjectScreenXCoord,x
	lda ObjectScreenYCoord
	sta ObjectScreenYCoord,x
	rts
;------------------------------------------
SpecialWeaponUse_Weapon5_Diamond:
	lda #$01
	jsr SpecialWeaponUse_CheckNumHearts
	jsr SpecialWeaponUse_CreateObject
	lda #$02
	ldy #$00
	jsr Object_SetXVelocity16bit_from_AY_invert_if_ObjectFacingLeft_set
	lda #$01
	ldy #$00
	jsr Object_SetYVelocity16bit_from_AY
	lda #$11
	jsr AnyBankPlayTracks
	lda #$30
_loc_1D82A:
	jsr SetObjectIndexToAutomaticSpriteDataTable_to_A_and_PaletteIndexTo0
	sec
	rts
;------------------------------------------
SpecialWeaponUse_Try_FindSlot:
	ldx #$03
	@D831:
	lda ObjectType,x
	beq SpecialWeaponUse_Do_ThereisAFreeSlot
	inx
	cpx #$06
	bcc @D831
SpecialWeaponUse_Nothing:
	clc
	rts
;------------------------------------------
SpecialWeaponUse_Do_ThereisAFreeSlot:
	lda InventoryCursorSelected1
	jsr JumpWithParams
_JumpPointerTable_1D842:
	.word (SpecialWeaponUse_Nothing) ;D83B (1D83B) ()
	.word (SpecialWeaponUse_Weapon1_Dagger) ;D8CF (1D8CF) ()
	.word (SpecialWeaponUse_Weapon2and3_Knifes) ;D8D6 (1D8D6) ()
	.word (SpecialWeaponUse_Weapon2and3_Knifes) ;D8D6 (1D8D6) ()
	.word (SpecialWeaponUse_Weapon4_Bottle) ;D8A3 (1D8A3) ()
	.word (SpecialWeaponUse_Weapon5_Diamond) ;D80D (1D80D) ()
	.word (SpecialWeaponUse_Weapon6_Flame) ;D89B (1D89B) ()
	.word (SpecialWeaponUse_Weapon7_OakStake) ;D892 (1D892) ()
	.word (SpecialWeaponUse_Weapon8_Laurel) ;D91A (1D91A) ()
	.word (SpecialWeaponUse_Weapon9_Garlic) ;D92E (1D92E) ()
SpecialWeaponUse_CheckNumHearts:
	stx $96
	ldy #$00
	jsr CheckEnoughHearts_SubtractIfOk
	bcc @D862
	ldx $96
	rts

	@D862:
	pla
	pla
	jmp SpecialWeaponUse_Nothing
;------------------------------------------
CheckEnoughHearts_SubtractIfOk:
	sty $05
	sta TempPtr08_hi
	lda HeartsDigits0011
	sta TempPtr08_lo
	jsr MathBCD_subtract
	sta $06
	ldx $05
	bcs @D879
	inx
	@D879:
	stx TempPtr08_hi
	lda HeartsDigits1100
	sta TempPtr08_lo
	jsr MathBCD_subtract
	bcc @D890
	sta Temp07
	lda $06
	sta HeartsDigits0011
	lda Temp07
	sta HeartsDigits1100
	sec
	rts

	@D890:
	clc
	rts
;------------------------------------------
SpecialWeaponUse_Weapon7_OakStake:
	ldy CurrentLevelMapType
	dey
	bne @D89A
	jmp SpecialWeaponUse_CreateOakStake

	@D89A:
	rts
;------------------------------------------
SpecialWeaponUse_Weapon6_Flame:
	lda #$01
	jsr SpecialWeaponUse_CheckNumHearts
	jmp SpecialWeaponUse_CreateGravityObject
;------------------------------------------
SpecialWeaponUse_Weapon4_Bottle:
	cpx #$03
	beq SpecialWeaponUse_CreateGravityObject
	jmp SpecialWeaponUse_Nothing
;------------------------------------------
SpecialWeaponUse_CreateGravityObject:
	jsr SpecialWeaponUse_CreateObject
	lda #$01
	ldy #$80
	jsr Object_SetXVelocity16bit_from_AY_invert_if_ObjectFacingLeft_set
	lda #$FF
	ldy #$00
	jsr Object_SetYVelocity16bit_from_AY
	lda #$11
	jsr AnyBankPlayTracks
	lda InventoryCursorSelected1
	cmp #$04
	beq @D8CB
	lda #$20
	@D8C8:
	jmp _loc_1D82A

	@D8CB:
	lda #$33
	bne @D8C8
;------------------------------------------
SpecialWeaponUse_Weapon1_Dagger:
	cpx #$03
	beq SpecialWeaponUse_CreateDaggerOrKnife
	jmp SpecialWeaponUse_Nothing
;------------------------------------------
SpecialWeaponUse_Weapon2and3_Knifes:
	lda InventoryCursorSelected1
	cmp #$03
	bne @D8E0
	lda #$02
	bne @D8E2

	@D8E0:
	lda #$01
	@D8E2:
	 jsr SpecialWeaponUse_CheckNumHearts
SpecialWeaponUse_CreateDaggerOrKnife:
	jsr SpecialWeaponUse_CreateObject
	ldy #$00
	lda InventoryCursorSelected1
	cmp #$02
	bne @D8F2
	ldy #$40
	@D8F2:
	lda #$02
	jsr Object_SetXVelocity16bit_from_AY_invert_if_ObjectFacingLeft_set
	jsr Object_SetYVelocity16bit_ToZero
	lda InventoryCursorSelected1
	cmp #$01
	bne @D905
	lda #$20
	sta ObjectAIvar5,x
	@D905:
	lda InventoryCursorSelected1
	cmp #$03
	bne @D910
	lda #$13
	jmp @D912

	@D910:
	lda #$11
	@D912:
	 jsr AnyBankPlayTracks
	lda #$32
	jmp _loc_1D82A
;------------------------------------------
SpecialWeaponUse_Weapon8_Laurel:
	lda InventoryNumLaurels
	bne @D921
	jmp SpecialWeaponUse_Nothing

	@D921:
	dec InventoryNumLaurels
	lda #$20
	jsr AnyBankPlayTracks
	lda #$B4
	sta RemainingLaurelPower
	rts
;------------------------------------------
SpecialWeaponUse_Weapon9_Garlic:
	lda InventoryNumGarlics
	bne @D935
	jmp SpecialWeaponUse_Nothing

	@D935:
	dec InventoryNumGarlics
	jsr SpecialWeaponUse_CreateObject
	jsr Object_SetXandYVelocity16bit_ToZero
	lda #$11
	jsr AnyBankPlayTracks
	lda #$34
	jmp _loc_1D82A
;------------------------------------------
SpecialWeaponUse_CreateOakStake:
	lda InventoryMiscItems2
	and #$BF
	sta InventoryMiscItems2
	jsr SpecialWeaponUse_CreateObject
	lda #$01
	ldy #$80
	jsr Object_SetXVelocity16bit_from_AY_invert_if_ObjectFacingLeft_set
	jsr Object_SetYVelocity16bit_ToZero
	lda #$00
	sta InventoryCursorSelected1
	lda #$11
	jsr AnyBankPlayTracks
	lda #$31
	jmp _loc_1D82A
;------------------------------------------
SpecialWeaponAI_Weapon7_OakStake:
	jmp Object_FlashPalette
;------------------------------------------
SpecialWeaponAI_Run:
	ldx #$03
	@D96D:
	 lda ObjectType,x
	bmi @D9AC
	bne SpecialWeaponAI_RunForX
_loc_1D974:
	inx
	cpx #$06
	bcc @D96D
	rts
;------------------------------------------
SpecialWeaponAI_RunForX:
	jsr _func_1E08C
	lda JumpPointerD99F+1
	pha
	 lda JumpPointerD99F
	 pha
	  lda ObjectType,x
	  jsr JumpWithParams
_JumpPointerTable_1D98B:
	.word @D9BB
	.word (SpecialWeaponAI_Weapon1_Dagger) ;DA62 (1DA62) ()
	.word (SpecialWeaponAI_Weapon2_SilverKnife) ;D9AF (1D9AF) ()
	.word (SpecialWeaponAI_Weapon3_GoldKnife) ;DA53 (1DA53) ()
	.word (SpecialWeaponAI_Weapon4_Bottle) ;DA90 (1DA90) ()
	.word (SpecialWeaponAI_Weapon5_Diamond) ;D9D7 (1D9D7) ()
	.word (SpecialWeaponAI_Weapon6_Flame) ;DAB3 (1DAB3) ()
	.word (SpecialWeaponAI_Weapon7_OakStake) ;D968 (1D968) ()
	.word @D9BB
	.word (SpecialWeaponAI_Weapon9_Garlic) ;D9B5 (1D9B5) ()
JumpPointerD99F:
	.word (SpecialWeaponAI_Done -1) ;D9A1 (1D9A1) ()
SpecialWeaponAI_Done:
	jsr ObjectLoadAutomaticSpriteNumber
	jsr Object_GeneringXYmovementEngine
	jmp _loc_1D974
;------------------------------------------
_loc_1D9AA:
	pla
	pla
_loc_1D9AC:
	jmp Object_Erase
;------------------------------------------
SpecialWeaponAI_Weapon2_SilverKnife:
	lda #$01
	sta ObjectPaletteIndex,x
	rts
;------------------------------------------
SpecialWeaponAI_Weapon9_Garlic:
	lda ObjectEnemyRemainingHP,x
	tay
	beq _loc_1D9BC
SpecialWeaponAI_Nothing:
	rts
;------------------------------------------
_loc_1D9BC:
	jsr Object_GravityAccelerateBy_020
	lda #$00
	ldy #$08
	jsr SpecialWeapon_CheckMapCollision
	bne @D9C9
	rts

	@D9C9:
	jsr Object_SetXandYVelocity16bit_ToZero
	jmp _loc_1DA72
;------------------------------------------
Object_FlashPalette:
	lda FrameCounter
	and #$03
	sta ObjectPaletteIndex,x
	rts
;------------------------------------------
SpecialWeaponAI_Weapon5_Diamond:
	ldy #$08
	lda FrameCounter
	and #$01
	bne @D9E3
	ldy #$F8
	bne @D9E5

	@D9E3:
	lda #$00
	@D9E5:
	 jsr SpecialWeapon_CheckMapCollision
	bne @DA14
	lda FrameCounter
	and #$01
	bne @D9F4
	lda #$F8
	bne @D9F6

	@D9F4:
	lda #$08
	@D9F6:
	 ldy #$00
	jsr SpecialWeapon_CheckMapCollision
	bne @D9FE
	rts

	@D9FE:
	lda ObjectXSpeedFrac,x
	ldy ObjectXSpeed,x
	jsr _func_1DA28
	sta ObjectXSpeedFrac,x
	lda TempPtr00_hi
	sta ObjectXSpeed,x
	@DA0F:
	lda #$12
	jmp AnyBankPlayTracks

	@DA14:
	  lda ObjectYSpeedFrac,x
	ldy ObjectYSpeed,x
	jsr _func_1DA28
	sta ObjectYSpeedFrac,x
	lda TempPtr00_hi
	sta ObjectYSpeed,x
	jmp @DA0F
;------------------------------------------
_func_1DA28:
	eor #$FF
	sta TempPtr00_lo
	tya
	eor #$FF
	sta TempPtr00_hi
	stx $96
	ldx #$00
	lda #$01
	jsr Inc16bitPointerAtX_by_A
	ldx $96
	lda TempPtr00_lo
	rts
;------------------------------------------
SpecialWeapon_CheckMapCollision:
	clc
	adc ObjectScreenXCoord,x
	sta TempPtr02_lo
	lda #$00
	sta TempPtr02_hi
	tya
	clc
	adc ObjectScreenYCoord,x
	sta TempPtr00_lo
	jmp LoadObstacleBufferBits
;------------------------------------------
SpecialWeaponAI_Weapon3_GoldKnife:
	jsr Object_FlashPalette
	lda ObjectEnemyRemainingHP,x
	tay
	beq @DA6C
	dey
	beq _loc_1DA6D
	dey
	beq _loc_1DA76
SpecialWeaponAI_Weapon1_Dagger:
	dec ObjectAIvar5,x
	bne @DA6C
	@DA67:
	  lda #$80
	sta ObjectType,x
_loc_1DA6C:
	rts
;------------------------------------------
_loc_1DA6D:
	lda #$04
	sta ObjectAIvar5,x
_loc_1DA72:
	inc ObjectEnemyRemainingHP,x
	rts
;------------------------------------------
_loc_1DA76:
	dec ObjectAIvar5,x
	bne @DA6C
	lda #$20
	jsr SetObjectIndexToAutomaticSpriteDataTable_to_A_and_PaletteIndexTo0
	lda #$82
	sta ObjectCurrentActionType,x
	lda #$3C
	sta ObjectAIvar5,x
	inc ObjectEnemyRemainingHP,x
	jmp Object_SetXandYVelocity16bit_ToZero
;------------------------------------------
SpecialWeaponAI_Weapon4_Bottle:
	jsr Object_GravityAccelerateBy_020
	lda #$00
	tay
	jsr SpecialWeapon_CheckMapCollision
	beq @DAC2
	cmp #$01
	beq @DAA7
	lda #$16
	jsr AnyBankPlayTracks
	jmp @DA67

	@DAA7:
	stx $96
	lda #$FF
	sta Temp97
	jsr SpecialWeaponAI_Bottle_CheckWallBreaking
	ldx $96
	rts
;------------------------------------------
SpecialWeaponAI_Weapon6_Flame:
	lda ObjectEnemyRemainingHP,x
	tay
	beq @DAC3
	dey
	bne @DABF
	jmp _loc_1DB0F

	@DABF:
	dey
	beq @DAF7
	@DAC2:
	   rts

	@DAC3:
	  jsr Object_GravityAccelerateBy_020
	lda #$00
	sta TempPtr02_hi
	lda ObjectScreenXCoord,x
	sta TempPtr02_lo
	lda ObjectScreenYCoord,x
	clc
	adc #$08
	sta TempPtr00_lo
	jsr LoadObstacleBufferBits
	beq @DAC2
	lda #$21
	jsr SetObjectIndexToAutomaticSpriteDataTable_to_A_and_PaletteIndexTo0
	lda #$15
	jsr AnyBankPlayTracks
	jsr Object_SetXandYVelocity16bit_ToZero
	lda #$82
	sta ObjectCurrentActionType,x
	lda ObjectScreenYCoord,x
	sta ObjectAIvar1,x
	jmp _loc_1DA72

	@DAF7:
	   lda ObjectCurrentPose2,x
	cmp #$05
	beq @DB05
	clc
	adc #$06
	tay
	jmp _loc_1DB23

	@DB05:
	lda ObjectPoseChangeCounter,x
	cmp #$01
	bne _loc_1DB23
	jmp @DA67
;------------------------------------------
_loc_1DB0F:
	ldy ObjectCurrentPose2,x
	cpy #$05
	bne _loc_1DB23
	lda ObjectPoseChangeCounter,x
	bne _loc_1DB23
	lda #$22
	jsr SetObjectIndexToAutomaticSpriteDataTable_to_A_and_PaletteIndexTo0
	jmp _loc_1DA72
;------------------------------------------
_loc_1DB23:
	lda ObjectAIvar1,x
	clc
	adc $3A
	sta ObjectAIvar1,x
	cmp #$08
	bcs @DB33
	jmp _loc_1D9AA

	@DB33:
	cmp #$F0
	bcc @DB3A
	jmp _loc_1D9AA

	@DB3A:
	sec
	sbc _data_1DB42_indexed,y
	sta ObjectScreenYCoord,x
	rts
;------------------------------------------
_data_1DB42_indexed:
	.byte $00,$00,$04,$08,$0C,$10,$10,$10,$0C,$08,$04,$00
Object_GravityAccelerateBy_020:
	lda #$20
	sta TempPtr08_lo
	jmp Object_GravityAccelerateBy_Var08
;------------------------------------------
SimonUseWhip:
	lda #$0A
	ldy CurrentWhipLevel
	cpy #$02
	bcc @DB69
	cpy #$04
	bne @DB67
	lda #$0F
	jmp @DB69

	@DB67:
	lda #$0E
	@DB69:
	 jsr AnyBankPlayTracks
	lda #$80
	sta ObjectPoseChangeCounter
	lda #$FF
	sta $03B5
	rts
;------------------------------------------
_func_1DB77:
	ldy TempPtr02_lo
	lda (TempPtr00_lo),y
	ldy ObjectFacingLeft
	beq @DB83
	jsr Math_NegateA
	@DB83:
	sta Temp93
	ldy #$00
	lda Temp93
	bpl @DB8D
	ldy #$FF
	@DB8D:
	sty Temp93
	clc
	adc ObjectScreenXCoord
	sta ObjectScreenXCoord,x
	lda Temp93
	adc #$00
	sta ObjectDialogStatusFlag,x
	lda #$00
	ldy ObjectXSpeed
	cpy #$03
	bne @DBA8
	lda #$04
	@DBA8:
	sta Temp93
	lda ObjectScreenYCoord
	clc
	adc Temp93
	sta ObjectScreenYCoord,x
	rts
;------------------------------------------
_func_1DBB4:
	lda $03B5
	bne @DBC8
	rts

	@DBBA:
	ldy #$09
	sty TempPtr02_lo
	ldx #$02
	jsr _func_1DB77
	lda #$06
	jmp @DC07

	@DBC8:
	lda CurrentWhipLevel
	cmp #$02
	beq @DBD3
	cmp #$03
	bne @DBDB
	@DBD3:
	ldx #$01
	jsr Object_FlashPalette
	sta $0314
	@DBDB:
	 lda ObjectFacingLeft
	sta $0421
	sta $0422
	lda CurrentWhipLevel
	asl a
	tay
	lda _DataPointerTable_1DCD9,y
	sta TempPtr00_lo
	lda _DataPointerTable_1DCD9+1,y
	sta TempPtr00_hi
	jsr _func_1DC0E
	ldy $0445
	beq @DC00
	cpy #$03
	beq @DBBA
	dey
	@DC00:
	sty Temp93
	tya
DataTableEntry_1DC03:
	asl a
	clc
	adc Temp93
	@DC07:
	  sta TempPtr02_lo
	ldx #$01
	jmp _func_1DB77
;------------------------------------------
_func_1DC0E:
	lda $0457
	beq @DC17
	dec $0457
	rts

	@DC17:
	lda $0445
	cmp #$03
	bcs _loc_1DC7D
	cmp #$02
	beq @DC71
	@DC22:
	  asl a
	clc
	adc $0445
	tay
	iny
	lda (TempPtr00_lo),y
	sta $0301
	iny
	lda (TempPtr00_lo),y
	sta $0457
	lda ObjectXSpeed
	cmp #$03
	beq @DC43
	cmp #$09
	beq @DC47
	lda #$00
	beq @DC60

	@DC43:
	lda #$01
	bne @DC60

	@DC47:
	 lda ObjectFacingLeft
	beq @DC59
	lda ObjectAIvar3
	beq @DC55
	@DC51:
	 lda #$02
	bne @DC60

	@DC55:
	  lda #$03
	bne @DC60

	@DC59:
	 lda ObjectAIvar3
	bne @DC55
	beq @DC51
	@DC60:
	  asl a
	asl a
	clc
	adc $0445
	tay
	lda _data_1DCE3_indexed,y
	sta ObjectCurrentPose1
	inc $0445
	rts

	@DC71:
	   ldy #$0A
	lda (TempPtr00_lo),y
	sta $0302
	lda #$02
	jmp @DC22
;------------------------------------------
_loc_1DC7D:
	jsr _func_1DC86
	jsr DeleteSimonWhipObject
	pla
	pla
	@DC85:
	rts
;------------------------------------------
_func_1DC86:
	lda ObjectXSpeed
	sta ObjectCurrentActionType
	lda #$00
	ldy ObjectCurrentActionType
	cpy #$01
	beq @DCAC
	cpy #$02
	beq @DCA9
	cpy #$05
	beq @DCA9
	lda #$01
	cpy #$03
	beq @DCA9
	cpy #$09
	beq @DCB1
	bne @DC85
	@DCA9:
	jmp CheckIfBoneHeld_SetSimonAutomaticSprite_To_Table_Atimes2plusBone

	@DCAC:
	 lda #$00
	@DCAE:
	  jmp SetObjectIndexToAutomaticSpriteDataTable_to_A_for_Simon

	@DCB1:
	  lda ObjectFacingLeft
	beq @DCC3
	lda ObjectAIvar3
	beq @DCBF
	@DCBB:
	 lda #$03
	bne @DCAE

	@DCBF:
	  lda #$02
	bne @DCAE

	@DCC3:
	 lda ObjectAIvar3
	beq @DCBB
	bne @DCBF
DeleteSimonWhipObject:
	ldx #$01
	jsr Object_Erase
	sta $0314
	sta $0302
	sta $0326
	rts
;------------------------------------------
_DataPointerTable_1DCD9:
	.word (DataTableEntry_1DCF3) ;DCF3 (1DCF3) ([8:0][A:1][C:E][E:F])
	.word (DataTableEntry_1DCFE) ;DCFE (1DCFE) ([8:0][A:1][C:E][E:F])
	.word (DataTableEntry_1DD09) ;DD09 (1DD09) ([8:0][A:1][C:E][E:F])
	.word (DataTableEntry_1DD14) ;DD14 (1DD14) ([8:0][A:1][C:E][E:F])
	.word (DataTableEntry_1DD1F) ;DD1F (1DD1F) ([8:0][A:1][C:E][E:F])
_data_1DCE3_indexed:
	.word ($0B0A) ;B0A (0) ([8:0][A:1][C:E][E:F])
	.word ($0D0C) ;D0C (0) ([8:0][A:1][C:E][E:F])
	.word ($2B2A) ;2B2A (0) ([8:0][A:1][C:E][E:F])
	.word ($2D2C) ;2D2C (0) ([8:0][A:1][C:E][E:F])
	.word (DataTableEntry_35B4) ;B5B4 (35B4) ([8:0][A:1][C:E][E:F])
	.word (DataTableEntry_37B6) ;B7B6 (37B6) ([8:0][A:1][C:E][E:F])
	.word (DataTableEntry_31B0) ;B1B0 (31B0) ([8:0][A:1][C:E][E:F])
	.word (DataTableEntry_33B2) ;B3B2 (33B2) ([8:0][A:1][C:E][E:F])
DataTableEntry_1DCF3:
	.byte $10,$52,$04,$10,$53,$04,$EA,$54,$08,$E2,$55
DataTableEntry_1DCFE:
	.byte $10,$52,$04,$10,$53,$04,$EA,$54,$08,$DA,$68
DataTableEntry_1DD09:
	.byte $10,$69,$04,$10,$6A,$04,$EA,$6C,$08,$DA,$6B
DataTableEntry_1DD14:
	.byte $10,$6D,$04,$10,$6E,$04,$EA,$70,$08,$DA,$6F
DataTableEntry_1DD1F:
	.byte $10,$6D,$04,$10,$6E,$04,$EA,$72,$08,$DA,$71
ObjectLoadAutomaticSpriteNumber:
	lda ObjectPoseChangeCounter,x
	bmi @DD86
	beq @DD35
	dec ObjectPoseChangeCounter,x
	rts

	@DD35:
	lda #$00
	sta Temp95
	lda ObjectIndexToAutomaticSpriteDataTable,x
	sta Temp94
	asl a
	rol Temp95
	clc
	adc Temp94
	sta Temp94
	lda Temp95
	adc #$00
	sta Temp95
	beq @DD5B
	lda AutomaticSpriteDataTablePointer1
	sta TempPtr08_lo
	lda AutomaticSpriteDataTablePointer1+1
	sta TempPtr08_hi
	jmp @DD65

	@DD5B:
	lda AutomaticSpriteDataTablePointer0
	sta TempPtr08_lo
	lda AutomaticSpriteDataTablePointer0+1
	sta TempPtr08_hi
	@DD65:
	 ldy Temp94
	lda (TempPtr08_lo),y
	cmp ObjectCurrentPose2,x
	bcs @DD73
	lda #$00
	sta ObjectCurrentPose2,x
	@DD73:
	iny
	lda (TempPtr08_lo),y
	clc
	adc ObjectCurrentPose2,x
	sta ObjectCurrentPose1,x
	iny
	lda (TempPtr08_lo),y
	sta ObjectPoseChangeCounter,x
	inc ObjectCurrentPose2,x
	@DD86:
	  rts
;------------------------------------------
SetObjectIndexToAutomaticSpriteDataTable_to_A_for_Simon:
	ldx #$00
	beq SetObjectIndexToAutomaticSpriteDataTable_to_A
;------------------------------------------
SetObjectIndexToAutomaticSpriteDataTable_to_A_and_PaletteIndexTo0:
	pha
	 lda #$00
	 sta ObjectPaletteIndex,x
	pla
SetObjectIndexToAutomaticSpriteDataTable_to_A:
	sta ObjectIndexToAutomaticSpriteDataTable,x
	lda #$00
	sta ObjectCurrentPose2,x
	sta ObjectPoseChangeCounter,x
	rts
;------------------------------------------
AutomaticSpriteDataTablePointer0:
	.word (AutomaticSpriteDataTable) ;DDA2 (1DDA2) ()
AutomaticSpriteDataTablePointer1:
	.word (AutomaticSpriteDataTable +256) ;DDA2 (1DDA2) ()
AutomaticSpriteDataTable:
                            ; Byte 0: Number of animation frames - 1:
                            ; Byte 1: First sprite number:
                            ; Byte 2: Number of frames between toggle:
	.byte $03,$01,$0A, $00,$05,$80, $00,$06,$80, $00,$08,$80
	.byte $03,$0A,$02, $01,$0E,$10, $01,$10,$10, $01,$12,$08
	.byte $03,$15,$08, $01,$19,$08, $01,$1C,$0C, $01,$1E,$0C
	.byte $01,$20,$0C, $01,$22,$0C, $01,$24,$0C, $01,$26,$0C
	.byte $03,$2A,$04, $00,$04,$80, $01,$31,$18, $01,$35,$18
	.byte $02,$37,$06, $01,$44,$18, $01,$49,$08, $01,$8E,$18
	.byte $01,$4F,$08, $02,$59,$08, $01,$5D,$10, $01,$5F,$08
	.byte $01,$61,$08, $01,$63,$10, $01,$65,$10, $00,$73,$80
	.byte $01,$78,$08, $04,$A4,$08, $04,$A8,$08, $01,$2E,$10
	.byte $02,$90,$08, $01,$93,$10, $01,$95,$08, $03,$97,$08
	.byte $01,$ED,$08, $01,$9D,$10, $03,$9F,$0A, $00,$A3,$80
	.byte $00,$A2,$80, $03,$B0,$02, $03,$B4,$02, $01,$81,$08
	.byte $03,$B8,$02, $00,$42,$80, $00,$AD,$80, $00,$41,$80
	.byte $00,$3A,$80, $01,$BC,$10, $00,$74,$80, $01,$3F,$10
	.byte $01,$46,$10, $01,$C6,$08, $01,$C8,$10, $00,$30,$80
	.byte $03,$CF,$08, $03,$C3,$08, $03,$E2,$20, $01,$E6,$10
_func_1DE62:
	jsr _func_1D3F6
	lda ObjectScreenYCoord,x
	clc
	adc #$03
	sta ObjectScreenYCoord,x
	rts
;------------------------------------------
_func_1DE6F:
	sta TempPtr08_lo
	jsr Object_SetFacing_FaceTowardsSimon
	lda #$00
	ldy TempPtr08_lo
	jmp Object_SetXVelocity16bit_from_AY_invert_if_ObjectFacingLeft_set
;------------------------------------------
_func_1DE7B:
	sta ObjectType,x
	lda ObjectScreenXCoord,y
	sta ObjectScreenXCoord,x
	lda ObjectScreenYCoord,y
	sta ObjectScreenYCoord,x
	rts
;------------------------------------------
_func_1DE8B:
	lda ObjectFacingLeft,x
	bne @DE94
	lda #$FA
	bne @DE96

	@DE94:
	lda #$06
	@DE96:
	 ldy #$00
	jsr Object_GenericCollisionHelper_ParamAY_ReturnCarry_IfFrameOddThenDefaultSEC
	bcs @DEA0
	jsr Object_SetXVelocity16bit_InvertCurrent_AndAlso_ObjectFacingLeft
	@DEA0:
	rts
;------------------------------------------
_func_1DEA1:
	lda ObjectFacingLeft,x
	bne @DEAA
	lda #$FA
	bne @DEAC

	@DEAA:
	lda #$06
	@DEAC:
	 ldy #$10
	jsr Object_GenericCollisionHelper_ParamAY_ReturnCarry_IfFrameOddThenDefaultCLC
	bcc @DEB6
	jsr Object_SetXVelocity16bit_InvertCurrent_AndAlso_ObjectFacingLeft
	@DEB6:
	rts
;------------------------------------------
Math_NegateA:
	eor #$FF
	clc
	adc #$01
	rts
;------------------------------------------
Object_SetCurrentActionType_For_Simon:
	ldx #$00
	jmp Object_SetCurrentActionType
;------------------------------------------
Object_SetCurrentActionType_to_80:
	lda #$80
	bne Object_SetCurrentActionType
;------------------------------------------
Object_SetCurrentActionType_to_02:
	lda #$02
	bne Object_SetCurrentActionType
;------------------------------------------
Object_SetCurrentActionType_to_01:
	lda #$01
Object_SetCurrentActionType:
	sta ObjectCurrentActionType,x
	rts
;------------------------------------------
Object_SetCurrentActionType_And_Y_as_Pose1:
	sta ObjectCurrentActionType,x
	tya
	sta ObjectCurrentPose1,x
	rts
;------------------------------------------
SetObjectIndexToAutomaticSpriteDataTable_to_A_and_PaletteIndexTo0_and_RefreshSprite:
	jsr SetObjectIndexToAutomaticSpriteDataTable_to_A_and_PaletteIndexTo0
	jmp ObjectLoadAutomaticSpriteNumber
;------------------------------------------
MathBCD_addition_In_Var08_Var09_Out_AandCarry_Temp_Var0A_Var0B:
	lda TempPtr08_hi
	and #$0F
	sta ObstaclePointerLo
	lda TempPtr08_lo
	and #$0F
	clc
	adc ObstaclePointerLo
	cmp #$0A
	bcc @DEF1
	adc #$05
	@DEF1:
	sta ObstaclePointerLo
	lda TempPtr08_hi
	and #$F0
	sta ObstaclePointerHi
	lda TempPtr08_lo
	and #$F0
	clc
	adc ObstaclePointerHi
	adc ObstaclePointerLo
	bcs @DF08
	cmp #$A0
	bcc @DF0E
	@DF08:
	sbc #$A0
	bcc @DF0E
	sec
	rts

	@DF0E:
	 clc
	rts
;------------------------------------------
MathBCD_subtract:
	lda TempPtr08_hi
	and #$0F
	sta ObstaclePointerLo
	lda TempPtr08_lo
	and #$0F
	sec
	sbc ObstaclePointerLo
	bcs @DF25
	sec
	sbc #$06
	and #$0F
	clc
	@DF25:
	sta ObstaclePointerLo
	lda TempPtr08_hi
	and #$F0
	bcs @DF2F
	adc #$10
	@DF2F:
	sta ObstaclePointerHi
	lda TempPtr08_lo
	and #$F0
	ora ObstaclePointerLo
	sec
	sbc ObstaclePointerHi
	bcs @DF40
	adc #$A0
	clc
	rts

	@DF40:
	sec
	rts
;------------------------------------------
Object_Erase_And_IfType3C_Set_42to00:
	lda ObjectType,x
	cmp #$3C
	bne Object_Erase
	lda #$00
	sta Unknown42
Object_Erase:
	lda #$00
	sta ObjectType,x
	sta ObjectFacingLeft,x
	sta ObjectDialogStatusFlag,x
	sta ObjectCurrentPose2,x
	sta ObjectUnknown432,x
	sta ObjectCurrentActionType,x
	sta ObjectCurrentPose1,x
	sta ObjectPaletteIndex,x
	sta ObjectScreenXCoord,x
	sta ObjectScreenXCoordFrac,x
	sta ObjectScreenYCoord,x
	sta ObjectScreenYCoordFrac,x
	sta ObjectDialogTextIndex,x
	sta ObjectFacingLeft,x
	sta ObjectEnemyRemainingHP,x
	sta ObjectStunCounter,x
_loc_1DF7F:
	jsr _func_1DF93
Object_SetXandYVelocity16bit_ToZero:
	lda #$00
	sta ObjectXSpeed,x
	sta ObjectXSpeedFrac,x
Object_SetYVelocity16bit_ToZero:
	lda #$00
	sta ObjectYSpeed,x
	sta ObjectYSpeedFrac,x
	rts
;------------------------------------------
_func_1DF93:
	jsr _func_1DFA3
	sta Ending_PrimaryActionIndex,x
	sta ObjectAIvar4,x
	sta ObjectAIvar5,x
	sta ObjectAIvar6,x
	rts
;------------------------------------------
_func_1DFA3:
	lda #$00
	sta ObjectAIvar3,x
_func_1DFA8:
	lda #$00
	sta ObjectAIvar2,x
_func_1DFAD:
	lda #$00
	sta ObjectAIvar1,x
	rts
;------------------------------------------
Object_FindUnusedSlot:
	ldx #$06
	@DFB5:
	lda ObjectType,x
	beq @DFC1
	inx
	cpx #$12
	bne @DFB5
	sec
	rts

	@DFC1:
	clc
	rts
;------------------------------------------
DeleteAllMonstersExceptFerryManAndHisBoat:
	ldx #$11
	@DFC5:
	lda ObjectType,x
	cmp #$1C
	beq @DFDE
	cmp #$3C
	beq @DFD7
	cmp #$3D
	beq @DFD7
	jmp @DFDB

	@DFD7:
	lda Unknown41
	bne @DFDE
	@DFDB:
	 jsr Object_Erase_And_IfType3C_Set_42to00
	@DFDE:
	  dex
	cpx #$02
	bne @DFC5
	rts
;------------------------------------------
Object_GravityAccelerateBy_Var08:
	lda #$00
	sta TempPtr08_hi
_loc_1DFE8:
	lda ObjectYSpeedFrac,x
	clc
	adc TempPtr08_lo
	sta ObjectYSpeedFrac,x
	lda ObjectYSpeed,x
	adc TempPtr08_hi
	sta ObjectYSpeed,x
	rts
;------------------------------------------
Object_GravityDecelerateBy_Var08:
	lda #$00
	sta TempPtr08_hi
	lda ObjectYSpeedFrac,x
	sec
	sbc TempPtr08_lo
	sta ObjectYSpeedFrac,x
	lda ObjectYSpeed,x
	sbc TempPtr08_hi
	sta ObjectYSpeed,x
	rts
;------------------------------------------
Object_SetFacing_FaceTowardsSimon:
	jsr Object_SetCarry_If_OnRightSideOfSimon
	bcs @E019
	lda #$01
	bne @E01B

	@E019:
	lda #$00
	@E01B:
	 sta ObjectFacingLeft,x
	rts
;------------------------------------------
Object_SetXVelocity16bit_InvertCurrent_AndAlso_ObjectFacingLeft:
	lda ObjectFacingLeft,x
	eor #$01
	sta ObjectFacingLeft,x
Object_SetXVelocity16bit_InvertCurrent:
	lda ObjectXSpeedFrac,x
	jsr Math_NegateA
	sta ObjectXSpeedFrac,x
	lda ObjectXSpeed,x
	eor #$FF
	adc #$00
	sta ObjectXSpeed,x
	rts
;------------------------------------------
Object_SetYVelocity16bit_InvertCurrent:
	lda ObjectYSpeedFrac,x
	jsr Math_NegateA
	sta ObjectYSpeedFrac,x
	lda ObjectYSpeed,x
	eor #$FF
	adc #$00
	sta ObjectYSpeed,x
	rts
;------------------------------------------
Object_SetXVelocity16bit_from_AY_invert_if_ObjectFacingLeft_set:
	sta TempPtr00_hi
	sty TempPtr00_lo
	lda ObjectFacingLeft,x
	bne Object_SetXVelocity16bit_from_00
	jsr Math_Negate16bitWordAt00
Object_SetXVelocity16bit_from_00:
	lda TempPtr00_hi
	sta ObjectXSpeed,x
	lda TempPtr00_lo
	sta ObjectXSpeedFrac,x
	rts
;------------------------------------------
Math_Negate16bitWordAt00:
	lda TempPtr00_lo
	jsr Math_NegateA
	sta TempPtr00_lo
	lda TempPtr00_hi
	eor #$FF
	adc #$00
	sta TempPtr00_hi
	rts
;------------------------------------------
Object_SetYVelocity16bit_from_AY:
	sta ObjectYSpeed,x
	tya
	sta ObjectYSpeedFrac,x
	rts
;------------------------------------------
UnusedE07E:
	stx Unknown10_CollisionAndScrollingTemp
	lda ObjectAIvar4,x
	beq @E08B
	tax
	jsr _func_1E08C
	ldx Unknown10_CollisionAndScrollingTemp
	@E08B:
	rts
;------------------------------------------
_func_1E08C:
	lda ObjectCurrentActionType,x
	and #$08
	bne @E099
	jsr Object_GeneringXmovementEngine
	jmp _loc_1E224

	@E099:
	lda ObjectCurrentActionType,x
	and #$F7
	sta ObjectCurrentActionType,x
	rts
;------------------------------------------
Object_IncreaseXPositionByVar37_DeleteIfGoesOutScreen:
	lda $37
	beq @E0C0
	bmi @E0B4
	clc
	adc ObjectScreenXCoord,x
	sta ObjectScreenXCoord,x
	bcc @E0C0
	jmp Object_Erase_And_IfType3C_Set_42to00

	@E0B4:
	clc
	adc ObjectScreenXCoord,x
	sta ObjectScreenXCoord,x
	bcs @E0C0
	jmp Object_Erase_And_IfType3C_Set_42to00

	@E0C0:
	 rts
;------------------------------------------
Object_IncreaseYPositionByVar3A_DeleteIfGoesOutScreen:
	lda $3A
	beq @E0DF
	bmi @E0D3
	clc
	adc ObjectScreenYCoord,x
	sta ObjectScreenYCoord,x
	bcc @E0DF
	jmp Object_Erase_And_IfType3C_Set_42to00

	@E0D3:
	clc
	adc ObjectScreenYCoord,x
	sta ObjectScreenYCoord,x
	bcs @E0DF
	jmp Object_Erase_And_IfType3C_Set_42to00

	@E0DF:
	 rts
;------------------------------------------
Object_IncreaseYPositionByYVelocity:
	lda ObjectScreenYCoordFrac,x
	clc
	adc ObjectYSpeedFrac,x
	sta ObjectScreenYCoordFrac,x
	lda ObjectScreenYCoord,x
	adc ObjectYSpeed,x
	sta ObjectScreenYCoord,x
	rts
;------------------------------------------
Object_GeneringXYmovementEngine:
	jsr Object_IncreaseYPositionByYVelocity
	lda ObjectYSpeed,x
	ror a
	and #$C0
	beq @E156
	cmp #$C0
	bne @E14C
	beq @E156
	@E105:
	   jsr _func_1E28B
	@E108:
	  lda ObjectDialogStatusFlag,x
	and #$02
	bne @E122
	lda ObjectScreenYCoord,x
	cmp #$E0
	bcs @E125
	cmp #$08
	bcc @E125
	lda ObjectDialogStatusFlag,x
	and #$BF
	sta ObjectDialogStatusFlag,x
	@E122:
	  jmp _loc_1E16B

	@E125:
	 lda ObjectDialogStatusFlag,x
	and #$40
	bne @E122
	lda ObjectDialogStatusFlag,x
	ora #$40
	sta ObjectDialogStatusFlag,x
	jmp _loc_1E16B

	@E137:
	 lda ObjectDialogStatusFlag,x
	and #$02
	beq @E108
	lda ObjectScreenYCoord,x
	cmp #$20
	bcc @E108
	cmp #$E0
	bcs @E108
	@E149:
	jmp Object_Erase_And_IfType3C_Set_42to00

	@E14C:
	  lda ObjectCurrentActionType,x
	and #$02
	bne _loc_1E160
	jmp @E105

	@E156:
	   lda ObjectCurrentActionType,x
	and #$02
	bne _loc_1E160
	jmp @E137
;------------------------------------------
_loc_1E160:
	lda ObjectScreenYCoord,x
	cmp #$E0
	bcs @E149
	cmp #$20
	bcc @E149
_loc_1E16B:
	lda ObjectScreenXCoordFrac,x
	clc
	adc ObjectXSpeedFrac,x
	sta ObjectScreenXCoordFrac,x
	lda ObjectScreenXCoord,x
	adc ObjectXSpeed,x
	sta ObjectScreenXCoord,x
	bcc @E187
	lda ObjectXSpeed,x
	bpl @E18C
	bmi @E195
	@E187:
	lda ObjectXSpeed,x
	bpl @E195
	@E18C:
	 lda ObjectCurrentActionType,x
	and #$02
	bne @E19E
	beq _loc_1E1C3
	@E195:
	  lda ObjectCurrentActionType,x
	and #$02
	bne @E19E
	beq _loc_1E204
	@E19E:
	   lda ObjectScreenXCoord,x
	cmp #$FC
	bcs @E149
	cmp #$0C
	bcc @E149
	rts
;------------------------------------------
Object_GeneringXmovementEngine:
	lda ObjectCurrentActionType,x
	and #$02
	beq @E1B4
	jmp Object_IncreaseXPositionByVar37_DeleteIfGoesOutScreen

	@E1B4:
	lda $37
	beq @E1F3
	bmi _loc_1E219
	clc
	adc ObjectScreenXCoord,x
	sta ObjectScreenXCoord,x
	bcc _loc_1E204
_loc_1E1C3:
	lda ObjectDialogStatusFlag,x
	and #$01
	bne @E1D1
	lda ObjectDialogStatusFlag,x
	ora #$01
	bne @E1D6
	@E1D1:
	lda ObjectDialogStatusFlag,x
	and #$FE
	@E1D6:
	 sta ObjectDialogStatusFlag,x
	@E1D9:
	 lda ObjectDialogStatusFlag,x
	and #$01
	bne @E1F3
	lda ObjectScreenXCoord,x
	cmp #$F8
	bcs _loc_1E1F4
	cmp #$08
	bcc _loc_1E1F4
	lda ObjectDialogStatusFlag,x
	and #$7F
	sta ObjectDialogStatusFlag,x
_loc_1E1F3:
	rts
;------------------------------------------
_loc_1E1F4:
	lda ObjectDialogStatusFlag,x
	and #$80
	bne @E1F3
	lda ObjectDialogStatusFlag,x
	ora #$80
	sta ObjectDialogStatusFlag,x
	rts
;------------------------------------------
_loc_1E204:
	lda ObjectDialogStatusFlag,x
	and #$01
	beq @E1D9
	lda ObjectScreenXCoord,x
	cmp #$40
	bcc @E1D9
	cmp #$C0
	bcs @E1D9
	jmp Object_Erase_And_IfType3C_Set_42to00
;------------------------------------------
_loc_1E219:
	clc
	adc ObjectScreenXCoord,x
	sta ObjectScreenXCoord,x
	bcc _loc_1E1C3
	bcs _loc_1E204
_loc_1E224:
	lda ObjectCurrentActionType,x
	and #$02
	beq @E22E
	jmp Object_IncreaseYPositionByVar3A_DeleteIfGoesOutScreen

	@E22E:
	lda $3A
	beq @E25A
	bmi @E280
	clc
	adc ObjectScreenYCoord,x
	sta ObjectScreenYCoord,x
	bcc @E26B
	@E23D:
	  jsr _func_1E28B
	@E240:
	 lda ObjectDialogStatusFlag,x
	and #$02
	bne @E25A
	lda ObjectScreenYCoord,x
	cmp #$E0
	bcs @E25B
	cmp #$10
	bcc @E25B
	lda ObjectDialogStatusFlag,x
	and #$BF
	sta ObjectDialogStatusFlag,x
	@E25A:
	  rts

	@E25B:
	 lda ObjectDialogStatusFlag,x
	and #$40
	bne @E25A
	lda ObjectDialogStatusFlag,x
	ora #$40
	sta ObjectDialogStatusFlag,x
	rts

	@E26B:
	    lda ObjectDialogStatusFlag,x
	and #$02
	beq @E240
	lda ObjectScreenYCoord,x
	cmp #$20
	bcc @E240
	cmp #$E0
	bcs @E240
	jmp Object_Erase_And_IfType3C_Set_42to00

	@E280:
	   clc
	adc ObjectScreenYCoord,x
	sta ObjectScreenYCoord,x
	bcc @E23D
	bcs @E26B
_func_1E28B:
	lda ObjectDialogStatusFlag,x
	and #$02
	bne @E299
	lda ObjectDialogStatusFlag,x
	ora #$02
	bne @E29E
	@E299:
	lda ObjectDialogStatusFlag,x
	and #$FD
	@E29E:
	 sta ObjectDialogStatusFlag,x
	rts
;------------------------------------------
Object_GenericCollisionHelper_ParamAY_ReturnCarry_IfFrameOddThenDefaultSEC:
	sta Temp93
	sty Temp97
	lda FrameCounter
	and #$01
	bne _loc_1E2FC
	jmp _loc_1E2B9
;------------------------------------------
Object_GenericCollisionHelper_ParamAY_ReturnCarry_IfFrameOddThenDefaultCLC:
	sta Temp93
	sty Temp97
	lda FrameCounter
	and #$01
	bne @E2FA
_loc_1E2B9:
	ldy #$00
	lda Temp93
	bpl @E2C1
	ldy #$FF
	@E2C1:
	sty TempPtr08_lo
	lda ObjectDialogStatusFlag,x
	and #$01
	beq @E2D7
	ldy #$01
	lda ObjectScreenXCoord,x
	cmp #$80
	bcc @E2D9
	ldy #$FF
	bne @E2D9

	@E2D7:
	ldy #$00
	@E2D9:
	 sty TempPtr08_hi
	lda ObjectScreenXCoord,x
	clc
	adc Temp93
	sta TempPtr02_lo
	lda TempPtr08_hi
	adc TempPtr08_lo
	sta TempPtr02_hi
	lda Temp97
	clc
	adc ObjectScreenYCoord,x
	sta TempPtr00_lo
	jsr LoadObstacleBufferBits
	beq _loc_1E2FC
	cmp #$03
	beq _loc_1E2FC
	@E2FA:
	  clc
	rts
;------------------------------------------
_loc_1E2FC:
	sec
	rts
;------------------------------------------
Object_CreateThreeWaterSplashes_AroundSimon:
	ldx #$00
Object_CreateThreeWaterSplashes_AroundObjectX:
                            ; First  object (#$11): Y speed = $FF.00, X speed = $FF.80:
                            ; Second object (#$10): Y speed = $FE.00, X speed = $00.80:
                            ; Third  object (#$0F): Y speed = $FD.00, X speed = $FF.40:
	lda #$00
	sta Temp93
	ldy #$11
	@E306:
	lda ObjectType,y
	bne @E34B
	lda #$07
	sta ObjectType,y
	lda ObjectScreenXCoord,x
	sta ObjectScreenXCoord,y
	lda ObjectScreenYCoord,x
	sta ObjectScreenYCoord,y
	stx Unknown10_CollisionAndScrollingTemp
	lda Temp93
	jsr Math_mulAby4
	tax
	lda WaterSplash_YcoordinateTable,x
	sta ObjectYSpeed,y
	lda WaterSplash_YFracCoordinateTable,x
	sta ObjectYSpeedFrac,y
	lda WaterSplash_XcoordinateTable,x
	sta ObjectXSpeed,y
	bmi @E33C
	lda #$01
	bne @E33E

	@E33C:
	lda #$00
	@E33E:
	 sta ObjectFacingLeft,y
	lda WaterSplash_XFracCoordinateTable,x
	sta ObjectXSpeedFrac,y
	ldx Unknown10_CollisionAndScrollingTemp
	inc Temp93
	@E34B:
	  dey
	cpy #$0E
	bne @E306
	lda #$1D
	jmp AnyBankPlayTracks
;------------------------------------------
WaterSplash_YcoordinateTable:
	.byte $FF
WaterSplash_YFracCoordinateTable:
	.byte $00
WaterSplash_XcoordinateTable:
	.byte $FF
WaterSplash_XFracCoordinateTable:
	.byte $80
WaterSplash_CoordinateTableContinues:
	.byte $FE,$00,$00,$80, $FD,$00,$FF,$40
Math_mul93by16:
	asl Temp93
	asl Temp93
Math_mul93by4:
	asl Temp93
	asl Temp93
	rts
;------------------------------------------
Math_div93by16:
	lsr Temp93
	lsr Temp93
Math_div93by4:
	lsr Temp93
	lsr Temp93
	rts
;------------------------------------------
Math_divAby16:
	lsr a
	lsr a
	lsr a
	lsr a
	rts
;------------------------------------------
Math_mulAby16:
	asl a
	asl a
Math_mulAby4:
	asl a
	asl a
	rts
;------------------------------------------
PPU_Text_Put3bytes_01_and_AttributeTableAddress:
	ldx PPUsendQueueHead
	lda #$01
PPU_Text_Put3bytes_A_and_AttributeTableAddress:
	sta PPUsendQueue,x
	inx
	lda AttributeTableAddressHi
	sta PPUsendQueue,x
	inx
	lda Unknown60_ScrollingRelated
PPU_Text_PutA:
	sta PPUsendQueue,x
	inx
	stx PPUsendQueueHead
	rts
;------------------------------------------
PPU_Text_Put3bytes_01_and_NameTableAddress:
	ldx PPUsendQueueHead
	lda #$01
	jsr PPU_Text_PutA
	lda NameTableAddressHi
	jsr PPU_Text_PutA
	lda NameTableAddressLo
	jmp PPU_Text_PutA
;------------------------------------------
_func_1E3A5:
	jsr _func_1EAC1
	jsr _func_1E72C
	jsr _func_1E3B4
	jsr _func_1E4DB
	jmp _loc_1E5CC
;------------------------------------------
_func_1E3B4:
	ldy $6B
	beq @E3BE
	dey
	beq @E3BF
	dey
	beq @E3C4
	@E3BE:
	rts

	@E3BF:
	 lda CurrentYScrollingPosition_SomeOtherUnit
	jmp @E3C6

	@E3C4:
	  lda CurrentYScrollingPosition_Related
	@E3C6:
	   sta $05
	ldy #$00
	@E3CA:
	cmp #$1E
	bcc @E3D4
	sec
	sbc #$1E
	iny
	bne @E3CA
	@E3D4:
	and #$FC
	@E3D6:
	dey
	bmi @E3DE
	clc
	adc #$1E
	bne @E3D6
	@E3DE:
	cmp CurrentYScrollingPosition_SomeOtherUnit
	bcs @E3E6
	ldy CurrentYScrollingPosition_Related
	dey
	tya
	@E3E6:
	sta $05
	sta Unknown6A_ScrollingRelated
	jsr Split_6A_into_10_11_and_12
	lda Unknown10_CollisionAndScrollingTemp
	sta $16
	lda $59
	and #$F0
	sta Temp07
	lda #$02
	sta $98
	@E3FB:
	 lda #$08
	sta $0E
_loc_1E3FF:
	lda Temp07
DataTableEntry_1E401:
	lsr a
	lsr a
	lsr a
	sta Unknown14_Horizontal_256pixelUnitForObject
	lda Temp07
	and #$07
	sta Unknown13_Horizontal_32pixelUnitForObject
	jsr Convert_6A_13_14_into_NameTableAddress_and_AttributeTableAddress
	jsr LoadLevelDataScreensPointerLo_SomePointerIndexedBy12and14_StoreTo02
	jsr PPU_Text_Put3bytes_01_and_AttributeTableAddress
_loc_1E415:
	lda Unknown11_CollisionAndScrollingTemp
	asl a
	asl a
	asl a
	clc
	adc Unknown13_Horizontal_32pixelUnitForObject
	sta Temp97
	jsr Load_Room_MetaTileNumber_StoreTo62
	lda #$04
	jsr SwitchBank_NewPage
	ldy $62
	iny
	lda (LevelData_MetaTiles_pointerLo),y
	sta Temp93
	lda $16
	and #$02
	beq @E43C
	lsr Temp93
	lsr Temp93
	lsr Temp93
	lsr Temp93
	@E43C:
	lda Temp93
	and #$0F
	sta TempPtr08_lo
	inc Unknown6A_ScrollingRelated
	inc Unknown6A_ScrollingRelated
	lda CurrentYScrollingPosition_Related
	cmp Unknown6A_ScrollingRelated
	bcs @E450
	lda CurrentYScrollingPosition_SomeOtherUnit
	sta Unknown6A_ScrollingRelated
	@E450:
	jsr Split_6A_into_10_11_and_12
	jsr LoadLevelDataScreensPointerLo_SomePointerIndexedBy12and14_StoreTo02
	lda Unknown11_CollisionAndScrollingTemp
	asl a
	asl a
	asl a
	clc
	adc Unknown13_Horizontal_32pixelUnitForObject
	sta Temp97
	jsr Load_Room_MetaTileNumber_StoreTo62
	lda #$04
	jsr SwitchBank_NewPage
	ldy $62
	iny
	lda (LevelData_MetaTiles_pointerLo),y
	sta Temp93
	lda Unknown10_CollisionAndScrollingTemp
	and #$02
	bne @E47D
	asl Temp93
	asl Temp93
	asl Temp93
	asl Temp93
	@E47D:
	lda Temp93
	and #$F0
	ora TempPtr08_lo
	sta TempPtr08_lo
	cmp #$05
	bcc @E4C4
	@E489:
	jsr PPU_Text_ExtractAndSend_Finish_PutA
	inc Temp07
	lda Temp07
	cmp $59
	beq @E49C
	bcc @E49C
	lda $58
	bmi @E4D8
	sta Temp07
	@E49C:
	lda $05
	sta Unknown6A_ScrollingRelated
	jsr Split_6A_into_10_11_and_12
	lda Temp07
	lsr a
	lsr a
	lsr a
	sta Unknown14_Horizontal_256pixelUnitForObject
	lda Temp07
	and #$07
	sta Unknown13_Horizontal_32pixelUnitForObject
	jsr LoadLevelDataScreensPointerLo_SomePointerIndexedBy12and14_StoreTo02
	dec $0E
	beq @E4BA
	jmp _loc_1E415

	@E4BA:
	jsr PPU_Text_PutFF
	dec $98
	beq @E4F2
	jmp @E3FB

	@E4C4:
	 ldx PPUsendQueueHead
	lda PPUsendQueueMinus1,x
	cmp #$FF
	beq @E4D2
	lda TempPtr08_lo
	jmp @E489

	@E4D2:
	jsr PPU_Text_PutFF
	jmp _loc_1E3FF

	@E4D8:
	  jmp PPU_Text_PutFF
;------------------------------------------
_func_1E4DB:
	lda #$00
	sta $6B
	lda CurrentYScrollingPosition_SomeOtherUnit
	cmp $69
	beq @E4F2
	sta $69
	lda $68
	and #$03
	tay
	dey
	beq _loc_1E4F3
	dey
	beq _loc_1E4FC
	@E4F2:
	     rts
;------------------------------------------
_loc_1E4F3:
	ldx #$00
	lda CurrentYScrollingPosition_SomeOtherUnit
	bmi @E4F2
	jmp _loc_1E500
;------------------------------------------
_loc_1E4FC:
	ldx #$01
	lda CurrentYScrollingPosition_Related
_loc_1E500:
	stx $06
	sta Unknown6A_ScrollingRelated
	jsr Split_6A_into_10_11_and_12
	lda $59
	and #$F0
	sta Temp07
	lsr a
	lsr a
	lsr a
	sta Unknown14_Horizontal_256pixelUnitForObject
	lda Temp07
	and #$07
	sta Unknown13_Horizontal_32pixelUnitForObject
	jsr Convert_6A_13_14_into_NameTableAddress_and_AttributeTableAddress
	jsr LoadLevelDataScreensPointerLo_SomePointerIndexedBy12and14_StoreTo02
	@E51E:
	  jsr PPU_Text_Put3bytes_01_and_NameTableAddress
	jsr Convert_NameTableAddress_To_ObstacleBufferAddress
	lda #$00
	sta $0C
	lda #$08
	sta $0E
	@E52C:
	 jsr Load_MetaTile_ParticularTileStoreTo16_and_0F09
	jsr Load_MetaTile_ParticularRowPointerStoreTo16
	ldx PPUsendQueueHead
	lda #$04
	sta Temp93
	ldy #$00
	sty Temp97
	lda Temp07
	asl a
	sta $0D
	@E541:
	jsr SubstituteBlockCheckFakeBlocks
	cmp #$FF
	bne @E54C
	ldy Temp97
                            ; Load tile that is drawn when scrolling vertically:
	lda ($16),y
	@E54C:
	sta PPUsendQueue,x
	jsr AddTileAttributesTo94
	inc Temp97
	inx
	dec Temp93
	bne @E541
	stx PPUsendQueueHead
	ldy $0C
	lda Temp94
	sta (ObstaclePointerLo),y
	iny
	sty $0C
	inc Temp07
	lda Temp07
	cmp $59
	beq @E584
	bcc @E584
	lda $58
	bmi @E59A
	sta Temp07
	lda Temp07
	lsr a
	lsr a
	lsr a
	sta Unknown14_Horizontal_256pixelUnitForObject
	lda Temp07
	and #$07
	sta Unknown13_Horizontal_32pixelUnitForObject
	jmp @E593

	@E584:
	lda Temp07
	lsr a
	lsr a
	lsr a
	sta Unknown14_Horizontal_256pixelUnitForObject
	lda Temp07
	and #$07
	sta Unknown13_Horizontal_32pixelUnitForObject
	bne @E596
	@E593:
	 jsr LoadLevelDataScreensPointerLo_SomePointerIndexedBy12and14_StoreTo02
	@E596:
	  dec $0E
	bne @E52C
	@E59A:
	   jsr PPU_Text_PutFF
	lda NameTableAddressHi
	and #$04
	bne @E5AC
	lda NameTableAddressHi
	ora #$04
	sta NameTableAddressHi
	jmp @E51E

	@E5AC:
	lda NameTableAddressLo
	and #$20
	bne @E5BD
	lda $06
	bne @E5BA
	lda #$01
	@E5B8:
	 sta $6B
	@E5BA:
	  pla
	pla
	rts

	@E5BD:
	 lda $06
	beq @E5BA
	lda #$02
	bne @E5B8
;------------------------------------------
Inc_NameTableAddress_by_0020:
	lda #$20
	ldx #$5E
	jmp Inc16bitPointerAtX_by_A
;------------------------------------------
_loc_1E5CC:
	lda $58
	cmp $66
	beq @E5D7
	sta $66
	jsr _func_1E832
	@E5D7:
	ldy $67
	dey
	beq @E5E8
	dey
	beq @E5EC
	lda $68
	beq @E607
	bmi @E607
	jmp _func_1E832

	@E5E8:
	ldx #$01
	bne @E5EE

	@E5EC:
	 ldx #$00
	@E5EE:
	  stx $96
	lda $5A,x
	sta Unknown6A_ScrollingRelated
	lda $58,x
	bmi @E607
	sta Temp07
	jsr _func_1EA96
_loc_1E5FD:
	lda Unknown6A_ScrollingRelated
	bpl _loc_1E608
	lda #$00
_loc_1E603:
	ldx $96
	sta $5A,x
	@E607:
	   rts
;------------------------------------------
_loc_1E608:
	jsr Split_6A_into_10_11_and_12
	jsr Convert_6A_13_14_into_NameTableAddress_and_AttributeTableAddress
	@E60E:
	   jsr LoadLevelDataScreensPointerLo_SomePointerIndexedBy12and14_StoreTo02
	@E611:
	  jsr Load_MetaTile_ParticularTileStoreTo16_and_0F09
	@E614:
	 jsr Load_MetaTile_ParticularRowPointerStoreTo16
	lda #$00
	sta $04
	sta Temp97
	@E61D:
	jsr Convert_NameTableAddress_To_ObstacleBufferAddress
	jsr PPU_Text_Put3bytes_01_and_NameTableAddress
	lda Temp07
	jsr _func_1E845
	ldy #$00
	lda Temp94
	sta (ObstaclePointerLo),y
	jsr Inc_NameTableAddress_by_0020
	inc $04
	inc Unknown10_CollisionAndScrollingTemp
	inc Unknown6A_ScrollingRelated
	lda CurrentYScrollingPosition_Related
	cmp Unknown6A_ScrollingRelated
	bcs @E649
	lda CurrentYScrollingPosition_SomeOtherUnit
	sta Unknown6A_ScrollingRelated
	lda $04
	cmp #$02
	bcs @E64F
	bcc _loc_1E69B
	@E649:
	lda NameTableAddressLo
	and #$20
	bne @E61D
	@E64F:
	 ldy $62
	iny
	lda (LevelData_MetaTiles_pointerLo),y
	sta Temp93
	lda Unknown10_CollisionAndScrollingTemp
	and #$02
	bne @E65F
	jsr Math_div93by16
	@E65F:
	lda Temp93
	and #$0F
	sta Temp93
	lda NameTableAddressLo
	and #$60
	beq @E685
	lda NameTableAddressLo
	cmp #$C0
	bcc @E679
	lda NameTableAddressHi
	and #$03
	cmp #$03
	beq @E680
	@E679:
	lda Temp93
	sta TempPtr08_lo
	jmp _loc_1E69B

	@E680:
	 lda Temp93
	jmp @E68C

	@E685:
	  lda Temp93
	jsr Math_mulAby16
	ora TempPtr08_lo
	@E68C:
	   sta TempPtr08_lo
	jsr PPU_Text_Put3bytes_01_and_AttributeTableAddress
	lda TempPtr08_lo
	jsr PPU_Text_PutAandFF
	lda Unknown6A_ScrollingRelated
	jmp _loc_1E603
;------------------------------------------
_loc_1E69B:
	lda Unknown10_CollisionAndScrollingTemp
	cmp #$04
	bcs @E6AA
	lda Unknown6A_ScrollingRelated
	cmp CurrentYScrollingPosition_SomeOtherUnit
	beq @E6BF
	jmp @E614

	@E6AA:
	lda #$00
	sta Unknown10_CollisionAndScrollingTemp
	inc Unknown11_CollisionAndScrollingTemp
	lda Unknown11_CollisionAndScrollingTemp
	cmp #$07
	bcs @E6C2
	lda Unknown6A_ScrollingRelated
	cmp CurrentYScrollingPosition_SomeOtherUnit
	beq @E6BF
	jmp @E611

	@E6BF:
	   jmp _loc_1E5FD

	@E6C2:
	  lda #$00
	sta Unknown11_CollisionAndScrollingTemp
	inc Unknown12_CollisionAndScrollingTemp
	lda Unknown6A_ScrollingRelated
	cmp CurrentYScrollingPosition_SomeOtherUnit
	beq @E6BF
	jmp @E60E
;------------------------------------------
SubstituteBlockCheckFakeBlocks:
	lda Temp93
	cmp #$02
	bne @E6D9
	inc $0D
	@E6D9:
	ldy #$00
	@E6DB:
	lda ClearedFakeBlockListY,y
	beq @E725
	and #$3F
	sta $98
	lda Unknown6A_ScrollingRelated
	lsr a
	cmp $98
	bne @E71F
	lda ClearedFakeBlockListX,y
	and #$3F
                            ; Stupid code: Would be faster to 'cmp $0D' without storing to temp:
	sta $98
	lda $0D
	cmp $98
	bne @E71F
	lda ClearedFakeBlockListY,y
	ldy #$00
	sta $98
                            ; Stupid code: This bpl and .byte $C8,$C8 is redundant:
	bpl @E703

	.byte $C8,$C8
	@E703:
	and #$40
	beq @E708
	iny
	@E708:
	tya
	asl a
	asl a
	tay
	lda Unknown6A_ScrollingRelated
	and #$01
	beq @E714
	iny
	iny
	@E714:
	lda $0D
	and #$01
	beq @E71B
	iny
                            ; The whole part from $E6F8 to $E71E:
                            ; could be replaced with simply 'lda #0' and 'rts'.:
	lda _data_1E728_indexed,y
	rts

	@E71F:
	 iny
	iny
                            ; Stupid code: Why check the whole list? $185 contains the length of list.:
                            ; Stupidly inefficient to check all $20 items.:
	cpy #$20
	bcc @E6DB
	@E725:
	  lda #$FF
	rts
;------------------------------------------
_data_1E728_indexed:
	.byte $00,$00,$00,$00
_func_1E72C:
	ldx #$00
	lda CurrentXScrollingPositionPixels
	sec
	sbc #$80
	sta TempPtr00_lo
	lda CurrentXScrollingPositionScreens
	sbc #$00
	sta TempPtr00_hi
	bpl @E73F
	ldx #$F8
	@E73F:
	stx Temp93
	ldx #$00
	jsr Ram58x_becomes_Word0000_lsr_5
	lda Temp93
	ora $58
	sta $58
	lda CurrentXScrollingPositionPixels
	clc
	adc #$60
	sta TempPtr00_lo
	lda CurrentXScrollingPositionScreens
	adc #$01
	sta TempPtr00_hi
	ldx #$01
Ram58x_becomes_Word0000_lsr_5:
	lda TempPtr00_lo
	lsr TempPtr00_hi
	ror a
	lsr TempPtr00_hi
	ror a
	lsr TempPtr00_hi
	ror a
	lsr a
	lsr a
	sta $58,x
	rts
;------------------------------------------
_func_1E76B:
	lda #$00
	sta CurrentXScrollingPositionPixels
	sta CurrentXScrollingPositionScreens
	sta CurrentYScrollingPositionPixels_Mod240
	sta Current_WhatUnknown57
_func_1E775:
	lda #$00
	sta $65
	sta $66
	jsr _func_1E72C
	jsr _func_1EAC1
	jsr _func_1E832
	lda $5A
	sta Unknown6A_ScrollingRelated
	rts
;------------------------------------------
_func_1E789:
	lda Unknown194_PossiblyScrollingRelated
	beq @E7A3
	jsr DeleteSimonWhipObject
	lda #$00
	sta CurrentYScrollingPositionPixels_Mod240
	sta ObjectYSpeed
	sta ObjectYSpeedFrac
	sta ObjectCurrentActionType
	lda #$BD
	sta ObjectScreenYCoord
	@E7A3:
	lda CurrentLevelSubRoomNumber
	bmi @E7AB
	ldy #$00
	beq @E7B1

	@E7AB:
	ldy #$00
	lda (LevelData_Screens_pointerLo),y
	tay
	dey
	@E7B1:
	 sty CurrentXScrollingPositionScreens
	lda $89
	clc
	adc Current_WhatUnknown57
	cmp #$04
	bcs @E7C5
	@E7BC:
	 sta Current_WhatUnknown57
	@E7BE:
	lda #$00
	sta CurrentXScrollingPositionPixels
	jmp _func_1E775

	@E7C5:
	lda #$00
	beq @E7BC
;------------------------------------------
_func_1E7C9:
	lda CurrentLevelSceneNumber
	sec
	sbc #$06
	tay
	lda _data_1F7A6_indexed,y
	sta Current_WhatUnknown57
	lda #$00
	sta CurrentXScrollingPositionScreens
	sta CurrentYScrollingPositionPixels_Mod240
	jmp @E7BE
;------------------------------------------
_func_1E7DD:
	lda CurrentXScrollingPositionPixels_BackupForExitRoom
	sta CurrentXScrollingPositionPixels
	lda CurrentXScrollingPositionScreens_BackupForExitRoom
	sta CurrentXScrollingPositionScreens
	lda CurrentYScrollingPositionPixels_Mod240_BackupForExitRoom
	sta CurrentYScrollingPositionPixels_Mod240
	lda Current_WhatUnknown57_BackupForExitRoom
	sta Current_WhatUnknown57
	jmp _func_1E775
;------------------------------------------
Load_MetaTile_ParticularRowPointerStoreTo16:
	lda Unknown10_CollisionAndScrollingTemp
	asl a
	asl a
	clc
	adc TempPtr08_hi
	sta $16
	lda $0F
	adc #$00
                            ; Ptr16 = PointerToMetaTiles[hi at $0F, lo at $09] + Unknown10*4:
	sta $17
	rts
;------------------------------------------
LoadLevelDataScreensPointerLo_SomePointerIndexedBy12and14_StoreTo02:
	lda #$02
	jsr SwitchBank_NewPage
	ldy #$00
	lda (LevelData_Screens_pointerLo),y
	asl a
	sta Temp93
                            ; $93 = byte0*2:
	lda #$00
	ldx Unknown12_CollisionAndScrollingTemp
	beq @E81C
	@E816:
	clc
	adc Temp93
	dex
	bne @E816
	@E81C:
	tay
	iny
	iny
	sty Temp93
                            ; $93 = 2 + (byte0*2) * Unknown12:
	lda Unknown14_Horizontal_256pixelUnitForObject
	asl a
	clc
	adc Temp93
	tay
                            ; Y = 2 + 2*(byte0 * Unknown12 + Unknown14):
	lda (LevelData_Screens_pointerLo),y
	sta TempPtr02_lo
	iny
	lda (LevelData_Screens_pointerLo),y
	sta TempPtr02_hi
	rts
;------------------------------------------
_func_1E832:
	lda #$00
	ldy CurrentYScrollingPosition_SomeOtherUnit
	bmi @E840
	@E838:
	cmp CurrentYScrollingPosition_SomeOtherUnit
	bcs @E840
	adc #$1E
	bne @E838
	@E840:
	sta $5A
	sta $5B
	rts
;------------------------------------------
_func_1E845:
	asl a
	sta $0D
	lda #$04
	sta Temp93
	@E84C:
	jsr SubstituteBlockCheckFakeBlocks
	cmp #$FF
	bne @E857
	ldy Temp97
                            ; Load tile that is drawn when scrolling horizontally or when redrawing full screen:
	lda ($16),y
	@E857:
	sta PPUsendQueue,x
	jsr AddTileAttributesTo94
	inc Temp97
	inx
	dec Temp93
	bne @E84C
	stx PPUsendQueueHead
	jmp PPU_Text_PutFF
;------------------------------------------
_func_1E869:
	lda $58
	bpl @E870
	jmp _loc_1E955

	@E870:
	ldx #$00
	stx $96
	jsr _func_1EA96
_loc_1E877:
	lda Unknown6A_ScrollingRelated
	bpl @E87E
	jmp _loc_1E955

	@E87E:
	jsr Split_6A_into_10_11_and_12
	jsr Convert_6A_13_14_into_NameTableAddress_and_AttributeTableAddress
	@E884:
	   jsr LoadLevelDataScreensPointerLo_SomePointerIndexedBy12and14_StoreTo02
	@E887:
	  jsr Load_MetaTile_ParticularTileStoreTo16_and_0F09
	@E88A:
	 jsr Load_MetaTile_ParticularRowPointerStoreTo16
	lda #$00
	sta $04
	sta Temp97
	@E893:
	jsr Convert_NameTableAddress_To_ObstacleBufferAddress
	jsr PPU_Text_Put3bytes_01_and_NameTableAddress
	lda $58
	jsr _func_1E845
	ldy #$00
	lda Temp94
	sta (ObstaclePointerLo),y
	jsr Inc_NameTableAddress_by_0020
	inc $04
	inc Unknown10_CollisionAndScrollingTemp
	inc Unknown6A_ScrollingRelated
	lda CurrentYScrollingPosition_Related
	cmp Unknown6A_ScrollingRelated
	bcs @E8BF
	lda CurrentYScrollingPosition_SomeOtherUnit
	sta Unknown6A_ScrollingRelated
	lda $04
	cmp #$02
	bcs @E8C5
	bcc _loc_1E91F
	@E8BF:
	lda NameTableAddressLo
	and #$20
	bne @E893
	@E8C5:
	 ldy $62
	iny
	lda (LevelData_MetaTiles_pointerLo),y
	sta Temp93
	lda Unknown10_CollisionAndScrollingTemp
	and #$02
	bne @E8D5
	jsr Math_div93by16
	@E8D5:
	lda Temp93
	and #$0F
	sta Temp93
	lda NameTableAddressLo
	and #$60
	beq @E8FB
	lda NameTableAddressLo
	cmp #$C0
	bcc @E8EF
	lda NameTableAddressHi
	and #$03
	cmp #$03
	beq @E8F6
	@E8EF:
	lda Temp93
	sta TempPtr08_lo
	jmp _loc_1E91F

	@E8F6:
	 lda Temp93
	jmp @E902

	@E8FB:
	  lda Temp93
	jsr Math_mulAby16
	ora TempPtr08_lo
	@E902:
	   sta TempPtr08_lo
	jsr PPU_Text_Put3bytes_01_and_AttributeTableAddress
	lda TempPtr08_lo
	jsr PPU_Text_PutAandFF
	lda Unknown60_ScrollingRelated
	clc
	adc #$08
	sta Unknown60_ScrollingRelated
	bcs _loc_1E955
	lda $66
	bne _loc_1E91F
	lda Unknown60_ScrollingRelated
	cmp #$E0
	bcs _loc_1E955
_loc_1E91F:
	lda Unknown10_CollisionAndScrollingTemp
	cmp #$04
	bcs @E92E
	lda Unknown6A_ScrollingRelated
	cmp CurrentYScrollingPosition_SomeOtherUnit
	beq @E943
	jmp @E88A

	@E92E:
	lda #$00
	sta Unknown10_CollisionAndScrollingTemp
	inc Unknown11_CollisionAndScrollingTemp
	lda Unknown11_CollisionAndScrollingTemp
	cmp #$07
	bcs @E946
	lda Unknown6A_ScrollingRelated
	cmp CurrentYScrollingPosition_SomeOtherUnit
	beq @E943
	jmp @E887

	@E943:
	   jmp _loc_1E877

	@E946:
	  lda #$00
	sta Unknown11_CollisionAndScrollingTemp
	inc Unknown12_CollisionAndScrollingTemp
	lda Unknown6A_ScrollingRelated
	cmp CurrentYScrollingPosition_SomeOtherUnit
	beq @E943
	jmp @E884
;------------------------------------------
_loc_1E955:
	lda $66
	eor #$01
	sta $66
	bne @E965
	lda $5A
	sta Unknown6A_ScrollingRelated
	inc $58
	inc $65
	@E965:
	rts
;------------------------------------------
_func_1E966:
	lda CurrentXScrollingPositionPixels
	clc
	adc TempPtr02_lo
	sta Temp93
	lda CurrentXScrollingPositionScreens
	adc TempPtr02_hi
	sta Unknown14_Horizontal_256pixelUnitForObject
	rts
;------------------------------------------
_loc_1E974:
	lda #$00
	jmp _loc_1EA10
;------------------------------------------
LoadObstacleBufferBits:
	stx $96
	lda TempPtr02_hi
	beq @E9A0
	lda TempPtr02_lo
	cmp #$80
	bcc @E9A0
	lda ObjectType,x
	cmp #$3C
	bne @E9A0
	jsr _func_1E966
	lda Unknown14_Horizontal_256pixelUnitForObject
	bmi @E99B
	bne @E9A0
	lda Temp93
	cmp #$10
	bcs @E9A0
	@E99B:
	lda #$00
	jmp _loc_1EA10

	@E9A0:
	 lda TempPtr00_lo
	sec
	sbc #$0D
	bcc _loc_1E974
	sta TempPtr00_lo
	ldy Current_WhatUnknown57
	lda CurrentYScrollingPositionPixels_Mod240
	clc
	adc TempPtr00_lo
	bcs @E9B6
	cmp #$E0
	bcc @E9BA
	@E9B6:
	iny
	clc
	adc #$20
	@E9BA:
	 sta TempPtr00_lo
	sty TempPtr00_hi
	lda #$00
	@E9C0:
	dey
	bmi @E9C8
	clc
	adc #$1C
	bne @E9C0
	@E9C8:
	sta TempPtr00_hi
	lda TempPtr00_lo
	lsr a
	lsr a
	lsr a
	clc
	adc TempPtr00_hi
	sta TempPtr00_lo
	sta Unknown6A_ScrollingRelated
	jsr _func_1E966
	lda Temp93
	lsr a
	lsr a
	lsr a
	sta TempPtr02_lo
	lsr a
	lsr a
	sta Unknown13_Horizontal_32pixelUnitForObject
	lda TempPtr02_lo
	and #$03
	sta TempPtr02_lo
	jsr Convert_6A_13_14_into_NameTableAddress
	lda NameTableAddressLo
	clc
	adc TempPtr02_lo
	sta NameTableAddressLo
	bcc @E9F8
	inc NameTableAddressHi
	@E9F8:
	jsr Convert_NameTableAddress_To_ObstacleBufferAddress
	lda NameTableAddressLo
	and #$03
	eor #$03
	tax
	ldy #$00
	lda (ObstaclePointerLo),y
	@EA06:
	dex
	bmi @EA0E
	lsr a
	lsr a
	jmp @EA06

	@EA0E:
	and #$03
_loc_1EA10:
	ldx $96
	sta $0C
                            ; This redundant-seeming load serves to load Z & N with A's content.:
                            ; ora #0 would be faster by 1 cycle.:
	lda $0C
	rts
;------------------------------------------
Convert_NameTableAddress_To_ObstacleBufferAddress:
                            ; $0520-$06FF is used as a buffer for obstacles in currently loaded screens.:
                            ; Return value: 0x520 + (value & 0x3FF)/4 + 0xF0*!!(value & 0x400):
                            ; Bits in $520 have the following meanings::
                            ;   0 = background decorations:
                            ;   1 = probably breakable bricks:
                            ;   2 = solid:
                            ;   3 = door (entrance). Also swamp.:
	lda #$00
	sta ObstaclePointerHi
	lda NameTableAddressLo
	sta ObstaclePointerLo
	lda NameTableAddressHi
	and #$0F
	lsr a
	ror ObstaclePointerLo
	lsr a
	ror ObstaclePointerLo
	ldx #$00
	and #$01
	beq @EA31
	ldx #$F0
	@EA31:
	txa
	clc
	adc ObstaclePointerLo
	sta ObstaclePointerLo
	lda ObstaclePointerHi
	adc #$00
	sta ObstaclePointerHi
	lda #$20
	clc
	adc ObstaclePointerLo
	sta ObstaclePointerLo
	lda #$05
	adc ObstaclePointerHi
	sta ObstaclePointerHi
	rts
;------------------------------------------
Load_Room_MetaTileNumber_StoreTo62:
                            ; $02 = Pointer to Room metatile table (56 bytes):
                            ; $97 = Which metatile to select:
                            ; Output: $62 = Metatile number:
	lda #$02
	jsr SwitchBank_NewPage
	ldy Temp97
	lda (TempPtr02_lo),y
	sta $62
	rts
;------------------------------------------
Load_MetaTile_ParticularTileStoreTo16_and_0F09:
	lda Unknown11_CollisionAndScrollingTemp
	asl a
	asl a
	asl a
	clc
	adc Unknown13_Horizontal_32pixelUnitForObject
                            ; $97 = Unknown11 * 8 + Unknown13:
	sta Temp97
                            ; $62 = byte at Ptr02[Temp97] (in bank 2):
	jsr Load_Room_MetaTileNumber_StoreTo62
	lda #$04
	jsr SwitchBank_NewPage
	ldy #$00
	lda (LevelData_MetaTiles_pointerLo),y
	clc
	adc LevelData_MetaTiles_pointerLo
	sta $16
	lda LevelData_MetaTiles_pointerHi
	adc #$00
                            ; Ptr16 = Ptr63 + Ptr63[0]:
	sta $17
	lda #$00
	sta $0F
	lda $62
	asl a
	rol $0F
	asl a
	rol $0F
	asl a
	rol $0F
	asl a
	rol $0F
	clc
	adc $16
	sta TempPtr08_hi
	lda $0F
	adc $17
                            ; SomePtr[hi at $0F, lo at $09] = Ptr16 + $62 * 16:
	sta $0F
	rts
;------------------------------------------
_func_1EA96:
	ldx $96
	lda $58,x
	lsr a
	lsr a
	lsr a
	sta Unknown14_Horizontal_256pixelUnitForObject
	lda $58,x
	and #$07
	sta Unknown13_Horizontal_32pixelUnitForObject
	rts
;------------------------------------------
Split_6A_into_10_11_and_12:
                            ; $11 = ($6A >> 2) mod 7:
                            ; $12 = ($6A >> 2) div 7:
                            ; $10 = ($6A & 3):
	lda Unknown6A_ScrollingRelated
	lsr a
	lsr a
	ldy #$00
	@EAAC:
	cmp #$07
	bcc @EAB6
	sec
	sbc #$07
	iny
	bne @EAAC
	@EAB6:
	sta Unknown11_CollisionAndScrollingTemp
	lda Unknown6A_ScrollingRelated
	and #$03
	sta Unknown10_CollisionAndScrollingTemp
	sty Unknown12_CollisionAndScrollingTemp
	rts
;------------------------------------------
_func_1EAC1:
	ldy Current_WhatUnknown57
	lda CurrentYScrollingPositionPixels_Mod240
	sec
	sbc #$08
	bcs @EAD6
	dey
	bpl @EAD3
	lda #$FF
	sta CurrentYScrollingPosition_SomeOtherUnit
	bne @EADB

	@EAD3:
	sec
	sbc #$20
	@EAD6:
	 ldx #$00
	jsr _func_1EAE2
	@EADB:
	  ldy Current_WhatUnknown57
	iny
	lda CurrentYScrollingPositionPixels_Mod240
	ldx #$01
_func_1EAE2:
	sta Temp94
	sty Temp95
	lda #$00
	@EAE8:
	dey
	bmi @EAF0
	clc
	adc #$1C
	bne @EAE8
	@EAF0:
	sta Temp95
	lda Temp94
	lsr a
	lsr a
	lsr a
	clc
	adc Temp95
	sta CurrentYScrollingPosition_SomeOtherUnit,x
	rts
;------------------------------------------
Convert_6A_13_14_into_NameTableAddress_and_AttributeTableAddress:
	jsr Convert_6A_13_14_into_NameTableAddress
Convert_NameTableAddress_To_AttributeTableAddress:
	lda NameTableAddressHi
	and #$03
	sta Temp95
                            ; $95 = $5F & 3:
	lda NameTableAddressLo
	asl a
	rol Temp95
	asl a
	rol Temp95
	asl a
	rol Temp95
	asl a
	rol Temp95
                            ; $95:A = ($5F & 3) * 4096 + $5E * 16:
	lda Temp95
	and #$F8
	sta Temp95
                            ; 000000ff eeeeeeee:
                            ; 00000ffe eeeeeee0:
                            ; 0000ffee eeeeee00:
                            ; 000ffeee eeeee000:
                            ; 00ffeeee eeee0000:
                            ; 00ffe000 --------:
                            ; $95 = ($5F & 3) * 16 + (($5E >> 4) & 8):
	lda NameTableAddressLo
	lsr a
	lsr a
	and #$07
                            ; A = ($5E >> 2) & 7:
	clc
	adc Temp95
	clc
	adc #$C0
	sta Unknown60_ScrollingRelated
                            ; $60 = 0xC0 + (($5E >> 2) & 7) + (($5E >> 4) & 8) + ($5F & 3) * 16:
	ldy #$23
	lda NameTableAddressHi
	cmp #$24
	bcc @EB32
	ldy #$27
	@EB32:
	sty AttributeTableAddressHi
                            ; $61 = ($5F < 36 ? 0x23 : 0x27):
	rts
;------------------------------------------
Convert_6A_13_14_into_NameTableAddress:
	lda Unknown6A_ScrollingRelated
	@EB37:
	cmp #$1E
	bcc @EB40
	sec
	sbc #$1E
	bpl @EB37
	
							; A = $6A mod 30
	@EB40:
	ldx #$00
	stx NameTableAddressHi
	jsr Math_mulAby16
	rol NameTableAddressHi
	asl a
	rol NameTableAddressHi
                            ; $5F:$5E = ($6A mod 30) * 32:
	@EB5B:
	sta NameTableAddressLo
	lda Unknown13_Horizontal_32pixelUnitForObject
	asl a
	asl a
	clc
	adc NameTableAddressLo
	sta NameTableAddressLo
	bcc @EB5B
	inc NameTableAddressHi
	ldy #$20
	lda Unknown14_Horizontal_256pixelUnitForObject
	lsr a
	bcc @EB64
	ldy #$24
	@EB64:
	sty Temp93
	lda NameTableAddressHi
	clc
	adc Temp93
	sta NameTableAddressHi
                            ; $5F:$5E += (($14 & 1) ? 0x24 : 0x20):
	rts
;------------------------------------------
AddTileAttributesTo94:
                            ; If the last drawn tile was < byte1, use $00.:
                            ; If < byte2, use $C0.:
                            ; If < byte3, use $80.:
                            ; Otherwise use $40.:
	ldy #$00
                            ; This instruction is redundant and costs 4 cycles with no benefit::
	lda PPUsendQueue,x
	cmp (LevelData_CategoryThresholds_pointerLo),y
	bcs @EB7B
	lda #$00
	beq @EB8F

	@EB7B:
	iny
	cmp (LevelData_CategoryThresholds_pointerLo),y
	bcs @EB84
	lda #$C0
	bne @EB8F

	@EB84:
	iny
	cmp (LevelData_CategoryThresholds_pointerLo),y
	bcs @EB8D
	lda #$80
	bne @EB8F

	@EB8D:
	lda #$40
	@EB8F:
	 asl a
	rol Temp94
	asl a
	rol Temp94
	rts
;------------------------------------------
DialogAction_Maybe_SetPaletteForDialog:
	jsr LoadAndApplyCurrentLevelPalette
	inc DialogActionState
	rts
;------------------------------------------
PPU_Text_PutAandFF:
	jsr PPU_Text_PutA
	jmp PPU_Text_PutFF
;------------------------------------------
DayNightTransition_ShowDialog:
	lda #$00
	sta DialogActivationState
	ldy #$00
	lda IsNightTime
	beq @EBAD
	iny
	@EBAD:
	sty DialogTextID
	lda DialogActionState
	jsr JumpWithParams
DayNightTransitionOperations:
	.word (DialogAction_HideAllActors) ;EF66 (1EF66) ()
	.word (DialogAction_BeginDialogBoxRender) ;EFD6 (1EFD6) ()
	.word (DialogAction_Maybe_SetPaletteForDialog) ;EB96 (1EB96) ()
	.word (DialogAction_PositionCursorAtBegin) ;EE51 (1EE51) ()
	.word (DialogAction_RenderMessage_WithDelayCheck) ;EE96 (1EE96) ()
	.word (DialogAction_Wait_BeginXframes) ;EE8F (1EE8F) ()
	.word (DialogAction_DetermineDialogBoxCoordinates) ;EF7A (1EF7A) ()
	.word (DialogAction_Undraw_DialogBox_18lines) ;F3E7 (1F3E7) ()
	.word (DialogAction_UnhideAllActors) ;EF22 (1EF22) ()
DialogExecuteAction_Type6_UninterruptipleDialog:
	lda DialogActionState
	jsr JumpWithParams
_JumpPointerTable_1EBCB:
	.word (DialogAction_HideAllActors) ;EF66 (1EF66) ()
	.word (DialogAction_BeginDialogBoxRender) ;EFD6 (1EFD6) ()
	.word (DialogAction_PositionCursorAtBegin) ;EE51 (1EE51) ()
	.word (DialogAction_RenderMessage_WithDelayCheck) ;EE96 (1EE96) ()
	.word (DialogAction_ChangeSomeActorsSomehow) ;EC9F (1EC9F) ()
	.word (DialogAction_WaitFor_B_key) ;EF18 (1EF18) ()
	.word (DialogAction_Undraw_DialogBox_18lines) ;F3E7 (1F3E7) ()
	.word (DialogAction_UnhideAllActors) ;EF22 (1EF22) ()
DialogExecuteAction_Type5_RefillHP:
	lda DialogActionState
	jsr JumpWithParams
_JumpPointerTable_1EBE0:
	.word (DialogAction_HideAllActors) ;EF66 (1EF66) ()
	.word (DialogAction_BeginDialogBoxRender) ;EFD6 (1EFD6) ()
	.word (DialogAction_PositionCursorAtBegin) ;EE51 (1EE51) ()
	.word (DialogAction_RenderMessage_WithDelayCheck) ;EE96 (1EE96) ()
	.word (DialogAction_PlayPasswordCursorMovingSoundEffect) ;EC7C (1EC7C) ()
	.word (DialogAction06c_or_08b_Goto_06a) ;EF1E (1EF1E) ()
	.word (DialogAction_Undraw_DialogBox_18lines) ;F3E7 (1F3E7) ()
	.word (DialogAction_UnhideAllActors) ;EF22 (1EF22) ()
DialogChooseAndExecuteAction:
	lda DialogActivationState
	jsr Math_divAby16
	lsr a
	and #$07
	jsr JumpWithParams
DialogExecuteAction_Table:
	.word (DialogExecuteAction_Type0_InterruptipleDialog_3_InterruptipleButAutomaticallyInvoked_4_Noninterruptiple) ;EC28 (1EC28) ()
	.word (DialogExecuteAction_Type1_SellYesNo) ;EC0B (1EC0B) ()
	.word (DialogExecuteAction_Type2_GiftingNPC) ;EC53 (1EC53) ()
	.word (DialogExecuteAction_Type0_InterruptipleDialog_3_InterruptipleButAutomaticallyInvoked_4_Noninterruptiple) ;EC28 (1EC28) ()
	.word (DialogExecuteAction_Type0_InterruptipleDialog_3_InterruptipleButAutomaticallyInvoked_4_Noninterruptiple) ;EC28 (1EC28) ()
	.word (DialogExecuteAction_Type5_RefillHP) ;EBDB (1EBDB) ()
	.word (DialogExecuteAction_Type6_UninterruptipleDialog) ;EBC6 (1EBC6) ()
	.word (DialogExecuteAction_Type7_DoLevelUp) ;EF2E (1EF2E) ()
DialogExecuteAction_Type1_SellYesNo:
	lda DialogActionState
	jsr JumpWithParams
_JumpPointerTable_1EC10:
	.word (DialogAction_HideAllActors) ;EF66 (1EF66) ()
	.word (DialogAction_ClearDialogBox) ;EFD2 (1EFD2) ()
	.word (DialogAction_Maybe_SetPaletteForDialog) ;EB96 (1EB96) ()
	.word (DialogAction_PositionCursorAtBegin) ;EE51 (1EE51) ()
	.word (DialogAction_RenderMessage_WithDelayCheck) ;EE96 (1EE96) ()
	.word (DialogAction_MerchantRenderDeal) ;ECC7 (1ECC7) ()
	.word (DialogAction_WaitMerchantDecision) ;ED4A (1ED4A) ()
	.word (DialogAction_MerchantConfirmationShow) ;EE2A (1EE2A) ()
	.word (DialogAction06c_or_08b_Goto_06a) ;EF1E (1EF1E) ()
	.word (DialogAction_Undraw_DialogBox_18lines) ;F3E7 (1F3E7) ()
	.word (DialogAction_Maybe_SetPaletteForDialog) ;EB96 (1EB96) ()
	.word (DialogAction_UnhideAllActors) ;EF22 (1EF22) ()
DialogExecuteAction_Type0_InterruptipleDialog_3_InterruptipleButAutomaticallyInvoked_4_Noninterruptiple:
	lda DialogActionState
	cmp #$04
	bne @EC3C
	lda Input_NewJoyButtonsWork
	and #$40
	beq @EC3C
	jsr InitializeDialogBoxCoordinates
	lda #$06
	sta DialogActionState
	rts

	@EC3C:
	lda DialogActionState
	jsr JumpWithParams
_JumpPointerTable_1EC41:
	.word (DialogAction_HideAllActors) ;EF66 (1EF66) ()
	.word (DialogAction_BeginDialogBoxRender) ;EFD6 (1EFD6) ()
	.word (DialogAction_Maybe_SetPaletteForDialog) ;EB96 (1EB96) ()
	.word (DialogAction_PositionCursorAtBegin) ;EE51 (1EE51) ()
	.word (DialogAction_RenderMessage_WithDelayCheck) ;EE96 (1EE96) ()
	.word (DialogAction_WaitFor_B_key) ;EF18 (1EF18) ()
	.word (DialogAction_Undraw_DialogBox_18lines) ;F3E7 (1F3E7) ()
	.word (DialogAction_Maybe_SetPaletteForDialog) ;EB96 (1EB96) ()
	.word (DialogAction_UnhideAllActors) ;EF22 (1EF22) ()
DialogExecuteAction_Type2_GiftingNPC:
	lda DialogActionState
	jsr JumpWithParams
_JumpPointerTable_1EC58:
	.word (DialogAction_GiftingNPCexecute) ;EC6E (1EC6E) ()
	.word (DialogAction_HideAllActors) ;EF66 (1EF66) ()
	.word (DialogAction_BeginDialogBoxRender) ;EFD6 (1EFD6) ()
	.word (DialogAction_Maybe_SetPaletteForDialog) ;EB96 (1EB96) ()
	.word (DialogAction_PositionCursorAtBegin) ;EE51 (1EE51) ()
	.word (DialogAction_RenderMessage_WithDelayCheck) ;EE96 (1EE96) ()
	.word (DialogAction_PlayTransformationSoundEffect) ;EF0A (1EF0A) ()
	.word (DialogAction_WaitFor_B_key) ;EF18 (1EF18) ()
	.word (DialogAction_Undraw_DialogBox_18lines) ;F3E7 (1F3E7) ()
	.word (DialogAction_Maybe_SetPaletteForDialog) ;EB96 (1EB96) ()
	.word (DialogAction_UnhideAllActors) ;EF22 (1EF22) ()
DialogAction_GiftingNPCexecute:
	lda #$01
	jsr SwitchBank_NewPage
	inc DialogActionState
	lda DialogActivationState
	and #$1F
	jmp NPCtalkAction_Do
;------------------------------------------
DialogAction_PlayPasswordCursorMovingSoundEffect:
	lda FrameCounter
	and #$03
	bne @EC87
	lda #$26
	jsr AnyBankPlayTracks
	@EC87:
	lda FrameCounter
	and #$03
	bne _EC9E
	lda CurrentHP
	clc
	adc #$01
	sta CurrentHP
	cmp CurrentMaxHP
	bcc _EC9E
	lda CurrentMaxHP
	sta CurrentHP
_loc_1EC9C:
	inc DialogActionState
	_EC9E:
	rts
;------------------------------------------
DialogAction_ChangeSomeActorsSomehow:
	ldx #$06
	@ECA1:
	 lda ObjectType,x
	cmp #$3C
	beq @ECB8
	cmp #$3D
	beq @ECB4
	@ECAC:
	inx
	cpx #$12
	bcc @ECA1
	jmp @ECC0

	@ECB4:
	lda #$01
	bne @ECBA

	@ECB8:
	 lda #$02
	@ECBA:
	  sta ObjectAIvar1,x
	jmp @ECAC

	@ECC0:
	   lda #$01
	sta Unknown43
	jmp _loc_1EC9C
;------------------------------------------
DialogAction_MerchantRenderDeal:
	jsr InitializeDialogBoxCoordinates
	lda #$06
	jsr DialogText_IncYcoord_by_A
	jsr DialogBox_TranslateCoordinateIntoPPUoffset_Maybe
	lda NameTableAddressLo
	and #$20
	sta $16
	lda #$03
	jsr DialogBox_GoForwardHorizontally
	jsr PPU_Text_Put3bytes_01_and_NameTableAddress
	jsr Merchant_ChooseSellingItem_times3
	tay
	lda Merchant_SellingItemsAndCostsTable,y
	iny
	sty Temp97
	jsr PPU_Text_PutAandFF
	lda #$07
	jsr DialogBox_GoForwardHorizontally
	ldy Temp97
	lda Merchant_SellingItemsAndCostsTable,y
	sta MerchantDealCost1100
	iny
	sty Temp97
	jsr DialogBox_RenderTwoDigitNumber
	lda #$01
	jsr DialogBox_GoForwardHorizontally
	sty Temp97
	lda Merchant_SellingItemsAndCostsTable,y
	sta MerchantDealCost0011
	jsr DialogBox_RenderTwoDigitNumber
	lda #$00
	sta DialogText_Saved_CharacterIndex
	inc DialogActionState
	rts
;------------------------------------------
Merchant_SellingItemsAndCostsTable:
	.byte $58,$00,$50, $58,$20,$00, $6D,$00,$50, $57,$00,$50
	.byte $54,$00,$50, $55,$01,$00, $59,$00,$50, $5E,$00,$50
	.byte $5B,$01,$00, $5B,$01,$50, $5B,$02,$00
Merchant_ChooseSellingItem_times3:
	lda DialogActivationState
	and #$1F
	sta Temp93
	asl a
	clc
	adc Temp93
	rts
;------------------------------------------
DialogAction_WaitMerchantDecision_ToggleCursorPosition:
	lda DialogText_Saved_CharacterIndex
	eor #$01
	sta DialogText_Saved_CharacterIndex
	jmp DialogAction_MerchantConfirmationDrawCursor
;------------------------------------------
DialogAction_WaitMerchantDecision:
	lda Input_NewJoyButtonsWork
	lsr a
	bcs DialogAction_WaitMerchantDecision_ToggleCursorPosition
	lsr a
	bcs DialogAction_WaitMerchantDecision_ToggleCursorPosition
	lda Input_NewJoyButtonsWork
	and #$40
	bne DialogAction_MerchantConfirmAction
DialogAction_MerchantConfirmationDrawCursor:
	jsr InitializeDialogBoxCoordinates
	lda #$08
	jsr DialogText_IncYcoord_by_A
	jsr StatusScreenAndMerchants_InitializePPUsendQueue_For_CursorHandling
	jmp DialogBox_RenderDownArrow
;------------------------------------------
_loc_1ED66:
	jmp _loc_1EDF7
;------------------------------------------
TryBuyLaurels:
	jsr DetermineInventoryHerbLimit_Storeto94
	lda InventoryNumLaurels
	cmp Temp94
	bcc _loc_1ED90
	jmp PlayInvalidSelectionWarningSoundEffect
;------------------------------------------
TryBuyGarlics:
	lda InventoryNumGarlics
	cmp #$08
	bcc _loc_1ED90
	jmp PlayInvalidSelectionWarningSoundEffect
;------------------------------------------
DialogAction_MerchantConfirmAction:
	lda DialogText_Saved_CharacterIndex
	beq _loc_1ED66
	jsr Merchant_ChooseSellingItem_times3
                            ;  0,0 = laurels:
                            ;  1,3 = laurels, at cost 2000:
                            ;  2,6 = garlics:
                            ;  3,9 = holy water:
                            ;  4,12 = dagger:
                            ;  5,15 = silver knife maybe:
                            ;  6,18 = oak stake:
                            ;  7,21 = white crystal:
                            ;  8,24 = thorn whip:
                            ;  9,27 = chain whip:
                            ; 10,30 = morning star:
	tax
	stx Temp93
	cpx #$00
	beq TryBuyLaurels
	cpx #$06
	beq TryBuyGarlics
_loc_1ED90:
	lda MerchantDealCost0011
	ldy MerchantDealCost1100
	jsr CheckEnoughHearts_SubtractIfOk
	bcc PlayInvalidSelectionWarningSoundEffect
	lda #$25
	jsr AnyBankPlayTracks
	ldx Temp93
	cpx #$18
	bcs DialogAction_Merchant_BoughtWhip
	cpx #$15
	bne @EDB1
	lda InventoryBodyParts1
	and #$1F
	sta InventoryBodyParts1
	jmp DialogAction_Merchant_BoughtItem

	@EDB1:
	cpx #$00
	beq @EDC8
	cpx #$06
	bne DialogAction_Merchant_BoughtItem
	lda InventoryNumGarlics
	clc
	adc #$02
	cmp #$08
	bcc @EDC4
	lda #$08
	@EDC4:
	sta InventoryNumGarlics
	bne DialogAction_Merchant_BoughtItem
	@EDC8:
	 jsr DetermineInventoryHerbLimit_Storeto94
	lda InventoryNumLaurels
	clc
	adc #$02
	cmp Temp94
	bcc @EDD6
	lda Temp94
	@EDD6:
	sta InventoryNumLaurels
DialogAction_Merchant_BoughtItem:
	lda MerchantDealInstructions,x
	sta TempPtr00_lo
	lda MerchantDealInstructions+1,x
	sta TempPtr00_hi
	ldy #$00
	lda (TempPtr00_lo),y
	ora _data_1EE14_indexed,x
	sta (TempPtr00_lo),y
	bne _loc_1EDF7
DialogAction_Merchant_BoughtWhip:
	lda DialogActivationState
	and #$1F
	sec
	sbc #$07
	sta CurrentWhipLevel
_loc_1EDF7:
	lda #$30
	sta DialogText_BeginX
	inc DialogActionState
	rts
;------------------------------------------
PlayInvalidSelectionWarningSoundEffect:
	lda #$24
	jmp AnyBankPlayTracks
;------------------------------------------
DetermineInventoryHerbLimit_Storeto94:
	ldy #$04
	lda InventoryMiscItems1
	and #$01
	beq @EE0D
	ldy #$08
	@EE0D:
	sty Temp94
	rts
;------------------------------------------
MerchantCursorPositionsIntoPPUsendQueue:
	.byte $17,$08
MerchantDealInstructions:
	.word (InventoryMiscItems1) ;92 (0) ()
_data_1EE14_indexed:
	.byte $04
	.word (InventoryMiscItems1) ;92 (0) ()
	.byte $10
	.word (InventoryMiscItems1) ;92 (0) ()
	.byte $08
	.word (InventoryMiscItems2) ;4A (0) ()
	.byte $08
	.word (InventoryMiscItems2) ;4A (0) ()
	.byte $01
	.word (InventoryMiscItems2) ;4A (0) ()
	.byte $02
	.word (InventoryMiscItems2) ;4A (0) ()
	.byte $40
	.word (InventoryBodyParts1) ;91 (0) ()
	.byte $20
DialogAction_MerchantConfirmationShow:
	dec DialogText_BeginX
	beq _loc_1EE4E
	jsr InitializeDialogBoxCoordinates
	lda #$08
	jsr DialogText_IncYcoord_by_A
	jsr StatusScreenAndMerchants_InitializePPUsendQueue_For_CursorHandling
	lda FrameCounter
	and #$04
	beq _loc_1EE4D
DialogBox_RenderDownArrow:
	ldy DialogText_Saved_CharacterIndex
	lda MerchantCursorPositionsIntoPPUsendQueue,y
	clc
	adc $05
	tax
	lda #$53
	sta PPUsendQueue,x
_loc_1EE4D:
	rts
;------------------------------------------
_loc_1EE4E:
	inc DialogActionState
	rts
;------------------------------------------
DialogAction_PositionCursorAtBegin:
	jsr DialogAction_DetermineDialogBoxCoordinates
	lda #$02
	jsr DialogText_IncYcoord_by_A
	lda DialogText_Xcoord
	clc
	adc #$02
	sta DialogText_Xcoord
	sta DialogText_BeginX
	lda #$00
	sta DialogText_RemainingPerCharacterDelay
	sta DialogText_CharacterIndex
	rts
;------------------------------------------
DialogBox_TranslateCoordinateIntoPPUoffset_Maybe:
	lda DialogText_Ycoord
	sta Unknown6A_ScrollingRelated
	lda DialogText_Xcoord
	and #$03
	sta $15
	lda DialogText_Xcoord
	lsr a
	lsr a
	sta Unknown14_Horizontal_256pixelUnitForObject
	and #$07
	sta Unknown13_Horizontal_32pixelUnitForObject
	lda Unknown14_Horizontal_256pixelUnitForObject
	lsr a
	lsr a
	lsr a
	sta Unknown14_Horizontal_256pixelUnitForObject
	jsr Convert_6A_13_14_into_NameTableAddress_and_AttributeTableAddress
	lda NameTableAddressLo
	clc
	adc $15
	sta NameTableAddressLo
	rts
;------------------------------------------
DialogAction_Wait_BeginXframes:
	dec DialogText_BeginX
	bne @EE95
	inc DialogActionState
	@EE95:
	rts
;------------------------------------------
DialogAction_RenderMessage_WithDelayCheck:
	lda DialogText_RemainingPerCharacterDelay
	beq @EE9D
	dec DialogText_RemainingPerCharacterDelay
	rts

	@EE9D:
	lda #$05
	sta DialogText_RemainingPerCharacterDelay
	jsr DialogBox_TranslateCoordinateIntoPPUoffset_Maybe
DialogRenderLoop:
	lda DialogTextID
	asl a
	tax
	lda DialogTextTable,x
	sta TempPtr00_lo
	lda DialogTextTable+1,x
	sta TempPtr00_hi
	ldy DialogText_CharacterIndex
	inc DialogText_CharacterIndex
	lda (TempPtr00_lo),y
	cmp #$FF
	beq DialogRender_FF_end
	cmp #$FE
	beq DialogRender_FE_newline
	cmp #$FC
	beq DialogRender_FC_SubstringGosub
	cmp #$FB
	beq DialogRender_FB_SubstringReturn
	sta Temp07
	beq @EED1
	lda #$05
	jsr AnyBankPlayTracks
	@EED1:
	jsr PPU_Text_Put3bytes_01_and_NameTableAddress
	inc DialogText_Xcoord
	lda Temp07
	jmp PPU_Text_PutAandFF
;------------------------------------------
DialogRender_FE_newline:
	inc DialogText_Ycoord
	inc DialogText_Ycoord
	lda DialogText_BeginX
	sta DialogText_Xcoord
	rts
;------------------------------------------
DialogRender_FC_SubstringGosub:
	ldy DialogText_CharacterIndex
	lda DialogTextID
	sta DialogText_Saved_ID
	lda (TempPtr00_lo),y
	sta DialogTextID
	iny
	sty DialogText_Saved_CharacterIndex
	lda #$00
	sta DialogText_CharacterIndex
	jmp DialogRenderLoop
;------------------------------------------
DialogRender_FB_SubstringReturn:
	lda DialogText_Saved_ID
	sta DialogTextID
	lda DialogText_Saved_CharacterIndex
	sta DialogText_CharacterIndex
	jmp DialogRenderLoop
;------------------------------------------
DialogRender_FF_end:
	lda #$3C
	sta DialogText_BeginX
	inc DialogActionState
	rts
;------------------------------------------
DialogAction_PlayTransformationSoundEffect:
	lda DialogTextID
	cmp #$6B
	beq @EF15
	lda #$22
	jsr AnyBankPlayTracks
	@EF15:
	inc DialogActionState
	rts
;------------------------------------------
DialogAction_WaitFor_B_key:
	lda Input_NewJoyButtonsWork
	and #$40
	beq _loc_1EF21
DialogAction06c_or_08b_Goto_06a:
	jmp DialogAction_DetermineDialogBoxCoordinates
;------------------------------------------
_loc_1EF21:
	rts
;------------------------------------------
DialogAction_UnhideAllActors:
	jsr _func_1F403
	lda #$00
	sta GameInDeathState
	lda #$00
	sta TimeRelated3F
	rts
;------------------------------------------
DialogExecuteAction_Type7_DoLevelUp:
	lda DialogActionState
	jsr JumpWithParams
_JumpPointerTable_1EF33:
	.word (DialogAction_PlayLevelUpSoundEffect) ;EF4C (1EF4C) ()
	.word (DialogAction_FlashSimonPalette) ;EF3B (1EF3B) ()
	.word (DialogAction_PlayPasswordCursorMovingSoundEffect) ;EC7C (1EC7C) ()
	.word (DialogAction_UnhideAllActors) ;EF22 (1EF22) ()
DialogAction_FlashSimonPalette:
	dec DialogText_BeginX
	beq @EF44
	ldx #$00
	jmp Object_FlashPalette

	@EF44:
	lda #$00
	sta ObjectPaletteIndex
	inc DialogActionState
	rts
;------------------------------------------
DialogAction_PlayLevelUpSoundEffect:
	inc DialogActionState
	lda #$27
	jmp AnyBankPlayTracks
;------------------------------------------
ItemMenuPauseScreen_Run:
	lda DialogActionState
	jsr JumpWithParams
ItemMenuPauseScreen_Actions:
	.word (DialogAction_HideAllActors) ;EF66 (1EF66) ()
	.word (DialogAction_ItemMenuPauseScreen_RenderStatusBox) ;EFAA (1EFAA) ()
	.word (DialogAction_Maybe_SetPaletteForDialog) ;EB96 (1EB96) ()
	.word (DialogAction_ItemMenuPauseScreen_WaitForStatusScreenKeys) ;F2ED (1F2ED) ()
	.word (DialogAction_Undraw_DialogBox_18lines) ;F3E7 (1F3E7) ()
	.word (DialogAction_Maybe_SetPaletteForDialog) ;EB96 (1EB96) ()
	.word (DialogAction_ItemMenuPauseScreen_EndPauseStateShowActors) ;F3FB (1F3FB) ()
DialogAction_HideAllActors:
	lda #$08
	sta Unknown04EE
	ldx #$00
	@EF6D:
	lda ObjectDialogStatusFlag,x
	ora #$04
	sta ObjectDialogStatusFlag,x
	inx
	cpx #$12
	bcc @EF6D
DialogAction_DetermineDialogBoxCoordinates:
	jsr InitializeDialogBoxCoordinates
	inc DialogActionState
	rts
;------------------------------------------
InitializeDialogBoxCoordinates:
                            ; Ycoord ($77) = ($5C + 4) & ~1:
                            ; ^ 4 lines from top:
                            ; Xcoord ($78) = ((0x20 + $53 + $54 * 0x100) / 8) & ~1:
                            ; ^ 4 tiles from left:
	lda CurrentYScrollingPosition_SomeOtherUnit
	clc
	adc #$04
	and #$FE
	sta DialogText_Ycoord
	lda CurrentXScrollingPositionPixels
	clc
	adc #$20
	sta TempPtr00_lo
	lda CurrentXScrollingPositionScreens
	adc #$00
	sta TempPtr00_hi
	lda TempPtr00_lo
	lsr TempPtr00_hi
	ror a
	lsr TempPtr00_hi
	ror a
	lsr TempPtr00_hi
	ror a
	and #$FE
	sta DialogText_Xcoord
	lda #$00
	sta DialogText_Saved_ID
	rts
;------------------------------------------
DialogAction_ItemMenuPauseScreen_RenderStatusBox:
	lda Unknown45
	bne @EFC4
	ldy #$00
	sty DialogText_Saved_CharacterIndex
	jsr DialogBox_RenderLineAttributes
	jsr DialogBox_RenderLine
	lda #$FF
	sta Unknown45
	rts

	@EFBD:
	lda #$00
	sta Unknown45
	inc DialogActionState
	rts

	@EFC4:
	lda #$00
	sta Unknown45
	jsr DialogBox_RenderStatusBoxLine
	lda DialogText_Saved_ID
	cmp #$12
	bcs @EFBD
	rts
;------------------------------------------
DialogAction_ClearDialogBox:
	ldy #$02
	bne _loc_1EFD8
;------------------------------------------
DialogAction_BeginDialogBoxRender:
	ldy #$01
_loc_1EFD8:
	sty DialogText_Saved_CharacterIndex
	lda DialogBoxTable_LengthsMinus1,y
	cmp DialogText_Saved_ID
	bcc @EFE8
	jsr DialogBox_RenderLineAttributes
	jsr DialogBox_RenderLine
	rts

	@EFE8:
	inc DialogActionState
	rts
;------------------------------------------
DialogBox_RenderBodyParts:
	jsr Inc_NameTableAddress_by_0020
	lda NameTableAddressLo
	and #$20
	sta $16
	lda InventoryBodyParts1
	sta Temp07
	lda #$00
	sta $06
	@EFFC:
	lda #$02
	jsr DialogBox_GoForwardHorizontally
	lsr Temp07
	bcc @F010
	jsr PPU_Text_Put3bytes_01_and_NameTableAddress
	ldy $06
	lda DialogBox_RenderBodyParts_SymbolTable,y
	jsr PPU_Text_PutAandFF
	@F010:
	inc $06
	lda $06
	cmp #$05
	bcc @EFFC
	lda #$02
	jsr DialogBox_GoForwardHorizontally
	lda Temp07
	beq @F030
	jsr PPU_Text_Put3bytes_01_and_NameTableAddress
	lda Temp07
	and #$03
	tay
	dey
	lda DialogBox_RenderBodyParts_CrystalTable,y
	jsr PPU_Text_PutAandFF
	@F030:
	jmp DialogBox_GoDownTwoLines
;------------------------------------------
DialogBox_RenderBodyParts_SymbolTable:
	.byte $4E,$4F,$50,$51,$52
DialogBox_RenderWeapons_SymbolTable:
	.byte $54,$55,$6F,$57,$70,$69,$59
DialogBox_RenderBodyParts_CrystalTable:
	.byte $5E,$6E,$5F
DialogBox_RenderWeapons:
	lda InventoryMiscItems2
	sta Temp07
	lda #$00
	sta $06
	@F04A:
	lda #$02
	jsr DialogBox_GoForwardHorizontally
	lsr Temp07
	bcc @F05E
	jsr PPU_Text_Put3bytes_01_and_NameTableAddress
	ldy $06
	lda DialogBox_RenderWeapons_SymbolTable,y
	jsr PPU_Text_PutAandFF
	@F05E:
	inc $06
	lda $06
	cmp #$07
	bcc @F04A
	jmp DialogBox_GoDownTwoLines
;------------------------------------------
DialogBox_RenderLaurelsAndGarlics:
	lda #$02
	jsr DialogBox_GoForwardHorizontally
	lda InventoryMiscItems1
	and #$04
	beq @F097
	jsr PPU_Text_Put3bytes_01_and_NameTableAddress
	lda #$58
	jsr PPU_Text_PutAandFF
	lda #$01
	jsr DialogBox_GoForwardHorizontally
	jsr PPU_Text_Put3bytes_01_and_NameTableAddress
	lda #$46
	jsr PPU_Text_PutAandFF
	lda #$02
	jsr DialogBox_GoForwardHorizontally
	lda InventoryNumLaurels
	jsr DialogBox_RenderTwoDigitNumber
	lda #$03
	bne @F099

	@F097:
	lda #$07
	@F099:
	 jsr DialogBox_GoForwardHorizontally
	lda InventoryMiscItems1
	and #$08
	beq @F0C1
	jsr PPU_Text_Put3bytes_01_and_NameTableAddress
	lda #$6D
	jsr PPU_Text_PutAandFF
	lda #$01
	jsr DialogBox_GoForwardHorizontally
	jsr PPU_Text_Put3bytes_01_and_NameTableAddress
	lda #$46
	jsr PPU_Text_PutAandFF
	lda #$02
	jsr DialogBox_GoForwardHorizontally
	lda InventoryNumGarlics
	jsr DialogBox_RenderTwoDigitNumber
	@F0C1:
	jmp DialogBox_GoDownTwoLines
;------------------------------------------
DialogBox_RenderStatusBoxLine:
	dec DialogText_Ycoord
	dec DialogText_Ycoord
	dec DialogText_Saved_ID
	dec DialogText_Saved_ID
	jsr DialogBox_TranslateCoordinateIntoPPUoffset_Maybe
	lda NameTableAddressLo
	and #$20
	sta $16
	lda DialogText_Saved_ID
	cmp #$02
	beq DialogBox_RenderTime
	cmp #$04
	beq DialogBox_RenderExpAndLevel
	cmp #$06
	beq DialogBox_RenderHeartCount
	cmp #$08
	beq DialogBox_RenderWhipName
	cmp #$0A
	bne @F0EE
	jmp DialogBox_RenderBodyParts

	@F0EE:
	cmp #$0E
	bne @F0F5
	jmp DialogBox_RenderWeapons

	@F0F5:
	cmp #$10
	bne DialogBox_GoDownTwoLines
	jmp DialogBox_RenderLaurelsAndGarlics
;------------------------------------------
DialogBox_GoDownTwoLines:
	inc DialogText_Ycoord
	inc DialogText_Ycoord
	inc DialogText_Saved_ID
	inc DialogText_Saved_ID
	rts
;------------------------------------------
DialogBox_RenderTime:
	lda #$06
	jsr DialogBox_GoForwardHorizontally
	lda CurrentDayBCD
	jsr DialogBox_RenderTwoDigitNumber
	lda #$02
	jsr DialogBox_GoForwardHorizontally
	lda CurrentHourBCD
	jsr DialogBox_RenderTwoDigitNumber
	lda #$02
	jsr DialogBox_GoForwardHorizontally
	lda CurrentMinuteBCD
	jsr DialogBox_RenderTwoDigitNumber
	jmp DialogBox_GoDownTwoLines
;------------------------------------------
DialogBox_RenderExpAndLevel:
	lda #$04
	jsr DialogBox_GoForwardHorizontally
	lda Edigits1100
	jsr DialogBox_RenderTwoDigitNumber
	lda #$01
	jsr DialogBox_GoForwardHorizontally
	lda Edigits0011
	jsr DialogBox_RenderTwoDigitNumber
	lda #$05
	jsr DialogBox_GoForwardHorizontally
	lda CurrentLevel
	jsr DialogBox_RenderTwoDigitNumber
	jmp DialogBox_GoDownTwoLines
;------------------------------------------
DialogBox_RenderHeartCount:
	lda #$04
	jsr DialogBox_GoForwardHorizontally
	lda HeartsDigits1100
	jsr DialogBox_RenderTwoDigitNumber
	lda #$01
	jsr DialogBox_GoForwardHorizontally
	lda HeartsDigits0011
	jsr DialogBox_RenderTwoDigitNumber
	jmp DialogBox_GoDownTwoLines
;------------------------------------------
DialogBox_RenderWhipName:
	lda #$02
	jsr DialogBox_GoForwardHorizontally
	lda CurrentWhipLevel
	asl a
	tay
	lda WhipNameTable,y
	sta TempPtr00_lo
	lda WhipNameTable+1,y
	sta TempPtr00_hi
	ldy #$00
	sty Temp97
	@F176:
	ldy Temp97
	lda (TempPtr00_lo),y
	cmp #$FF
	beq @F191
	pha
	 jsr PPU_Text_Put3bytes_01_and_NameTableAddress
	 iny
	 sty Temp97
	pla
	jsr PPU_Text_PutAandFF
	lda #$01
	jsr DialogBox_GoForwardHorizontally
	jmp @F176

	@F191:
	jsr DialogBox_TranslateCoordinateIntoPPUoffset_Maybe
	lda #$0C
	jsr DialogBox_GoForwardHorizontally
	lda InventoryMiscItems1
	and #$01
	beq @F1A7
	jsr PPU_Text_Put3bytes_01_and_NameTableAddress
	lda #$5C
	jsr PPU_Text_PutAandFF
	@F1A7:
	lda #$02
	jsr DialogBox_GoForwardHorizontally
	lda InventoryMiscItems1
	and #$02
	beq @F1BA
	jsr PPU_Text_Put3bytes_01_and_NameTableAddress
	lda #$5A
	jsr PPU_Text_PutAandFF
	@F1BA:
	jmp DialogBox_GoDownTwoLines
;------------------------------------------
DialogBox_GoForwardHorizontally:
	clc
	adc NameTableAddressLo
	sta NameTableAddressLo
	and #$20
	cmp $16
	beq @F1CB
	jsr DialogBox_NameTableWrapped_SaveNew_5Ebitand20_to_16
	@F1CB:
	rts
;------------------------------------------
DialogBox_RenderTwoDigitNumber:
	pha
	 jsr PPU_Text_Put3bytes_01_and_NameTableAddress
	pla
	sta Temp93
	jsr Math_divAby16
	jsr DialogBox_RenderOneDigit
	inc NameTableAddressLo
	lda NameTableAddressLo
	and #$20
	cmp $16
	beq @F1E6
	jsr DialogBox_NameTableWrapped_StartNewPPUtext_AndSaveNew_5Ebitand20_to_16
	@F1E6:
	lda Temp93
	and #$0F
	jsr DialogBox_RenderOneDigit
	jmp PPU_Text_PutFF
;------------------------------------------
DialogBox_RenderOneDigit:
	ldx PPUsendQueueHead
	clc
	adc #$36
	jmp PPU_Text_PutA
;------------------------------------------
WhipNameTable:
	.word (WhipNameTable_1F202) ;F202 (1F202) ()
	.word (WhipNameTable_1F20A) ;F20A (1F20A) ()
	.word (WhipNameTable_1F212) ;F212 (1F212) ()
	.word (WhipNameTable_1F21A) ;F21A (1F21A) ()
	.word (WhipNameTable_1F222) ;F222 (1F222) ()
WhipNameTable_1F202:
	.byte $0C,$1B,$00,$17,$08,$09,$10,$FF
WhipNameTable_1F20A:
	.byte $14,$1B,$00,$17,$08,$09,$10,$FF
WhipNameTable_1F212:
	.byte $03,$1B,$00,$17,$08,$09,$10,$FF
WhipNameTable_1F21A:
	.byte $0D,$1B,$00,$13,$14,$01,$12,$FF
WhipNameTable_1F222:
	.byte $06,$1B,$00,$17,$08,$09,$10,$FF
DialogAction_ItemMenuPauseScreen_ButtonPressed_Start:
	jmp DialogAction_DetermineDialogBoxCoordinates
;------------------------------------------
DialogAction_ItemMenuPauseScreen_Load_ShiftCount_For_LaurelsAndGarlics:
	tya
	sec
	sbc #$07
	tay
	lda InventoryMiscItems1
	lsr a
	lsr a
	rts
;------------------------------------------
DialogAction_ItemMenuPauseScreen_ButtonPressed_Left:
	lda InventoryCursorCompartmentSelection
	beq @F262
	lda InventoryMiscItems2
	bne @F245
	lda InventoryMiscItems1
	and #$0C
	beq @F25F
	@F245:
	  ldy InventoryCursorSelected1
	dey
	bne @F24C
	ldy #$09
	@F24C:
	sty InventoryCursorSelected1
	cpy #$08
	bcc @F258
	jsr DialogAction_ItemMenuPauseScreen_Load_ShiftCount_For_LaurelsAndGarlics
	jmp @F25A

	@F258:
	lda InventoryMiscItems2
	@F25A:
	 jsr DialogAction_ItemMenuPauseScreen_RightShift_A_by_Y_put_original_in_17
	bcc @F245
	@F25F:
	    jmp DialogAction_ItemMenuPauseScreen_DoneCursorMovement_Do_SFX

	@F262:
	   lda InventoryBodyParts1
	beq @F25F
	@F266:
	ldy InventoryBodyPartSelection
	dey
	bne @F26D
	ldy #$06
	@F26D:
	jsr ItemStatusScreen_BodyPartsNormalize
	bcc @F266
	jmp DialogAction_ItemMenuPauseScreen_DoneCursorMovement_Do_SFX
;------------------------------------------
ItemStatusScreen_BodyPartsNormalize:
	sty InventoryBodyPartSelection
	ldx #$00
	lda InventoryBodyParts1
	and #$60
	beq @F281
	ldx #$20
	@F281:
	stx Temp93
	lda InventoryBodyParts1
	and #$1F
	ora Temp93
	jmp DialogAction_ItemMenuPauseScreen_RightShift_A_by_Y_put_original_in_17
;------------------------------------------
_func_1F28C:
	ldy InventoryCursorSelected1
	iny
	cpy #$0A
	bcc @F295
	ldy #$01
	@F295:
	sty InventoryCursorSelected1
	cpy #$08
	bcc @F2A1
	jsr DialogAction_ItemMenuPauseScreen_Load_ShiftCount_For_LaurelsAndGarlics
	jmp @F2A3

	@F2A1:
	lda InventoryMiscItems2
	@F2A3:
	 jsr DialogAction_ItemMenuPauseScreen_RightShift_A_by_Y_put_original_in_17
	bcc _func_1F28C
	rts
;------------------------------------------
DialogAction_ItemMenuPauseScreen_ButtonPressed_Right:
	lda InventoryCursorCompartmentSelection
	beq @F2BD
	lda InventoryMiscItems2
	bne @F2B7
	lda InventoryMiscItems1
	and #$0C
	beq DialogAction_ItemMenuPauseScreen_DoneCursorMovement
	@F2B7:
	jsr _func_1F28C
	jmp DialogAction_ItemMenuPauseScreen_DoneCursorMovement_Do_SFX

	@F2BD:
	   lda InventoryBodyParts1
	beq DialogAction_ItemMenuPauseScreen_DoneCursorMovement
	ldy InventoryBodyPartSelection
	iny
	cpy #$07
	bcc @F2CA
	ldy #$01
	@F2CA:
	jsr ItemStatusScreen_BodyPartsNormalize
	bcc @F2BD
	jmp DialogAction_ItemMenuPauseScreen_DoneCursorMovement_Do_SFX
;------------------------------------------
DialogAction_ItemMenuPauseScreen_RightShift_A_by_Y_put_original_in_17:
	sta $17
	lsr a
	dey
	bne DialogAction_ItemMenuPauseScreen_RightShift_A_by_Y_put_original_in_17
	rts
;------------------------------------------
DialogAction_ItemMenuPauseScreen_ButtonPressed_UpOrDown:
	lda InventoryCursorCompartmentSelection
	eor #$01
	sta InventoryCursorCompartmentSelection
DialogAction_ItemMenuPauseScreen_DoneCursorMovement_Do_SFX:
	lda #$31
	jsr AnyBankPlayTracks
DialogAction_ItemMenuPauseScreen_DoneCursorMovement:
	jmp _loc_1F307
;------------------------------------------
DialogText_IncYcoord_by_A:
	clc
	adc DialogText_Ycoord
	sta DialogText_Ycoord
	rts
;------------------------------------------
DialogAction_ItemMenuPauseScreen_WaitForStatusScreenKeys:
	lda Input_NewJoyButtonsWork
	and #$10
	beq @F2F6
	jmp @F22A

	@F2F6:
	lda Input_NewJoyButtonsWork
	lsr a
	bcs DialogAction_ItemMenuPauseScreen_ButtonPressed_Right
	lsr a
	bcc @F301
	jmp DialogAction_ItemMenuPauseScreen_ButtonPressed_Left

	@F301:
	lsr a
	bcs DialogAction_ItemMenuPauseScreen_ButtonPressed_UpOrDown
	lsr a
	bcs DialogAction_ItemMenuPauseScreen_ButtonPressed_UpOrDown
_loc_1F307:
	jsr InitializeDialogBoxCoordinates
	lda #$0A
	jsr DialogText_IncYcoord_by_A
	lda InventoryCursorCompartmentSelection
	bne StatusScreen_AnimateItemsLine
                            ; StatusScreen_AnimateBodypartsLine::
	jsr StatusScreenAndMerchants_InitializePPUsendQueue_For_CursorHandling
	lda FrameCounter
	and #$04
	beq _loc_1F35C
	lda InventoryBodyPartSelection
	beq @F329
	ldy InventoryBodyPartSelection
	dey
	lda StatusScreenCursorPositionsIntoPPUsendQueue,y
	jsr DialogBox_RenderDownArrow_StatusScreen_ReplaceArrowOnThisLine
	@F329:
	jmp StatusScreen_PutDownArrowForItemsLine
;------------------------------------------
StatusScreen_AnimateItemsLine:
	jsr DialogBox_TranslateCoordinateIntoPPUoffset_Maybe
	lda NameTableAddressLo
	and #$20
	sta $16
	ldy InventoryBodyPartSelection
	jsr DialogBox_RenderDownArrow_StatusScreen_PutArrowOnTheOtherLine
	lda #$03
	jsr DialogText_IncYcoord_by_A
	jsr StatusScreenAndMerchants_InitializePPUsendQueue_For_CursorHandling
	jsr StatusScreen_Add_PPUsendQueueSlots_For_LaurelsAndGarlics
	lda FrameCounter
	and #$04
	beq _loc_1F35C
	ldy InventoryCursorSelected1
	beq _loc_1F35C
	dey
	lda StatusScreenCursorPositionsIntoPPUsendQueue,y
DialogBox_RenderDownArrow_StatusScreen_ReplaceArrowOnThisLine:
	clc
	adc $05
	tax
	lda #$53
	sta PPUsendQueue,x
_loc_1F35C:
	rts
;------------------------------------------
StatusScreen_PutDownArrowForItemsLine:
	lda #$03
	ldy InventoryCursorSelected1
	cpy #$08
	bcc @F367
	lda #$05
	@F367:
	jsr DialogText_IncYcoord_by_A
	jsr DialogBox_TranslateCoordinateIntoPPUoffset_Maybe
	lda NameTableAddressLo
	and #$20
	sta $16
	ldy InventoryCursorSelected1
DialogBox_RenderDownArrow_StatusScreen_PutArrowOnTheOtherLine:
	beq _loc_1F35C
	dey
	lda _data_1F386_indexed,y
	jsr DialogBox_GoForwardHorizontally
	jsr PPU_Text_Put3bytes_01_and_NameTableAddress
	lda #$53
	jmp PPU_Text_PutAandFF
;------------------------------------------
_data_1F386_indexed:
	.byte $02,$04,$06,$08,$0A,$0C,$0E,$02,$09
StatusScreen_Add_PPUsendQueueSlots_For_LaurelsAndGarlics:
	inc DialogText_Ycoord
	inc DialogText_Ycoord
	jsr DialogBox_TranslateCoordinateIntoPPUoffset_Maybe
	lda NameTableAddressLo
	and #$20
	sta $16
	lda #$02
	sta Temp07
	lda #$02
	@F3A2:
	jsr DialogBox_GoForwardHorizontally
	jsr PPU_Text_Put3bytes_01_and_NameTableAddress
	lda #$00
	jsr PPU_Text_PutAandFF
	dec Temp07
	beq @F3B6
	lda #$07
	jmp @F3A2

	@F3B6:
	dec DialogText_Ycoord
	dec DialogText_Ycoord
	rts
;------------------------------------------
StatusScreenAndMerchants_InitializePPUsendQueue_For_CursorHandling:
                            ; Creates seven blank slots in the buffer, with one space between each.:
                            ; Each slot is a separate PPU send command. This ensures that it will:
                            ; work properly even when the line of slots spans across nametables.:
	ldx PPUsendQueueHead
	stx $05
	jsr DialogBox_TranslateCoordinateIntoPPUoffset_Maybe
	lda NameTableAddressLo
	and #$20
	sta $16
	lda #$07
	sta Temp07
	@F3CC:
	lda #$02
	jsr DialogBox_GoForwardHorizontally
	jsr PPU_Text_Put3bytes_01_and_NameTableAddress
	lda #$00
	jsr PPU_Text_PutAandFF
	dec Temp07
	bne @F3CC
	rts
;------------------------------------------
StatusScreenCursorPositionsIntoPPUsendQueue:
	.byte $03,$08,$0D,$12,$17,$1C,$21,$26,$2B
DialogAction_Undraw_DialogBox_18lines:
	jsr UndrawDialogBoxAttributes
	jsr UndrawDialogBoxTiles
	lda DialogText_Saved_ID
	cmp #$12
	bcc @F3FA
	lda #$08
	sta Unknown04EE
	inc DialogActionState
	@F3FA:
	rts
;------------------------------------------
DialogAction_ItemMenuPauseScreen_EndPauseStateShowActors:
	jsr _func_1F403
	lda #$00
	sta GamePaused
	rts
;------------------------------------------
_func_1F403:
	ldx #$00
	@F405:
	lda ObjectDialogStatusFlag,x
	and #$FB
	sta ObjectDialogStatusFlag,x
	inx
	cpx #$11
	bcc @F405
	rts
;------------------------------------------
UndrawDialogBoxTiles:
	jsr DialogBox_TranslateCoordinateIntoPPUoffset_Maybe
	jsr Split_6A_into_10_11_and_12
	lda NameTableAddressLo
	and #$20
	sta $06
	lda #$10
	sta Temp07
	jsr PPU_Text_Put3bytes_01_and_NameTableAddress
	@F426:
	 jsr LoadLevelDataScreensPointerLo_SomePointerIndexedBy12and14_StoreTo02
	jsr Load_MetaTile_ParticularTileStoreTo16_and_0F09
	jsr Load_MetaTile_ParticularRowPointerStoreTo16
	lda $15
	ldx #$16
	jsr Inc16bitPointerAtX_by_A
	ldx PPUsendQueueHead
	lda $15
	eor #$03
	tay
	iny
	sty Temp93
	ldy #$00
	sty Temp97
	jsr _func_1D619
	sta $0D
_loc_1F449:
	jsr SubstituteBlockCheckFakeBlocks
	cmp #$FF
	bne @F454
	ldy Temp97
                            ; Load tile that is drawn when restoring under a dialog box:
	lda ($16),y
	@F454:
	sta PPUsendQueue,x
	inc Temp97
	inx
	inc NameTableAddressLo
	dec Temp07
	beq @F488
	dec Temp93
	bne _loc_1F449
	stx PPUsendQueueHead
	lda NameTableAddressLo
	and #$20
	cmp $06
	bne @F482
	@F46E:
	ldy Unknown13_Horizontal_32pixelUnitForObject
	iny
	cpy #$08
	bcc @F479
	inc Unknown14_Horizontal_256pixelUnitForObject
	ldy #$00
	@F479:
	sty Unknown13_Horizontal_32pixelUnitForObject
	lda #$00
	sta $15
	jmp @F426

	@F482:
	 jsr DialogBox_NameTableWrapped_StartNewPPUtext_AndSaveNew_5Ebitand20_to_06
	jmp @F46E

	@F488:
	  stx PPUsendQueueHead
	lda PPUsendQueueMinus1,x
	cmp #$FF
	beq @F494
	jsr PPU_Text_PutFF
	@F494:
	inc DialogText_Ycoord
	inc DialogText_Saved_ID
	lda DialogText_Saved_ID
	and #$01
	beq @F4A1
	jmp UndrawDialogBoxTiles

	@F4A1:
	rts
;------------------------------------------
UndrawDialogBoxAttributes:
	jsr DialogBox_TranslateCoordinateIntoPPUoffset_Maybe
	jsr Split_6A_into_10_11_and_12
	lda NameTableAddressLo
	and #$20
	sta $06
	lda #$08
	sta Temp07
	@F4B2:
	  jsr LoadLevelDataScreensPointerLo_SomePointerIndexedBy12and14_StoreTo02
	jsr Load_MetaTile_ParticularTileStoreTo16_and_0F09
	ldy $62
	iny
	lda (LevelData_MetaTiles_pointerLo),y
	sta Temp93
	lda Unknown10_CollisionAndScrollingTemp
	and #$02
	beq @F4C8
	jsr Math_div93by16
	@F4C8:
	lda $15
	and #$02
	beq @F4D1
	jsr Math_div93by4
	@F4D1:
	lda Temp93
	and #$03
	sta Temp93
	ldy #$00
	lda NameTableAddressLo
	and #$40
	beq @F4E4
	iny
	iny
	jsr Math_mul93by16
	@F4E4:
	lda NameTableAddressLo
	and #$02
	beq @F4EE
	iny
	jsr Math_mul93by4
	@F4EE:
	sty Temp97
	ldx PPUsendQueueHead
	lda Temp07
	cmp #$08
	beq @F502
	lda Unknown60_ScrollingRelated
	cmp PPUsendQueueMinus3,x
	bne @F502
	jmp @F559

	@F502:
	lda #$04
	jsr PPU_Text_Put3bytes_A_and_AttributeTableAddress
	lda Temp97
	sta PPUsendQueue,x
	inx
	lda Temp93
	jsr PPU_Text_PutA
	@F512:
	 lda NameTableAddressLo
	clc
	adc #$02
	sta NameTableAddressLo
	bcc @F51D
	inc NameTableAddressHi
	@F51D:
	jsr Convert_NameTableAddress_To_AttributeTableAddress
	lda NameTableAddressLo
	and #$20
	cmp $06
	bne @F54A
	@F528:
	ldy $15
	iny
	iny
	cpy #$04
	bcc @F534
	inc Unknown13_Horizontal_32pixelUnitForObject
	ldy #$00
	@F534:
	sty $15
	lda Unknown13_Horizontal_32pixelUnitForObject
	cmp #$08
	bcc @F542
	inc Unknown14_Horizontal_256pixelUnitForObject
	lda #$00
	sta Unknown13_Horizontal_32pixelUnitForObject
	@F542:
	dec Temp07
	beq @F549
	jmp @F4B2

	@F549:
	rts

	@F54A:
	 jsr DialogBox_AdjustCoordinatesAfterNameTableWrap
	jsr Convert_NameTableAddress_To_AttributeTableAddress
	lda NameTableAddressLo
	and #$20
	sta $06
	jmp @F528

	@F559:
	  ldy #$04
	lda PPUsendQueueMinus2,x
	and #$02
	beq @F563
	iny
	@F563:
	tya
	sta PPUsendQueueMinus2,x
	lda PPUsendQueueMinus1,x
	ora Temp93
	sta PPUsendQueueMinus1,x
	jmp @F512
;------------------------------------------
DialogBox_AdjustCoordinatesAfterNameTableWrap:
	lda NameTableAddressHi
	eor #$04
	sta NameTableAddressHi
	lda NameTableAddressLo
	sec
	sbc #$20
	sta NameTableAddressLo
	rts
;------------------------------------------
DialogBox_RenderLine:
	lda DialogText_Saved_CharacterIndex
	asl a
	tay
	lda DialogBoxTable,y
	sta TempPtr02_lo
	lda DialogBoxTable+1,y
	sta TempPtr02_hi
	lda DialogText_Saved_ID
	asl a
	tay
	lda (TempPtr02_lo),y
	sta TempPtr00_lo
	iny
	lda (TempPtr02_lo),y
	sta TempPtr00_hi
	jsr DialogBox_TranslateCoordinateIntoPPUoffset_Maybe
	jsr Split_6A_into_10_11_and_12
	lda NameTableAddressLo
	and #$20
	sta $16
	jsr PPU_Text_Put3bytes_01_and_NameTableAddress
	ldy #$00
	@F5AC:
	 lda (TempPtr00_lo),y
	iny
	cmp #$FF
	beq @F5F7
	cmp #$80
	bcs @F5D6
	sta $04
	@F5B9:
	lda NameTableAddressLo
	and #$20
	cmp $16
	bne @F5D0
	lda (TempPtr00_lo),y
	jsr PPU_Text_PutA
	inc NameTableAddressLo
	dec $04
	bne @F5B9
	iny
	jmp @F5AC

	@F5D0:
	jsr DialogBox_NameTableWrapped_StartNewPPUtext_AndSaveNew_5Ebitand20_to_16
	jmp @F5B9

	@F5D6:
	 and #$7F
	sta $04
	@F5DA:
	lda NameTableAddressLo
	and #$20
	cmp $16
	bne @F5F1
	lda (TempPtr00_lo),y
	jsr PPU_Text_PutA
	iny
	inc NameTableAddressLo
	dec $04
	bne @F5DA
	jmp @F5AC

	@F5F1:
	jsr DialogBox_NameTableWrapped_StartNewPPUtext_AndSaveNew_5Ebitand20_to_16
	jmp @F5DA

	@F5F7:
	  ldx PPUsendQueueHead
	lda PPUsendQueueMinus1,x
	cmp #$FF
	beq @F603
	jsr PPU_Text_PutFF
	@F603:
	inc DialogText_Ycoord
	inc DialogText_Saved_ID
	lda DialogText_Saved_ID
	and #$01
	beq @F610
	jmp DialogBox_RenderLine

	@F610:
	rts
;------------------------------------------
DialogBox_NameTableWrapped_SaveNew_5Ebitand20_to_16:
	lda #$16
DialogBox_NameTableWrapped_SaveNew_5Ebitand20_to_Addr_A:
	pha
	 jsr DialogBox_AdjustCoordinatesAfterNameTableWrap
	pla
	tax
	lda NameTableAddressLo
	and #$20
	sta TempPtr00_lo,x
	rts
;------------------------------------------
DialogBox_NameTableWrapped_StartNewPPUtext_AndSaveNew_5Ebitand20_to_06:
	lda #$06
	bne _loc_1F626
;------------------------------------------
DialogBox_NameTableWrapped_StartNewPPUtext_AndSaveNew_5Ebitand20_to_16:
	lda #$16
_loc_1F626:
	pha
	 jsr PPU_Text_PutFF
	pla
	jsr DialogBox_NameTableWrapped_SaveNew_5Ebitand20_to_Addr_A
	jmp PPU_Text_Put3bytes_01_and_NameTableAddress
;------------------------------------------
DialogBoxTable_LengthsMinus1:
	.byte $11,$0B,$0B,$0B,$0B,$0B,$0B,$0B
DialogBoxTable:
	.word (DialogBoxTable_00_Status) ;F649 (1F649) ()
	.word (DialogBoxTable_default) ;F66D (1F66D) ()
	.word (DialogBoxTable_02_sell_yesno) ;F685 (1F685) ()
	.word (DialogBoxTable_default) ;F66D (1F66D) ()
	.word (DialogBoxTable_default) ;F66D (1F66D) ()
	.word (DialogBoxTable_default) ;F66D (1F66D) ()
	.word (DialogBoxTable_default) ;F66D (1F66D) ()
	.word (DialogBoxTable_default) ;F66D (1F66D) ()
DialogBoxTable_00_Status:
	.word (DialogBoxGraph_TopLine) ;F69D (1F69D) ()
	.word (DialogBoxGraph_EmptyLine) ;F6A4 (1F6A4) ()
	.word (DialogBoxGraph_Status_Time) ;F6B9 (1F6B9) ()
	.word (DialogBoxGraph_EmptyLine) ;F6A4 (1F6A4) ()
	.word (DialogBoxGraph_Status_Exp_Level) ;F6CC (1F6CC) ()
	.word (DialogBoxGraph_EmptyLine) ;F6A4 (1F6A4) ()
	.word (DialogBoxGraph_Status_Hearts) ;F6DC (1F6DC) ()
	.word (DialogBoxGraph_MiddleLine) ;F6AB (1F6AB) ()
	.word (DialogBoxGraph_EmptyLine) ;F6A4 (1F6A4) ()
	.word (DialogBoxGraph_MiddleLine) ;F6AB (1F6AB) ()
	.word (DialogBoxGraph_EmptyLine) ;F6A4 (1F6A4) ()
	.word (DialogBoxGraph_EmptyLine) ;F6A4 (1F6A4) ()
	.word (DialogBoxGraph_MiddleLine) ;F6AB (1F6AB) ()
	.word (DialogBoxGraph_EmptyLine) ;F6A4 (1F6A4) ()
	.word (DialogBoxGraph_EmptyLine) ;F6A4 (1F6A4) ()
	.word (DialogBoxGraph_EmptyLine) ;F6A4 (1F6A4) ()
	.word (DialogBoxGraph_EmptyLine) ;F6A4 (1F6A4) ()
	.word (DialogBoxGraph_BottomLine) ;F6B2 (1F6B2) ()
DialogBoxTable_default:
	.word (DialogBoxGraph_TopLine) ;F69D (1F69D) ()
	.word (DialogBoxGraph_EmptyLine) ;F6A4 (1F6A4) ()
	.word (DialogBoxGraph_EmptyLine) ;F6A4 (1F6A4) ()
	.word (DialogBoxGraph_EmptyLine) ;F6A4 (1F6A4) ()
	.word (DialogBoxGraph_EmptyLine) ;F6A4 (1F6A4) ()
	.word (DialogBoxGraph_EmptyLine) ;F6A4 (1F6A4) ()
	.word (DialogBoxGraph_EmptyLine) ;F6A4 (1F6A4) ()
	.word (DialogBoxGraph_EmptyLine) ;F6A4 (1F6A4) ()
	.word (DialogBoxGraph_EmptyLine) ;F6A4 (1F6A4) ()
	.word (DialogBoxGraph_EmptyLine) ;F6A4 (1F6A4) ()
	.word (DialogBoxGraph_EmptyLine) ;F6A4 (1F6A4) ()
	.word (DialogBoxGraph_BottomLine) ;F6B2 (1F6B2) ()
DialogBoxTable_02_sell_yesno:
	.word (DialogBoxGraph_TopLine) ;F69D (1F69D) ()
	.word (DialogBoxGraph_EmptyLine) ;F6A4 (1F6A4) ()
	.word (DialogBoxGraph_EmptyLine) ;F6A4 (1F6A4) ()
	.word (DialogBoxGraph_EmptyLine) ;F6A4 (1F6A4) ()
	.word (DialogBoxGraph_EmptyLine) ;F6A4 (1F6A4) ()
	.word (DialogBoxGraph_EmptyLine) ;F6A4 (1F6A4) ()
	.word (DialogBoxGraph_Sell_HeartCost) ;F6E7 (1F6E7) ()
	.word (DialogBoxGraph_EmptyLine) ;F6A4 (1F6A4) ()
	.word (DialogBoxGraph_EmptyLine) ;F6A4 (1F6A4) ()
	.word (DialogBoxGraph_Sell_YesNo) ;F6F6 (1F6F6) ()
	.word (DialogBoxGraph_EmptyLine) ;F6A4 (1F6A4) ()
	.word (DialogBoxGraph_BottomLine) ;F6B2 (1F6B2) ()
DialogBoxGraph_TopLine:
	.byte $81,$47,$0E,$48,$81,$49,$FF
DialogBoxGraph_EmptyLine:
	.byte $81,$4A,$0E,$00,$81,$4A,$FF
DialogBoxGraph_MiddleLine:
	.byte $81,$4A,$0E,$48,$81,$4A,$FF
DialogBoxGraph_BottomLine:
	.byte $81,$4B,$0E,$48,$81,$4C,$FF
DialogBoxGraph_Status_Time:
	.byte $81,$4A,$83,$00,$63,$46,$04,$00,$81,$71,$02,$00,$81,$71,$03,$00
	.byte $81,$4A,$FF
DialogBoxGraph_Status_Exp_Level:
	.byte $81,$4A,$83,$00,$62,$46,$05,$00,$82,$64,$46,$04,$00,$81,$4A,$FF
DialogBoxGraph_Status_Hearts:
	.byte $81,$4A,$83,$00,$61,$46,$0B,$00,$81,$4A,$FF
DialogBoxGraph_Sell_HeartCost:
	.byte $81,$4A,$03,$00,$04,$46,$81,$00,$81,$61,$05,$00,$81,$4A,$FF
DialogBoxGraph_Sell_YesNo:
	.byte $81,$4A,$03,$00,$83,$19,$05,$13,$03,$00,$82,$0E,$0F,$03,$00,$81
	.byte $4A,$FF
DialogBox_RenderLineAttributes:
	jsr DialogBox_TranslateCoordinateIntoPPUoffset_Maybe
	jsr Split_6A_into_10_11_and_12
	lda NameTableAddressLo
	and #$20
	sta $16
	ldy #$08
	sty $17
	@F718:
	  lda #$03
	sta Temp93
	ldy #$00
	lda NameTableAddressLo
	and #$40
	beq @F729
	jsr Math_mul93by16
	iny
	iny
	@F729:
	lda NameTableAddressLo
	and #$02
	beq @F733
	jsr Math_mul93by4
	iny
	@F733:
	sty Temp97
	ldx PPUsendQueueHead
	lda $17
	cmp #$08
	beq @F744
	lda Unknown60_ScrollingRelated
	cmp PPUsendQueueMinus3,x
	beq @F77E
	@F744:
	lda #$04
	sta PPUsendQueue,x
	inx
	lda AttributeTableAddressHi
	sta PPUsendQueue,x
	inx
	lda Unknown60_ScrollingRelated
	sta PPUsendQueue,x
	inx
	lda Temp97
	sta PPUsendQueue,x
	inx
	lda Temp93
	jsr PPU_Text_PutA
	@F761:
	 lda NameTableAddressLo
	clc
	adc #$02
	sta NameTableAddressLo
	lda NameTableAddressHi
	adc #$00
	sta NameTableAddressHi
	jsr Convert_NameTableAddress_To_AttributeTableAddress
	lda NameTableAddressLo
	and #$20
	cmp $16
	bne @F797
	@F779:
	dec $17
	bne @F718
	rts

	@F77E:
	 ldy #$04
	lda PPUsendQueueMinus2,x
	and #$02
	beq @F788
	iny
	@F788:
	tya
	sta PPUsendQueueMinus2,x
	lda PPUsendQueueMinus1,x
	ora Temp93
	sta PPUsendQueueMinus1,x
	jmp @F761

	@F797:
	  jsr DialogBox_AdjustCoordinatesAfterNameTableWrap
	jsr Convert_NameTableAddress_To_AttributeTableAddress
	lda NameTableAddressLo
	and #$20
	sta $16
	jmp @F779
;------------------------------------------
_data_1F7A6_indexed:
	.byte $01,$02,$02,$03,$02
LevelData_ScreenNumbers:
	.word (LevelData_ScreenNumbers_0_Towns) ;8042 (8042) ([8:4][A:5])
	.word (LevelData_ScreenNumbers_1_Mansions) ;873C (873C) ([8:4][A:5])
	.word (LevelData_ScreenNumbers_2_ForestsAndBridges) ;9EE5 (9EE5) ([8:4][A:5])
	.word (LevelData_ScreenNumbers_3_Wilderness) ;B280 (B280) ([8:4][A:5])
	.word (LevelData_ScreenNumbers_4_Wastelands) ;AE64 (AE64) ([8:4][A:5])
	.word (LevelData_ScreenNumbers_5_Ruins) ;BC56 (BC56) ([8:4][A:5])
	.byte $01,$00,$00,$00,$00,$01,$FE,$01,$FE,$00,$00,$00,$00,$00
LevelData_Palettes:
	.word (LevelData_Palettes_0_Towns) ;8072 (8072) ([8:4][A:5])
	.word (LevelData_Palettes_1_Mansions) ;8762 (8762) ([8:4][A:5])
	.word (LevelData_Palettes_2_ForestsAndBridges) ;9EF9 (9EF9) ([8:4][A:5])
	.word (LevelData_Palettes_3_Wilderness) ;B28A (B28A) ([8:4][A:5])
	.word (LevelData_Palettes_4_Wastelands) ;AEAD (AEAD) ([8:4][A:5])
	.word (LevelData_Palettes_5_Ruins) ;BC4E (BC4E) ([8:4][A:5])
LevelData_MetaTiles:
	.word (LevelData_MetaTiles_0_Towns) ;841D (1041D) ([8:8][A:9])
LevelData_CategoryThresholds:
	.word (LevelData_CategoryThresholds_0_Towns) ;F7E9 (1F7E9) ([8:8][A:9])
	.word (LevelData_MetaTiles_1_Mansions) ;8891 (10891) ([8:8][A:9])
	.word (LevelData_CategoryThresholds_1_Mansions) ;F7EC (1F7EC) ([8:8][A:9])
	.word (LevelData_MetaTiles_2_ForestsAndBridges) ;8CF4 (10CF4) ([8:8][A:9])
	.word (LevelData_CategoryThresholds_2_ForestsAndBridges) ;F7EF (1F7EF) ([8:8][A:9])
	.word (LevelData_MetaTiles_3_Wilderness) ;918A (1118A) ([8:8][A:9])
	.word (LevelData_CategoryThresholds_3_Wilderness) ;F7F2 (1F7F2) ([8:8][A:9])
	.word (LevelData_MetaTiles_4_Wastelands) ;9620 (11620) ([8:8][A:9])
	.word (LevelData_CategoryThresholds_4_Wastelands) ;F7F5 (1F7F5) ([8:8][A:9])
	.word (LevelData_MetaTiles_5_Ruins) ;9A3F (11A3F) ([8:8][A:9])
	.word (LevelData_CategoryThresholds_5_Ruins) ;F7F8 (1F7F8) ([8:8][A:9])
LevelData_CategoryThresholds_0_Towns:
	.byte $F0,$F1,$FB
LevelData_CategoryThresholds_1_Mansions:
	.byte $E1,$E9,$FB
LevelData_CategoryThresholds_2_ForestsAndBridges:
	.byte $DA,$DD,$FB
LevelData_CategoryThresholds_3_Wilderness:
	.byte $E0,$E3,$FB
LevelData_CategoryThresholds_4_Wastelands:
	.byte $D5,$D5,$FB
LevelData_CategoryThresholds_5_Ruins:
	.byte $E5,$E5,$FB
LevelData_Screens:
	.word (LevelData_Screens_0_Towns) ;80D3 (80D3) ([8:4][A:5])
	.word (LevelData_Screens_1_Mansions) ;8792 (8792) ([8:4][A:5])
	.word (LevelData_Screens_2_ForestsAndBridges) ;9F21 (9F21) ([8:4][A:5])
	.word (LevelData_Screens_3_Wilderness) ;B29E (B29E) ([8:4][A:5])
	.word (LevelData_Screens_4_Wastelands) ;AEDD (AEDD) ([8:4][A:5])
	.word (LevelData_Screens_5_Ruins) ;BC46 (BC46) ([8:4][A:5])
LevelData_Screen_Blank:
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00
LevelData_Screen_Map2_16_17_and_2_18_and_4_5_6:
	.byte $3B,$3B,$3B,$3B,$3B,$3B,$3B,$3B,$1F,$1F,$1F,$1F,$1F,$1F,$1F,$1F
	.byte $1F,$1F,$1E,$1F,$1F,$1F,$1E,$1F,$1A,$1B,$1C,$1D,$1A,$1B,$1C,$1D
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$35,$35,$35,$35,$35,$35,$35,$35
	.byte $34,$34,$34,$34,$34,$34,$34,$34
LevelData_Screen_Map2_16_17_and_2_18_and_3_10_and_4_5_6:
	.byte $3B,$3B,$3B,$3B,$3B,$3B,$3B,$3B,$1F,$1F,$1F,$1F,$1F,$1F,$1F,$1F
	.byte $1F,$1F,$1E,$1F,$1F,$1F,$1E,$1F,$1A,$1B,$1C,$1D,$1A,$1B,$1C,$1D
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$39,$39,$3A,$3A,$3A,$3A,$39,$39
	.byte $17,$17,$21,$21,$21,$21,$17,$17
LevelData_Screen_Map2_10_and_3_4:
	.byte $3B,$3B,$3B,$3B,$3B,$3B,$3B,$3B,$1F,$1F,$1F,$1F,$1F,$1F,$1F,$1F
	.byte $1F,$1F,$1E,$1F,$1F,$1F,$1E,$1F,$1A,$1B,$1C,$1D,$1A,$1B,$1C,$1D
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$35,$35,$35,$35,$35,$35,$35,$35
	.byte $17,$34,$34,$34,$34,$34,$34,$17
LevelData_Screen_Map2_4_and_2_11_and_2_25:
	.byte $3B,$3B,$3B,$3B,$3B,$3B,$3B,$3B,$1F,$1F,$1F,$1F,$1F,$1F,$1F,$1F
	.byte $1F,$1F,$1E,$1F,$1F,$1F,$1E,$1F,$1A,$1B,$1C,$1D,$1A,$1B,$1C,$1D
	.byte $00,$00,$39,$39,$38,$38,$38,$38,$39,$39,$17,$17,$32,$35,$35,$37
	.byte $17,$17,$19,$19,$34,$34,$34,$34
LevelData_Screen_Map2_4_and_2_11_and_2_25_and_4_2:
	.byte $3B,$3B,$3B,$3B,$3B,$3B,$3B,$3B,$1F,$1F,$1F,$1F,$1F,$1F,$1F,$1F
	.byte $1F,$1F,$1E,$1F,$1F,$1F,$1E,$1F,$1A,$1B,$1C,$1D,$1A,$1B,$1C,$1D
	.byte $38,$38,$38,$38,$39,$39,$00,$00,$37,$35,$35,$33,$17,$17,$39,$39
	.byte $34,$34,$34,$34,$19,$19,$17,$17
LevelData_Screen_Map2_25_and_4_2:
	.byte $3B,$3B,$3B,$3B,$3B,$3B,$3B,$3B,$1F,$1F,$1F,$1F,$1F,$1F,$1F,$1F
	.byte $1F,$1F,$1E,$1F,$1F,$1F,$1E,$1F,$1A,$1B,$1C,$1D,$1A,$1B,$1C,$1D
	.byte $38,$38,$38,$38,$38,$38,$38,$38,$35,$35,$37,$35,$35,$37,$35,$35
	.byte $34,$34,$34,$34,$34,$34,$34,$34
LevelData_Screen_Map2_4:
	.byte $3B,$3B,$3B,$3B,$3B,$3B,$3B,$3B,$1F,$1F,$1F,$1F,$1F,$1F,$1F,$1F
	.byte $1F,$1F,$1E,$1F,$1F,$1F,$1E,$1F,$1A,$1B,$1C,$1D,$1A,$1B,$1C,$1D
	.byte $38,$00,$38,$00,$38,$00,$00,$38,$35,$35,$37,$35,$35,$37,$35,$35
	.byte $34,$34,$34,$34,$34,$34,$34,$34
LevelData_Screen_Map2_11:
	.byte $3B,$3B,$3B,$3B,$3B,$3B,$3B,$3B,$1F,$1F,$1F,$1F,$1F,$1F,$1F,$1F
	.byte $1F,$1F,$1E,$1F,$1F,$1F,$1E,$1F,$1A,$1B,$1C,$1D,$1A,$1B,$1C,$1D
	.byte $38,$00,$00,$00,$00,$00,$00,$38,$35,$35,$37,$35,$35,$37,$35,$35
	.byte $34,$34,$34,$34,$34,$34,$34,$34
LevelData_ScreenNumbers_0_Towns_0aldra:
	.word (LevelData_ScreenNumbers_0_Towns_0aldra_1FA3D) ;FA3D (1FA3D) ()
	.byte $00,$FF,$02,$07,$FF,$02,$00
	.word (LevelData_ScreenNumbers_0_Towns_0aldra_0) ;FA3A (1FA3A) ()
LevelData_ScreenNumbers_0_Towns_3jova:
	.word (LevelData_ScreenNumbers_0_Towns_3jova_1FA3C) ;FA3C (1FA3C) ()
	.byte $00,$FF,$03,$02,$FF,$02,$07
	.word (LevelData_ScreenNumbers_0_Towns_3jova_0) ;FA3B (1FA3B) ()
LevelData_ScreenNumbers_0_Towns_8_9:
	.word (LevelData_ScreenNumbers_0_Towns_5doina_80D2) ;80D2 (80D2) ()
	.byte $00,$FB,$00,$00,$FB,$00,$00
	.word (LevelData_ScreenNumbers_0_Towns_8_0_9_0_10_1_16_1_18_0_19_2_20_0_22_0_23_0) ;800C (800C) ()
LevelData_ScreenNumbers_0_Towns_15:
	.word (LevelData_ScreenNumbers_0_Towns_5doina_80D2) ;80D2 (80D2) ()
	.byte $01,$FB,$00,$00,$FB,$00,$00
	.word (LevelData_ScreenNumbers_0_Towns_14_0_15_0) ;800F (800F) ()
	.word (LevelData_ScreenNumbers_0_Towns_13_1_14_1_15_1_17_1) ;800E (800E) ()
LevelData_ScreenNumbers_0_Towns_16:
	.word (LevelData_ScreenNumbers_0_Towns_5doina_80D2) ;80D2 (80D2) ()
	.byte $01,$FB,$00,$00,$FB,$00,$00
	.word (LevelData_ScreenNumbers_0_Towns_10_0_16_0_19_0_19_1) ;800D (800D) ()
	.word (LevelData_ScreenNumbers_0_Towns_8_0_9_0_10_1_16_1_18_0_19_2_20_0_22_0_23_0) ;800C (800C) ()
LevelData_ScreenNumbers_0_Towns_0aldra_0:
	.byte $03
LevelData_ScreenNumbers_0_Towns_3jova_0:
	.byte $04
LevelData_ScreenNumbers_0_Towns_3jova_1FA3C:
	.byte $FE
LevelData_ScreenNumbers_0_Towns_0aldra_1FA3D:
	.byte $FF
LevelData_Palettes_0_Towns_0aldra_Day:
	.byte $16,$2E
LevelData_Palettes_0_Towns_3jova_Day:
	.byte $19,$2E
LevelData_Palettes_0_Towns_8_9_15_Day:
	.byte $15,$2E,$15,$2E,$15,$2E
LevelData_Palettes_0_Towns_15garlicvendor_Night:
	.byte $16,$2E
LevelData_Palettes_0_Towns_0aldra_3jova_Night:
	.byte $14,$37
LevelData_Palettes_0_Towns_16laurelvendor_Day:
	.byte $15,$2E,$15,$2E
LevelData_Stairs_0_Towns_3jova:
	.byte $09,$16,$95,$22,$1B,$A2,$8B,$B2,$2D,$26,$B9,$32,$53,$A6,$C7,$B2
	.byte $65,$16,$F1,$22,$65,$22,$F5,$32,$FF
LevelData_Stairs_0_Towns_4ondol:
	.byte $09,$32,$95,$3E,$1B,$BE,$8B,$CE,$53,$C2,$C7,$CE,$65,$16,$F1,$22
	.byte $65,$22,$F5,$32,$65,$32,$F1,$3E,$65,$3E,$F5,$4E,$FF
LevelData_Screens_0_Towns_3jova_A:
	.byte $04,$02
	.word (LevelData_Screen_Map0_3_and_0_4_and_0_5_two) ;8497 (8497) ([8:4][A:5])
	.word (LevelData_Screen_Map0_2_and_0_3_and_0_4_and_0_5_and_0_6) ;85AF (85AF) ([8:4][A:5])
	.word (LevelData_Screen_Map0_0_and_0_1_and_0_3_and_0_4) ;8577 (8577) ([8:4][A:5])
	.word (LevelData_Screen_Map0_2_and_0_3_and_0_4_and_0_5_two) ;8507 (8507) ([8:4][A:5])
	.word (LevelData_Screen_Map0_3_and_0_4_and_0_5_one) ;83B7 (83B7) ([8:4][A:5])
	.word (LevelData_Screen_Map0_3) ;82D7 (82D7) ([8:4][A:5])
	.word (LevelData_Screen_Map0_0_and_0_3_and_0_4_and_0_5_and_0_6) ;861F (861F) ([8:4][A:5])
	.word (LevelData_Screen_Map0_2_and_0_3_and_0_4_and_0_5_one) ;845F (845F) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
LevelData_Screens_0_Towns_4ondol_A:
	.byte $04,$03
	.word (LevelData_Screen_Map0_2_and_0_4_and_0_5) ;853F (853F) ([8:4][A:5])
	.word (LevelData_Screen_Map0_4) ;8427 (8427) ([8:4][A:5])
	.word (LevelData_Screen_Map0_0_and_0_1_and_0_3_and_0_4) ;8577 (8577) ([8:4][A:5])
	.word (LevelData_Screen_Map0_2_and_0_3_and_0_4_and_0_5_two) ;8507 (8507) ([8:4][A:5])
	.word (LevelData_Screen_Map0_3_and_0_4_and_0_5_two) ;8497 (8497) ([8:4][A:5])
	.word (LevelData_Screen_Map0_2_and_0_3_and_0_4_and_0_5_and_0_6) ;85AF (85AF) ([8:4][A:5])
	.word (LevelData_Screen_Map0_1_and_0_2_and_0_4_and_0_5) ;85E7 (85E7) ([8:4][A:5])
	.word (LevelData_Screen_Map0_4_and_0_5) ;84CF (84CF) ([8:4][A:5])
	.word (LevelData_Screen_Map0_3_and_0_4_and_0_5_one) ;83B7 (83B7) ([8:4][A:5])
	.word (LevelData_Screen_Map0_1_and_0_2_and_0_4_and_0_5) ;85E7 (85E7) ([8:4][A:5])
	.word (LevelData_Screen_Map0_0_and_0_3_and_0_4_and_0_5_and_0_6) ;861F (861F) ([8:4][A:5])
	.word (LevelData_Screen_Map0_2_and_0_3_and_0_4_and_0_5_one) ;845F (845F) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
LevelData_ScreenNumbers_0_Towns_2aljiba:
	.word (LevelData_ScreenNumbers_0_Towns_2aljiba_1FB24) ;FB24 (1FB24) ()
	.byte $00,$FF,$02,$02,$FF,$03,$00
	.word (LevelData_ScreenNumbers_0_Towns_2aljiba_0) ;FB1E (1FB1E) ()
LevelData_ScreenNumbers_0_Towns_5doina:
	.word (LevelData_ScreenNumbers_0_Towns_5doina_80D2) ;80D2 (80D2) ()
	.byte $00,$FF,$04,$02,$FF,$02,$08
	.word (LevelData_ScreenNumbers_0_Towns_5doina_0) ;FB1F (1FB1F) ()
LevelData_ScreenNumbers_0_Towns_6yomi:
	.word (LevelData_ScreenNumbers_0_Towns_5doina_80D2) ;80D2 (80D2) ()
	.byte $00,$FC,$02,$08,$FF,$04,$03
	.word (LevelData_ScreenNumbers_0_Towns_6yomi_0) ;FB20 (1FB20) ()
LevelData_ScreenNumbers_0_Towns_12:
	.word (LevelData_ScreenNumbers_0_Towns_5doina_80D2) ;80D2 (80D2) ()
	.byte $00,$FB,$00,$00,$FB,$00,$00
	.word (LevelData_ScreenNumbers_0_Towns_12_0) ;FB21 (1FB21) ()
LevelData_ScreenNumbers_0_Towns_13:
	.word (LevelData_ScreenNumbers_0_Towns_5doina_80D2) ;80D2 (80D2) ()
	.byte $01,$FB,$00,$00,$FB,$00,$00
	.word (LevelData_ScreenNumbers_0_Towns_13_0) ;FB22 (1FB22) ()
	.word (LevelData_ScreenNumbers_0_Towns_13_1_14_1_15_1_17_1) ;800E (800E) ()
LevelData_ScreenNumbers_0_Towns_14:
	.word (LevelData_ScreenNumbers_0_Towns_5doina_80D2) ;80D2 (80D2) ()
	.byte $01,$FB,$00,$00,$FB,$00,$00
	.word (LevelData_ScreenNumbers_0_Towns_14_0_15_0) ;800F (800F) ()
	.word (LevelData_ScreenNumbers_0_Towns_13_1_14_1_15_1_17_1) ;800E (800E) ()
LevelData_ScreenNumbers_0_Towns_20_22_23:
	.word (LevelData_ScreenNumbers_0_Towns_5doina_80D2) ;80D2 (80D2) ()
	.byte $00,$FB,$00,$00,$FB,$00,$00
	.word (LevelData_ScreenNumbers_0_Towns_8_0_9_0_10_1_16_1_18_0_19_2_20_0_22_0_23_0) ;800C (800C) ()
LevelData_ScreenNumbers_0_Towns_21:
	.word (LevelData_ScreenNumbers_0_Towns_5doina_80D2) ;80D2 (80D2) ()
	.byte $00,$FB,$00,$00,$FB,$00,$00
	.word (LevelData_ScreenNumbers_0_Towns_21_0) ;FB23 (1FB23) ()
LevelData_ScreenNumbers_0_Towns_2aljiba_0:
	.byte $02
LevelData_ScreenNumbers_0_Towns_5doina_0:
	.byte $00
LevelData_ScreenNumbers_0_Towns_6yomi_0:
	.byte $06
LevelData_ScreenNumbers_0_Towns_12_0:
	.byte $0A
LevelData_ScreenNumbers_0_Towns_13_0:
	.byte $0B
LevelData_ScreenNumbers_0_Towns_21_0:
	.byte $0E
LevelData_ScreenNumbers_0_Towns_2aljiba_1FB24:
	.byte $FF
LevelData_Palettes_0_Towns_2aljiba_Day:
	.byte $18,$2E
LevelData_Palettes_0_Towns_5doina_Day:
	.byte $1B,$2E
LevelData_Palettes_0_Towns_6yomi_Day:
	.byte $1C,$2E
LevelData_Palettes_0_Towns_12_13_14_20_21_22_23_Day__12_13_14_20_21_22_Night:
	.byte $15,$2E,$15,$2E,$15,$2E
LevelData_Palettes_0_Towns_23yomiguy_Night:
	.byte $16,$2E
LevelData_Palettes_0_Towns_2aljiba_5doina_6yomi_Night:
	.byte $14,$37
LevelData_Stairs_0_Towns_0aldra:
	.byte $33,$8A,$A7,$96,$69,$0E,$F1,$16,$FF
LevelData_Stairs_0_Towns_2aljiba:
	.byte $65,$16,$F1,$22,$65,$22,$F5,$32,$FF
LevelData_Stairs_0_Towns_6yomi:
	.byte $33,$8A,$A7,$96,$69,$0E,$F1,$16,$FF
LevelData_Stairs_0_Towns_10_14:
	.byte $05,$22,$8D,$2A,$05,$2A,$8D,$32,$1B,$A2,$93,$AA,$FF
LevelData_Stairs_0_Towns_11:
	.byte $0D,$1A,$99,$26,$13,$A6,$87,$B2,$FF
LevelData_Screens_0_Towns_0aldra_A:
	.byte $04,$01
	.word (LevelData_Screen_Map0_0_and_0_1_and_0_2_and_0_6) ;8347 (8347) ([8:4][A:5])
	.word (LevelData_Screen_Map0_0_and_0_3_and_0_4_and_0_5_and_0_6) ;861F (861F) ([8:4][A:5])
	.word (LevelData_Screen_Map0_0_and_0_1_and_0_3_and_0_4) ;8577 (8577) ([8:4][A:5])
	.word (LevelData_Screen_Map0_0_and_0_1_and_0_6) ;837F (837F) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
LevelData_Screens_0_Towns_2aljiba_A:
	.byte $04,$02
	.word (LevelData_Screen_Map0_2_and_0_4_and_0_5) ;853F (853F) ([8:4][A:5])
	.word (LevelData_Screen_Map0_2_and_0_3_and_0_4_and_0_5_and_0_6) ;85AF (85AF) ([8:4][A:5])
	.word (LevelData_Screen_Map0_1_and_0_2_and_0_4_and_0_5) ;85E7 (85E7) ([8:4][A:5])
	.word (LevelData_Screen_Map0_2_and_0_3_and_0_4_and_0_5_two) ;8507 (8507) ([8:4][A:5])
	.word (LevelData_Screen_Map0_0_and_0_1_and_0_2_and_0_6) ;8347 (8347) ([8:4][A:5])
	.word (LevelData_Screen_Map0_2_and_0_5) ;830F (830F) ([8:4][A:5])
	.word (LevelData_Screen_Map0_2_and_0_3_and_0_4_and_0_5_and_0_6) ;85AF (85AF) ([8:4][A:5])
	.word (LevelData_Screen_Map0_2_and_0_3_and_0_4_and_0_5_one) ;845F (845F) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
LevelData_Screens_0_Towns_6yomi_A:
	.byte $04,$01
	.word (LevelData_Screen_Map0_0_and_0_1_and_0_2_and_0_6) ;8347 (8347) ([8:4][A:5])
	.word (LevelData_Screen_Map0_0_and_0_3_and_0_4_and_0_5_and_0_6) ;861F (861F) ([8:4][A:5])
	.word (LevelData_Screen_Map0_2_and_0_3_and_0_4_and_0_5_and_0_6) ;85AF (85AF) ([8:4][A:5])
	.word (LevelData_Screen_Map0_0_and_0_1_and_0_6) ;837F (837F) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
LevelData_Screens_0_Towns_10_A:
	.byte $01,$02
	.word (LevelData_Screen_Map0_10_and_0_13) ;8187 (8187) ([8:4][A:5])
	.word (LevelData_Screen_Map0_9_and_0_10_and_0_14) ;822F (822F) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
LevelData_Screens_0_Towns_11_A:
	.byte $01,$02
	.word (LevelData_Screen_Map0_9_and_0_11) ;81BF (81BF) ([8:4][A:5])
	.word (LevelData_Screen_Map0_11_and_0_13_and_0_15) ;8267 (8267) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word ($0201) ;201 (0) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Map0_7_and_0_12) ;8117 (8117) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
LevelData_Screens_0_Towns_14_A:
	.byte $01,$02
	.word (LevelData_Screen_Map0_14_and_0_15) ;81F7 (81F7) ([8:4][A:5])
	.word (LevelData_Screen_Map0_9_and_0_10_and_0_14) ;822F (822F) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
Sound_PCMsample5D_Config:
	.byte $0E,$7F,$F3
DataTableEntry_1FBC7:
	.byte $17
Sound_PCMsample5E_Config:
	.byte $0F,$00,$F0,$0B
Sound_PCMsample5F_Config_DamageOuchSoundMaybe:
	.byte $0F,$00,$F9,$0A,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF
Sound_PCMsample5E_Data:
                            ; Length: $0B0+1 bytes:
	.byte $AA,$AA,$AA,$AA,$AA,$AF,$F0,$9E,$9F,$F0,$06,$AE,$7C,$1B,$98,$F0
	.byte $00,$03,$00,$0C,$01,$CE,$01,$80,$00,$00,$00,$00,$00,$0F,$1F,$FF
	.byte $FB,$F3,$CF,$F3,$EF,$DE,$B8,$F9,$A6,$A2,$24,$39,$81,$43,$80,$86
	.byte $19,$02,$38,$51,$87,$86,$15,$39,$8C,$A6,$55,$4D,$16,$8C,$A3,$45
	.byte $45,$90,$CA,$56,$22,$52,$70,$D6,$53,$16,$D3,$54,$D7,$4B,$37,$4B
	.byte $5B,$6B,$56,$CE,$B5,$5B,$5D,$59,$B6,$D5,$AB,$D6,$B5,$D7,$6B,$6D
	.byte $AD,$AE,$B6,$D6,$B5,$B5,$AA,$D6,$AA,$AC,$AA,$A9,$54,$A9,$94,$A4
	.byte $A9,$4A,$4A,$8A,$92,$54,$A5,$49,$29,$4A,$54,$A5,$29,$52,$A5,$4A
	.byte $A5,$54,$A9,$54,$AA,$95,$2A,$AA,$94,$95,$2A,$AA,$55,$55,$2A,$56
	.byte $66,$AA,$9A,$AA,$B5,$5A,$AD,$AB,$5A,$B5,$6B,$6B,$6B,$5A,$B5,$AA
	.byte $B5,$56,$AA,$D5,$55,$56,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$95,$55,$55
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
Sound_PCMsample5D_Data:
                            ; Length: $170+1 bytes:
	.byte $FE,$FF,$DE,$FF,$E3,$EF,$8C,$44,$40,$31,$37,$09,$80,$18,$60,$00
	.byte $C0,$20,$2F,$3A,$A3,$57,$EF,$9F,$AF,$FF,$DE,$BF,$9E,$C9,$24,$41
	.byte $09,$00,$04,$00,$18,$74,$9B,$BF,$76,$EB,$CF,$7B,$DF,$F3,$81,$E2
	.byte $68,$31,$1C,$31,$88,$6A,$C0,$8F,$06,$D4,$C5,$C7,$2F,$1D,$63,$A7
	.byte $D0,$FC,$63,$CF,$B8,$DC,$76,$33,$EE,$30,$E2,$D0,$08,$38,$84,$01
	.byte $42,$1E,$7D,$9E,$7F,$E7,$EF,$3F,$7F,$3F,$87,$DC,$63,$18,$88,$53
	.byte $11,$06,$0D,$62,$03,$3C,$33,$24,$E7,$1F,$F8,$F0,$F3,$CF,$71,$AE
	.byte $1C,$8E,$CF,$08,$CE,$C2,$40,$E1,$8E,$18,$2C,$D1,$91,$ED,$9F,$0F
	.byte $CF,$C7,$CC,$F5,$38,$39,$B8,$19,$47,$88,$46,$D6,$04,$58,$63,$9C
	.byte $61,$79,$8C,$F3,$98,$F7,$78,$27,$C7,$0F,$8C,$F5,$86,$2F,$91,$8C
	.byte $71,$C7,$21,$E1,$C4,$07,$A6,$2E,$8A,$E7,$43,$CF,$9E,$1F,$9E,$71
	.byte $F3,$63,$C3,$18,$C3,$B0,$E0,$E3,$0F,$08,$E0,$71,$8C,$39,$39,$99
	.byte $F1,$BC,$74,$76,$E2,$F3,$C7,$97,$19,$C6,$37,$0F,$09,$C6,$71,$23
	.byte $88,$E0,$A9,$83,$8B,$8C,$EF,$0D,$DA,$F4,$73,$EE,$1C,$DB,$8E,$76
	.byte $1A,$2E,$31,$C3,$9C,$59,$07,$A1,$C0,$F1,$19,$9C,$58,$3C,$E3,$39
	.byte $E3,$8E,$B8,$E7,$1C,$E3,$A7,$0D,$8E,$C2,$39,$E6,$26,$36,$19,$8C
	.byte $74,$98,$CD,$47,$38,$B8,$F2,$6E,$AC,$B3,$B4,$E5,$71,$27,$8E,$8C
	.byte $8F,$8E,$1C,$6B,$29,$8E,$1C,$2C,$68,$D9,$31,$E3,$55,$97,$38,$D3
	.byte $B1,$CE,$38,$F1,$D4,$B3,$4E,$A9,$62,$C9,$A8,$AC,$A9,$18,$E6,$51
	.byte $9A,$73,$29,$9E,$39,$D3,$65,$9D,$58,$BA,$61,$DA,$46,$AA,$3C,$52
	.byte $B1,$31,$E0,$E5,$95,$2A,$CC,$B2,$9C,$AC,$AB,$39,$66,$6A,$CC,$AB
	.byte $8B,$55,$A6,$A6,$AA,$3C,$5A,$39,$38,$B9,$54,$AA,$95,$AA,$65,$5A
	.byte $9C,$C7,$59,$B2,$AE,$D4,$B1,$D4,$63,$C5,$34,$6A,$65,$69,$65,$4C
	.byte $E3,$54,$D6,$33,$4D,$71,$92,$EA,$9A,$AB,$56,$55,$5A,$FF,$FF,$FF
Sound_PCMsample5F_Data:
                            ; Length: $0A0+1 bytes:
	.byte $55,$AB,$D5,$AA,$5A,$4B,$95,$4A,$55,$A9,$54,$D5,$D6,$AA,$A4,$35
	.byte $4B,$89,$52,$55,$D9,$5B,$5F,$57,$75,$2A,$49,$42,$92,$22,$4D,$D5
	.byte $76,$DB,$D7,$2A,$A5,$24,$92,$28,$52,$A9,$7F,$DF,$DB,$6D,$4F,$89
	.byte $20,$24,$82,$88,$D2,$7B,$77,$AD,$AA,$54,$8A,$41,$48,$FF,$7F,$57
	.byte $7B,$5F,$12,$02,$92,$22,$02,$6A,$7B,$57,$AA,$6A,$A5,$48,$10,$FF
	.byte $FF,$77,$73,$7F,$45,$20,$40,$89,$08,$2A,$B5,$53,$95,$AA,$AA,$24
	.byte $6A,$FF,$FF,$BF,$D6,$57,$82,$00,$28,$49,$88,$A8,$D6,$AC,$A4,$D2
	.byte $8C,$DA,$FF,$FF,$BF,$D6,$B5,$08,$08,$20,$29,$82,$90,$D6,$56,$25
	.byte $A9,$A6,$DD,$FF,$FF,$AF,$DA,$35,$22,$80,$A0,$A2,$80,$A0,$5A,$A7
	.byte $94,$4A,$5B,$FD,$FF,$FF,$CD,$7A,$8B,$02,$01,$8A,$04,$22,$88,$76
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
DataTableEntry_1FF00:
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
_Reset:
	cld
	sei
	inc _data_1FFFF
	jmp Main_ProgramBegin

	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$43,$41,$53,$54,$4C,$45,$32,$00,$00,$00,$00,$38,$02,$01,$06
_data_1FFF8:
	.byte $A4,$1B
SystemVectorTable:
	.word (_NMI) ;C046 (1C046) ()
	.word (_Reset) ;FFD0 (1FFD0) ()
	.word @C096
