.segment "BANK_00"

; Offset in ROM: $00000
.setcpu "6502X"
.feature org_per_seg
.feature pc_assignment

.include "globals.inc"


SoundData4D_DraculaSong_ch1:
	.byte $E9,$31,$D8,$70,$1D,$00,$E4,$45,$B0,$E3,$40,$37,$E4,$75,$E3,$20
	.byte $70,$87,$E4,$92,$E3,$42,$91,$E4,$A2,$E3,$62,$A1,$D8,$7B,$83,$15
	.byte $F0,$E5,$B0,$B0,$F1,$E7,$1C,$E4,$B0,$E3,$60,$B0,$E2,$30,$60,$B0
	.byte $E7,$1E,$F0,$E4,$B0,$90,$70,$60,$40,$30,$40,$60,$FE,$FF,$00,$80
SoundData4E_DraculaSong_ch0:
	.byte $EB,$22,$0A,$E9,$B1,$D8,$70,$1C,$15,$F5,$E2,$70,$F4,$40,$F3,$E3
	.byte $B0,$E2,$70,$F2,$40,$E3,$B0,$F1,$E2,$70,$40,$F5,$60,$F4,$30,$F3
	.byte $E3,$90,$E2,$60,$F2,$30,$E3,$90,$F1,$E2,$60,$30,$F5,$70,$F4,$20
	.byte $F3,$E3,$B0,$E2,$70,$F2,$20,$E3,$B0,$F1,$E2,$70,$20,$F5,$80,$F4
	.byte $20,$F3,$E3,$80,$E2,$80,$F2,$20,$E3,$80,$F1,$E2,$80,$20,$F5,$90
	.byte $F4,$40,$F3,$00,$90,$F2,$40,$00,$F1,$90,$40,$F5,$A0,$F4,$60,$F3
	.byte $10,$A0,$F2,$60,$10,$F1,$A0,$60,$E9,$32,$EB,$01,$00,$E4,$60,$60
	.byte $F1,$E4,$B0,$E3,$60,$B0,$E2,$30,$60,$B0,$E7,$1E,$F0,$E3,$B0,$90
	.byte $70,$60,$40,$30,$40,$60,$FE,$FF,$40,$80
SoundData4F_DraculaSong_ch2:
	.byte $FB,$D8,$20,$E4,$45,$B0,$E3,$40,$37,$E4,$75,$E3,$20,$70,$87,$E4
	.byte $92,$E3,$42,$91,$E4,$A2,$E3,$62,$A1,$E4,$B0,$B0,$C3,$D1,$90,$E4
	.byte $40,$70,$90,$E3,$B1,$90,$70,$40,$21,$12,$02,$D8,$20,$E4,$B0,$90
	.byte $70,$60,$40,$30,$40,$60,$FE,$FF,$CA,$80
SoundData50_DraculaSong_ch5:
	.byte $FB,$D8,$B1,$A1,$B0,$B0,$A0,$B1,$B0,$A1,$B0,$B0,$A0,$B0,$B1,$A1
	.byte $B0,$B0,$A0,$B1,$B0,$A1,$B0,$B0,$A0,$A0,$B1,$A0,$B0,$B0,$B0,$A0
	.byte $B0,$B1,$A0,$B0,$B0,$B0,$A0,$B0,$A0,$A3,$B0,$A1,$B1,$A1,$B0,$A0
	.byte $A0,$A0,$FE,$FF,$04,$81
Sound_Records:
	.byte $04
Sound_Ptrs:
	.word (SoundData01_SFX_ch4) ;8278 (278) ()
	.byte $04
	.word (SoundData02_SFX_ch4) ;828A (28A) ()
	.byte $04
	.word (SoundData03_SFX_Snare_ch4) ;8297 (297) ()
	.byte $04
	.word (SoundData04_SFX_ch4) ;8290 (290) ()
	.byte $03
	.word (SoundData05_SFX_DialogCharacter_ch3) ;8486 (486) ()
	.byte $04
	.word (SoundData06_SFX_ch4) ;82A1 (2A1) ()
	.byte $04
	.word (SoundData07_SFX_SimonLands_ch4) ;82BC (2BC) ()
	.byte $04
	.word (SoundData08_SFX_ch4) ;82C2 (2C2) ()
	.byte $04
	.word (SoundData09_SFX_ch4) ;82CC (2CC) ()
	.byte $04
	.word (SoundData0A_SFX_LeatherWhip_ch4) ;82D6 (2D6) ()
	.byte $03
	.word (SoundData0B_SFX_Frog_ch3) ;82E2 (2E2) ()
	.byte $03
	.word (SoundData0C_SFX_ch3) ;82F0 (2F0) ()
	.byte $03
	.word (SoundData0D_SFX_Swamp_ch3) ;8301 (301) ()
	.byte $04
	.word (SoundData0E_SFX_ChainWhip_ch4) ;831B (31B) ()
	.byte $43
	.word (SoundData0F_SFX_FireWhip_ch3) ;832E (32E) ()
	.byte $04
	.word (SoundData10_SFX_ch4) ;8342 (342) ()
	.byte $04
	.word (SoundData11_SFX_ch4) ;834B (34B) ()
	.byte $03
	.word (SoundData12_SFX_DiamondBoundingEffect_ch3) ;8350 (350) ()
	.byte $03
	.word (SoundData13_SFX_KnifeEffect_ch3) ;8363 (363) ()
	.byte $03
	.word (SoundData14_SFX_ShieldEffect_ch3) ;837F (37F) ()
	.byte $04
	.word (SoundData15_SFX_FireEffect_ch4) ;839D (39D) ()
	.byte $43
	.word (SoundData16_SFX_WaterBottleBreaks_ch3) ;8703 (703) ()
	.byte $04
	.word (SoundData17_SFX_ch4) ;8725 (725) ()
	.byte $43
	.word (SoundData18_SFX_EnemySuffers_ch3) ;83AF (3AF) ()
	.byte $04
	.word (SoundData19_SFX_ch4) ;83CD (3CD) ()
	.byte $43
	.word (SoundData1A_SFX_ch3) ;83D3 (3D3) ()
	.byte $04
	.word (SoundData1B_SFX_ch4) ;83E5 (3E5) ()
	.byte $04
	.word (SoundData1C_SFX_ch4) ;83F4 (3F4) ()
	.byte $04
	.word (SoundData1D_SFX_WaterSplash_ch4) ;8400 (400) ()
	.byte $03
	.word (SoundData1E_SFX_WallDestroyedWithWater_ch3) ;8410 (410) ()
	.byte $03
	.word (SoundData1F_SFX_HeartAcquisition_ch3) ;8420 (420) ()
	.byte $03
	.word (SoundData20_SFX_ConsumeLaurel_ch3) ;842F (42F) ()
	.byte $03
	.word (SoundData21_SFX_EnemyDestroyed_ch3) ;8442 (442) ()
	.byte $03
	.word (SoundData22_SFX_NPCgaveSomething_ch3) ;846B (46B) ()
	.byte $03
	.word (SoundData23_SFX_ch3) ;8494 (494) ()
	.byte $03
	.word (SoundData24_SFX_PasswordError_ch3) ;84A4 (4A4) ()
	.byte $03
	.word (SoundData25_SFX_TransactionConfirm_ch3) ;84AF (4AF) ()
	.byte $03
	.word (SoundData26_SFX_ch3) ;84DF (4DF) ()
	.byte $03
	.word (SoundData27_SFX_ch3) ;84C7 (4C7) ()
	.byte $04
	.word (SoundData28_SFX_Tornado_ch4) ;84F0 (4F0) ()
	.byte $43
	.word (SoundData29_SFX_ch3) ;8539 (539) ()
	.byte $04
	.word (SoundData2A_SFX_ch4) ;8551 (551) ()
	.byte $43
	.word (SoundData2B_SFX_ch3) ;856F (56F) ()
	.byte $04
	.word (SoundData2C_SFX_ch4) ;8587 (587) ()
	.byte $43
	.word (SoundData2D_SFX_ch3) ;85A5 (5A5) ()
	.byte $01
	.word (SoundData2E_SFX_ch1) ;85C3 (5C3) ()
	.byte $43
	.word (SoundData2F_SFX_ch3) ;85CC (5CC) ()
	.byte $01
	.word (SoundData30_SFX_ch1) ;8604 (604) ()
	.byte $03
	.word (SoundData31_SFX_ch3) ;860D (60D) ()
	.byte $43
	.word (SoundData32_SFX_ch3) ;8617 (617) ()
	.byte $04
	.word (SoundData33_SFX_ch4) ;863B (63B) ()
	.byte $43
	.word (SoundData34_SFX_Death_ch3) ;865B (65B) ()
	.byte $01
	.word (SoundData35_SFX_Death_ch1) ;86CD (6CD) ()
	.byte $43
	.word (SoundData36_SFX_ch3) ;86E2 (6E2) ()
	.byte $01
	.word (SoundData37_SFX_ch1) ;86F0 (6F0) ()
	.byte $03
	.word (SoundData38_SFX_ch3) ;86D6 (6D6) ()
	.byte $C1
	.word (SoundData39_TownSong_ch1) ;8E16 (E16) ()
	.byte $00
	.word (SoundData3A_TownSong_ch0) ;8F10 (F10) ()
	.byte $02
	.word (SoundData3B_TownSong_ch2) ;9077 (1077) ()
	.byte $05
	.word (SoundData3C_TownSong_ch5) ;916B (116B) ()
	.byte $C1
	.word (SoundData3D_WildernessSong_ch1) ;920A (120A) ()
	.byte $00
	.word (SoundData3E_WildernessSong_ch0) ;9308 (1308) ()
	.byte $02
	.word (SoundData3F_WildernessSong_ch2) ;94E0 (14E0) ()
	.byte $05
	.word (SoundData40_WildernessSong_ch5) ;95E0 (15E0) ()
	.byte $C1
	.word (SoundData41_NightSong_ch1) ;A7D2 (27D2) ()
	.byte $00
	.word (SoundData42_NightSong_ch0) ;A8B9 (28B9) ()
	.byte $02
	.word (SoundData43_NightSong_ch2) ;A9CC (29CC) ()
	.byte $05
	.word (SoundData44_NightSong_ch5) ;AA7B (2A7B) ()
	.byte $C1
	.word (SoundData45_MansionSong_ch1) ;A3EC (23EC) ()
	.byte $00
	.word (SoundData46_MansionSong_ch0) ;A51D (251D) ()
	.byte $02
	.word (SoundData47_MansionSong_ch2) ;A68D (268D) ()
	.byte $05
	.word (SoundData48_MansionSong_ch5) ;A750 (2750) ()
	.byte $C1
	.word (SoundData49_RuinsSong_ch1) ;A081 (2081) ()
	.byte $00
	.word (SoundData4A_RuinsSong_ch0) ;A15D (215D) ()
	.byte $02
	.word (SoundData4B_RuinsSong_ch2) ;A22D (222D) ()
	.byte $05
	.word (SoundData4C_RuinsSong_ch5) ;A26D (226D) ()
	.byte $C1
	.word (SoundData4D_DraculaSong_ch1) ;8000 (0) ()
	.byte $00
	.word (SoundData4E_DraculaSong_ch0) ;8040 (40) ()
	.byte $02
	.word (SoundData4F_DraculaSong_ch2) ;80CA (CA) ()
	.byte $05
	.word (SoundData50_DraculaSong_ch5) ;8104 (104) ()
	.byte $C1
	.word (SoundData51_GameOverSong_ch1) ;9F9F (1F9F) ()
	.byte $00
	.word (SoundData52_GameOverSong_ch0) ;9FFC (1FFC) ()
	.byte $02
	.word (SoundData53_GameOverSong_ch2) ;A063 (2063) ()
	.byte $05
	.word (SoundData54_GameOverSong_ch5) ;A07E (207E) ()
	.byte $C1
	.word (SoundData55_PasswordSong_ch1) ;9EA1 (1EA1) ()
	.byte $00
	.word (SoundData56_PasswordSong_ch0) ;9F03 (1F03) ()
	.byte $02
	.word (SoundData57_PasswordSong_ch2) ;9F4A (1F4A) ()
	.byte $05
	.word (SoundData58_PasswordSong_ch5) ;9F7F (1F7F) ()
	.byte $C1
	.word (SoundData59_EndingSong_ch1) ;8733 (733) ()
	.byte $00
	.word (SoundData5A_EndingSong_ch0) ;8819 (819) ()
	.byte $02
	.word (SoundData5B_EndingSong_ch2) ;8974 (974) ()
	.byte $05
	.word (SoundData5C_EndingSong_ch5) ;8AFB (AFB) ()
	.byte $06
	.word (Sound_PCMsample5D_Config) ;FBC4 (1FBC4) ()
	.byte $06
	.word (Sound_PCMsample5E_Config) ;FBC8 (1FBC8) ()
	.byte $06
	.word (Sound_PCMsample5F_Config_DamageOuchSoundMaybe) ;FBCC (1FBCC) ()
	.byte $03
	.word (SoundData60_SFX_Pause_ch3) ;825A (25A) ()
SoundData60_SFX_Pause_ch3:
	.byte $05,$82,$88,$10,$D5,$10,$8E,$10,$A9,$02,$B0,$88,$E0,$6A,$D0,$6A
	.byte $B0,$6A,$A0,$6A,$90,$6A,$70,$6A,$50,$6A,$40,$6A,$FF,$00
SoundData01_SFX_ch4:
	.byte $01,$A2,$A1,$71,$61,$61,$50,$51,$50,$51,$50,$41,$30,$20,$20,$06
	.byte $10,$FF
SoundData02_SFX_ch4:
	.byte $01,$65,$24,$31,$11,$FF
SoundData04_SFX_ch4:
	.byte $01,$77,$56,$35,$24,$14,$FF
SoundData03_SFX_Snare_ch4:
	.byte $01,$EE,$86,$34,$43,$34,$13,$12,$10,$FF
SoundData06_SFX_ch4:
	.byte $02,$FB,$00,$FE,$AD,$CF,$FE,$08,$EE,$9D,$BF,$DE,$8D,$AF,$CE,$7D
	.byte $9F,$BE,$6D,$8F,$AE,$5D,$7F,$9E,$4D,$6F,$FF
SoundData07_SFX_SimonLands_ch4:
	.byte $01,$DB,$02,$10,$84,$FF
SoundData08_SFX_ch4:
	.byte $01,$6A,$AB,$6C,$BD,$AB,$8A,$69,$49,$FF
SoundData09_SFX_ch4:
	.byte $02,$56,$8A,$8D,$00,$EC,$BD,$8C,$5D,$FF
SoundData0A_SFX_LeatherWhip_ch4:
	.byte $01,$31,$58,$71,$98,$11,$D6,$C3,$A6,$83,$66,$FF
SoundData0B_SFX_Frog_ch3:
	.byte $05,$70,$82,$40,$60,$02,$70,$82,$03,$B0,$8A,$81,$40,$FF
SoundData0C_SFX_ch3:
	.byte $04,$F0,$82,$C2,$80,$A1,$A0,$04,$70,$82,$82,$80,$62,$C0,$43,$00
	.byte $FF
SoundData0D_SFX_Swamp_ch3:
	.byte $04,$B0,$8B,$47,$00,$63,$00,$83,$00,$A3,$00,$66,$C0,$82,$C0,$A2
	.byte $C0,$C2,$C0,$92,$80,$62,$80,$32,$80,$FF
SoundData0E_SFX_ChainWhip_ch4:
	.byte $02,$30,$5D,$7C,$9B,$01,$30,$BA,$00,$D9,$00,$BA,$00,$9B,$00,$7C
	.byte $00,$5D,$FF
SoundData0F_SFX_FireWhip_ch3:
	.byte $03,$70,$8B,$43,$80,$73,$60,$A3,$40,$C3,$20,$93,$00,$72,$E0,$62
	.byte $C0,$42,$C0,$FF
SoundData10_SFX_ch4:
	.byte $03,$4F,$6E,$8D,$AD,$8D,$6D,$4D,$FF
SoundData11_SFX_ch4:
	.byte $01,$58,$88,$A8,$FF
SoundData12_SFX_DiamondBoundingEffect_ch3:
	.byte $04,$70,$89,$10,$50,$02
SpriteConstructionData_0356:
	.byte $70,$89,$C0,$A0,$A0,$50,$80,$A0,$60,$50,$40,$A0,$FF
SoundData13_SFX_KnifeEffect_ch3:
	.byte $02,$F0,$88,$C0,$40,$C0,$30,$C0,$40,$C0,$28,$A0,$40,$A0,$28,$80
	.byte $40,$80,$28,$60,$40,$60,$28,$40,$40,$40,$28,$FF
SoundData14_SFX_ShieldEffect_ch3:
	.byte $01,$B0,$88,$FB,$C0,$40,$50,$80,$FE,$02,$01,$F0,$88,$C0,$80,$80
	.byte $30,$80,$80,$70,$30,$A0,$80,$60,$30,$40,$80,$30,$30,$FF
SoundData15_SFX_FireEffect_ch4:
	.byte $02,$AD,$8E,$10,$10,$0A,$CD,$CD,$CD,$CD,$04,$8F,$6E,$4E,$3E,$2E
	.byte $1E,$FF
SoundData18_SFX_EnemySuffers_ch3:
	.byte $01,$F0,$91,$FB,$B0,$40,$B0,$60,$FE,$02,$03,$B0,$91,$B0,$30,$B0
	.byte $60,$70,$32,$70,$62,$30,$34,$30,$64,$20,$36,$20,$66,$FF
SoundData19_SFX_ch4:
	.byte $01,$CC,$BA,$A8,$96,$FF
SoundData1A_SFX_ch3:
	.byte $04,$B0,$82,$E1,$C0,$E1,$80,$E1,$40,$C1,$00,$A0,$C0,$80,$C0,$60
	.byte $C0,$FF
SoundData1B_SFX_ch4:
	.byte $02,$6E,$5C,$4A,$38,$36,$4C,$4A,$38,$36,$2C,$2A,$28,$26,$FF
SoundData1C_SFX_ch4:
	.byte $01,$FB,$56,$A7,$35,$86,$32,$64,$FE,$02,$53,$FF
SoundData1D_SFX_WaterSplash_ch4:
	.byte $03,$FA,$8B,$10,$82,$F8,$D5,$94,$85,$74,$A2,$82,$72,$52,$31,$FF
SoundData1E_SFX_WallDestroyedWithWater_ch3:
	.byte $04,$F0,$81,$F1,$00,$E0,$80,$C0,$A0,$A0,$B0,$80,$C0,$60,$D0,$FF
SoundData1F_SFX_HeartAcquisition_ch3:
	.byte $0A,$B0,$A2,$A0,$56,$05,$B0,$8B,$A0,$80,$60,$80,$30,$80,$FF
SoundData20_SFX_ConsumeLaurel_ch3:
	.byte $0B,$B0,$AB,$A1,$40,$A1,$00,$08,$70,$AB,$A0,$C0,$80,$C0,$60,$C0
	.byte $40,$C0,$FF
SoundData21_SFX_EnemyDestroyed_ch3:
	.byte $02,$F0,$88,$10,$00,$06,$F0,$82,$F0,$80,$F1,$00,$E0,$80,$E1,$00
	.byte $D0,$80,$D1,$00,$C0,$80,$C1,$00,$A0,$80,$A1,$00,$80,$80,$81,$00
	.byte $60,$80,$61,$00,$40,$80,$41,$00,$FF
SoundData22_SFX_NPCgaveSomething_ch3:
	.byte $07,$B0,$8B,$31,$C0,$51,$80,$71,$40,$91,$00,$07,$B0,$9A,$C0,$E0
	.byte $A0,$E0,$80,$E0,$60,$E0,$40,$E0,$20,$E0,$FF
SoundData05_SFX_DialogCharacter_ch3:
	.byte $02,$B0,$88,$FB,$80,$C0,$02,$30,$88,$70,$60,$FE,$02,$FF
SoundData23_SFX_ch3:
	.byte $03,$B0,$8B,$50,$58,$80,$48,$B0,$3C,$80,$28,$50,$28,$30,$28,$FF
SoundData24_SFX_PasswordError_ch3:
	.byte $01,$30,$88,$FB,$A2,$00,$E2,$40,$FE,$08,$FF
SoundData25_SFX_TransactionConfirm_ch3:
	.byte $04,$70,$8C,$C0,$24,$C0,$40,$A0,$24,$A0,$40,$80,$24,$80,$40,$60
	.byte $24,$60,$40,$40,$24,$20,$40,$FF
SoundData27_SFX_ch3:
	.byte $0F,$B0,$B2,$40,$60,$60,$60,$80,$60,$A0,$60,$C0,$60,$A0,$60,$80
	.byte $60,$60,$60,$40,$60,$20,$60,$FF
SoundData26_SFX_ch3:
	.byte $08,$B0,$AA,$A0,$70,$06,$70,$AA,$80,$70,$60,$70,$40,$70,$20,$70
	.byte $FF
SoundData28_SFX_Tornado_ch4:
	.byte $02,$FB,$DD,$DD,$DC,$D8,$FE,$07,$FB,$EC,$EC,$EB,$EA,$FE,$05,$FB
	.byte $00,$FB,$00,$FB,$FA,$F9,$FE,$06,$FB,$FA,$FA,$F9,$F8,$FE,$07,$FB
	.byte $DA,$DA,$D9,$D8,$FE,$09,$FB,$BA,$BA,$B9,$B8,$FE,$09,$FB,$9A,$9A
	.byte $99,$98,$FE,$09,$FB,$7A,$7A,$79,$78,$FE,$09,$FB,$5A,$5A,$59,$58
	.byte $FE,$09,$FB,$3A,$3A,$39,$39,$FE,$FF
SoundData29_SFX_ch3:
	.byte $0F,$B0,$AB,$34,$00,$54,$00,$74,$00,$94,$00,$B4,$00,$93,$E0,$73
	.byte $C0,$53,$A0,$33,$80,$13,$60,$FF
SoundData2A_SFX_ch4:
	.byte $05,$29,$38,$49,$58,$69,$78,$89,$98,$A9,$B8,$C9,$D8,$E9,$D8,$C9
	.byte $B8,$A9,$98,$89,$78,$69,$58,$49,$38,$29,$28,$19,$18,$FF
SoundData2B_SFX_ch3:
	.byte $0F,$B0,$AB,$34,$00,$54,$00,$74,$00,$94,$00,$B4,$00,$93,$E0,$73
	.byte $C0,$53,$A0,$33,$80,$13,$60,$FF
SoundData2C_SFX_ch4:
	.byte $05,$29,$38,$49,$58,$69,$78,$89,$98,$A9,$B8,$C9,$D8,$E9,$D8,$C9
	.byte $B8,$A9,$98,$89,$78,$69,$58,$49,$38,$29,$28,$19,$18,$FF
SoundData2D_SFX_ch3:
	.byte $0F,$B0,$BC,$51,$E0,$71,$C0,$91,$A0,$B1,$80,$A1,$60,$81,$40,$71
	.byte $20,$61,$00,$51,$00,$41,$00,$31,$00,$21,$00,$11,$00,$FF
SoundData2E_SFX_ch1:
	.byte $02,$30,$88,$10,$00,$FE,$FF,$A5,$85
SoundData2F_SFX_ch3:
	.byte $04,$F0,$81,$F0,$C0,$F0,$20,$E0,$80,$E0,$20,$D0,$80,$D0,$20,$C0
	.byte $80,$C0,$20,$B0,$80,$B0,$20,$A0,$80,$A0,$20,$90,$80,$90,$20,$80
	.byte $80,$80,$20,$70,$80,$70,$20,$60,$80,$60,$20,$50,$80,$50,$20,$40
	.byte $80,$40,$20,$30,$80,$30,$20,$FF
SoundData30_SFX_ch1:
	.byte $01,$F0,$88,$10,$00,$FE,$FF,$CC,$85
SoundData31_SFX_ch3:
	.byte $07,$B0,$C9,$90,$C0,$60,$C0,$30,$C0,$FF
SoundData32_SFX_ch3:
	.byte $04,$F0,$82,$63,$00,$83,$00,$03,$F0,$83,$A4,$00,$FB,$C4,$00,$B4
	.byte $00,$FE,$10,$A4,$00,$94,$00,$84,$00,$74,$00,$64,$00,$54,$00,$44
	.byte $00,$34,$00,$FF
SoundData33_SFX_ch4:
	.byte $01,$69,$8A,$AB,$CD,$10,$04,$00,$EE,$00,$ED,$EE,$DF,$CE,$CF,$BE
	.byte $AF,$BF,$AE,$9F,$BE,$AF,$9F,$8E,$7F,$6E,$5F,$4E,$3F,$2E,$1F,$FF
SoundData34_SFX_Death_ch3:
	.byte $02,$B0,$82,$B0,$40,$B0,$4C,$B0,$5A,$B0,$6B,$B0,$7F,$B0,$97,$F0
	.byte $00,$90,$40,$90,$4C,$90,$5A,$90,$6B,$90,$7F,$90,$97,$F0,$00,$70
	.byte $40,$70,$4C,$70,$5A,$70,$6B,$70,$7F,$70,$97,$F0,$00,$60,$40,$60
	.byte $4C,$60,$5A,$60,$6B,$60,$7F,$60,$97,$F0,$00,$50,$40,$50,$4C,$50
	.byte $5A,$50,$6B,$50,$7F,$50,$97,$F0,$00,$40,$40,$40,$4C,$40,$5A,$40
	.byte $6B,$40,$7F,$40,$97,$F0,$00,$20,$40,$20,$4C,$20,$5A,$20,$6B,$20
	.byte $7F,$20,$97,$F0,$00,$10,$40,$10,$4C,$10,$5A,$10,$6B,$10,$7F,$10
	.byte $97,$FF
SoundData35_SFX_Death_ch1:
	.byte $01,$70,$86,$10,$00,$FE,$FF,$5B,$86
SoundData38_SFX_ch3:
	.byte $02,$30,$8A,$A0,$40,$90,$48,$80,$50,$70,$58,$FF
SoundData36_SFX_ch3:
	.byte $06,$F0,$82,$F2,$80,$E0,$E0,$80,$E0,$80,$E0,$50,$E0,$FF
SoundData37_SFX_ch1:
	.byte $02,$F0,$88,$10,$00,$06,$F0,$82,$F2,$80,$E0,$E0,$80,$E0,$80,$E0
	.byte $50,$E0,$FF
SoundData16_SFX_WaterBottleBreaks_ch3:
	.byte $03,$B0,$88,$E0,$15,$E0,$10,$E0,$2A,$E0,$20,$03,$B0,$88,$10,$00
	.byte $03,$B0,$88,$D0,$10,$D0,$0A,$D0,$25,$D0,$1A,$10,$00,$A0,$15,$A0
	.byte $10,$FF
SoundData17_SFX_ch4:
	.byte $03,$F4,$F4,$F4,$10,$F4,$E7,$E3,$E1,$E2,$E5,$B2,$FF,$FF
SoundData59_EndingSong_ch1:
	.byte $EB,$01,$10,$D8,$70,$24,$16,$E9,$B5,$E3,$07,$73,$03,$05,$E4,$B0
	.byte $90,$B7,$E3,$27,$85,$21,$55,$40,$20,$47,$77,$E2,$07,$E3,$A3,$8B
	.byte $57,$A5,$51,$83,$7B,$37,$83,$33,$75,$50,$40,$57,$E7,$28,$E2,$0D
	.byte $E7,$24,$20,$00,$E3,$B9,$EA,$89,$E3,$B1,$E2,$01,$21,$EA,$03,$E3
	.byte $07,$73,$03,$05,$E4,$B0,$90,$B7,$E3,$27,$85,$21,$55,$40,$20,$47
	.byte $77,$E2,$07,$E3,$A3,$8B,$57,$A5,$51,$83,$7B,$37,$83,$33,$75,$50
	.byte $40,$57,$E7,$28,$E2,$0D,$E7,$24,$20,$00,$E3,$B9,$EA,$00,$E4,$B1
	.byte $E3,$01,$21,$E9,$B1,$E3,$07,$73,$03,$05,$E4,$B0,$90,$B7,$E3,$27
	.byte $85,$21,$55,$40,$20,$47,$77,$E2,$07,$E3,$A3,$8B,$57,$A5,$51,$83
	.byte $7B,$37,$83,$33,$75,$50,$40,$57,$E7,$28,$E2,$0D,$E7,$24,$20,$00
	.byte $E3,$B9,$E4,$B1,$E3,$01,$21,$E9,$35,$D8,$70,$25,$00,$EB,$01,$10
	.byte $E2,$0F,$E7,$27,$E8,$16,$E3,$33,$E2,$21,$31,$51,$21,$01,$E3,$A1
	.byte $E8,$00,$E7,$25,$E2,$0F,$E8,$16,$E7,$27,$E3,$33,$E2,$71,$51,$31
	.byte $51,$21,$31,$E9,$31,$E7,$25,$E8,$00,$E6,$09,$07,$E6,$0A,$07,$F1
	.byte $E7,$27,$E6,$0C,$0F,$FF
SoundData5A_EndingSong_ch0:
	.byte $EB,$01,$0F,$E9,$35,$D8,$70,$26,$17,$F2,$E2,$0B,$73,$25,$E7,$23
	.byte $E3,$70,$50,$77,$E7,$26,$B7,$E2,$23,$83,$75,$E7,$23,$00,$E3,$B0
	.byte $E2,$07,$E7,$26,$47,$77,$73,$85,$E7,$23,$E3,$A1,$E2,$01,$E3,$81
	.byte $E7,$26,$E2,$27,$57,$53,$75,$E7,$23,$E3,$81,$A1,$71,$E7,$26,$E2
	.byte $89,$E7,$23,$71,$51,$31,$E7,$26,$79,$E7,$23,$51,$41,$51,$E3,$77
	.byte $57,$E2,$51,$F2,$20,$00,$E3,$B1,$F4,$E2,$20,$00,$E3,$B1,$F0,$EA
	.byte $89,$E3,$71,$91,$B1,$EA,$89,$F2,$E2,$0B,$73,$25,$E7,$23,$E2,$70
	.byte $50,$77,$E7,$26,$E3,$B7,$E2,$23,$83,$75,$E7,$23,$F2,$E1,$00,$E2
	.byte $B0,$E1,$07,$E7,$26,$E2,$47,$77,$73
_func_08A2:
	sta Sound_LoopBeginPointerHi_Channel0_square0
	.byte MainMenuOptionIndex

	.byte $E2,$A1,$E1,$01,$E2,$81,$E7,$26,$E2,$27,$57,$53,$75,$E7,$23,$E2
	.byte $81,$A1,$71,$E7,$26,$E2,$89,$E7,$23,$E1,$71,$51,$31,$E7,$26,$E2
	.byte $79,$E7,$23,$E1,$51,$41,$51,$E2,$77,$57,$E1,$51,$F2,$20,$00,$E2
	.byte $B1,$F4,$E1,$20,$00,$E2,$B1,$F0,$EA,$00,$E4,$71,$91,$B1,$F2,$E2
	.byte $0B,$73,$25,$E7,$23,$E3,$70,$50,$77,$E7,$26,$B7,$E2,$23,$83,$75
	.byte $E7,$23,$00,$E3,$B0,$E2,$07,$E7,$26,$47,$77,$73,$85,$E7,$23,$E3
	.byte $A1,$E2,$01,$E3,$81,$E7,$26,$E2,$27,$57,$53,$75,$E7,$23,$E3,$81
	.byte $A1,$71,$E7,$26,$E2,$89,$E7,$23,$71,$51,$31,$E7,$26,$79,$E7,$23
	.byte $51,$41,$51,$E3,$77,$57,$E2,$51,$F2,$20,$00,$E3,$B1,$F4,$E2,$20
	.byte $00,$E3,$B1,$F0,$E4,$71,$91,$B1,$EB,$01,$0F,$D8,$70,$27,$17,$E9
	.byte $35,$E3,$33,$F1,$33,$F0,$23,$F1,$23,$F0,$03,$51,$71,$81,$51,$31
	.byte $21,$33,$F1,$33,$F0,$23,$F1,$23,$F0,$03,$A1,$81,$71,$81,$51,$71
	.byte $F1,$E9,$31,$E8,$00,$E6,$09,$57,$E6,$0A,$27,$E6,$0C,$4F,$FF
SoundData5B_EndingSong_ch2:
	.byte $D8,$15,$E3,$05,$05,$D8,$1F,$03,$D8,$15,$E4,$75,$75,$D8,$1D,$73
	.byte $D8,$15,$75,$75,$D8,$1F,$B3,$D8,$10,$E3,$07,$D8,$1F,$43,$73,$41
	.byte $71,$D8,$12,$43,$D8,$1F,$41,$01,$21,$41,$51,$81,$D8,$12,$53,$D8
	.byte $1F,$51,$71,$81,$51,$21,$A1,$D8,$12,$23,$D8,$1F,$21,$31,$51,$21
	.byte $31,$A1,$D8,$12,$33,$D8,$1F,$31,$51,$71,$31,$E4,$81,$E3,$01,$31
	.byte $81,$E4,$81,$E3,$01,$31,$81,$E4,$51,$81,$E3,$11,$51,$E4,$51,$81
	.byte $E3,$11,$51,$E4,$71,$E3,$01,$21,$51,$71,$E2,$01,$21,$51,$E3,$77
	.byte $C7,$EA,$03,$D8,$15,$E3,$05,$D8,$14,$05,$D8,$1F,$03,$D8,$15,$E4
	.byte $75,$D8,$14,$75,$D8,$1D,$73,$D8,$15,$75,$D8,$14,$75,$D8,$1F,$B3
	.byte $D8,$10,$E3,$07,$D8,$1F,$43,$73,$41,$71,$D8,$12,$43,$D8,$1F,$41
	.byte $01,$21,$41,$51,$81,$D8,$12,$53,$D8,$1F,$51,$71,$81,$51,$21,$A1
	.byte $D8,$12,$23,$D8,$1F,$21,$31,$51,$21,$31,$A1,$D8,$12,$33,$D8,$1F
	.byte $31,$51,$71,$31,$E4,$81,$E3,$01,$31,$81,$E4,$81,$E3,$01,$31,$81
	.byte $E4,$51,$81,$E3,$11,$51,$E4,$51,$81,$E3,$11,$51,$E4,$71,$E3,$01
	.byte $21,$51,$71,$E2,$01,$21,$51,$E3,$77,$C7,$EA,$00,$D8,$15,$E3,$05
	.byte $D8,$14,$05,$D8,$1F,$03,$D8,$15,$E4,$75,$D8,$14,$75,$D8,$1D,$73
	.byte $D8,$15,$75,$D8,$14,$75,$D8,$1F,$B3,$D8,$10,$E3,$07,$D8,$1F,$43
	.byte $73,$41,$71,$D8,$12,$43,$D8,$1F,$41,$01,$21,$41,$51,$81,$D8,$12
	.byte $53,$D8,$1F,$51,$71,$81,$51,$21,$A1,$D8,$12,$23,$D8,$1F,$21,$31
	.byte $51,$21,$31,$A1,$D8,$12,$33,$D8,$1F,$31,$51,$71,$31,$E4,$81,$E3
	.byte $01,$31,$81,$E4,$81,$E3,$01,$31,$81,$E4,$51,$81
_DataPointerTable_0AC0:
	.word ($11E3) ;11E3 (0) ([8:0][A:1][C:E][E:F])
	.word (DataTableEntry_1E451) ;E451 (1E451) ([8:0][A:1][C:E][E:F])
	.word (DataTableEntry_0151) ;8151 (151) ([8:0][A:1][C:E][E:F])
	.word ($11E3) ;11E3 (0) ([8:0][A:1][C:E][E:F])
	.word (DataTableEntry_1E451) ;E451 (1E451) ([8:0][A:1][C:E][E:F])
	.word (DataTableEntry_1E371) ;E371 (1E371) ([8:0][A:1][C:E][E:F])
	.word ($2101) ;2101 (0) ([8:0][A:1][C:E][E:F])
	.word ($7151) ;7151 (0) ([8:0][A:1][C:E][E:F])
	.word ($01E2) ;1E2 (0) ([8:0][A:1][C:E][E:F])
	.word ($5121) ;5121 (0) ([8:0][A:1][C:E][E:F])
	.word ($77E3) ;77E3 (0) ([8:0][A:1][C:E][E:F])
	.word (DataTableEntry_1FBC7) ;FBC7 (1FBC7) ([8:0][A:1][C:E][E:F])
	.word ($1AD8) ;1AD8 (0) ([8:0][A:1][C:E][E:F])
	.word ($01E3) ;1E3 (0) ([8:0][A:1][C:E][E:F])
	.word (Mapper1reg_reg1) ;101 (0) ([8:0][A:1][C:E][E:F])
	.word (DataTableEntry_1E401) ;E401 (1E401) ([8:0][A:1][C:E][E:F])
	.word (DataTableEntry_21A1) ;A1A1 (21A1) ([8:0][A:1][C:E][E:F])
	.word (DataTableEntry_21A1) ;A1A1 (21A1) ([8:0][A:1][C:E][E:F])
	.word (DataTableEntry_0181) ;8181 (181) ([8:0][A:1][C:E][E:F])
	.word (DataTableEntry_0181) ;8181 (181) ([8:0][A:1][C:E][E:F])
	.word (DataTableEntry_21A1) ;A1A1 (21A1) ([8:0][A:1][C:E][E:F])
	.word (DataTableEntry_21A1) ;A1A1 (21A1) ([8:0][A:1][C:E][E:F])
	.word ($02FE) ;2FE (0) ([8:0][A:1][C:E][E:F])
	.word (DataTableEntry_10D9) ;90D9 (10D9) ([8:0][A:1][C:E][E:F])
	.word ($03E3) ;3E3 (0) ([8:0][A:1][C:E][E:F])
	.word (DataTableEntry_1DA03) ;DA03 (1DA03) ([8:0][A:1][C:E][E:F])
	.word ($031F) ;31F (0) ([8:0][A:1][C:E][E:F])
	.word (DataTableEntry_1DC03) ;DC03 (1DC03) ([8:0][A:1][C:E][E:F])
	.word ($0F90) ;F90 (0) ([8:0][A:1][C:E][E:F])
	.byte $FF
SoundData5C_EndingSong_ch5:
	.byte $D8,$FB,$CF,$CF,$FE,$06,$FB,$BF,$CF,$FE,$05,$BF,$BF,$FB,$B7,$17
	.byte $B7,$17,$FE,$02,$FB,$B5,$B1,$B5,$B1,$B5,$B1,$B3,$A3,$FE,$03,$B7
	.byte $A7,$B7,$A1,$B1,$A1,$A1,$FB,$B1,$11,$11,$11,$A1,$11,$11,$B1,$B1
	.byte $11,$11,$11,$A1,$11,$11,$11,$FE,$02,$D9,$B7,$DA,$B7,$B0,$FF
SoundEffectTable:
	.word (SoundEffectTable_0B9A) ;8B9A (B9A) ()
	.word (SoundEffectTable_0BA0) ;8BA0 (BA0) ()
	.word (SoundEffectTable_0BA6) ;8BA6 (BA6) ()
	.word (SoundEffectTable_0BAF) ;8BAF (BAF) ()
	.word (SoundEffectTable_0BB3) ;8BB3 (BB3) ()
	.word (SoundEffectTable_0BBB) ;8BBB (BBB) ()
	.word (SoundEffectTable_0BC2) ;8BC2 (BC2) ()
	.word (SoundEffectTable_0BC7) ;8BC7 (BC7) ()
	.word (SoundEffectTable_0BD1) ;8BD1 (BD1) ()
	.word (SoundEffectTable_0BDC) ;8BDC (BDC) ()
	.word (SoundEffectTable_0BE1) ;8BE1 (BE1) ()
	.word (SoundEffectTable_0BEB) ;8BEB (BEB) ()
	.word (SoundEffectTable_0BF3) ;8BF3 (BF3) ()
	.word (SoundEffectTable_0BFA) ;8BFA (BFA) ()
	.word (SoundEffectTable_0C02) ;8C02 (C02) ()
	.word (SoundEffectTable_0C08) ;8C08 (C08) ()
	.word (SoundEffectTable_0C0E) ;8C0E (C0E) ()
	.word (SoundEffectTable_0C12) ;8C12 (C12) ()
	.word (SoundEffectTable_0C1B) ;8C1B (C1B) ()
	.word (SoundEffectTable_0C23) ;8C23 (C23) ()
	.word (SoundEffectTable_0C2C) ;8C2C (C2C) ()
	.word (SoundEffectTable_0C36) ;8C36 (C36) ()
	.word (SoundEffectTable_0C3D) ;8C3D (C3D) ()
	.word (SoundEffectTable_0C43) ;8C43 (C43) ()
	.word (SoundEffectTable_0C4B) ;8C4B (C4B) ()
	.word (SoundEffectTable_0C52) ;8C52 (C52) ()
	.word (SoundEffectTable_0C59) ;8C59 (C59) ()
	.word (SoundEffectTable_0C59) ;8C59 (C59) ()
	.word (SoundEffectTable_0C5F) ;8C5F (C5F) ()
	.word (SoundEffectTable_0C65) ;8C65 (C65) ()
	.word (SoundEffectTable_0C71) ;8C71 (C71) ()
	.word (SoundEffectTable_0C76) ;8C76 (C76) ()
	.word (SoundEffectTable_0C82) ;8C82 (C82) ()
	.word (SoundEffectTable_0C8B) ;8C8B (C8B) ()
	.word (SoundEffectTable_0C90) ;8C90 (C90) ()
	.word (SoundEffectTable_0C95) ;8C95 (C95) ()
	.word (SoundEffectTable_0C9C) ;8C9C (C9C) ()
	.word (SoundEffectTable_0CA2) ;8CA2 (CA2) ()
	.word (SoundEffectTable_0CAD) ;8CAD (CAD) ()
	.word (SoundEffectTable_0CB5) ;8CB5 (CB5) ()
	.word (SoundEffectTable_0CC8) ;8CC8 (CC8) ()
	.word (SoundEffectRelatedTable) ;8CD0 (CD0) ()
	.word (SoundEffectRelatedTable) ;8CD0 (CD0) ()
	.word (SoundEffectRelatedTable) ;8CD0 (CD0) ()
	.word (SoundEffectRelatedTable) ;8CD0 (CD0) ()
	.word (SoundEffectRelatedTable) ;8CD0 (CD0) ()
	.word (SoundEffectRelatedTable) ;8CD0 (CD0) ()
	.word (SoundEffectRelatedTable) ;8CD0 (CD0) ()
SoundEffectTable_0B9A:
	.byte $14,$16,$17,$16,$F5,$FF
SoundEffectTable_0BA0:
	.byte $14,$15,$17,$26,$F5,$FF
SoundEffectTable_0BA6:
	.byte $12,$13,$14,$15,$16,$27,$16,$F5,$FF
SoundEffectTable_0BAF:
	.byte $19,$27,$F6,$FF
SoundEffectTable_0BB3:
	.byte $1D,$1B,$1A,$15,$17,$16,$F5,$FF
SoundEffectTable_0BBB:
	.byte $13,$15,$17,$18,$17,$F6,$FF
SoundEffectTable_0BC2:
	.byte $14,$45,$F4,$F3,$FF
SoundEffectTable_0BC7:
	.byte $18,$16,$45,$54,$23,$25,$24,$23,$25,$FF
SoundEffectTable_0BD1:
	.byte $17,$18,$17,$16,$35,$14,$15,$16,$27,$28,$FF
SoundEffectTable_0BDC:
	.byte $18,$17,$26,$B5,$FF
SoundEffectTable_0BE1:
	.byte $17,$19,$18,$17,$36,$44,$45,$46,$47,$FF
SoundEffectTable_0BEB:
	.byte $42,$43,$44,$25,$26,$25,$F4,$FF
SoundEffectTable_0BF3:
	.byte $17,$19,$18,$17,$15,$76,$FF
SoundEffectTable_0BFA:
	.byte $17,$16,$15,$13,$15,$14,$A3,$FF
SoundEffectTable_0C02:
	.byte $15,$27,$26,$65,$F4,$FF
SoundEffectTable_0C08:
	.byte $82,$83,$84,$85,$86,$FF
SoundEffectTable_0C0E:
	.byte $16,$17,$F6,$FF
SoundEffectTable_0C12:
	.byte $14,$16,$17,$18,$12,$13,$14,$15,$FF
SoundEffectTable_0C1B:
	.byte $22,$23,$24,$25,$26,$45,$F4,$FF
SoundEffectTable_0C23:
	.byte $1A,$28,$17,$16,$15,$14,$15,$F6,$FF
SoundEffectTable_0C2C:
	.byte $12,$13,$14,$25,$26,$27,$16,$15,$F6,$FF
SoundEffectTable_0C36:
	.byte $1A,$18,$17,$16,$15,$A4,$FF
SoundEffectTable_0C3D:
	.byte $1A,$18,$17,$16,$A5,$FF
SoundEffectTable_0C43:
	.byte $18,$27,$26,$15,$14,$85,$76,$FF
SoundEffectTable_0C4B:
	.byte $1A,$17,$16,$13,$35,$F4,$FF
SoundEffectTable_0C52:
	.byte $26,$25,$24,$15,$24,$53,$FF
SoundEffectTable_0C59:
	.byte $24,$43,$14,$23,$62,$FF
SoundEffectTable_0C5F:
	.byte $17,$26,$25,$26,$F7,$FF
SoundEffectTable_0C65:
	.byte $FB,$83,$44,$85,$86,$45,$86,$45,$86,$45,$86,$FF
SoundEffectTable_0C71:
	.byte $18,$17,$16,$F5,$FF
SoundEffectTable_0C76:
	.byte $14,$16,$17,$F6,$F5,$F5,$F4,$F4,$F4,$F3,$F2,$FF
SoundEffectTable_0C82:
	.byte $13,$15,$26,$11,$22,$13,$14,$25,$FF
SoundEffectTable_0C8B:
	.byte $11,$12,$14,$F5,$FF
SoundEffectTable_0C90:
	.byte $31,$32,$33,$F4,$FF
SoundEffectTable_0C95:
	.byte $13,$15,$16,$35,$23,$F4,$FF
SoundEffectTable_0C9C:
	.byte $15,$16,$25,$14,$F5,$FF
SoundEffectTable_0CA2:
	.byte $F1,$F1,$F2,$F2,$F3,$F3,$F4,$F4,$F4,$F4,$FF
SoundEffectTable_0CAD:
	.byte $22,$23,$24,$25,$16,$F5,$F4,$FF
SoundEffectTable_0CB5:
	.byte $15,$16,$18,$16,$25,$24,$F5,$F5,$F4,$F4,$F4,$F3,$F3,$F3,$F2,$F2
	.byte $F2,$F2,$FF
SoundEffectTable_0CC8:
	.byte $41,$42,$43,$44,$45,$46,$F5,$FF
SoundEffectRelatedTable:
	.word (SoundEffectRelatedTable_0D10) ;8D10 (D10) ()
	.word (SoundEffectRelatedTable_0D13) ;8D13 (D13) ()
	.word (SoundEffectRelatedTable_0D24) ;8D24 (D24) ()
	.word (SoundEffectRelatedTable_0D32) ;8D32 (D32) ()
	.word (SoundEffectRelatedTable_0D43) ;8D43 (D43) ()
	.word (SoundEffectRelatedTable_0D54) ;8D54 (D54) ()
	.word (SoundEffectRelatedTable_0D6C) ;8D6C (D6C) ()
	.word (SoundEffectRelatedTable_0D7D) ;8D7D (D7D) ()
	.word (SoundEffectRelatedTable_0D8C) ;8D8C (D8C) ()
	.word (SoundEffectRelatedTable_0D9A) ;8D9A (D9A) ()
	.word (SoundEffectRelatedTable_0DA8) ;8DA8 (DA8) ()
	.word (SoundEffectRelatedTable_0DB1) ;8DB1 (DB1) ()
	.word (SoundEffectRelatedTable_0DC9) ;8DC9 (DC9) ()
	.word (SoundEffectRelatedTable_0DE1) ;8DE1 (DE1) ()
	.word (SoundEffectRelatedTable_0DEB) ;8DEB (DEB) ()
	.word (SoundEffectRelatedTable_0DF3) ;8DF3 (DF3) ()
	.word (SoundEffectRelatedTable_0E04) ;8E04 (E04) ()
	.word (SoundEffectRelatedTable_0E15) ;8E15 (E15) ()
	.word (SoundEffectRelatedTable_0E15) ;8E15 (E15) ()
	.word (SoundEffectRelatedTable_0E15) ;8E15 (E15) ()
_func_0CF8:
	ora $8E,x
	ora $8E,x
	ora $8E,x
	ora $8E,x
	ora $8E,x
	ora $8E,x
	ora $8E,x
	ora $8E,x
	ora $8E,x
	ora $8E,x
	ora $8E,x
	ora $8E,x
SoundEffectRelatedTable_0D10:
	.byte $FB

	.byte $1F,$FF
SoundEffectRelatedTable_0D13:
	.byte $FB,$80,$FB,$20,$2F,$20,$21,$FE,$01,$FB,$20,$2E,$20,$22,$FE,$0F
	.byte $FF
SoundEffectRelatedTable_0D24:
	.byte $FB,$17,$15,$13,$11,$C0,$FB,$20,$2F,$20,$21,$FE,$0F,$FF
SoundEffectRelatedTable_0D32:
	.byte $FB,$E0,$FB,$10,$2F,$20,$21,$FE,$02,$FB,$10,$2E,$20,$22,$FE,$0F
	.byte $FF
SoundEffectRelatedTable_0D43:
	.byte $FB,$80,$FB,$2F,$20,$21,$20,$FE,$03,$FB,$20,$2E,$20,$22,$FE,$0F
	.byte $FF
SoundEffectRelatedTable_0D54:
	.byte $FB,$80,$FB,$2F,$20,$21,$20,$FE,$02,$FB,$20,$2E,$20,$22,$FE,$02
	.byte $FB,$20,$2D,$20,$23,$FE,$0F,$FF
SoundEffectRelatedTable_0D6C:
	.byte $FB,$70,$FB,$10,$2F,$20,$21,$FE,$02,$FB,$10,$2E,$20,$22,$FE,$0F
	.byte $FF
SoundEffectRelatedTable_0D7D:
	.byte $FB,$17,$15,$13,$12,$11,$F0,$FB,$1F,$10,$11,$10,$FE,$0F,$FF
SoundEffectRelatedTable_0D8C:
	.byte $FB,$FB,$20,$2F,$20,$21,$20,$2E,$20,$22,$20,$FE,$0F,$FF
SoundEffectRelatedTable_0D9A:
	.byte $FB,$FB,$2F,$2E,$2F,$20,$2F,$2D,$2F,$21,$2F,$FE,$0F,$FF
SoundEffectRelatedTable_0DA8:
	.byte $FB,$FB,$20,$2F,$20,$21,$FE,$0F,$FF
SoundEffectRelatedTable_0DB1:
	.byte $FB,$E0,$FB,$20,$2F,$20,$21,$FE,$02,$FB,$20,$2E,$20,$22,$FE,$02
	.byte $FB,$20,$2D,$20,$23,$FE,$0F,$FF
SoundEffectRelatedTable_0DC9:
	.byte $FB,$EF,$FB,$2F,$2E,$2F,$20,$FE,$02,$FB,$2F,$2D,$2F,$21,$FE,$02
	.byte $FB,$2F,$2C,$2F,$22,$FE,$0F,$FF
SoundEffectRelatedTable_0DE1:
	.byte $FB,$90,$FB,$30,$3F,$30,$31,$FE,$0F,$FF
SoundEffectRelatedTable_0DEB:
	.byte $FB,$17,$15,$13,$12,$21,$F0,$FF
SoundEffectRelatedTable_0DF3:
	.byte $FB,$8F,$FB,$2F,$2E,$2F,$20,$FE,$04,$FB
_DataPointerTable_0DFD:
	.word ($2D2F) ;2D2F (0) ([8:0][A:1][C:E][E:F])
	.word ($212F) ;212F (0) ([8:0][A:1][C:E][E:F])
	.word ($0FFE) ;FFE (0) ([8:0][A:1][C:E][E:F])
	.byte $FF
SoundEffectRelatedTable_0E04:
	.byte $FB,$80,$FB,$20,$2F,$20,$21,$FE,$04,$FB,$20,$2E,$20,$22,$FE,$0F
	.byte $FF
SoundEffectRelatedTable_0E15:
	.byte $FF
SoundData39_TownSong_ch1:
	.byte $EB,$F1,$01,$E9,$31,$D8,$71,$01,$55,$E2,$71,$E3,$70,$E2,$5A,$E2
	.byte $40,$50,$42,$28,$E3,$A0,$90,$A0,$E2,$00,$E2,$70,$70,$E3,$70,$E2
	.byte $58,$E3,$A0,$E2,$00,$40,$50,$42,$28,$E3,$A0,$90,$A0,$E2,$00,$E9
	.byte $34,$EB,$01,$01,$D8,$B1,$00,$16,$FB,$E2,$20,$10,$00,$E3,$7A,$70
	.byte $90,$72,$62,$92,$E2,$02,$31,$61,$FE,$02,$E9,$34,$EB,$01,$01,$D8
	.byte $B9,$82,$17,$F0,$E3,$90,$F3,$90,$F4,$90,$F2,$21,$60,$90,$E2,$00
	.byte $F1,$E3,$A0,$F3,$A0,$F4,$A0,$F5,$A0,$F2,$20,$70,$A0,$E2,$20,$F1
	.byte $00,$F3,$00,$F4,$00,$F2,$E3,$51,$90,$E2,$00,$50,$F1,$30,$F3,$30
	.byte $F4,$30,$F5,$30,$F1,$20,$F3,$20,$F4,$20,$F5,$20,$F1,$20,$F3,$20
	.byte $F4,$20,$F2,$E3,$71,$B0,$E2,$20,$70,$F1,$50,$F3,$50,$F4,$50,$F5
	.byte $50,$F1,$30,$F3,$30,$F4,$30,$F5,$30,$F1,$E7,$01,$74,$10,$40,$70
	.byte $67,$E9,$35,$EB,$01,$02,$D8,$71,$05,$17,$E2,$72,$E2,$52,$EB,$01
	.byte $01,$E2,$29,$E7,$03,$E3,$00,$E2,$00,$E1,$00,$E4,$60,$E3,$60,$E2
	.byte $60,$E7,$05,$E3,$79,$EB,$03,$02,$E3,$72,$E3,$52,$EB,$01,$01,$E3
	.byte $29,$E7,$03,$E3,$00,$00,$00,$E4,$60,$60,$60,$73,$E4,$70,$E3,$70
	.byte $E4,$20,$60,$90,$E3,$20,$FE,$FF,$45,$8E
SoundData3A_TownSong_ch0:
	.byte $EB,$F1,$01,$E9,$31,$D8,$70,$01,$55,$F1,$E3,$A1,$F2,$E4,$A0,$E2
	.byte $0A,$E2,$00,$20,$02,$E3,$A8,$F1,$E3,$50,$40,$50,$70,$E3,$A0,$F2
	.byte $A0,$E4,$A0,$E2,$08,$E3,$70,$90,$E2,$00,$20,$02,$E3,$A8,$F1,$E3
	.byte $50,$40,$50,$70,$FB,$EB,$00,$00,$E9,$34,$D8,$70,$02,$17,$F2,$E3
	.byte $A1,$E4,$20,$E3,$22,$12,$02,$E4,$A1,$70,$90,$E9,$31,$F1,$E7,$03
	.byte $E6,$01,$E5,$20,$E4,$2E,$E5,$20,$E4,$2E,$E4,$20,$E3,$2E,$E5,$20
	.byte $E4,$26,$E5,$20,$E4,$26,$E5,$70,$E4,$76,$E5,$80,$E4,$86,$E5,$90
	.byte $E4,$9E,$E4,$20,$E3,$26,$E4,$20,$E3,$26,$E5,$20,$E4,$26,$E4,$20
	.byte $E3,$26,$FE,$02,$EB,$01,$01,$E9,$31,$D8,$70,$03,$16,$F1,$E5,$60
	.byte $60,$E4,$60,$E5,$60,$F2,$E7,$02,$E2,$03,$E7,$03,$F1,$E5,$70,$70
	.byte $E4,$70,$E5,$70,$F2,$E7,$02,$E4,$A0,$E3,$20,$70,$A0,$F1,$E7,$03
	.byte $E5,$90,$90,$E4,$90,$E5,$90,$F2,$E7,$02,$E2,$03,$F1,$E7,$03,$E5
	.byte $A0,$A0,$E4,$A0,$E5,$A0,$F2,$E7,$02,$E3,$A0,$E2,$20,$50,$90,$82
	.byte $24,$E2,$03,$E3,$73,$44,$40,$40,$40,$E7,$04,$F2,$E6,$01,$E4,$60
	.byte $E3,$66,$E4,$90,$E3,$96,$E3,$00,$E2,$06,$E4,$30,$E3,$36,$E4,$60
	.byte $E3,$66,$E4,$90,$E3,$96,$E4,$00,$E3,$06,$E4,$30,$E3,$36,$EB,$01
	.byte $02,$E9,$75,$D8,$31,$05,$17,$E2,$22,$E2,$02,$EB,$01,$01,$E3,$A3
	.byte $E7,$03,$E4,$A0,$90,$A0,$50,$50,$E5,$A0,$E4,$70,$E3,$70,$E2,$70
	.byte $E4,$20,$E3,$20,$E2,$20,$E7,$05,$E3,$23,$E7,$03,$E4,$70,$70,$70
	.byte $E5,$71,$70,$E7,$05,$EB,$03,$02,$E3,$22,$E3,$02,$EB,$01,$01,$E4
	.byte $A3,$E7,$03,$E5,$A0,$A0,$E4,$A0,$E5,$A1,$A0,$E4,$70,$70,$70,$E4
	.byte $20,$20,$20,$E7,$05,$E4,$23,$E7,$03,$E5,$70,$E4,$70,$E5,$20,$60
	.byte $90,$E4,$20,$FE,$FF,$44,$8F
SoundData3B_TownSong_ch2:
	.byte $FB,$D8,$1A,$E4,$71,$71,$E3,$71,$E4,$70,$70,$70,$A1,$90,$A0,$B0
	.byte $E3,$20,$20,$E4,$71,$71,$E3,$71,$E4,$70,$70,$A0,$A0,$E3,$A0,$E4
	.byte $A0,$E3,$A0,$90,$A0,$E2,$00,$FE,$02,$FB,$E4,$71,$71,$A0,$90,$70
	.byte $20,$71,$71,$E3,$70,$70,$E4,$A0,$70,$E3,$21,$21,$E2,$21,$E3,$21
	.byte $00,$10,$21,$E2,$20,$20,$E3,$20,$E2,$20,$FE,$02,$E4,$60,$60,$E3
	.byte $60,$E4,$60,$91,$20,$60,$70,$70,$E3,$70,$E4,$70,$E3,$71,$E4,$70
	.byte $70,$E4
DataTableEntry_10D9:
	.byte $90,$90,$E3,$90,$E4,$90,$E3,$91,$50,$50,$E4,$A0,$A0,$E3,$A0,$E4
	.byte $A0,$A0,$E3,$90,$90,$A0,$E4,$B0,$B0,$E3,$B0,$E4,$B0,$E4,$B1,$E3
	.byte $B0,$E4,$B0,$E3,$00,$00,$E2,$00,$E3,$00,$E2,$01,$E4,$70,$70,$E3
	.byte $10,$10,$E2,$10,$E3,$10,$E4,$90,$B0,$E3,$10,$E4,$90,$E3,$20,$20
	.byte $00,$10,$20,$E4,$70,$80,$E3,$50,$E4,$71,$E3,$70,$E4,$91,$E3,$90
	.byte $E4,$A3,$E3,$A0,$90,$A0,$50,$50,$E4,$A0,$E3,$00,$00,$00,$20,$20
	.byte $20,$73,$70,$70,$70,$E4,$71,$70,$71,$E3,$70,$E4,$91,$E3,$90,$E4
	.byte $A3,$A0,$A0,$E3,$A0,$E4,$A1,$A0,$E3,$00,$00,$E2,$00,$E3,$20,$20
	.byte $E2,$20,$E3,$73,$E4,$70,$E3,$70,$E4,$20,$60,$90,$E3,$20,$FE,$FF
	.byte $A0,$90
SoundData3C_TownSong_ch5:
	.byte $D8,$B1,$10,$10,$B1,$10,$12,$10,$10,$B1,$40,$12,$10,$10,$B1,$10
	.byte $10,$B0,$B0,$10,$10,$41,$40,$40,$B1,$10,$10,$B1,$10,$12,$10,$10
	.byte $B1,$40,$12,$10,$10,$B1,$10,$10,$40,$40,$41,$41,$40,$40,$FB,$B1
	.byte $B0,$10,$A1,$10,$10,$B0,$10,$B0,$10,$A1,$10,$10,$B1,$B0,$10,$A1
	.byte $10,$10,$B0,$10,$B0,$10,$A1,$A0,$A0,$FE,$02,$FB,$B0,$B0,$10,$10
	.byte $A0,$10,$10,$10,$B0,$B0,$10,$10,$A0,$10,$A0,$A0,$FE,$03,$B0,$B0
	.byte $10,$10,$A0,$10,$10,$10,$B0,$A0,$A0,$10,$A0,$10,$A0,$A0,$B1,$A0
	.byte $B1,$A0,$B3,$A1,$A1,$A0,$A0,$B0,$A0,$A0,$B0,$A0,$A0,$B3,$A0,$A0
	.byte $B0,$A1,$A0,$B1,$A0,$B1,$A0,$B3,$A0,$A0,$A1,$A0,$A0,$B0,$A0,$A0
	.byte $B0,$A0,$A0,$B2,$B0,$A0,$A0,$B0,$A0,$A0,$A0,$FE,$FF,$99,$91
SoundData3D_WildernessSong_ch1:
	.byte $EB,$00,$00,$E9,$71,$D7,$36,$82,$16,$F0,$FB,$E2,$A0,$50,$E1,$50
	.byte $E2,$50,$E1,$30,$E2,$50,$E1,$10,$E2,$50,$E1,$00,$E2,$50,$E1,$10
	.byte $E2,$50,$E1,$00,$E2,$50,$A0,$50,$E1,$00,$E2,$50,$E1,$10,$E2,$50
	.byte $E1,$30,$E2,$50,$E1,$10,$E2,$50,$E1,$00,$E2,$50,$80,$50,$E1,$00
	.byte $E2,$50,$A0,$50,$FE,$02,$E9,$35,$EB,$01,$03,$D7,$70,$06,$17,$E2
	.byte $31,$80,$58,$31,$11,$32,$82,$55,$31,$11,$31,$80,$58,$31,$51,$E9
	.byte $32,$E7,$0B,$62,$84,$52,$64,$E9,$35,$EB,$01,$03,$D7,$70,$06,$17
	.byte $E2,$31,$80,$58,$31,$11,$32,$82,$55,$31,$11,$31,$80,$58,$31,$51
	.byte $E9,$32,$E7,$0B,$62,$84,$E7,$06,$51,$71,$91,$E1,$01,$E9,$74,$EB
	.byte $00,$00,$D7,$30,$08,$15,$F0,$E2,$00,$F3,$00,$F5,$00,$F1,$E3,$A2
	.byte $E2,$A1,$F0,$00,$F3,$00,$F5,$00,$F1,$E3,$A2,$E2,$A1,$F0,$00,$F3
	.byte $00,$F5,$00,$F1,$E3,$A2,$E2,$A1,$E7,$09,$E9,$71,$F0,$10,$E1,$10
	.byte $E2,$00,$E1,$00,$E3,$A0,$E2,$A0,$E3,$80,$E2,$80,$E7,$0A,$E9,$74
	.byte $EB,$01,$03,$F0,$00,$F3,$00,$F1,$E3,$A0,$E2,$A4,$F0,$00,$F3,$00
	.byte $F1,$E3,$A0,$E2,$A4,$F0,$00,$F3,$00,$F1,$E3,$A0,$E2,$A4,$E9,$30
	.byte $E9,$75,$E7,$09,$F0,$E1,$11,$31,$00,$12,$FE,$FF,$0A,$92
SoundData3E_WildernessSong_ch0:
	.byte $E9,$00,$EA,$8C,$EB,$01,$00,$D1,$36,$82,$18,$F0,$FB,$E3,$A0,$E2
	.byte $A5,$E3,$50,$E2,$55,$E2,$50,$E1,$55,$E3,$50,$E2,$55,$E2,$30,$E1
	.byte $35,$E3,$50,$E2,$55,$E2,$10,$E1,$15,$E3,$50,$E2,$55,$E2,$00,$E1
	.byte $05,$E3,$50,$E2,$55,$E2,$10,$E1,$15,$E3,$50,$E2,$55,$E2,$00,$E1
	.byte $05,$E3,$50,$E2,$55,$E3,$A0,$E2,$A5,$E3,$50,$E2,$55,$E2,$00,$E1
	.byte $05,$E3,$50,$E2,$55,$E2,$10,$E1,$15,$E3,$50,$E2,$55,$E2,$30,$E1
	.byte $35,$E3,$50,$E2,$55,$E2,$10,$E1,$15,$E3,$50,$E2,$55,$E2,$00,$E1
	.byte $05,$E3,$50,$E2,$55,$E3,$80,$E2,$85,$E3,$50,$E2,$55,$E2,$00,$E1
	.byte $05,$E3,$50,$E2,$55,$E3,$A0,$E2,$A5,$E3,$50,$E2,$55,$FE,$02,$E9
	.byte $35,$EA,$00,$EB,$01,$03,$D7,$70,$06,$17,$E2,$01,$30,$11,$E9,$B5
	.byte $E7,$07,$E6,$01,$E4,$00,$E3,$05,$E5,$A0,$E4,$A5,$E4,$00,$E3,$05
	.byte $E4,$10,$E3,$1C,$E4,$30,$E3,$3C,$E6,$07,$53,$E9,$35,$E7,$06,$E2
	.byte $02,$52,$15,$01,$E3,$A1,$E2,$01,$30,$11,$E9,$B5,$E7,$07,$E6,$01
	.byte $E4,$30,$E3,$35,$E4,$10,$E3,$15,$E4,$30,$E3,$35,$E4,$50,$E3,$5C
	.byte $E4,$60,$E3,$6C,$E4,$80,$E3,$8C,$E4,$A0,$E3,$AC,$E6,$07,$E9,$32
	.byte $E7,$0B,$E2,$02,$04,$E3,$A2,$A4,$E9,$35,$EB,$01,$03,$D7,$70,$06
	.byte $17,$E2,$01,$30,$11,$E9,$B5,$E7,$07,$E6,$01,$E4,$00,$E3,$05,$E5
	.byte $A0,$E4,$A5,$00,$E3,$05,$E4,$10,$E3,$1C,$E4,$30,$E3,$3C,$E6,$07
	.byte $53,$E9,$35,$E7,$06,$E2,$02,$52,$15,$01,$E3,$A1,$E2,$01,$30,$11
	.byte $E9,$B5,$E7,$07,$E6,$01,$E4,$30,$E3,$35,$E4,$10,$E3,$15,$E4,$30
	.byte $E3,$35,$E4,$50,$E3,$5C,$E4,$60,$E3,$6C,$E4,$80,$E3,$8C,$E4,$A0
	.byte $E3,$AC,$E6,$07,$E9,$32,$E7,$0B,$E2,$02,$04,$E3,$E7,$06,$E3,$91
	.byte $A1,$E2,$01,$31,$E9,$74,$EB,$01,$00,$D7,$30,$08,$15,$F0,$E3,$30
	.byte $F3,$30,$F5,$30,$F1,$12,$E2,$11,$F0,$E3,$30,$F3,$30,$F5,$30,$F1
	.byte $12,$E2,$11,$F0,$E3,$30,$F3,$30,$F5,$30,$F0,$12,$E2,$11,$F1,$E7
	.byte $09,$E9,$B1,$E3,$10,$E2,$10,$E3,$00,$E2,$00,$E4,$A0,$E3,$A0,$E4
	.byte $80,$E3,$80,$EB,$01,$03,$F0,$E7,$0A,$E9,$30,$E9,$74,$E3,$30,$F3
	.byte $30,$F1,$10,$E2,$14,$F0,$E3,$30,$F3,$30,$F1,$10,$E2,$14,$F0,$E3
	.byte $30,$F3,$30,$F1,$10,$E2,$14,$E7,$09,$E9,$B5,$EB,$01,$00,$F0,$E2
	.byte $11,$31,$00,$12,$FE,$FF,$08,$93
SoundData3F_WildernessSong_ch2:
	.byte $D7,$90,$FB,$E4,$AF,$E4,$57,$E3,$57,$FE,$02,$D7,$15,$E4,$A1,$E3
	.byte $A0,$E4,$A0,$C0,$A0,$E3,$A0,$C0,$E4,$A0,$A0,$E3,$A0,$C0,$E4,$A0
	.byte $C0,$E3,$A0,$C0,$E4,$81,$E3,$80,$E4,$80,$C0,$80,$E3,$80,$C0,$E4
	.byte $80,$C0,$E3,$80,$C0,$E4,$80,$80,$E3,$80,$C0,$E4,$61,$E3,$60,$E4
	.byte $60,$C0,$60,$E3,$60,$C0,$E4,$60,$60,$E3,$60,$C0,$E4,$60,$C0,$E3
	.byte $60,$C0,$E4,$50,$50,$E3,$50,$E4,$50,$C0,$50,$E3,$50,$C0,$E4,$50
	.byte $C0,$E3,$50,$C0,$E4,$50,$50,$E3,$50,$C0,$E4,$A1,$E3,$A0,$E4,$A0
	.byte $C0,$A0,$E3,$A0,$C0,$E4,$A0,$A0,$E3,$A0,$C0,$E4,$A0,$C0,$E3,$A0
	.byte $C0,$E4,$81,$E3,$80,$E4,$80,$C0,$80,$E3,$80,$C0,$E4,$80,$C0,$E3
	.byte $80,$C0,$E4,$80,$80,$E3,$80,$C0,$E4,$61,$E3,$60,$E4,$60,$C0,$60
	.byte $E3,$60,$C0,$E4,$60,$60,$E3,$60,$C0,$E4,$60,$C0,$E3,$60,$C0,$E4
	.byte $50,$50,$E3,$50,$E4,$50,$C0,$50,$E3,$50,$C0,$E4,$50,$E3,$50,$E4
	.byte $70,$E3,$70,$E4,$90,$E3,$90,$00,$E2,$00,$E4,$A2,$A2,$A0,$E3,$A0
	.byte $E4,$82,$82,$80,$E3,$80,$E4,$62,$62,$60,$E3,$60,$E4,$82,$82,$80
	.byte $E3,$80,$E4,$A2,$A2,$A0,$E3,$A0,$E4,$82,$82,$80,$80,$E4,$62,$62
	.byte $60,$E3,$60,$E4,$81,$E3,$81,$E4,$80,$80,$E3,$81,$FE,$FF,$E0,$94
SoundData40_WildernessSong_ch5:
	.byte $D7,$BF,$B7,$B3,$A3,$BF,$B7,$B3,$A1,$A0,$A0,$FB,$B1,$A0,$B1,$B0
	.byte $A1,$B1,$A1,$B0,$B0,$A1,$B1,$A0,$B1,$B0,$A1,$B1,$A1,$B0,$B0,$A0
	.byte $A0,$FE,$02,$B1,$A0,$B1,$B0,$A1,$B1,$A1,$B0,$B0,$A1,$B1,$A0,$B1
	.byte $B0,$A1,$B1,$A1,$B1,$A0,$A0,$B1,$A0,$B1,$B0,$A1,$B1,$A1,$B0,$B0
	.byte $A1,$B1,$A0,$B1,$B0,$A0,$A0,$B1,$B0,$A0,$B0,$A0,$A0,$A0,$FB,$B1
	.byte $A0,$B1,$B0,$A1,$B1,$A0,$B1,$B0,$A0,$A0,$FE,$03,$B1,$A0,$B1,$B0
	.byte $A0,$B1,$B0,$A0,$A0,$B0,$A0,$A0,$A0,$B1,$10,$10,$B1,$10,$10,$11
	.byte $10,$10,$B1,$10,$10,$11,$10,$10,$B1,$10,$10,$11,$10,$10,$B1,$A0
	.byte $10,$B1,$10,$10,$B1,$10,$10,$11,$10,$10,$B1,$10,$10,$11,$10,$10
	.byte $B1,$10,$10,$11,$B0,$B0,$A1,$A0,$A0,$FE,$FF,$EB,$95
SoundCode_NMIcallback:
	lda APU_HW__4015_EnableChannelsMask
	and #$10
	bne @9689
	lda #$00
	sta Sound_PCMsampleActive
	@9689:
	inc Sound_FadeCounter
	lda Sound_FadeMode
	beq @96B6
	lda Sound_FadeCounter
	and #$3F
	bne @96B6
	inc Sound_FadeMode
	lda Sound_FadeMode
	cmp #$04
	bne @96A3
	jsr Bank0TerminateSound
	jmp @96B6

	@96A3:
	cmp #$03
	bne @96AB
	lda #$00
	sta Sound_CUrrentSongNumber_Channel5_Percussion
	@96AB:
	cmp #$02
	bne @96B6
	lda #$00
	sta Sound_CurrentSongNumber_Channel2_triangle
	sta APU_HW__4008_Reg0_channel2
	@96B6:
	 ldx #$00
	ldy #$00
	@96BA:
	stx Sound_CurrentLogicalChannel
	lda Sound_CurrentSongNumber_Channel0_square0,x
	beq @96C4
	jsr SoundCode_ExecuteTickForLogicalChannelX
	@96C4:
	inx
	cpx #$06
	bcc @96BA
_loc_16C9:
	rts
;------------------------------------------
SoundCode_ExecuteTickForLogicalChannelX:
	jsr Sound_Set_TrackPtr_From_TrackDataPointer1
	dec Sound_SongPausedFlag_Channel0_square0,x
	bne @96D4
	jmp SoundCode_ReadNextCommand_From_TrackPtr_y

	@96D4:
	cpx #$05
	beq _loc_16C9		; $96C9 @96C9
	cpx #$02
	beq _loc_16C9		; $96C9 @96C9
	cpx #$04
	beq _loc_16C9		; $96C9 @96C9
SoundCode_TickForSquareWaveChannel:
	lda #$41
	sta Sound_TempPtr015C_lo
	lda Sound_FlagsC3_Channel0_square0,x
	bit Sound_TempPtr015C_lo
	beq @96EE
	bne _loc_16C9		; $96C9 @96C9
	@96EE:
	lda #$00
	sta SoundEffectRelatedPtrLo
	dec Sound_TabUnknown014E,x
	bne @9703
	inc Sound_TabUnknown0152,x
	jsr _func_1C64
	jsr _func_1CBB
	jsr _func_1BB7
	@9703:
	lda Sound_EffectTableIndex,x
	and #$80
	beq @9718
	lda Sound_EffectRelatedBytesRead,x
	beq @9723
	dec Sound_EffectRelatedBytesRead,x
	inc Sound_TabUnknown0140,x
	jmp @9723

	@9718:
	dec Sound_EffectTableResultHiNibble,x
	bne @9723
	inc Sound_EffectRelatedBytesRead,x
	jsr _func_1CC6
	@9723:
	 lda Sound_CacheAPUreg0and1_twonibbles,x
	sta SoundEffectRelatedPtrHi
	lda Sound_SongPausedFlag_Channel0_square0,x
	cmp Sound_TabUnknown013A_squarewavesonly,x
	bcs @9744
	dec Sound_TabUnknown013C_squarewavesonly,x
	bne @9741
	lda Sound_TabUnknown0138,x
	lsr a
	lsr a
	lsr a
	lsr a
	sta Sound_TabUnknown013C_squarewavesonly,x
	inc Sound_TabUnknown0140,x
	@9741:
	jsr _func_1D20
	@9744:
	 jsr _func_1CED
	jsr Sound_SetCarry_If_X_is_00_and_B4_is_nonzero
	bcs @974F
	jmp Sound_PokeChannelSoundRegister0_preserveAX

	@974F:
	rts
;------------------------------------------
SoundCode_ReadNextCommand_From_TrackPtr_ypp:
	iny
SoundCode_ReadNextCommand_From_TrackPtr_y:
	lda (SoundTrackPtrLo),y
	cmp #$FB
	bcs Sound_TrackCommandFBtoFF
	jmp Sound_TrackCommand00toFA
;------------------------------------------
Sound_TrackCommandFBtoFF:
	sec
	sbc #$FB
	jsr Sound_JumpWithParams
_JumpPointerTable_1760:
	.word (Sound_TrackCommandFBtoFC_LoopBegin) ;976A (176A) ()
	.word (Sound_TrackCommandFBtoFC_LoopBegin) ;976A (176A) ()
	.word (Sound_TrackCommandFD_Gosub_FollowedByGosubAddress) ;977B (177B) ()
	.word (Sound_TrackCommandFE_LoopEnd_FollowedByLoopCount_Or_FF_and_gotoAddress) ;978D (178D) ()
	.word (Sound_TrackCommandFF_Return) ;97D2 (17D2) ()
Sound_TrackCommandFBtoFC_LoopBegin:
	jsr Sound_Set_TrackDataPointer1_From_TrackPtr_y
	lda Sound_TrackDataPointer1Lo_Channel0_square0,x
	sta Sound_LoopBeginPointerLo_Channel0_square0,x
	lda Sound_TrackDataPointer1Hi_Channel0_square0,x
	sta Sound_LoopBeginPointerHi_Channel0_square0,x
	jsr Sound_Set_TrackPtr_From_TrackDataPointer1
	jmp SoundCode_ReadNextCommand_From_TrackPtr_y
;------------------------------------------
Sound_TrackCommandFD_Gosub_FollowedByGosubAddress:
	lda Sound_FlagsC3_Channel0_square0,x
	ora #$02
	sta Sound_FlagsC3_Channel0_square0,x
	jsr Sound_Fetch_TrackDataPointer1
	jsr Sound_Set_ReturnPointer_From_TrackPtr_y
	jsr Sound_Set_TrackPtr_From_TrackDataPointer1
	jmp SoundCode_ReadNextCommand_From_TrackPtr_y
;------------------------------------------
Sound_TrackCommandFE_LoopEnd_FollowedByLoopCount_Or_FF_and_gotoAddress:
	iny
	lda (SoundTrackPtrLo),y
	cmp #$FF
	beq @97B2
	lda Sound_LoopCounter_Channel0_square0,x
	clc
	adc #$01
	cmp (SoundTrackPtrLo),y
	beq @97BB
	bmi @97A2
	sec
	sbc #$01
	@97A2:
	sta Sound_LoopCounter_Channel0_square0,x
	lda Sound_LoopBeginPointerLo_Channel0_square0,x
	sta Sound_TrackDataPointer1Lo_Channel0_square0,x
	lda Sound_LoopBeginPointerHi_Channel0_square0,x
	sta Sound_TrackDataPointer1Hi_Channel0_square0,x
	jsr Sound_Set_TrackPtr_From_TrackDataPointer1
	jmp SoundCode_ReadNextCommand_From_TrackPtr_y

	@97B2:
	 jsr Sound_Fetch_TrackDataPointer1
	jsr Sound_Set_TrackPtr_From_TrackDataPointer1
	jmp SoundCode_ReadNextCommand_From_TrackPtr_y

	@97BB:
	  lda #$00
	sta Sound_LoopCounter_Channel0_square0,x
	iny
	tya
	clc
	adc SoundTrackPtrLo
	sta Sound_TrackDataPointer1Lo_Channel0_square0,x
	lda #$00
	adc SoundTrackPtrHi
	sta Sound_TrackDataPointer1Hi_Channel0_square0,x
	jsr Sound_Set_TrackPtr_From_TrackDataPointer1
	jmp SoundCode_ReadNextCommand_From_TrackPtr_y
;------------------------------------------
Sound_TrackCommandFF_Return:
	lda Sound_FlagsC3_Channel0_square0,x
	and #$02
	beq @97EC
	lda Sound_FlagsC3_Channel0_square0,x
	and #$FD
	sta Sound_FlagsC3_Channel0_square0,x
	lda Sound_ReturnPointerLo_Channel0_square0,x
	sta Sound_TrackDataPointer1Lo_Channel0_square0,x
	lda Sound_ReturnPointerHi_Channel0_square0,x
	sta Sound_TrackDataPointer1Hi_Channel0_square0,x
	jsr Sound_Set_TrackPtr_From_TrackDataPointer1
	jmp SoundCode_ReadNextCommand_From_TrackPtr_y

	@97EC:
	lda Sound_CurrentSongNumber_Channel0_square0,x
	sta SoundEffectRelatedPtrLo
	lda #$00
	sta Sound_CurrentSongNumber_Channel0_square0,x
	sta Sound_CacheAPUreg3,x
	sta Sound_FlagsC3_Channel0_square0,x
	lda SoundEffectRelatedPtrLo
	cmp #$2F
	bne @9807
	jsr Bank0TerminateSound
	lda #$45
	jmp Bank0PlayTracks

	@9807:
	cpx #$05
	beq @982B
	cpx #$03
	bne @9816
	lda Sound_CurrentSongNumber_Channel0_square0
	beq @9816
	jmp _loc_1E41

	@9816:
	lda #$00
	sta Sound_CacheAPUreg3,x
	sta Sound_FlagsC3_Channel0_square0,x
	cpx #$02
	beq @9823
	lda #$30
	@9823:
	jsr Sound_SetCarry_If_X_is_00_and_B4_is_nonzero
	bcs @982B
	jmp Sound_PokeChannelSoundRegister0_preserveAX

	@982B:
	 rts
;------------------------------------------
Sound_TrackCommand00toFA:
	lda Sound_FlagsC3_Channel0_square0,x
	and #$01
	bne Sound_TrackCommand00toFA_for_NoiseChannel_maybe
	jmp Sound_TrackCommand00toFA_for_NotNoiseChannel_maybe
;------------------------------------------
Sound_TrackCommand00toFA_for_NoiseChannel_maybe:
	lda (SoundTrackPtrLo),y
	and #$F0
	bne Sound_TrackCommand10toFA
	lda Sound_CurrentLogicalChannel
	jsr Sound_JumpWithParams
_JumpPointerTable_1841:
	.word (Sound_TrackCommand00to0F_for_LogicalChannel0_or_1_or_3) ;9856 (1856) ()
	.word (Sound_TrackCommand00to0F_for_LogicalChannel0_or_1_or_3) ;9856 (1856) ()
	.word (Sound_TrackCommand00to0F_for_LogicalChannel2) ;9889 (1889) ()
	.word (Sound_TrackCommand00to0F_for_LogicalChannel0_or_1_or_3) ;9856 (1856) ()
	.word (Sound_TrackCommand00to0F_for_LogicalChannel4) ;9891 (1891) ()
Sound_TrackCommand10toFA:
	lda Sound_ChannelTempoPossibly_Channel0_square0,x
	sta Sound_SongPausedFlag_Channel0_square0,x
	cpx #$04
	bne Sound_TrackCommand00to0F_followedBy00_or_10toFA_for_LogicalChannelNot4
	jmp Sound_TrackCommand00to0F_followedBy00_or_10toFA_for_LogicalChannel4
;------------------------------------------
Sound_TrackCommand00to0F_for_LogicalChannel0_or_1_or_3:
	lda (SoundTrackPtrLo),y
	bne @985D
	jmp @989F

	@985D:
	sta Sound_ChannelTempoPossibly_Channel0_square0,x
	iny
	lda (SoundTrackPtrLo),y
	and #$F0
	sta Sound_CacheAPUreg0and1_twonibbles,x
	iny
	lda Sound_FlagsC3_Channel0_square0,x
	ora #$08
	sta Sound_FlagsC3_Channel0_square0,x
	lda (SoundTrackPtrLo),y
	beq @9876
	cmp #$88
	bne _loc_187C
	@9876:
	lda Sound_FlagsC3_Channel0_square0,x
	and #$F7
	sta Sound_FlagsC3_Channel0_square0,x
_loc_187C:
	lda (SoundTrackPtrLo),y
	jsr Sound_SetCarry_If_X_is_00_and_B4_is_nonzero
	bcs @9886
	jsr Sound_PokeChannelSoundRegister1_preserveAX
	@9886:
	jmp SoundCode_ReadNextCommand_From_TrackPtr_ypp
;------------------------------------------
Sound_TrackCommand00to0F_for_LogicalChannel2:
	lda (SoundTrackPtrLo),y
	sta Sound_ChannelTempoPossibly_Channel0_square0,x
	iny
	jmp _loc_187C
;------------------------------------------
Sound_TrackCommand00to0F_for_LogicalChannel4:
	lda (SoundTrackPtrLo),y
	beq _98C8
	sta Sound_ChannelTempoPossibly_Channel0_square0,x
	lda #$30
	sta Sound_CacheAPUreg0and1_twonibbles,x
	jmp SoundCode_ReadNextCommand_From_TrackPtr_ypp

	@989F:
	 iny
Sound_TrackCommand00to0F_followedBy00_or_10toFA_for_LogicalChannelNot4:
	lda Sound_ChannelTempoPossibly_Channel0_square0,x
	sta Sound_SongPausedFlag_Channel0_square0,x
	lda (SoundTrackPtrLo),y
	lsr a
	lsr a
	lsr a
	lsr a
	ora Sound_CacheAPUreg0and1_twonibbles,x
	jsr Sound_SetCarry_If_X_is_00_and_B4_is_nonzero
	bcs @98B5
	jsr Sound_PokeChannelSoundRegister0_preserveAX
	@98B5:
	lda (SoundTrackPtrLo),y
	and #$07
	sta Sound_CurrentPeriodHi,x
	iny
	lda (SoundTrackPtrLo),y
	sta Sound_CurrentPeriodLo,x
_loc_18C2:
	jsr _func_1B92
	jmp Sound_Set_TrackDataPointer1_From_TrackPtr_y

	_98C8:
	  iny
Sound_TrackCommand00to0F_followedBy00_or_10toFA_for_LogicalChannel4:
	lda Sound_ChannelTempoPossibly_Channel0_square0,x
	sta Sound_SongPausedFlag_Channel0_square0,x
	lda (SoundTrackPtrLo),y
	lsr a
	lsr a
	lsr a
	lsr a
	ora Sound_CacheAPUreg0and1_twonibbles,x
	jsr Sound_PokeChannelSoundRegister0_preserveAX
	lda #$00
	sta Sound_CurrentPeriodHi,x
	lda (SoundTrackPtrLo),y
	and #$0F
	sta Sound_CurrentPeriodLo,x
	jmp _loc_18C2
;------------------------------------------
Sound_TrackCommand00toFA_for_NotNoiseChannel_maybe:
	lda (SoundTrackPtrLo),y
	cmp #$D0
	bcs Sound_TrackCommandD0toFA
	jmp Sound_TrackCommand00toCF_or_10toCF
;------------------------------------------
Sound_TrackCommandD0toFA:
	sec
	sbc #$D0
	lsr a
	lsr a
	lsr a
	lsr a
	jsr Sound_JumpWithParams
_JumpPointerTable_18FB:
	.word (Sound_TrackCommandD0toDF) ;9901 (1901) ()
	.word (Sound_TrackCommandE0toEF) ;995F (195F) ()
	.word (Sound_TrackCommandF0toFA_savesLoNibbleTo13E) ;9987 (1987) ()
Sound_TrackCommandD0toDF:
	lda (SoundTrackPtrLo),y
	and #$0F
	sta Sound_ChannelTempoPossibly_Channel0_square0,x
	iny
	cpx #$05
	bne @990F
	jmp SoundCode_ReadNextCommand_From_TrackPtr_y

	@990F:
	lda (SoundTrackPtrLo),y
	sta Sound_EffectTableResultLoNibble,x
	cpx #$02
	bne @991B
	jmp SoundCode_ReadNextCommand_From_TrackPtr_ypp

	@991B:
	and #$F0
	sta Sound_CacheAPUreg0and1_twonibbles,x
	lda Sound_EffectTableResultLoNibble,x
	and #$0F
	sta Sound_TabUnknown013E,x
	sta Sound_EffectTableResultLoNibble,x
	iny
	cpx #$02
	bne @9933
	jmp SoundCode_ReadNextCommand_From_TrackPtr_ypp

	@9933:
	lda (SoundTrackPtrLo),y
	sta Sound_EffectTableIndex,x
	and #$80
	beq @9943
	lda (SoundTrackPtrLo),y
	and #$0F
	sta Sound_EffectRelatedBytesRead,x
	@9943:
	iny
	lda (SoundTrackPtrLo),y
_loc_1946:
	sta Sound_TabUnknown0138,x
	and #$F0
	bne @9955
	lda Sound_TabUnknown0138,x
	ora #$10
	sta Sound_TabUnknown0138,x
	@9955:
	lsr a
	lsr a
	lsr a
	lsr a
	sta Sound_TabUnknown013C_squarewavesonly,x
	jmp _loc_1991
;------------------------------------------
Sound_TrackCommandE0toEF:
	lda (SoundTrackPtrLo),y
	and #$0F
	cmp #$06
	bcc Sound_TrackCommandE0toE5_savesThisByteTo12E
	sec
	sbc #$06
	jsr Sound_JumpWithParams
_JumpPointerTable_196D:
	.word (Sound_TrackCommandE6_savesNextByteToC9) ;999D (199D) ()
	.word (Sound_TrackCommandE7_savesNextByteTo136) ;99A4 (19A4) ()
	.word (Sound_TrackCommandE8_savesNextTwoNibblesTo138and13C) ;99AD (19AD) ()
	.word (Sound_TrackCommandE9_savesNextByteTo134or129) ;99B3 (19B3) ()
	.word (Sound_TrackCommandEA_savesNextByteTo131) ;99CE (19CE) ()
	.word (Sound_TrackCommandEB_savesNextTwoNibblesTo146and148_andNextByteTo14A) ;99D7 (19D7) ()
	.word (Sound_TrackCommandECtoEF_flag_and_likeEB) ;99F1 (19F1) ()
	.word (Sound_TrackCommandECtoEF_flag_and_likeEB) ;99F1 (19F1) ()
	.word (Sound_TrackCommandECtoEF_flag_and_likeEB) ;99F1 (19F1) ()
	.word (Sound_TrackCommandECtoEF_flag_and_likeEB) ;99F1 (19F1) ()
Sound_TrackCommandE0toE5_savesThisByteTo12E:
	sta Sound_CurrentOctavePossibly,x
	jmp _loc_1991
;------------------------------------------
Sound_TrackCommandF0toFA_savesLoNibbleTo13E:
	lda (SoundTrackPtrLo),y
	and #$0F
	sta Sound_TabUnknown013E,x
	jmp _loc_1991
;------------------------------------------
_loc_1991:
	iny
	lda (SoundTrackPtrLo),y
	and #$F0
	cmp #$E0
	beq Sound_TrackCommandE0toEF
	jmp SoundCode_ReadNextCommand_From_TrackPtr_y
;------------------------------------------
Sound_TrackCommandE6_savesNextByteToC9:
	iny
	lda (SoundTrackPtrLo),y
	sta Sound_ChannelTempoPossibly_Channel0_square0,x
	bne _loc_1991
Sound_TrackCommandE7_savesNextByteTo136:
	iny
	lda (SoundTrackPtrLo),y
	sta Sound_EffectTableIndex,x
	jmp _loc_1991
;------------------------------------------
Sound_TrackCommandE8_savesNextTwoNibblesTo138and13C:
	iny
	lda (SoundTrackPtrLo),y
	jmp _loc_1946
;------------------------------------------
Sound_TrackCommandE9_savesNextByteTo134or129:
	lda #$0F
	sta Sound_TempPtr015C_lo
	iny
	lda (SoundTrackPtrLo),y
	beq @99C2
	bit Sound_TempPtr015C_lo
	beq @99C8
	@99C2:
	sta Sound_TabUnknown0134,x
	jmp _loc_1991

	@99C8:
	 sta Sound_CacheAPUreg0and1_twonibbles,x
	jmp _loc_1991
;------------------------------------------
Sound_TrackCommandEA_savesNextByteTo131:
	iny
	lda (SoundTrackPtrLo),y
	sta Sound_TabUnknown0131,x
	jmp _loc_1991
;------------------------------------------
Sound_TrackCommandEB_savesNextTwoNibblesTo146and148_andNextByteTo14A:
	iny
	lda (SoundTrackPtrLo),y
	and #$0F
	sta Sound_TabUnknown0146,x
	lda (SoundTrackPtrLo),y
	lsr a
	lsr a
	lsr a
	lsr a
	sta Sound_TabUnknown0148,x
	iny
	lda (SoundTrackPtrLo),y
	sta Sound_EffectRelated_Index,x
	jmp _loc_1991
;------------------------------------------
Sound_TrackCommandECtoEF_flag_and_likeEB:
	lda #$0F
	sta Sound_TempPtr015C_lo
	iny
	lda (SoundTrackPtrLo),y
	beq @9A00
	bit Sound_TempPtr015C_lo
	beq @9A06
	@9A00:
	sta Sound_TabUnknown0134,x
	jmp @9A09

	@9A06:
	 sta Sound_CacheAPUreg0and1_twonibbles,x
	@9A09:
	  iny
	lda (SoundTrackPtrLo),y
	and #$0F
	sta Sound_TabUnknown0146,x
	lda (SoundTrackPtrLo),y
	lsr a
	lsr a
	lsr a
	lsr a
	sta Sound_TabUnknown0148,x
	iny
	lda (SoundTrackPtrLo),y
	sta Sound_EffectRelated_Index,x
	iny
	jmp Sound_TrackCommandD0toDF
;------------------------------------------
_loc_1A24:
	lda (SoundTrackPtrLo),y
	lsr a
	lsr a
	lsr a
	lsr a
	cmp #$0C
	beq @9A46
	tax
	cmp #$0A
	bne @9A3A
	lda #$03
	jsr Bank0PlayTracks
	ldx #$0A
	@9A3A:
	lda _data_1A47_indexed,x
	sta Sound_StartSong_LatestSongIndex
	jsr Bank0PlayTracks
	ldx Sound_CurrentLogicalChannel
	@9A46:
	 rts
;------------------------------------------
_data_1A47_indexed:
	.byte $02,$02,$02,$02,$03,$03,$03,$03,$03,$04,$5D,$5E
Sound_TrackCommand00toCF_or_10toCF:
	jsr Sound_Set_TrackDataPointer1_From_TrackPtr_y
	dey
	lda (SoundTrackPtrLo),y
	and #$0F
	sta SoundEffectRelatedPtrLo
	beq @9A6A
	lda Sound_ChannelTempoPossibly_Channel0_square0,x
	clc
	@9A62:
	adc Sound_ChannelTempoPossibly_Channel0_square0,x
	dec SoundEffectRelatedPtrLo
	bne @9A62
	beq @9A6C
	@9A6A:
	lda Sound_ChannelTempoPossibly_Channel0_square0,x
	@9A6C:
	 sta Sound_SongPausedFlag_Channel0_square0,x
	cpx #$05
	bne @9A75
	jmp _loc_1A24

	@9A75:
	lda (SoundTrackPtrLo),y
	and #$F0
	cmp #$C0
	bne @9AA2
	lda #$40
	ora Sound_FlagsC3_Channel0_square0,x
	sta Sound_FlagsC3_Channel0_square0,x
	cpx #$02
	beq @9A95
	lda #$30
	ora Sound_CacheAPUreg0and1_twonibbles,x
	jsr Sound_SetCarry_If_X_is_00_and_B4_is_nonzero
	bcs @9A94
	jmp Sound_PokeChannelSoundRegister0_preserveAX

	@9A94:
	rts

	@9A95:
	 lda #$00
	jsr Sound_PokeChannelSoundRegister0_preserveAX
	lda #$FF
	sta Sound_CacheAPUreg3_Channel2_Triangle
	jmp Sound_PokeChannelSoundRegister3_preserveAX

	@9AA2:
	  lda Sound_FlagsC3_Channel0_square0,x
	and #$BF
	sta Sound_FlagsC3_Channel0_square0,x
	cpx #$02
	bne @9AEE
	lda Sound_EffectTableResultLoNibble,x
	cmp #$81
	bcs @9AD2
	lda (SoundTrackPtrLo),y
	and #$0F
	sta SoundEffectRelatedPtrLo
	sta Sound_PeriodTemp_Unknown9B_lo
	beq @9AD2
	lda Sound_EffectTableResultLoNibble,x
	clc
	@9AC1:
	adc Sound_EffectTableResultLoNibble,x
	cmp #$81
	bcs @9ACC
	dec SoundEffectRelatedPtrLo
	bne @9AC1
	@9ACC:
	clc
	adc Sound_PeriodTemp_Unknown9B_lo
	jmp @9AD5

	@9AD2:
	 lda Sound_EffectTableResultLoNibble,x
	@9AD5:
	  sta Sound_PeriodTemp_Unknown9B_lo
	lda Sound_FlagsC3_Channel0_square0,x
	and #$80
	beq @9AE9
	lda #$FF
	sta Sound_CacheAPUreg3_Channel2_Triangle
	jsr Sound_PokeChannelSoundRegister3_preserveAX
	lda #$00
	beq @9AEB

	@9AE9:
	lda Sound_PeriodTemp_Unknown9B_lo
	@9AEB:
	 jmp _loc_1B5E

	@9AEE:
	   lda Sound_TabUnknown0138,x
	and #$0F
	sta SoundEffectRelatedPtrLo
	beq @9B16
	lda #$00
	sta SoundEffectRelatedPtrHi
	@9AFB:
	clc
	adc Sound_SongPausedFlag_Channel0_square0,x
	bcc @9B02
	inc SoundEffectRelatedPtrHi
	@9B02:
	dec SoundEffectRelatedPtrLo
	bne @9AFB
	sta SoundEffectRelatedPtrLo
	lda #$04
	sta Sound_PeriodTemp_Unknown9B_lo
	@9B0C:
	lsr SoundEffectRelatedPtrHi
	ror SoundEffectRelatedPtrLo
	dec Sound_PeriodTemp_Unknown9B_lo
	bne @9B0C
	lda SoundEffectRelatedPtrLo
	@9B16:
	 sta Sound_TabUnknown013A_squarewavesonly,x
	lda #$00
	sta Sound_EffectRelatedBytesRead,x
	sta Sound_EffectRelatedBytesRead_Copy,x
	sta Sound_EffectRelatedLoopCounter,x
	sta Sound_TabUnknown0140,x
	sta Sound_TabUnknown0152,x
	sta Sound_TabUnknown0156,x
	sta Sound_TabUnknown015A,x
	lda #$01
	sta Sound_EffectTableResultHiNibble,x
	lda Sound_TabUnknown0148,x
	sta Sound_TabUnknown014E,x
	lda #$80
	sta Sound_TempPtr015C_lo
	lda Sound_EffectTableIndex,x
	bit Sound_TempPtr015C_lo
	bne @9B4E
	jsr _func_1CC6
	jmp @9B53

	@9B4E:
	and #$0F
	sta Sound_EffectRelatedBytesRead,x
	@9B53:
	 jsr _func_1D2F
	jsr _func_1CED
	jsr Sound_SetCarry_If_X_is_00_and_B4_is_nonzero
	bcs _loc_1B61
_loc_1B5E:
	jsr Sound_PokeChannelSoundRegister0_preserveAX
_loc_1B61:
	lda (SoundTrackPtrLo),y
	lsr a
	lsr a
	lsr a
	lsr a
	sta SoundEffectRelatedPtrLo
	jsr _func_1C4D
	clc
	adc SoundEffectRelatedPtrLo
	clc
	adc #$0C
	asl a
	tay
	lda SoundPeriodTable,y
	sta Sound_CurrentPeriodLo,x
	lda SoundPeriodTableHi,y
	sta Sound_CurrentPeriodHi,x
	ldy Sound_CurrentOctavePossibly,x
	@9B83:
	tya
	cmp #$05
	beq _func_1B92
	lsr Sound_CurrentPeriodHi,x
	ror Sound_CurrentPeriodLo,x
	iny
	jmp @9B83
;------------------------------------------
_func_1B92:
	lda Sound_CurrentPeriodHi,x
	ora #$08
	sta Sound_CurrentPeriodHi,x
	jsr _func_1CBB
	lda #$00
	sta SoundEffectRelatedPtrLo
	cpx #$02
	beq _9BED
	cpx #$04
	beq _func_1BB7
	lda Sound_FlagsC3_Channel0_square0,x
	and #$01
	bne _func_1BB7
	lda Sound_TabUnknown014E,x
	bne _func_1BB7
	jsr _func_1C64
_func_1BB7:
	lda SoundEffectRelatedPtrLo
	bmi @9BC9
	lda Sound_PeriodTemp_Unknown9B_lo
	clc
	adc SoundEffectRelatedPtrLo
	sta Sound_PeriodTemp_Unknown9B_lo
	bcc @9BD4
	inc Sound_PeriodTemp_Unknown9B_hi
	jmp @9BD4

	@9BC9:
	lda Sound_PeriodTemp_Unknown9B_lo
	clc
	adc SoundEffectRelatedPtrLo
	sta Sound_PeriodTemp_Unknown9B_lo
	bcs @9BD4
	dec Sound_PeriodTemp_Unknown9B_hi
	@9BD4:
	 lda Sound_PeriodTemp_Unknown9B_hi
	cmp Sound_CacheAPUreg3,x
	bne @9BEA
	lda Sound_CacheAPUreg0and1_twonibbles,x
	and #$10
	beq _9BED
	lda Sound_FlagsC3_Channel0_square0,x
	and #$08
	bne _9BED
	beq _9BF7
	@9BEA:
	sta Sound_CacheAPUreg3,x
_9BED:
	  lda Sound_PeriodTemp_Unknown9B_hi
	jsr Sound_SetCarry_If_X_is_00_and_B4_is_nonzero
	bcs _9BF7
	jsr Sound_PokeChannelSoundRegister3_preserveAX
_9BF7:
	   lda Sound_PeriodTemp_Unknown9B_lo
	sta Sound_CacheAPUreg2,x
	jsr Sound_SetCarry_If_X_is_00_and_B4_is_nonzero
	bcs @9C04
	jsr Sound_PokeChannelSoundRegister2_preserveAX
	@9C04:
	rts
;------------------------------------------
SoundPeriodTable:
	.byte $5C
SoundPeriodTableHi:
	.byte $0D
SoundPeriodTable2:
	.word $0C9C,$0BE8,$0B3C,$0A9A,$0A02,$0972,$08EA,$086A
	.word $07F2,$0780,$0714,$06AE,$064E,$05F4,$059E,$054D
	.word $0501,$04B9,$0475,$0435,$03F9,$03C0,$038A,$0357
	.word $0327,$02FA,$02CF,$02A7,$0281,$025D,$023B,$021B
	.word $01FC,$01E0,$01C5
_func_1C4D:
	lda #$80
	sta Sound_TempPtr015C_lo
	lda Sound_TabUnknown0131,x
	bit Sound_TempPtr015C_lo
	beq @9C63
	and #$0F
	sta SoundEffectRelatedPtrHi
	lda #$00
	sec
	sbc SoundEffectRelatedPtrHi
	@9C63:
	rts
;------------------------------------------
_func_1C64:
	lda #$00
	sta SoundEffectRelatedPtrLo
	lda Sound_EffectRelated_Index,x
	asl a
	sty Sound_TempA5
	tay
	lda SoundEffectRelatedTable,y
	sta SoundEffectRelatedPtrLo
	lda SoundEffectRelatedTable+1,y
	sta SoundEffectRelatedPtrHi
	stx Sound_TempA5
	lda #$02
	clc
	adc Sound_TempA5
	tax
	jsr Sound_EffectRelatedCommandReadNext
	ldx Sound_TempA5
	lda SoundEffectRelatedPtrLo
	lsr a
	lsr a
	lsr a
	lsr a
	sta Sound_TabUnknown014E,x
	lda SoundEffectRelatedPtrLo
	and #$0F
	sta SoundEffectRelatedPtrLo
	ldy Sound_TabUnknown0146,x
	bne @9C9D
	tya
	beq @9CB6
	@9C9D:
	lda #$08
	sta Sound_TempPtr015C_lo
	lda SoundEffectRelatedPtrLo
	bit Sound_TempPtr015C_lo
	beq @9CAD
	ora #$F0
	sta SoundEffectRelatedPtrLo
	@9CAD:
	  dey
	beq @9CB6
	clc
	adc SoundEffectRelatedPtrLo
	jmp @9CAD

	@9CB6:
	 sta SoundEffectRelatedPtrLo
	ldy Sound_TempA5
	rts
;------------------------------------------
_func_1CBB:
	lda Sound_CurrentPeriodLo,x
	sta Sound_PeriodTemp_Unknown9B_lo
	lda Sound_CurrentPeriodHi,x
	sta Sound_PeriodTemp_Unknown9B_hi
	rts
;------------------------------------------
_func_1CC6:
	lda Sound_EffectTableIndex,x
	asl a
	sty Sound_TempA5
	tay
	lda SoundEffectTable,y
	sta SoundEffectRelatedPtrLo
	lda SoundEffectTable+1,y
	sta SoundEffectRelatedPtrHi
	jsr Sound_EffectRelatedCommandReadNext
	lda SoundEffectRelatedPtrLo
	and #$0F
	sta Sound_EffectTableResultLoNibble,x
	lda SoundEffectRelatedPtrLo
	lsr a
	lsr a
	lsr a
	lsr a
	sta Sound_EffectTableResultHiNibble,x
	ldy Sound_TempA5
	rts
;------------------------------------------
_func_1CED:
	lda Sound_TabUnknown0134,x
	and #$04
	beq Sound_CalculateMomentaryVolume
	lda #$02
	sta SoundEffectRelatedPtrLo
	lda Sound_SongPausedFlag_Channel0_square0,x
	cmp Sound_TabUnknown013A_squarewavesonly,x
	bcc _loc_1D1B
Sound_CalculateMomentaryVolume:
	lda Sound_EffectTableResultLoNibble,x
	beq @9D19
	sec
	sbc Sound_TabUnknown013E,x
	bcc @9D17
	sec
	sbc Sound_TabUnknown0140,x
	bcc @9D17
	sec
	sbc Sound_FadeMode
	beq @9D17
	bcs @9D19
	@9D17:
	lda #$01
	@9D19:
	 sta SoundEffectRelatedPtrLo
_loc_1D1B:
	lda SoundEffectRelatedPtrHi
	ora SoundEffectRelatedPtrLo
	rts
;------------------------------------------
_func_1D20:
	lda Sound_TabUnknown0134,x
	and #$02
	beq @9D2E
	lda Sound_TabUnknown0134,x
	and #$F0
	sta SoundEffectRelatedPtrHi
	@9D2E:
	rts
;------------------------------------------
_func_1D2F:
	lda Sound_CacheAPUreg0and1_twonibbles,x
	sta SoundEffectRelatedPtrHi
	lda #$01
	sta Sound_TempPtr015C_lo
	lda Sound_TabUnknown0134,x
	bit Sound_TempPtr015C_lo
	beq _loc_1D1B
	and #$F0
	sta SoundEffectRelatedPtrHi
	jmp _loc_1D1B
;------------------------------------------
Sound_EffectRelatedCommandReadNext:
	ldy Sound_EffectRelatedBytesRead,x
	lda (SoundEffectRelatedPtrLo),y
	cmp #$FB
	bcc Sound_EffectRelatedCommand00toFA_ReturnWithA
	sec
	sbc #$FB
	jsr Sound_JumpWithParams
_JumpPointerTable_1D57:
	.word (Sound_EffectRelatedCommandFBtoFD_BeginLoop) ;9D64 (1D64) ()
	.word (Sound_EffectRelatedCommandFBtoFD_BeginLoop) ;9D64 (1D64) ()
	.word (Sound_EffectRelatedCommandFBtoFD_BeginLoop) ;9D64 (1D64) ()
	.word (Sound_EffectRelatedCommandFE_LoopUntil) ;9D70 (1D70) ()
	.word (Sound_EffectRelatedCommandFF_End_ReturnWithPreviousA) ;9D8D (1D8D) ()
Sound_EffectRelatedCommand00toFA_ReturnWithA:
	sta SoundEffectRelatedPtrLo
	rts
;------------------------------------------
Sound_EffectRelatedCommandFBtoFD_BeginLoop:
	inc Sound_EffectRelatedBytesRead,x
	lda Sound_EffectRelatedBytesRead,x
	sta Sound_EffectRelatedBytesRead_Copy,x
	jmp Sound_EffectRelatedCommandReadNext
;------------------------------------------
Sound_EffectRelatedCommandFE_LoopUntil:
	iny
	lda (SoundEffectRelatedPtrLo),y
	cmp Sound_EffectRelatedLoopCounter,x
	beq @9D84
	inc Sound_EffectRelatedLoopCounter,x
	lda Sound_EffectRelatedBytesRead_Copy,x
	sta Sound_EffectRelatedBytesRead,x
	jmp Sound_EffectRelatedCommandReadNext

	@9D84:
	inc Sound_EffectRelatedBytesRead,x
	inc Sound_EffectRelatedBytesRead,x
	jmp Sound_EffectRelatedCommandReadNext
;------------------------------------------
Sound_EffectRelatedCommandFF_End_ReturnWithPreviousA:
	dec Sound_EffectRelatedBytesRead,x
	jmp Sound_EffectRelatedCommandReadNext
;------------------------------------------
SoundCode_JustDoEightNOPs_28cyclesOfDelay:
                            ; Delay loop begin: 16 cycles (2.0 cycles per byte); ends at $1D9B:
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
                            ; End of delay loop (8 bytes):
	rts
;------------------------------------------
Sound_Set_TrackPtr_From_TrackDataPointer1:
	ldy #$00
	lda Sound_TrackDataPointer1Lo_Channel0_square0,x
	sta SoundTrackPtrLo
	lda Sound_TrackDataPointer1Hi_Channel0_square0,x
	sta SoundTrackPtrHi
	rts
;------------------------------------------
Sound_Set_TrackDataPointer1_From_TrackPtr_y:
	iny
	tya
	clc
	adc SoundTrackPtrLo
	sta Sound_TrackDataPointer1Lo_Channel0_square0,x
	bcc @9DB6
	lda SoundTrackPtrHi
	adc #$00
	sta Sound_TrackDataPointer1Hi_Channel0_square0,x
	@9DB6:
	rts
;------------------------------------------
Sound_Fetch_TrackDataPointer1:
	iny
	lda (SoundTrackPtrLo),y
	sta Sound_TrackDataPointer1Lo_Channel0_square0,x
	iny
	lda (SoundTrackPtrLo),y
	sta Sound_TrackDataPointer1Hi_Channel0_square0,x
	rts
;------------------------------------------
Sound_Set_ReturnPointer_From_TrackPtr_y:
	iny
	tya
	clc
	adc SoundTrackPtrLo
	sta Sound_ReturnPointerLo_Channel0_square0,x
	lda SoundTrackPtrHi
	adc #$00
	sta Sound_ReturnPointerHi_Channel0_square0,x
	rts
;------------------------------------------
Sound_PokeChannelSoundRegister0_preserveAX:
	jsr Sound_TranslateChannelToRegisterOffset_PreserveA
	sta APU_HW__4000_Reg0,x
	jmp Sound_PokeChannel_Common_RestoreX
;------------------------------------------
Sound_PokeChannelSoundRegister1_preserveAX:
	jsr Sound_TranslateChannelToRegisterOffset_PreserveA
	sta APU_HW__4001_Reg1_SweepControl,x
	jmp Sound_PokeChannel_Common_RestoreX
;------------------------------------------
Sound_PokeChannelSoundRegister2_preserveAX:
	jsr Sound_TranslateChannelToRegisterOffset_PreserveA
	sta APU_HW__4002_Reg2_WaveLengthLo,x
	jmp Sound_PokeChannel_Common_RestoreX
;------------------------------------------
Sound_PokeChannelSoundRegister3_preserveAX:
	jsr Sound_TranslateChannelToRegisterOffset_PreserveA
	sta APU_HW__4003_Reg3_WaveLengthHi,x
	jmp Sound_PokeChannel_Common_RestoreX
;------------------------------------------
Sound_TranslateChannelToRegisterOffset_PreserveA:
	sta SoundEffectRelatedPtrLo
	jsr Sound_TranslateChannelToRegisterOffset
	lda SoundEffectRelatedPtrLo
	rts
;------------------------------------------
Sound_PokeChannel_Common_RestoreX:
	jsr SoundCode_JustDoEightNOPs_28cyclesOfDelay
	ldx Sound_CurrentLogicalChannel
	rts
;------------------------------------------
Sound_ChannelRegisterOffsetTable:
	.byte $00,$04,$08,$00,$0C,$0C
Sound_TranslateChannelToRegisterOffset:
	lda Sound_ChannelRegisterOffsetTable,x
	tax
	rts
;------------------------------------------
Sound_SetCarry_If_X_is_00_and_B4_is_nonzero:
	pha
	 cpx #$00
	 bne @9E1C
	 lda Sound_CurrentSongNumber_Channel3_effectsquare
	 beq @9E1C
	 bne @9E19
	@9E19:
	 sec
	pla
	rts

	@9E1C:
	 clc
	pla
	rts
;------------------------------------------
SoundCode_MuteAllChannelsButDontDisableThem:
	lda #$30
	sta APU_HW__4000_Reg0
	jsr SoundCode_JustDoEightNOPs_28cyclesOfDelay
	sta APU_HW__4004_Reg0_channel1
	jsr SoundCode_JustDoEightNOPs_28cyclesOfDelay
	sta APU_HW__400C_Reg0_channel3
	jsr SoundCode_JustDoEightNOPs_28cyclesOfDelay
	lda #$00
	sta APU_HW__4008_Reg0_channel2
	lda #$FF
	sta Sound_CacheAPUreg3_Channel2_Triangle
	sta APU_HW__400B_Reg3_channel2_WaveLengthHi
	rts
;------------------------------------------
_loc_1E41:
	ldx #$00
	lda Sound_CacheAPUreg0and1_twonibbles,x
	sta SoundEffectRelatedPtrHi
	lda #$00
	sta SoundEffectRelatedPtrLo
	lda #$7F
	sta APU_HW__4001_Reg1_SweepControl
	jsr SoundCode_JustDoEightNOPs_28cyclesOfDelay
	lda Sound_CacheAPUreg2
	sta APU_HW__4002_Reg2_WaveLengthLo
	jsr SoundCode_JustDoEightNOPs_28cyclesOfDelay
	lda Sound_CacheAPUreg3
	sta APU_HW__4003_Reg3_WaveLengthHi
	jsr SoundCode_JustDoEightNOPs_28cyclesOfDelay
	lda Sound_CurrentSongNumber_Channel0_square0
	beq @9E73
	lda Sound_FlagsC3_Channel0_square0
	and #$40
	bne @9E73
	jsr Sound_CalculateMomentaryVolume
	@9E73:
	lda SoundEffectRelatedPtrHi
	ora SoundEffectRelatedPtrLo
	jsr Sound_PokeChannelSoundRegister0_preserveAX
	ldx Sound_CurrentLogicalChannel
	rts
;------------------------------------------
Sound_JumpWithParams:
	asl a
	stx Sound_TempPtr015C_hi
	sty Sound_TempPtr015C_lo
	tay
	iny
	pla
	sta Sound_TempPtrA7_lo
	pla
	sta Sound_TempPtrA7_hi
	lda (Sound_TempPtrA7_lo),y
	tax
	iny
	lda (Sound_TempPtrA7_lo),y
	sta Sound_TempPtrA7_hi
	stx Sound_TempPtrA7_lo
	ldy Sound_TempPtr015C_lo
	ldx Sound_TempPtr015C_hi
	jmp (Sound_TempPtrA7_lo)
	.byte $FF
SoundData55_PasswordSong_ch1:
	.byte $DA,$70,$20,$17,$FB,$E3,$00,$10,$20,$30,$20,$10,$FE,$06,$F1,$EA
	.byte $07,$FB,$E2,$00,$10,$20,$30,$20,$10,$F2,$FE,$02,$EA,$00,$EB,$91
	.byte $0D,$DA,$70,$22,$35,$E2,$AB,$E3,$6B,$E7,$21,$EB,$0F,$0E,$E2,$A2
	.byte $EB,$1F,$0E,$F2,$A2,$EB,$2F,$0E,$F3,$A2,$EB,$3F,$0E,$F4,$A2,$EB
	.byte $01,$0D,$F0,$E4,$60,$E3,$60,$E2,$60,$F2,$E4,$60,$E3,$60,$E2,$60
	.byte $F3,$E4,$60,$E3,$60,$E2,$60,$F4,$E4,$60,$E3,$60,$E2,$60,$FE,$FF
	.byte $A1,$9E
SoundData56_PasswordSong_ch0:
	.byte $EB,$11,$00,$DA,$70,$20,$17,$E3,$00,$F2,$FB,$E3,$00,$10,$20,$30
	.byte $20,$10,$EB,$21,$00,$FE,$03,$E3,$00,$10,$20,$30,$20,$EB,$31,$00
	.byte $F1,$FB,$E2,$00,$10,$20,$30,$20,$10,$EB,$41,$00,$FE,$04,$EB,$01
	.byte $00,$FB,$F0,$E2,$00,$10,$20,$30,$20,$10,$F3,$00,$10,$20,$30,$20
	.byte $10,$FE,$04,$FE,$FF,$03,$9F
SoundData57_PasswordSong_ch2:
	.byte $DA,$90,$E3,$0B,$1B,$0B,$1B,$DA,$15,$FB,$E3,$00,$70,$00,$70,$E2
	.byte $00,$E3,$70,$00,$70,$00,$70,$E2,$00,$E3,$70,$E4,$80,$E3,$30,$E4
	.byte $80,$E3,$60,$50,$40,$E4,$80,$E3,$30,$E4,$80,$E3,$60,$50,$40,$FE
	.byte $02,$FE,$FF,$4A,$9F
SoundData58_PasswordSong_ch5:
	.byte $DA,$BB,$B8,$A0,$A0,$A0,$BB,$B8,$B0,$A0,$A0,$C2,$B5,$B5,$B5,$B0
	.byte $A0,$A3,$B5,$B1,$A3,$B2,$B0,$B0,$B0,$A0,$A0,$A0,$FE,$FF,$7F,$9F
SoundData51_GameOverSong_ch1:
	.byte $E9,$34,$D1,$77,$82,$15,$F2,$E4,$46,$F1,$E3,$B0,$E2,$B5,$E3,$90
	.byte $E2,$95,$E3,$B0,$E2,$B5,$E3,$70,$E2,$75,$E3,$B0,$E2,$B5,$E3,$60
	.byte $E2,$65,$E3,$B0,$E2,$B5,$E3,$40,$E2,$45,$E3,$B0,$E2,$B5,$E3,$30
	.byte $E2,$35,$E3,$B0,$E2,$B5,$E3,$40,$E2,$45,$E3,$B0,$E2,$B5,$E3,$60
	.byte $E2,$65,$E3,$B0,$E2,$B5,$E8,$16,$F0,$E6,$07,$EB,$01,$0B,$41,$E3
	.byte $E6,$09,$B1,$E6,$0A,$91,$B1,$DF,$70,$1F,$00,$47,$FF
SoundData52_GameOverSong_ch0:
	.byte $EA,$8C,$EB,$01,$00,$E9,$34,$D1,$77,$82,$15,$F1,$E5,$46,$E3,$B0
	.byte $E2,$B5,$E3,$90,$E2,$95,$E3,$B0,$E2,$B5,$E3,$70,$E2,$75,$E3,$B0
	.byte $E2,$B5,$E3,$60,$E2,$65,$E3,$B0,$E2,$B5,$E3,$40,$E2,$45,$E3,$B0
	.byte $E2,$B5,$E3,$30,$E2,$35,$E3,$B0,$E2,$B5,$E3,$40,$E2,$45,$E3,$B0
	.byte $E2,$B5,$E3,$60,$E2,$65,$E3,$B0,$E2,$B5,$46,$C1,$F2,$EA,$00,$E8
	.byte $16,$E6,$07,$EB,$01,$0C,$41,$E3,$E6,$09,$B1,$E6,$0A,$91,$E6,$01
	.byte $BA,$DF,$70,$1F,$00,$47,$FF
SoundData53_GameOverSong_ch2:
	.byte $DE,$1B,$E3,$40,$60,$70,$90,$B0,$90,$70,$90,$D7,$90,$E4,$E4,$41
	.byte $D9,$90,$41,$DA,$90,$91,$91,$DF,$90,$47,$FF
SoundData54_GameOverSong_ch5:
	.byte $DD,$B0,$FF
SoundData49_RuinsSong_ch1:
	.byte $EA,$00,$EB,$00,$00,$E9,$34,$D1,$70,$19,$17,$FB,$E5,$90,$E4,$9A
	.byte $20,$E3,$2A,$E4,$50,$E3,$5A,$F1,$E4,$90,$E3,$9A,$20,$E2,$2A,$E3
	.byte $50,$E2,$5A,$F0,$E3,$90,$E2,$9A,$E3,$50,$E2,$5A,$E3,$20,$E2,$2A
	.byte $F1,$E4,$90,$E3,$9A,$E4,$50,$E3,$5A,$E4,$20,$E3,$2A,$F0,$E5,$50
	.byte $E4,$5A,$E5,$A0,$E4,$AA,$10,$E3,$1A,$F1,$E4,$50,$E3,$5A,$E4,$A0
	.byte $E3,$AA,$10,$E2,$1A,$F0,$E3,$50,$E2,$5A,$E3,$10,$E2,$1A,$E4,$A0
	.byte $E3,$AA,$F1,$70,$E2,$7A,$E3,$30,$E2,$3A,$E4,$A0,$E3,$AA,$FE,$02
	.byte $EA,$03,$FB,$F1,$E5,$90,$E4,$9A,$20,$E3,$2A,$E4,$50,$E3,$5A,$F0
	.byte $E4,$90,$E3,$9A,$20,$E2,$2A,$E3,$50,$E2,$5A,$F1,$E3,$90,$E2,$9A
	.byte $E3,$50,$E2,$5A,$E3,$20,$E2,$2A,$F2,$E4,$90,$E3,$9A,$E4,$50,$E3
	.byte $5A,$E4,$20,$E3,$2A,$F1,$E5,$50,$E4,$5A,$E5,$A0,$E4,$AA,$E4,$10
	.byte $E3,$1A,$F0,$E4,$50,$E3,$5A,$E4,$A0,$E3,$AA,$10,$E2,$1A,$E3,$50
	.byte $E2,$5A,$E3,$10,$E2,$1A,$E4,$A0,$E3,$AA,$E3,$70,$E2,$7A,$E3,$30
	.byte $E2,$3A,$E4,$A0,$E3,$AA,$FE,$02,$FE,$FF,$81,$A0
SoundData4A_RuinsSong_ch0:
	.byte $EA,$00,$E9,$34,$DC,$70,$1B,$17,$EB,$01,$00,$E4,$90,$F0,$90,$E3
	.byte $20,$50,$F1,$90,$E2,$20,$50,$F0,$90,$50,$20,$F1,$E3,$90,$50,$20
	.byte $F0,$E4,$50,$A0,$E3,$10,$F1,$50,$A0,$E2,$10,$F0,$50,$10,$E3,$A0
	.byte $F1,$E2,$70,$30,$E3,$A0,$EB,$02,$00,$F0,$E4,$90,$E3,$20,$50,$F1
	.byte $90,$E2,$20,$50
DataTableEntry_21A1:
	.byte $F0,$90,$50,$20,$F1,$E3,$90,$50,$20,$EB,$03,$00,$F0,$E4,$50,$A0
	.byte $E3,$10,$F1,$50,$A0,$E2,$10,$F0,$50,$10,$E3,$A0,$F1,$E2,$70,$30
	.byte $EA,$03,$E9,$75,$D1,$30,$19,$17,$E4,$93,$E6,$0C,$EB,$11,$09,$F1
	.byte $90,$E3,$20,$50,$F0,$90,$E2,$20,$50,$F1,$90,$50,$20,$F2,$E3,$90
	.byte $50,$20,$F1,$E4,$50,$A0,$E3,$10,$F0,$50,$A0,$E2,$10,$F1,$50,$10
	.byte $E3,$A0,$F2,$E2,$70,$30,$E3,$A0,$F1,$E4,$90,$E3,$20,$50,$F0,$90
	.byte $E2,$20,$50,$F1,$90,$50,$20,$F2,$E3,$90,$50,$E6,$01,$27,$E6,$0C
	.byte $EB,$01,$00,$EA,$0A,$F1,$E4,$50,$A0,$E3,$10,$50,$A0,$E2,$10,$50
	.byte $10,$E3,$A0,$E2,$70,$30,$E3,$A0,$FE,$FF,$5D,$A1
SoundData4B_RuinsSong_ch2:
	.byte $EA,$00,$DC,$90,$FB,$E4,$25,$95,$A5,$E3,$12,$32,$FE,$02,$EA,$03
	.byte $DC,$20,$E4,$C2,$22,$C2,$20,$50,$90,$C2,$A0,$A0,$A0,$E3,$10,$10
	.byte $10,$30,$30,$30,$E4,$C2,$22,$C2,$20,$50,$90,$A0,$A0,$A0,$E3,$52
	.byte $E4,$10,$E3,$10,$E2,$10,$E4,$30,$E3,$30,$E2,$30,$FE,$FF,$2D,$A2
SoundData4C_RuinsSong_ch5:
	.byte $DC,$C2,$B5,$B5,$B5,$A5,$B5,$B5,$B5,$A0,$A0,$A0,$C2,$B5,$A0,$A0
	.byte $A3,$A0,$A0,$A0,$B0,$B0,$B0,$A0,$A0,$A3,$B5,$A0,$A0,$A0,$B0,$B0
	.byte $B0,$A2,$B0,$A0,$A0,$B0,$A0,$A0,$FE,$FF,$6D,$A2
Sound_Records_Locator:
	.word (Sound_Records -3) ;813A (13A) ()
Bank0PlayTracks:
	sta Sound_StartSong_LatestSongIndex
	beq Bank0TerminateSound
	cmp #$5D
	bcc StartTracks
	cmp #$60
	bcs StartTracks
	jmp StartPCMsound
;------------------------------------------
StartTracks:
	cmp #$61
	bne Sound_StartTracks
Bank0TerminateSound:
	lda #$00
	ldx #$06
	@A2B3:
	dex
	sta Sound_CurrentSongNumber_Channel0_square0,x
	sta Sound_CacheAPUreg3,x
	sta Sound_FlagsC3_Channel0_square0,x
	bne @A2B3
	sta Sound_FadeMode
	jmp SoundCode_MuteAllChannelsButDontDisableThem
;------------------------------------------
_func_22C2:
	sta Sound_TabUnknown0134,x
	sta Sound_TabUnknown0146,x
_func_22C8:
	sta Sound_TabUnknown0131,x
	rts
;------------------------------------------
Sound_StartTracks:
	ldx #$03
	lda Sound_Records_Locator
	sta Sound_RecordPtrLo
	lda Sound_Records_Locator+1
	sta Sound_RecordPtrHi
	@A2D8:
	lda Sound_StartSong_LatestSongIndex
	clc
	adc Sound_RecordPtrLo
	sta Sound_RecordPtrLo
	lda #$00
	adc Sound_RecordPtrHi
	sta Sound_RecordPtrHi
	dex
	bne @A2D8
	ldy #$00
	sty Sound_StartSong_MainPtrOffset
	lda (Sound_RecordPtrLo),y
	rol a
	rol a
	rol a
	and #$03
	sta Sound_StartSong_NumTracksRemaining
	jmp _loc_2301
;------------------------------------------
Unused22FB:
	jmp _loc_23A0

	_A2FE:
	 jmp _loc_23B1
;------------------------------------------
_loc_2301:
	ldy Sound_StartSong_MainPtrOffset
	lda (Sound_RecordPtrLo),y
	and #$1F
	sta Sound_StartSong_CurrentLogicalChannel
	tax
	lda Sound_StartSong_LatestSongIndex
	beq @A315
	cmp Sound_CurrentSongNumber_Channel0_square0,x
	bcc _A2FE
	@A315:
	lda #$00
	sta Sound_CurrentSongNumber_Channel0_square0,x
	cpx #$02
	beq @A325
	bcs @A328
	jsr _func_22C2
	jmp @A328

	@A325:
	jsr _func_22C8
	@A328:
	 ldy Sound_StartSong_MainPtrOffset
	iny
	lda (Sound_RecordPtrLo),y
	sta Sound_TrackDataPointer1Lo_Channel0_square0,x
	sta Sound_LoopBeginPointerLo_Channel0_square0,x
	sta Sound_StartSong_TrackDataPtr_Lo
	iny
	lda (Sound_RecordPtrLo),y
	sta Sound_TrackDataPointer1Hi_Channel0_square0,x
	sta Sound_LoopBeginPointerHi_Channel0_square0,x
	sta Sound_StartSong_TrackDataPtr_Hi
	lda #$01
	sta Sound_SongPausedFlag_Channel0_square0,x
	lda #$00
	sta Sound_LoopCounter_Channel0_square0,x
	cpx #$02
	beq @A350
	sta Sound_CacheAPUreg3,x
	cpx #$04
	beq @A361
	@A350:
	ldy #$00
	lda (Sound_StartSong_TrackDataPtr_Lo),y
	bne @A35D
	sta Sound_StartSong_LatestSongIndex
	cpx #$04
	beq @A361
	@A35D:
	and #$F0
	bne @A365
	@A361:
	 lda #$01
	bne @A367

	@A365:
	  lda #$00
	@A367:
	   sta Sound_FlagsC3_Channel0_square0,x
	lda Sound_StartSong_CurrentLogicalChannel
	tay
	lda Sound_ChannelRegisterOffsetTable,y
	tay
	cpx #$00
	bne @A379
	lda Sound_CurrentSongNumber_Channel3_effectsquare
	bne @A39B
	@A379:
	lda #$00
	cpx #$02
	bne @A38B
	sta APU_HW__4008_Reg0_channel2
	jsr SoundCode_JustDoEightNOPs_28cyclesOfDelay
	sta APU_HW__400B_Reg3_channel2_WaveLengthHi
	jmp @A39B

	@A38B:
	lda #$30
	sta APU_HW__4000_Reg0,y
	jsr SoundCode_JustDoEightNOPs_28cyclesOfDelay
	lda #$7F
	sta APU_HW__4001_Reg1_SweepControl,y
	jsr SoundCode_JustDoEightNOPs_28cyclesOfDelay
	@A39B:
	 lda Sound_StartSong_LatestSongIndex
	sta Sound_CurrentSongNumber_Channel0_square0,x
_loc_23A0:
	dec Sound_StartSong_NumTracksRemaining
	bmi _loc_23B1
	ldy Sound_StartSong_MainPtrOffset
	iny
	iny
	iny
	sty Sound_StartSong_MainPtrOffset
	jmp _loc_2301
;------------------------------------------
_loc_23B1:
	lda #$00
	sta Sound_RecordPtrHi
	ldx Sound_CurrentLogicalChannel
	rts
;------------------------------------------
StartPCMsound:
	lda Sound_StartSong_LatestSongIndex
	cmp Sound_PCMsampleActive
	bcc @A3E7
	sta Sound_PCMsampleActive
	sec
	sbc #$5D
	asl a
	asl a
	clc
	adc #$03
	tax
	lda #$0F
	sta APU_HW__4015_EnableChannelsMask
	sty Sound_TempA5
	ldy #$03
	@A3D6:
	lda Sound_PCMsample5D_Config,x
	sta APU_HW__4010_PCM_IRQenableAndWaveLength,y
	dex
	dey
	bpl @A3D6
	ldy Sound_TempA5
	lda #$1F
	sta APU_HW__4015_EnableChannelsMask
	@A3E7:
	ldx Sound_CurrentLogicalChannel
	rts

	.byte $FF
SoundData45_MansionSong_ch1:
	.byte $E9,$33,$EB,$0F,$07,$D7,$70,$17,$17,$F1,$E3,$21,$20,$EB,$01,$06
	.byte $F3,$50,$40,$50,$F2,$51,$50,$90,$80,$90,$F1,$91,$90,$F0,$E2,$20
	.byte $10,$20,$EB,$0F,$07,$F0,$22,$EB,$2F,$07,$F2,$22,$F1,$E3,$51,$50
	.byte $EB,$01,$06,$F3,$90,$80,$90,$F2,$91,$90,$E2,$20,$10,$20,$F1,$21
	.byte $20,$F0,$50,$40,$50,$F0,$EB,$0F,$07,$51,$50,$EB,$1F,$07,$F3,$51
	.byte $50,$EB,$00,$00,$E9,$31,$E7,$18,$F1,$40,$10,$E3,$90,$70,$40,$10
	.byte $E2,$10,$E3,$A0,$70,$40,$10,$E4,$A0,$F0,$E3,$A0,$70,$40,$10,$E4
	.byte $A0,$70,$E3,$40,$70,$A0,$70,$A0,$E2,$10,$EB,$01,$06,$D7,$30,$12
	.byte $17,$FB,$F0,$E9,$74,$E7,$12,$E2,$22,$E3,$93,$E9,$71,$E7,$13,$F3
	.byte $70,$A0,$E2,$10,$E3,$A0,$E2,$10,$E9,$74,$E7,$12,$F1,$22,$E3,$95
	.byte $E9,$71,$E7,$13,$F4,$70,$50,$40,$22,$F3,$50,$40,$50,$52,$F2,$90
	.byte $80,$90,$92,$F0,$E2,$20,$10,$20,$F5,$20,$10,$20,$E9,$B1,$F0,$E7
	.byte $15,$E6,$01,$E4,$70,$E3,$75,$E4,$40,$E3,$45,$E4,$10,$E3,$15,$E6
	.byte $07,$FE,$02,$EB,$01,$06,$E9,$32,$D7,$76,$82,$18,$F0,$E3,$A0,$70
	.byte $40,$10,$40,$A0,$90,$50,$20,$E4,$90,$E3,$20,$90,$70,$40,$10,$E4
	.byte $A0,$E3,$10,$70,$50,$20,$E4,$90,$50,$90,$E3,$20,$E7,$14,$E9,$70
	.byte $A2,$E2,$20,$10,$20,$E3,$92,$E2,$20,$00,$20,$E3,$B2,$E2,$22,$E9
	.byte $30,$E7,$16,$E6,$01,$E3,$10,$E2,$15,$E4,$90,$E3,$95,$E4,$B0,$E3
	.byte $B5,$E4,$10,$E3,$15,$E4,$20,$E3,$25,$E4,$40,$E3,$45,$FE,$FF,$EC
	.byte $A3
SoundData46_MansionSong_ch0:
	.byte $E9,$33,$EB,$0F,$07,$D7,$70,$17,$17,$F0,$E4,$91,$90,$EB,$01,$06
	.byte $F2,$E3,$20,$10,$20,$F1,$21,$20,$50,$40,$50,$F0,$51,$50,$90,$80
	.byte $90,$EB,$0F,$07,$F0,$92,$EB,$2F,$07,$F2,$92,$F0,$21,$20,$EB,$01
	.byte $06,$F2,$50,$40,$50,$F1,$51,$50,$90,$80,$90,$F0,$91,$90,$E2,$20
	.byte $10,$20,$F0,$EB,$0F,$07,$21,$20,$EB,$1F,$07,$F3,$21,$20,$EB,$00
	.byte $00,$E9,$31,$E7,$18,$F1,$10,$E3,$A0,$70,$40,$10,$E4,$A0,$E3,$A0
	.byte $70,$40,$10,$E4,$A0,$70,$F0,$E3,$70,$40,$10,$E4,$A0,$70,$40,$E3
	.byte $10,$40,$70,$40,$70,$90,$EB,$01,$06,$D7,$30,$12,$17,$FB,$F1,$E9
	.byte $74,$E7,$12,$E3,$92,$23,$E9,$71,$E7,$13,$F3,$40,$70,$A0,$70,$A0
	.byte $E9,$74,$E7,$12,$F1,$92,$55,$E9,$71,$E7,$13,$F4,$40,$20,$10,$E4
	.byte $A2,$F3,$E3,$20,$10,$20,$22,$F2,$50,$40,$50,$52,$F0,$90,$80,$90
	.byte $F4,$90,$80,$90,$EB,$01,$00,$E9,$71,$F0,$E7,$15,$E6,$01,$E3,$70
	.byte $E2,$75,$E3,$40,$E2,$45,$E3,$10,$E2,$15,$E6,$07,$FE,$02,$EB,$01
	.byte $00,$E9,$32,$D1,$76,$82,$18,$F0,$E4,$A0,$E2,$A5,$E4,$70,$E2,$75
	.byte $E4,$40,$E2,$45,$E4,$10,$E2,$15,$E4,$40,$E2,$45,$E4,$A0,$E2,$A5
	.byte $E4,$90,$E2,$95,$E4,$50,$E2,$55,$E4,$20,$E2,$25,$E5,$90,$E3,$95
	.byte $E4,$20,$E2,$25,$E4,$90,$E2,$95,$E4,$70,$E2,$75,$E4,$40,$E2,$45
	.byte $E4,$10,$E2,$15,$E5,$A0,$E3,$A5,$E4,$10,$E2,$15,$E4,$70,$E2,$75
	.byte $E4,$50,$E2,$55,$E4,$20,$E2,$25,$E5,$90,$E3,$95,$E5,$50,$E3,$55
	.byte $E5,$90,$E3,$95,$E4,$20,$E2,$25,$E6,$07,$E9,$31,$EB,$01,$06,$E4
	.byte $70,$A0,$E3,$20,$52,$E4,$50,$90,$E3,$20,$52,$E4,$82,$B2,$E9,$30
	.byte $E6,$01,$E7,$16,$E4,$90,$E3,$95,$E4,$40,$E3,$45,$E4,$70,$E3,$75
	.byte $E4,$40,$E3,$45,$E4,$70,$E3,$75,$E4,$90,$E3,$95,$FE,$FF,$1D,$A5
SoundData47_MansionSong_ch2:
	.byte $D7,$15,$FB,$E3,$21,$20,$90,$20,$90,$FE,$03,$22,$02,$FB,$E4,$A1
	.byte $A0,$E3,$50,$E4,$A0,$E3,$50,$FE,$03,$E4,$A2,$92,$71,$C0,$D1,$10
	.byte $E3,$73,$52,$32,$12,$02,$E4,$B1,$A0,$90,$C0,$D7,$15,$71,$C0,$70
	.byte $E3,$70,$70,$E4,$70,$70,$E3,$70,$E4,$70,$E3,$70,$70,$E4,$90,$90
	.byte $E3,$90,$E4,$90,$E3,$90,$90,$FB,$E3,$21,$20,$20,$40,$50,$FE,$03
	.byte $20,$40,$50,$E4,$92,$FB,$E4,$A1,$A0,$A0,$E3,$00,$20,$FE,$03,$E4
	.byte $A0,$E3,$00,$20,$E4,$90,$E3,$90,$90,$FB,$E3,$21,$20,$20,$40,$50
	.byte $FE,$03,$20,$40,$50,$E4,$92,$FB,$E4,$A1,$A0,$A0,$E3,$00,$20,$FE
	.byte $03,$E4,$A0,$E3,$00,$20,$E4,$90,$E3,$90,$90,$E4,$91,$E3,$91,$C1
	.byte $E4,$51,$E3,$51,$C1,$E4,$41,$E3,$41,$C1,$E4,$21,$E3,$21,$40,$50
	.byte $E4,$70,$70,$70,$E3,$70,$E4,$70,$70,$50,$50,$50,$E3,$50,$E4,$50
	.byte $50,$40,$40,$40,$E3,$40,$E4,$40,$40,$90,$90,$90,$90,$90,$90,$FE
	.byte $FF,$8D,$A6
SoundData48_MansionSong_ch5:
	.byte $D7,$FB,$B1,$B0,$A1,$B0,$FE,$02,$B1,$B0,$A0,$A0,$A0,$B2,$B0,$A0
	.byte $A0,$FB,$B1,$B0,$A1,$B0,$FE
_loc_2767:
	.byte TempPtr02_lo

	.byte $B1,$B0,$A1,$A0,$B0,$A0,$A0,$A0,$A0,$A0,$B2,$A2,$B2,$A0,$A0,$A0
	.byte $B1,$B0,$B0,$A0,$A0,$B0,$B0,$B0,$A0,$A0,$A0,$FB,$B1,$B0,$A1,$B0
	.byte $FE,$03,$B0,$A0,$A0,$B2,$FB,$B1,$B0,$A1,$B0,$FE,$03,$B1,$B0,$A0
	.byte $A0,$A0,$FB,$B1,$B0,$A1,$B0,$FE,$03,$B0,$A0,$A0,$B2,$FB,$B1,$B0
	.byte $A1,$B0,$FE,$03,$B1,$B0,$A0,$A0,$A0,$FB,$B1,$A2,$A0,$B1,$A0,$A0
	.byte $A0,$A0,$FE,$02,$FB,$B1,$B0,$A1,$B0,$FE,$02,$B1,$A0,$B0,$A0,$A0
	.byte $B0,$A0,$A0,$A0,$A0,$A0,$FE,$FF,$50,$A7
SoundData41_NightSong_ch1:
	.byte $EB,$73,$04,$E9,$34,$FB,$D1,$B1,$10,$00,$E3,$40,$E2,$46,$E3,$10
	.byte $E2,$16,$E3,$20,$E2,$26,$E3,$40,$E2,$4E,$E3,$00,$E2,$0E,$E8,$42
	.byte $E6,$08,$E3,$A8,$FE,$02,$FB,$E9,$31,$EB,$01,$05,$D1,$70,$0E,$24
	.byte $E3,$40,$E4,$46,$E3,$70,$E4,$76,$E3,$B0,$E4,$B6,$E6,$08,$E3,$22
	.byte $E6,$01,$E4,$40,$E3,$4E,$E4,$10,$E3,$16,$E6,$08,$E4,$92,$E6,$01
	.byte $E3,$60,$E4,$66,$E3,$70,$E4,$76,$E3,$90,$E4,$96,$E6,$08,$B0,$F1
	.byte $60,$70,$90,$B0,$F2,$60,$70,$90,$B0,$F3,$60,$70,$90,$B0,$F0,$E7
	.byte $11,$E2,$30,$60,$90,$B0,$FE,$02,$EB,$41,$04,$E9,$31,$D4,$77,$82
	.byte $15,$F1,$E2,$01,$41,$91,$E1,$05,$43,$35,$E2,$B9,$E1,$25,$E2,$85
	.byte $B3,$E7,$0F,$E1,$0F,$E7,$82,$E2,$50,$74,$B5,$73,$55,$71,$F0,$E6
	.byte $01,$E3,$90,$E2,$96,$E3,$70,$E2,$76,$E3,$50,$E2,$56,$E3,$40,$E2
	.byte $46,$E9,$33,$D8,$70,$0C,$17,$E2,$C0,$F2,$30,$30,$F4,$30,$F2,$40
	.byte $40,$F4,$40,$F2,$60,$60,$F4,$60,$F2,$70,$70,$F4,$70,$F2,$70,$60
	.byte $40,$F4,$40,$F2,$30,$30,$F4,$30,$F2,$40,$40,$F4,$40,$D8,$70,$0F
	.byte $00,$E3,$B8,$FE,$FF,$D2,$A7
SoundData42_NightSong_ch0:
	.byte $EB,$01,$00,$E9,$B5,$D1,$70,$10,$25,$F1,$E4,$40,$E3,$46,$E4,$10
	.byte $E3,$16,$E4,$20,$E3,$26,$E4,$40,$E3,$4E,$E4,$00,$E3,$0E,$E5,$A0
	.byte $E4,$AE,$E7,$11,$F5,$E2,$77,$F4,$47,$F3,$17,$F2,$77,$47,$F1,$17
	.byte $F0,$77,$E7,$10,$F2,$E4,$40,$E3,$46,$E4,$10,$E3,$16,$E4,$20,$E3
	.byte $26,$E4,$40,$E3,$4E,$E4,$00,$E3,$0E,$E5,$A0,$E4,$AE,$E7,$11,$F5
	.byte $E2,$77,$F4,$47,$F3,$17,$F2,$77,$47,$F1,$17,$F0,$77,$FB,$E9,$34
	.byte $D4,$B0,$0D,$25,$F5,$E3,$B1,$E2,$71,$41,$11,$F4,$71,$41,$11,$71
	.byte $F3,$E3,$91,$E2,$71,$41,$11,$71,$41,$11,$71,$F2,$E3,$B1,$E2,$61
	.byte $41,$31,$F1,$41,$31,$E3,$B1,$E2,$61,$F0,$41,$31,$41,$31,$E7,$11
	.byte $E2,$B1,$E1,$31,$41,$61,$FE,$02,$EB,$41,$04,$E9,$B1,$D4,$37,$82
	.byte $15,$F2,$E3,$91,$E2,$01,$41,$95,$E1,$03,$E2,$65,$39,$55,$E3,$B5
	.byte $E2,$23,$E7,$0F,$F1,$4F,$E7,$82,$F2,$00,$24,$75,$23,$05,$01,$E9
	.byte $70,$F0,$E6,$01,$E4,$90,$E3,$96,$E4,$70,$E3,$76,$E4,$50,$E3,$56
	.byte $E4,$40,$E3,$46,$EB,$01,$00,$E9,$00,$D4,$30,$0C,$17,$E3,$C1,$F2
	.byte $B1,$B1,$F4,$B1,$F2,$E2,$01,$01,$F4,$01,$F2,$21,$21,$F4,$21,$F2
	.byte $41,$41,$F4,$41,$F2,$41,$21,$01,$F4,$01,$F2,$E3,$B1,$B1,$F4,$B1
	.byte $F2,$E2,$01,$01,$F4,$01,$F0,$D8,$70,$0F,$00,$E2,$B0,$E3,$B7,$FE
	.byte $FF,$B9,$A8
SoundData43_NightSong_ch2:
	.byte $D4,$90,$E3,$41,$11,$21,$49,$E4,$E6,$03,$50,$70,$80,$90,$E6,$04
	.byte $A4,$E5,$A7,$E3,$41,$11,$21,$49,$E4,$E6,$03,$50,$70,$80,$90,$E6
	.byte $04,$A4,$E5,$A7,$FB,$D4,$0D,$E4,$41,$41,$61,$41,$61,$41,$61,$41
	.byte $FE,$02,$FB,$E4,$B1,$B1,$E3,$31,$E4,$B1,$E3,$41,$E4,$B1,$E3,$61
	.byte $01,$FE,$02,$FB,$E4,$41,$41,$61,$41,$61,$41,$61,$41,$FE,$02,$FB
	.byte $E4,$B1,$B1,$E3,$31,$E4,$B1,$E3,$41,$E4,$B1,$E3,$61,$01,$FE,$02
	.byte $D4,$15,$E4,$95,$E3,$45,$93,$E4,$B1,$C1,$B1,$E3,$65,$B3,$E4,$55
	.byte $B5,$E3,$53,$D4,$0D,$91,$91,$C1,$91,$71,$51,$41,$21,$D4,$15,$E4
	.byte $75,$E3,$25,$73,$E4,$51,$C1,$51,$D4,$0D,$E3,$71,$91,$71,$51,$41
	.byte $FB,$C1,$E4,$B1,$E3,$31,$E4,$B1,$E3,$41,$E4,$B1,$E3,$61,$E4,$B1
	.byte $FE,$03,$B1,$B1,$91,$B1,$B1,$E3,$31,$61,$91,$FE,$FF,$CC,$A9
SoundData44_NightSong_ch5:
	.byte $D4,$BF,$B7,$B7,$B1,$BD,$B7,$B3,$A3,$FB,$B3,$A1,$B3,$B1,$A1,$B1
	.byte $FE,$07,$B3,$A1,$B3,$B1,$A1,$A0,$A0,$FB,$B3,$A1,$B5,$A3,$FE,$03
	.byte $A1,$A3,$A3,$B1,$A1,$A0,$A0,$B3,$A1,$B5,$A3,$B3,$A1,$B3,$A1,$A1
	.byte $A3,$B1,$A1,$A1,$B1,$A1,$B1,$A3,$B1,$A1,$A1,$B1,$B1,$A1,$A3,$B1
	.byte $A1,$A1,$B1,$A1,$A1,$A1,$B1,$B1,$A1,$A1,$B1,$A1,$A1,$A0,$A0,$FE
	.byte $FF,$7B,$AA
_loc_2ACE:
	clc
	adc TempPtr00_hi
	sta $0200,x
	jsr _func_2B7C
	lda $96
	jmp _loc_2B36
;------------------------------------------
SpriteConstructionProcess:
	ldy #$00
	lda (TempPtr08_lo),y
	bne @AAE3
	rts

	@AAE3:
	iny
	sta $0F
	and #$7F
	sta TempPtr02_hi
	sta $15
	ldx $04
	lda $0F
	bpl @AB02
	lda (TempPtr08_lo),y
	sta $0D
	iny
	lda (TempPtr08_lo),y
	sta $0E
	iny
	sty $0C
	ldy #$01
	lda ($0D),y
	@AB02:
	    jsr LoadFrom08_or_0D__if0Fnegative
	clc
	bpl @AB09
	sec
	@AB09:
	iny
	ror a
	bcs _loc_2ACE
	adc TempPtr00_hi
	sta $0200,x
	jsr _func_2B7C
	clc
	lda TempPtr00_lo
	and #$03
	beq @AB1D
	sec
	@AB1D:
	jsr LoadFrom08_or_0D__if0Fnegative
	bcc @AB26
	and #$DC
	ora TempPtr00_lo
	@AB26:
	sta $96
	sta $0202,x
	iny
	lda Unknown10_CollisionAndScrollingTemp
	beq _AB39
	lda $96
	eor #$40
	sta $96
_loc_2B36:
	sta $0202,x
	_AB39:
	lda Unknown10_CollisionAndScrollingTemp
	bne @AB66
	jsr LoadFrom08_or_0D__if0Fnegative
	@AB40:
	 clc
	adc TempPtr02_lo
	sta $0203,x
	lda $17
	bmi @AB60
	txa
	@AB4B:
	clc
	adc #$C4
	cmp $16
	bcc @AB4B
	tax
	dec Temp07
	@AB55:
	iny
	dec TempPtr02_hi
	beq @AB5D
	jmp @AB02

	@AB5D:
	stx $04
	rts

	@AB60:
	 inx
	inx
	inx
	inx
	bne @AB55
	@AB66:
	  jsr LoadFrom08_or_0D__if0Fnegative
	clc
	adc #$08
	jsr Math_NegateA
	jmp @AB40
;------------------------------------------
LoadFrom08_or_0D__if0Fnegative:
	lda $0F
	bpl @AB79
	lda ($0D),y
	rts

	@AB79:
	lda (TempPtr08_lo),y
	rts
;------------------------------------------
_func_2B7C:
	lda $0F
	asl a
	bcc @AB85
	sty Unknown14_Horizontal_256pixelUnitForObject
	ldy $0C
	@AB85:
	lda (TempPtr08_lo),y
	sta $0201,x
	bcc @AB91
	iny
	sty $0C
	ldy Unknown14_Horizontal_256pixelUnitForObject
	@AB91:
	iny
	rts
;------------------------------------------
SpriteConstructionInit:
	lda ObjectPaletteIndex,x
	sta TempPtr00_lo
	lda ObjectScreenYCoord,x
	sta TempPtr00_hi
	lda ObjectScreenXCoord,x
	sta TempPtr02_lo
	lda ObjectFacingLeft,x
	sta Unknown10_CollisionAndScrollingTemp
	lda ObjectCurrentPose1,x
	asl a
	bcs @ABB9
	tay
	lda SpriteConstructionData,y
	sta TempPtr08_lo
	lda SpriteConstructionData+1,y
	sta TempPtr08_hi
	rts

	@ABB9:
	tay
	lda $AD30,y
	sta TempPtr08_lo
	lda $AD31,y
	sta TempPtr08_hi
	rts
;------------------------------------------
NMI_RenderSprites:
	lda #$00
	sta $15
	lda #$38
	sta $16
	lda ObjectDialogStatusFlag
	beq @ABD5
	jmp @ABE9

	@ABD5:
	ldx #$00
	jsr SpriteConstructionInit
	ldx #$38
	stx $04
	lda #$FF
	sta $17
	jsr SpriteConstructionProcess
	lda $04
	sta $16
	@ABE9:
	 lda #$01
	sta $05
	lda #$31
	sec
	sbc $15
	sta Temp07
	lda $2D
	@ABF6:
	clc
	adc #$44
	cmp $16
	bcc @ABF6
	sta $2D
	sta $04
	@AC01:
	ldx $05
	cpx #$12
	bcs @AC1A
	lda ObjectDialogStatusFlag,x
	bne @AC16
	jsr SpriteConstructionInit
	lda #$00
	sta $17
	jsr SpriteConstructionProcess
	@AC16:
	inc $05
	bne @AC01
	@AC1A:
	 ldx $04
	ldy Temp07
	@AC1E:
	 lda #$F4
	sta $0200,x
	txa
	@AC24:
	clc
	adc #$C4
	cmp $16
	bcc @AC24
	tax
	dey
	bpl @AC1E
	rts
;------------------------------------------
SpriteConstructionData:
	.word (SpriteData_Poses_00_58_9B) ;B160 (3160) ()
	.word (SpriteData_Poses_01_03_07_09_Simon_WalkAnim1and3_ClimbAnim2) ;B179 (3179) ()
	.word (SpriteData_Poses_02_0D_Simon_WalkAnim2) ;B180 (3180) ()
	.word (SpriteData_Poses_01_03_07_09_Simon_WalkAnim1and3_ClimbAnim2) ;B179 (3179) ()
	.word (SpriteData_Pose04_Simon_Stand_WalkAnim4) ;B172 (3172) ()
	.word (SpriteData_Poses_05_2D_Simon_Duck_Jump) ;B198 (3198) ()
	.word (SpriteData_Poses_06_B3_Simon_ClimbAnim2) ;B19F (319F) ()
	.word (SpriteData_Poses_01_03_07_09_Simon_WalkAnim1and3_ClimbAnim2) ;B179 (3179) ()
	.word (SpriteData_Poses_08_B7_Simon_ClimbAnim1) ;B1AD (31AD) ()
	.word (SpriteData_Poses_01_03_07_09_Simon_WalkAnim1and3_ClimbAnim2) ;B179 (3179) ()
	.word (SpriteData_Pose0A_Simon_WhipAnim1_ThrowAnim1) ;B1E5 (31E5) ()
	.word (SpriteData_Pose0B_Simon_WhipAnim2_ThrowAnim2) ;B1EB (31EB) ()
	.word (SpriteData_Pose0C_Simon_WhipAnim3_ThrowAnim3) ;B1F1 (31F1) ()
	.word (SpriteData_Poses_02_0D_Simon_WalkAnim2) ;B180 (3180) ()
	.word (SpriteData_Pose0E_Skeleton_Anim1) ;B21F (321F) ()
	.word (SpriteData_Pose0F_Skeleton_Anim2) ;B22D (322D) ()
	.word (SpriteData_Pose10_FishMan_Anim1) ;B5EB (35EB) ()
	.word (SpriteData_Pose11_FishMan_Anim2) ;B5F2 (35F2) ()
	.word (SpriteData_Pose12_MansionBat_Anim1) ;B546 (3546) ()
	.word (SpriteData_Pose13_MansionBat_Anim2) ;B54B (354B) ()
	.word (SpriteData_Pose14_MansionBat_Hang) ;B550 (3550) ()
	.word (SpriteData_Pose15) ;B3D1 (33D1) ()
	.word (SpriteData_Poses_16_18) ;B3D9 (33D9) ()
	.word (SpriteData_Pose17) ;B3DE (33DE) ()
	.word (SpriteData_Poses_16_18) ;B3D9 (33D9) ()
	.word (SpriteData_Pose19_MansionUnusedMonster_Or_Fishman_Anim1) ;B45E (345E) ()
	.word (SpriteData_Pose1A_MansionUnusedMonster_Or_Fishman_Anim2) ;B46C (346C) ()
	.word (SpriteData_Pose1B_FloatingPlatform1) ;B392 (3392) ()
	.word (SpriteData_Pose1C_TownLady_Anim1) ;B3FB (33FB) ()
	.word (SpriteData_Pose1D_TownLady_Anim2) ;B406 (3406) ()
	.word (SpriteData_Pose1E_Vendor_Anim1) ;B23B (323B) ()
	.word (SpriteData_Pose1F_Vendor_Anim2) ;B242 (3242) ()
	.word (SpriteData_Pose20_Priest_Anim1) ;B411 (3411) ()
	.word (SpriteData_Pose21_Priest_Anim2) ;B418 (3418) ()
	.word (SpriteData_Pose22_TownBoy_Anim1) ;B41F (341F) ()
	.word (SpriteData_Pose23_TownBoy_Anim2) ;B42D (342D) ()
	.word (SpriteData_Pose24_TownMonk_Anim1) ;B434 (3434) ()
	.word (SpriteData_Pose25_TownMonk_Anim2) ;B43B (343B) ()
	.word (SpriteData_Pose26_TownFriend_Anim1) ;B442 (3442) ()
	.word (SpriteData_Pose27_TownFriend_Anim2) ;B449 (3449) ()
	.word (SpriteData_Pose28_TownSittingMan) ;B450 (3450) ()
	.word (SpriteData_Pose29_Fireball) ;B274 (3274) ()
	.word (SpriteData_Pose2A_Simon_SitWhip_Anim1) ;B202 (3202) ()
	.word (SpriteData_Pose2B_Simon_SitWhip_Anim2) ;B208 (3208) ()
	.word (SpriteData_Pose2C_Simon_SitWhip_Anim3) ;B20E (320E) ()
	.word (SpriteData_Poses_05_2D_Simon_Duck_Jump) ;B198 (3198) ()
	.word (SpriteData_Pose2E_Spider_Anim1) ;B249 (3249) ()
	.word (SpriteData_Pose2F_Spider_Anim2) ;B252 (3252) ()
	.word (SpriteData_Pose30_ClueBook) ;B3B9 (33B9) ()
	.word (SpriteData_Pose31_Gargoyle_Anim1) ;B47A (347A) ()
	.word (SpriteData_Pose32_Gargoyle_Anim2) ;B48E (348E) ()
	.word (SpriteData_Pose33_Dracula_ArmsClosed) ;AF7E (2F7E) ()
	.word (SpriteData_Pose34_Dracula_ArmsOpen) ;AFDD (2FDD) ()
	.word (SpriteData_Pose35_Knight_Pose1) ;B49F (349F) ()
	.word (SpriteData_Pose36_Knight_Pose2) ;B4B0 (34B0) ()
	.word (SpriteData_Pose37_ThrownBone_Anim1) ;B52F (352F) ()
	.word (SpriteData_Pose38_ThrownBone_Anim2) ;B538 (3538) ()
	.word (SpriteData_Pose39_ThrownBone_Anim3) ;B53D (353D) ()
	.word (SpriteData_Pose3A_Garlic) ;B28A (328A) ()
	.word (SpriteData_Pose3B_CrystalBall) ;B4D1 (34D1) ()
	.word (SpriteData_Pose3C_Slimey_FlatMaybe) ;B4F9 (34F9) ()
	.word (SpriteData_Pose3D_FlamingMan_Anim1) ;B501 (3501) ()
	.word (SpriteData_Pose3E_FlamingMan_Anim2) ;B506 (3506) ()
	.word (SpriteData_Pose3F_TownZombie_Anim1) ;B3E6 (33E6) ()
	.word (SpriteData_Pose40_TownZombie_Anim2) ;B3ED (33ED) ()
	.word (SpriteData_Pose41_Weapon_WaterBottle) ;B281 (3281) ()
	.word (SpriteData_Pose42_Weapon_OakStake) ;B4C4 (34C4) ()
	.word (SpriteData_Pose43_FloatingPlatform2) ;B376 (3376) ()
	.word (SpriteData_Pose44_DeathBoss_Anim1) ;B58E (358E) ()
	.word (SpriteData_Pose45_DeathBoss_Anim2) ;B5B1 (35B1) ()
	.word (SpriteData_Pose46_Leech_Anim1_maybe) ;B7DB (37DB) ()
	.word (SpriteData_Pose47_Leech_Anim2_maybe) ;B7E3 (37E3) ()
	.word (SpriteData_Pose48_SpiderNet) ;B3BE (33BE) ()
	.word (SpriteData_Pose49_Skull_Anim1) ;B786 (3786) ()
	.word (SpriteData_Pose4A_Skull_Anim2) ;B78E (378E) ()
	.word (SpriteData_Pose4B_Ending_SimonStanding) ;AE14 (2E14) ()
	.word (SpriteData_Pose4C_Ending_SimonKneeling1) ;AE49 (2E49) ()
	.word (SpriteData_Pose4D_Ending_SimonKneeling2) ;AE71 (2E71) ()
	.word (SpriteData_Pose4E_Ending_SimonKneeling3) ;AE9A (2E9A) ()
	.word (SpriteData_Pose4F_MedusaHead_Anim1) ;B6B6 (36B6) ()
	.word (SpriteData_Pose50_MedusaHead_Anim2) ;B6BE (36BE) ()
	.word (SpriteData_Pose51_FloatingPlatform3) ;B384 (3384) ()
	.word (SpriteData_Pose52_Whip_LeatherThorn_Anim1) ;B294 (3294) ()
	.word (SpriteData_Pose53_Whip_LeatherThorn_Anim2) ;B29F (329F) ()
	.word (SpriteData_Pose54_Whip_LeatherThorn_Part1Anim3) ;B2A4 (32A4) ()
	.word (SpriteData_Poses_55_68_Whip_LeatherThorn_Part2Anim3) ;B2A9 (32A9) ()
	.word (SpriteData_Pose56_DragonBone_Head_open) ;B793 (3793) ()
	.word (SpriteData_Pose57_DragonBone_Head_closed) ;B79B (379B) ()
	.word (SpriteData_Poses_00_58_9B) ;B160 (3160) ()
	.word (SpriteData_Pose59_Mudman_Anim1) ;B60E (360E) ()
	.word (SpriteData_Pose5A_Mudman_Anim2) ;B616 (3616) ()
	.word (SpriteData_Pose5B_Mudman_Anim3) ;B61B (361B) ()
	.word (SpriteData_Pose5C_SplashEffectWhenSimonDies) ;B285 (3285) ()
	.word (SpriteData_Pose5D_TwoHeadedCreature_Anim1) ;B622 (3622) ()
	.word (SpriteData_Pose5E_TwoHeadedCreature_Anim2) ;B633 (3633) ()
	.word (TempPtr00_lo) ;0 (0) ()
	.word (TempPtr00_lo) ;0 (0) ()
	.word (SpriteData_Pose61_Leech_Anim1) ;B63B (363B) ()
	.word (SpriteData_Pose62_Leech_Anim2) ;B643 (3643) ()
	.word (SpriteData_Pose63_Wolf_Anim1) ;B648 (3648) ()
	.word (SpriteData_Pose64_Wolf_Anim2_Leap) ;B656 (3656) ()
	.word (SpriteData_Pose65_Werewolf_Anim1) ;B65D (365D) ()
	.word (SpriteData_Pose66_Werewolf_Anim2) ;B664 (3664) ()
	.word (SpriteData_Pose67_FishMan_Shoots) ;B600 (3600) ()
	.word (SpriteData_Poses_55_68_Whip_LeatherThorn_Part2Anim3) ;B2A9 (32A9) ()
	.word (SpriteData_Pose69_Whip_Chain_Anim1) ;B28E (328E) ()
	.word (SpriteData_Pose6A_Whip_Chain_Anim2) ;B2AE (32AE) ()
	.word (SpriteData_Poses_6B_6C_70_Whip_Chain_Part1and2Anim3_MStar_Part1_Anim3) ;B2B3 (32B3) ()
	.word (SpriteData_Poses_6B_6C_70_Whip_Chain_Part1and2Anim3_MStar_Part1_Anim3) ;B2B3 (32B3) ()
	.word (SpriteData_Pose6D_Whip_MStarFire_Anim1) ;B2B8 (32B8) ()
	.word (SpriteData_Pose6E_Whip_MStarFire_Anim2) ;B2C3 (32C3) ()
	.word (SpriteData_Pose6F_Whip_MStar_Part2Anim3) ;B2C8 (32C8) ()
	.word (SpriteData_Poses_6B_6C_70_Whip_Chain_Part1and2Anim3_MStar_Part1_Anim3) ;B2B3 (32B3) ()
	.word (SpriteData_Pose71_Whip_Fire_Part1Anim3) ;B2D3 (32D3) ()
	.word (SpriteData_Pose72_Whip_FIre_Part2Anim3) ;B2DE (32DE) ()
	.word (SpriteData_Pose73_SimonGettingThrownAround) ;B2E3 (32E3) ()
	.word (SpriteData_Pose74_SimonCorpse) ;B2EA (32EA) ()
	.word (SpriteData_Pose75_SpiderLine_Anim1) ;B257 (3257) ()
	.word (SpriteData_Pose76_SpiderLine_Anim2) ;B25B (325B) ()
	.word (SpriteData_Pose77_SpiderLine_Anim3) ;B260 (3260) ()
	.word (SpriteData_Poses_78_A4_AC_Weapon_FlameThrown_Anim1_PileAnim1and9_HiddenAnim1_EnemyDeathAnim1) ;B2F8 (32F8) ()
	.word (SpriteData_Pose79_Weapon_FlameThrown_Anim2_HiddenAnim2_EnemyDeathAnim2) ;B301 (3301) ()
	.word (SpriteData_Pose7A_DraculaProjectile_Anim1) ;B050 (3050) ()
	.word (SpriteData_Pose7B_DraculaProjectile_Anim2) ;B058 (3058) ()
	.word (SpriteData_Pose7C_DraculaProjectile_Anim3) ;B060 (3060) ()
	.word (SpriteData_Pose7D_DraculaProjectile_Anim4) ;B068 (3068) ()
	.word (SpriteData_Pose7E) ;B397 (3397) ()
	.word (SpriteData_Pose7F_Ferryman_Part1) ;B66B (366B) ()
	.word (SpriteData_Pose80_Ferryman_Part2) ;B682 (3682) ()
	.word (SpriteData_Pose81_FallingStone_pose1) ;B4D6 (34D6) ()
	.word (SpriteData_Pose82_FellingStone_pose2) ;B4DE (34DE) ()
	.word (SpriteData_Pose83) ;B4F0 (34F0) ()
	.word (SpriteData_Pose84) ;B4F5 (34F5) ()
	.word (SpriteData_Pose85_SpiderLine_Anim4) ;B266 (3266) ()
	.word (SpriteData_Pose86_MansionSlimey_GoingUp) ;B50F (350F) ()
	.word (SpriteData_Pose87_MansionSlimey_HangingInCeiling_Anim1) ;B514 (3514) ()
	.word (SpriteData_Pose88_MansionSlimey_HangingInCeiling_Anim2) ;B51C (351C) ()
	.word (SpriteData_Pose89_MansionSlimey_BallShape) ;B521 (3521) ()
	.word (SpriteData_Pose8A_MansionSlimey_GoingDown) ;B52A (352A) ()
	.word (SpriteData_Pose8B_Heart1) ;B364 (3364) ()
	.word (SpriteData_Pose8C_Heart2) ;B368 (3368) ()
	.word (SpriteData_Pose8D_Heart3) ;B36D (336D) ()
	.word (SpriteData_Pose8E_ZombieHand_Anim1closed) ;B7FE (37FE) ()
	.word (SpriteData_Pose8F_ZombieHand_Anim2open) ;B806 (3806) ()
	.word (SpriteData_Pose90_Raven_Anim1) ;B6C3 (36C3) ()
	.word (SpriteData_Pose91_Raven_Anim2) ;B6CA (36CA) ()
	.word (SpriteData_Pose92_Raven_Anim3) ;B6CF (36CF) ()
	.word (SpriteData_Pose93_HoodedSkeleton_WalkAnim1) ;B80B (380B) ()
	.word (SpriteData_Pose94_HoodedSkeleton_WalkAnim2) ;B812 (3812) ()
	.word (SpriteData_Pose95_HoodedSkeleton_FistAnim1) ;B819 (3819) ()
	.word (SpriteData_Pose96_HoodedSkeleton_FistAnim2) ;B82A (382A) ()
	.word (SpriteData_Pose97_Gargoyle_FlyPose1) ;B6D6 (36D6) ()
	.word (SpriteData_Poses_98_9A_Gargoyle_FlyPose2and4) ;B6E7 (36E7) ()
	.word (SpriteData_Pose99_Gargoyle_FlyPose3) ;B6F8 (36F8) ()
	.word (SpriteData_Poses_98_9A_Gargoyle_FlyPose2and4) ;B6E7 (36E7) ()
	.word (SpriteData_Poses_00_58_9B) ;B160 (3160) ()
	.word (SpriteData_Pose9C) ;B6A2 (36A2) ()
	.word (SpriteData_Pose9D_BurningMan_Anim1) ;B831 (3831) ()
	.word (SpriteData_Pose9E_BurningMan_Anim2) ;B83F (383F) ()
	.word (SpriteData_Pose9F_MansionFlyingSpikeUp) ;B4E6 (34E6) ()
	.word (SpriteData_PoseA0_MansionFlyingSpikeDown) ;B4EB (34EB) ()
	.word (SpriteData_PoseA1_BodypartBag) ;B4C9 (34C9) ()
	.word (SpriteData_PoseA2_Simon_Stand_WithShield) ;B161 (3161) ()
	.word (SpriteData_PoseA3_Simon_Duck_WithShield) ;B187 (3187) ()
	.word (SpriteData_Poses_78_A4_AC_Weapon_FlameThrown_Anim1_PileAnim1and9_HiddenAnim1_EnemyDeathAnim1) ;B2F8 (32F8) ()
	.word (SpriteData_Poses_A5_AB_Weapon_FlamePile_Anim2and8) ;B30A (330A) ()
	.word (SpriteData_Poses_A6_AA_Weapon_FlamePile_Anim3and7) ;B319 (3319) ()
	.word (SpriteData_Poses_A7_A9_Weapon_FlamePile_Anim4and6) ;B32E (332E) ()
	.word (SpriteData_PoseA8_Weapon_FlamePile_Anim5) ;B343 (3343) ()
	.word (SpriteData_Poses_A7_A9_Weapon_FlamePile_Anim4and6) ;B32E (332E) ()
	.word (SpriteData_Poses_A6_AA_Weapon_FlamePile_Anim3and7) ;B319 (3319) ()
	.word (SpriteData_Poses_A5_AB_Weapon_FlamePile_Anim2and8) ;B30A (330A) ()
	.word (SpriteData_Poses_78_A4_AC_Weapon_FlameThrown_Anim1_PileAnim1and9_HiddenAnim1_EnemyDeathAnim1) ;B2F8 (32F8) ()
	.word (SpriteData_PoseAD_Weapon_AllKnives) ;B279 (3279) ()
	.word (SpriteData_Poses_AE_AF_MorningStarParts) ;AEC2 (2EC2) ()
	.word (SpriteData_Poses_AE_AF_MorningStarParts) ;AEC2 (2EC2) ()
	.word (SpriteData_PoseB0_Simon_Stairs_Pose1_WhipAnim1) ;B1B4 (31B4) ()
	.word (SpriteData_PoseB1_Simon_Stairs_Pose1_WhipAnim2) ;B1BA (31BA) ()
	.word (SpriteData_PoseB2_Simon_Stairs_Pose1_WhipAnim3) ;B1C0 (31C0) ()
_loc_2D96:
	.byte $9F

	.byte > (SpriteData_Poses_06_B3_Simon_ClimbAnim2)
	.word (SpriteData_PoseB4_Simon_Stairs_Pose2_WhipAnim1) ;B1D1 (31D1) ()
	.word (SpriteData_PoseB5_Simon_Stairs_Pose2_WhipAnim2) ;B1D7 (31D7) ()
	.word (SpriteData_PoseB6_Simon_Stairs_Pose2_WhipAnim3) ;B1DD (31DD) ()
	.word (SpriteData_Poses_08_B7_Simon_ClimbAnim1) ;B1AD (31AD) ()
	.word (SpriteData_PoseB8_Weapon_Diamond_Anim1) ;B39C (339C) ()
	.word (SpriteData_PoseB9_Weapon_Diamond_Anim2) ;B3A1 (33A1) ()
	.word (SpriteData_PoseBA_Weapon_Diamond_Anim3) ;B3A9 (33A9) ()
	.word (SpriteData_PoseBB_Weapon_Diamond_Anim4) ;B3B1 (33B1) ()
	.word (SpriteData_PoseBC_Mummy_Anim1) ;B717 (3717) ()
	.word (SpriteData_PoseBD_Mummy_Anim2) ;B72B (372B) ()
	.word (SpriteData_PoseBE_PlantIdle) ;B73F (373F) ()
	.word (SpriteData_PoseBF_PlantShooting) ;B754 (3754) ()
	.word (SpriteData_PoseC0) ;B7C3 (37C3) ()
	.word (SpriteData_PoseC1) ;B7C8 (37C8) ()
	.word (SpriteData_PoseC2_Maybe_Mudman) ;B7CD (37CD) ()
	.word (SpriteData_PoseC3_Slimey_FlatAnim1) ;B7E8 (37E8) ()
	.word (SpriteData_PoseC4_Slimey_FlatAnim2) ;B7F0 (37F0) ()
	.word (SpriteData_PoseC5_Slimey_Leap) ;B7F5 (37F5) ()
	.word (SpriteData_PoseC6_Eyeball_Anim1) ;B68E (368E) ()
	.word (SpriteData_PoseC7_Eyeball_Anim2) ;B693 (3693) ()
	.word (SpriteData_PoseC8_CaveBat_Anim1) ;B698 (3698) ()
	.word (SpriteData_PoseC9_CaveBat_Anim2) ;B69D (369D) ()
	.word (SpriteData_PoseCA_Carmilla_Anim1) ;B561 (3561) ()
	.word (SpriteConstructionData_0356) ;8356 (356) ()
	.word (SpriteConstructionData_0356) ;8356 (356) ()
	.word (SpriteConstructionData_0356) ;8356 (356) ()
	.word (SpriteConstructionData_0356) ;8356 (356) ()
	.word (SpriteData_PoseCF_Death_SickleAnim1) ;B5D1 (35D1) ()
	.word (SpriteData_PoseD0_Death_SickleAnim2) ;B5D9 (35D9) ()
	.word (SpriteData_PoseD1_Death_SickleAnim3) ;B5DE (35DE) ()
	.word (SpriteData_PoseD2_Death_SickleAnim4) ;B5E6 (35E6) ()
	.word (SpriteData_PoseD3_Altar_FireAnim1) ;B070 (3070) ()
	.word (SpriteData_Poses_D4_D6_Altar_FireAnim2and4) ;B091 (3091) ()
	.word (SpriteData_PoseD5_Altar_FireAnim3) ;B09C (309C) ()
	.word (SpriteData_Poses_D4_D6_Altar_FireAnim2and4) ;B091 (3091) ()
	.word (SpriteData_PoseD7_Ending_DraculaGraveHandAnim1) ;AECA (2ECA) ()
	.word (SpriteData_PoseD8_Ending_DraculaGraveHandAnim2) ;AED8 (2ED8) ()
	.word (SpriteData_PoseD9_Ending_DraculaGraveHandAnim3) ;AEE6 (2EE6) ()
	.word (SpriteData_PoseDA_Ending_DraculaGraveHandAnim4) ;AEFB (2EFB) ()
	.word (SpriteData_PoseDB_Ending_DraculaGraveHandAnim5) ;AF10 (2F10) ()
	.word (SpriteData_PoseDC_Ending_DraculaGraveHandAnim6) ;AF25 (2F25) ()
	.word (SpriteData_PoseDD_Ending_DraculaGrave) ;AF40 (2F40) ()
	.word (SpriteData_PoseDE_Rosary) ;B559 (3559) ()
	.word (SpriteData_PoseDF_Unknown_MansionDroppingFireMaybe) ;B581 (3581) ()
	.word (SpriteData_Poses_E0_E1) ;B586 (3586) ()
	.word (SpriteData_Poses_E0_E1) ;B586 (3586) ()
	.word (SpriteData_PoseE2) ;B7A0 (37A0) ()
	.word (SpriteData_Poses_E3_E5) ;B7AE (37AE) ()
	.word (SpriteData_PoseE4) ;B7BC (37BC) ()
	.word (SpriteData_Poses_E3_E5) ;B7AE (37AE) ()
	.word (SpriteData_PoseE6_FlamingFlyingPirateSkeleton_Anim1) ;B771 (3771) ()
	.word (SpriteData_PoseE7_FlamingFlyingPirateSkeleton_Anim2) ;B77F (377F) ()
	.word (SpriteData_PoseE8_Mansion_Sack) ;B0BE (30BE) ()
	.word (SpriteData_PoseE9_DraculaDeathExplosion_Anim1) ;B0C3 (30C3) ()
	.word (SpriteData_Poses_EA_EC_DraculaDeathExplosion_Anim2and4) ;B104 (3104) ()
	.word (SpriteData_PoseEB_DraculaDeathExplosion_Anim3) ;B117 (3117) ()
	.word (SpriteData_Poses_EA_EC_DraculaDeathExplosion_Anim2and4) ;B104 (3104) ()
	.word (SpriteData_PoseED_Gargoyle_WalkPose1) ;B709 (3709) ()
	.word (SpriteData_PoseEE_Gargoyle_WalkPose2) ;B710 (3710) ()
	.word (SpriteData_PoseEF) ;B3C7 (33C7) ()
	.word (SpriteData_PoseF0_PasswordCursor) ;B3CC (33CC) ()
	.word (SpriteData_PoseF1_SomeOtherCursor) ;B15B (315B) ()
SpriteData_Pose4B_Ending_SimonStanding:
	.byte $10,$A0,$03,$03, $F0,$A1,$1B,$07, $C1,$0D,$F8,$C1, $15,$FF,$E1,$0F
	.byte $F8,$E1,$17,$FF, $A0,$0B,$02,$F8, $A1,$13,$FF,$E0, $07,$41,$07,$C1
	.byte $05,$07,$01,$09, $07,$C0,$05,$01, $F0,$E1,$07,$F0, $01,$09,$F0,$01
	.byte $11,$F8,$01,$19, $FF
SpriteData_Pose4C_Ending_SimonKneeling1:
	.byte $0C,$C0,$03,$03, $F0,$C1,$1B,$07, $E1,$21,$F8,$E1, $25,$FF,$C0,$0B
	.byte $02,$F8,$C1,$13, $FF,$E0,$1D,$01, $F0,$E1,$29,$07, $01,$1F,$F0,$01
	.byte $23,$F8,$01,$27, $FF,$01,$2B,$07
SpriteData_Pose4D_Ending_SimonKneeling2:
	.byte $0C,$C0,$2D,$43, $07,$C0,$0B,$02, $F8,$C1,$13,$FF, $C0,$2D,$03,$F0
	.byte $E1,$31,$F8,$E1, $33,$FF,$00,$1F, $01,$F0,$E1,$2F, $F0,$E1,$35,$07
	.byte $01,$23,$F8,$01, $27,$FF,$01,$2B, $07
SpriteData_Pose4E_Ending_SimonKneeling3:
	.byte $0C,$C0,$3D,$02, $F8,$C1,$43,$FF, $C0,$37,$03,$F0, $C1,$49,$07,$E1
	.byte $3F,$F8,$E1,$45, $FF,$E0,$39,$01, $F0,$E1,$4B,$07, $01,$3B,$F0,$01
	.byte $41,$F8,$01,$47, $FF,$01,$4D,$07
SpriteData_Poses_AE_AF_MorningStarParts:
	.byte $02,$A0,$4F,$00,$F8,$A1,$51,$00
SpriteData_PoseD7_Ending_DraculaGraveHandAnim1:
	.byte $04,$20,$73,$00, $F0,$21,$75,$F8, $21,$77,$00,$21, $79,$08
SpriteData_PoseD8_Ending_DraculaGraveHandAnim2:
	.byte $04,$20,$7B,$00, $F0,$21,$7D,$F8, $21,$7F,$00,$21, $81,$08
SpriteData_PoseD9_Ending_DraculaGraveHandAnim3:
	.byte $06,$10,$8B,$01, $F8,$11,$8D,$00, $20,$83,$00,$F0, $21,$85,$F8,$21
	.byte $87,$00,$21,$89, $08
SpriteData_PoseDA_Ending_DraculaGraveHandAnim4:
	.byte $06,$10,$97,$01, $F8,$11,$99,$00, $20,$8F,$00,$F0, $21,$91,$F8,$21
	.byte $93,$00,$21,$95, $08
SpriteData_PoseDB_Ending_DraculaGraveHandAnim5:
	.byte $06,$10,$A3,$01, $F8,$11,$A5,$00, $20,$9B,$00,$F0, $21,$9D,$F8,$21
	.byte $9F,$00,$21,$A1, $08
SpriteData_PoseDC_Ending_DraculaGraveHandAnim6:
	.byte $08,$10,$AF,$01, $F8,$11,$B1,$00, $31,$B3,$F8,$31, $B5,$00,$20,$A7
	.byte $00,$F0,$21,$A9, $F8,$21,$AB,$00, $21,$AD,$08
SpriteData_PoseDD_Ending_DraculaGrave:
	.byte $14,$A0,$4F,$00, $F8,$A1,$51,$00, $C1,$53,$F0,$C1, $5B,$F8,$C1,$63
	.byte $00,$C1,$6B,$08, $E1,$B7,$E8,$E1, $55,$F0,$E1,$5D, $F8,$E1,$65,$00
	.byte $E1,$6D,$08,$E1, $B9,$10,$01,$57, $F0,$01,$5F,$F8, $01,$67,$00,$01
	.byte $6F,$08,$21,$59, $F0,$21,$61,$F8, $21,$69,$00,$21, $71,$08
SpriteData_Pose33_Dracula_ArmsClosed:
	.byte $1C,$A0,$A1,$03, $F8,$A1,$A3,$00, $C1,$A5,$E8,$C1, $A7,$F0,$C1,$A9
	.byte $F8,$C1,$AB,$00, $C1,$AD,$08,$C0, $A5,$43,$10,$E0, $AF,$03,$E8,$E1
	.byte $B1,$F0,$E1,$B3, $F8,$E1,$B5,$00, $E1,$B7,$08,$E0, $AF,$43,$10,$00
	.byte $B9,$03,$E8,$01, $BB,$F0,$01,$BD, $F8,$01,$BF,$00, $01,$BB,$08,$00
	.byte $B9,$43,$10,$20, $C1,$03,$F0,$21, $BB,$F8,$21,$BB, $00,$20,$C1,$43
	.byte $08,$40,$C3,$03, $F0,$41,$C5,$F8, $40,$C5,$43,$00, $41,$C3,$08
SpriteData_Pose34_Dracula_ArmsOpen:
	.byte $22,$A0,$C9,$43, $E0,$A1,$C7,$E8, $A0,$A1,$03,$F8, $A1,$A3,$00,$A1
	.byte $C7,$10,$A1,$C9, $18,$C0,$CF,$43, $E0,$C1,$CD,$E8, $C1,$CB,$F0,$C0
	.byte $A9,$03,$F8,$C1, $AB,$00,$C1,$CB, $08,$C1,$CD,$10, $C1,$CF,$18,$E0
	.byte $D1,$43,$E8,$E0, $B1,$03,$F0,$E1, $B3,$F8,$E1,$B5, $00,$E1,$B7,$08
	.byte $E1,$D1,$10,$00, $D3,$43,$E8,$00, $BB,$03,$F0,$01, $BD,$F8,$01,$BF
	.byte $00,$01,$BB,$08, $01,$D3,$10,$20, $C1,$03,$F0,$21, $BB,$F8,$21,$BB
	.byte $00,$20,$C1,$43, $08,$40,$C3,$03, $F0,$41,$C5,$F8, $40,$C5,$43,$00
	.byte $41,$C3,$08
SpriteData_Pose7A_DraculaProjectile_Anim1:
	.byte $02,$E0,$D5,$00, $F0,$E1,$D7,$F8
SpriteData_Pose7B_DraculaProjectile_Anim2:
	.byte $02,$00,$9D,$00, $F0,$01,$9F,$F8
SpriteData_Pose7C_DraculaProjectile_Anim3:
	.byte $02,$00,$D7,$C0, $00,$01,$D5,$08
SpriteData_Pose7D_DraculaProjectile_Anim4:
	.byte $02,$E0,$9F,$C0, $00,$E1,$9D,$08
SpriteData_PoseD3_Altar_FireAnim1:
	.byte $0A,$E0,$83,$01, $F0,$E1,$87,$F8, $01,$85,$F0,$01, $89,$F8,$F5,$81
	.byte $E8,$E0,$87,$41, $00,$E1,$83,$08, $01,$89,$00,$01, $85,$08,$F5,$81
	.byte $10
SpriteData_Poses_D4_D6_Altar_FireAnim2and4:
	.byte $88
	.word (SpriteData_PoseD5_Altar_FireAnim3) ;B09C (309C) ()
	.byte $8B,$8F,$8D,$91,$8F,$8B,$91,$8D
SpriteData_PoseD5_Altar_FireAnim3:
	.byte $0A,$E0,$95,$01, $F0,$E1,$97,$F8, $01,$99,$F0,$01, $9B,$F8,$E0,$97
	.byte $41,$00,$E1,$95, $08,$01,$9B,$00, $01,$99,$08,$C1, $93,$00,$C0,$93
	.byte $01,$F8
SpriteData_PoseE8_Mansion_Sack:
	.byte $82
	.word (SpriteData_PoseAD_Weapon_AllKnives) ;B279 (3279) ()
	.byte $6B,$6D
SpriteData_PoseE9_DraculaDeathExplosion_Anim1:
	.byte $14,$C0,$83,$01, $F0,$C1,$87,$F8, $E1,$85,$F0,$E1, $89,$F8,$D5,$81
	.byte $E8,$C0,$87,$41, $00,$C1,$83,$08, $E1,$89,$00,$E1, $85,$08,$D5,$81
	.byte $10,$00,$85,$81, $F0,$01,$89,$F8, $21,$83,$F0,$21, $87,$F8,$15,$81
	.byte $E8,$00,$89,$C1, $00,$01,$85,$08, $21,$87,$00,$21, $83,$08,$15,$81
	.byte $10
SpriteData_Poses_EA_EC_DraculaDeathExplosion_Anim2and4:
	.byte $90
	.word (SpriteData_PoseEB_DraculaDeathExplosion_Anim3) ;B117 (3117) ()
	.byte $8B,$8F,$8D,$91,$8F,$8B,$91,$8D,$8D,$91,$8B,$8F,$91,$8D,$8F,$8B
SpriteData_PoseEB_DraculaDeathExplosion_Anim3:
	.byte $14,$C0,$95,$01, $F0,$C1,$97,$F8, $E1,$99,$F0,$E1, $9B,$F8,$C0,$97
	.byte $41,$00,$C1,$95, $08,$E1,$9B,$00, $E1,$99,$08,$00, $99,$81,$F0,$01
	.byte $9B,$F8,$21,$95, $F0,$21,$97,$F8, $00,$9B,$C1,$00, $01,$99,$08,$21
	.byte $97,$00,$21,$95, $08,$41,$93,$00, $A0,$93,$01,$F8, $A0,$93,$41,$00
	.byte $40,$93,$81,$F8
SpriteData_PoseF1_SomeOtherCursor:
	.byte $01,$F0,$9C,$00, $F8
SpriteData_Poses_00_58_9B:
	.byte $00
SpriteData_PoseA2_Simon_Stand_WithShield:
	.byte $05,$E2,$03,$00, $F8,$E3,$05,$00, $03,$07,$F8,$03, $09,$00,$EB,$55
	.byte $F2
SpriteData_Pose04_Simon_Stand_WalkAnim4:
	.byte $84
	.word (SpriteData_PoseA2_Simon_Stand_WithShield) ;B161 (3161) ()
	.byte $03,$05,$07,$09
SpriteData_Poses_01_03_07_09_Simon_WalkAnim1and3_ClimbAnim2:
	.byte $84
	.word (SpriteData_PoseA2_Simon_Stand_WithShield) ;B161 (3161) ()
	.byte $0B,$0D,$0F,$11
SpriteData_Poses_02_0D_Simon_WalkAnim2:
	.byte $84
	.word (SpriteData_PoseA2_Simon_Stand_WithShield) ;B161 (3161) ()
	.byte $13,$15,$17,$19
SpriteData_PoseA3_Simon_Duck_WithShield:
	.byte $05,$E8,$03,$00, $F8,$E9,$05,$00, $09,$1B,$F8,$09, $1D,$00,$F1,$55
	.byte $F2
SpriteData_Poses_05_2D_Simon_Duck_Jump:
	.byte $84
	.word (SpriteData_PoseA3_Simon_Duck_WithShield) ;B187 (3187) ()
	.byte $03,$05,$1B,$1D
SpriteData_Poses_06_B3_Simon_ClimbAnim2:
	.byte $04,$E0,$13,$00,$F8,$E1,$15,$00,$01,$1F,$F8,$01,$1D,$00
SpriteData_Poses_08_B7_Simon_ClimbAnim1:
	.byte $84
	.word (SpriteData_Poses_06_B3_Simon_ClimbAnim2) ;B19F (319F) ()
DataTableEntry_31B0:
	.byte $13,$15,$21,$23
SpriteData_PoseB0_Simon_Stairs_Pose1_WhipAnim1:
	.byte $83
	.word (SpriteData_PoseB2_Simon_Stairs_Pose1_WhipAnim3) ;B1C0 (31C0) ()
	.byte $25,$1F,$1D
SpriteData_PoseB1_Simon_Stairs_Pose1_WhipAnim2:
	.byte $83
	.word (SpriteData_PoseB2_Simon_Stairs_Pose1_WhipAnim3) ;B1C0 (31C0) ()
	.byte $2D,$1F,$1D
SpriteData_PoseB2_Simon_Stairs_Pose1_WhipAnim3:
	.byte $05,$E0,$35,$00,$00,$01,$1F,$F8,$01,$1D,$00,$E1,$33,$F8,$E1,$37
	.byte $F0
SpriteData_PoseB4_Simon_Stairs_Pose2_WhipAnim1:
	.byte $83
	.word (SpriteData_PoseB2_Simon_Stairs_Pose1_WhipAnim3) ;B1C0 (31C0) ()
	.byte $25,$21,$23
SpriteData_PoseB5_Simon_Stairs_Pose2_WhipAnim2:
	.byte $83
	.word (SpriteData_PoseB2_Simon_Stairs_Pose1_WhipAnim3) ;B1C0 (31C0) ()
	.byte $2D,$21,$23
SpriteData_PoseB6_Simon_Stairs_Pose2_WhipAnim3:
	.byte $85
	.word (SpriteData_PoseB2_Simon_Stairs_Pose1_WhipAnim3) ;B1C0 (31C0) ()
	.byte $35,$21,$23,$33,$37
SpriteData_Pose0A_Simon_WhipAnim1_ThrowAnim1:
	.byte $83
	.word (SpriteData_Pose0C_Simon_WhipAnim3_ThrowAnim3) ;B1F1 (31F1) ()
	.byte $25,$07,$09
SpriteData_Pose0B_Simon_WhipAnim2_ThrowAnim2:
	.byte $83,$F1,$B1,$2D,$07,$09
SpriteData_Pose0C_Simon_WhipAnim3_ThrowAnim3:
	.byte $05,$E2,$35,$00, $00,$03,$07,$F8, $03,$09,$00,$E3, $33,$F8,$E3,$37
	.byte $F0
SpriteData_Pose2A_Simon_SitWhip_Anim1:
	.byte $83
	.word (SpriteData_Pose2C_Simon_SitWhip_Anim3) ;B20E (320E) ()
	.byte $25,$1B,$1D
SpriteData_Pose2B_Simon_SitWhip_Anim2:
	.byte $83
	.word (SpriteData_Pose2C_Simon_SitWhip_Anim3) ;B20E (320E) ()
	.byte $2D,$1B,$1D
SpriteData_Pose2C_Simon_SitWhip_Anim3:
	.byte $05,$E8,$35,$00,$00,$09,$1B,$F8,$09,$1D,$00,$E9,$33,$F8,$E9,$37
	.byte $F0
SpriteData_Pose0E_Skeleton_Anim1:
	.byte $04,$DA,$B1,$03, $F8,$DB,$B3,$00, $FB,$B5,$F8,$FB, $B7,$00
SpriteData_Pose0F_Skeleton_Anim2:
	.byte $04,$DC,$B1,$03, $F8,$DD,$B3,$00, $FB,$B9,$F8,$FB, $BB,$00
SpriteData_Pose1E_Vendor_Anim1:
	.byte $84
	.word (SpriteData_Pose0E_Skeleton_Anim1) ;B21F (321F) ()
	.byte $6F,$71,$73,$75
SpriteData_Pose1F_Vendor_Anim2:
	.byte $84
	.word (SpriteData_Pose0F_Skeleton_Anim2) ;B22D (322D) ()
	.byte $6F,$71,$77,$79
SpriteData_Pose2E_Spider_Anim1:
	.byte $02,$F0,$8B,$02, $F8,$F0,$8B,$42, $00
SpriteData_Pose2F_Spider_Anim2:
	.byte $82
	.word (SpriteData_Pose2E_Spider_Anim1) ;B249 (3249) ()
	.byte $BF,$BF
SpriteData_Pose75_SpiderLine_Anim1:
	.byte $81
	.word (SpriteData_Pose85_SpiderLine_Anim4) ;B266 (3266) ()
	.byte $8F
SpriteData_Pose76_SpiderLine_Anim2:
	.byte $82
	.word (SpriteData_Pose85_SpiderLine_Anim4) ;B266 (3266) ()
	.byte $8F,$8F
SpriteData_Pose77_SpiderLine_Anim3:
	.byte $83
	.word (SpriteData_Pose85_SpiderLine_Anim4) ;B266 (3266) ()
	.byte $8F,$8F,$8F
SpriteData_Pose85_SpiderLine_Anim4:
	.byte $04,$F0,$8F,$02, $F8,$11,$8F,$F8, $31,$8F,$F8,$51, $8F,$F8
SpriteData_Pose29_Fireball:
	.byte $01,$E8,$7B,$01, $FC
SpriteData_PoseAD_Weapon_AllKnives:
	.byte $02,$F0,$59,$00,$F8,$F1,$5B,$00
SpriteData_Pose41_Weapon_WaterBottle:
	.byte $81
	.word (SpriteData_Pose29_Fireball) ;B274 (3274) ()
	.byte $56
SpriteData_Pose5C_SplashEffectWhenSimonDies:
	.byte $01,$E8,$7D,$03, $FC
SpriteData_Pose3A_Garlic:
	.byte $81
	.word (SpriteData_Pose29_Fireball) ;B274 (3274) ()
	.byte $6C
SpriteData_Pose69_Whip_Chain_Anim1:
	.byte $83
	.word (SpriteData_Pose52_Whip_LeatherThorn_Anim1) ;B294 (3294) ()
	.byte $49,$27,$2B
SpriteData_Pose52_Whip_LeatherThorn_Anim1:
	.byte $03,$F0,$29,$00, $00,$E1,$27,$F8, $11,$2B,$00
SpriteData_Pose53_Whip_LeatherThorn_Anim2:
	.byte $82
	.word (SpriteData_Pose6D_Whip_MStarFire_Anim1) ;B2B8 (32B8) ()
	.byte $2F,$31
SpriteData_Pose54_Whip_LeatherThorn_Part1Anim3:
	.byte $82
	.word (SpriteData_Pose6F_Whip_MStar_Part2Anim3) ;B2C8 (32C8) ()
	.byte $39,$39
SpriteData_Poses_55_68_Whip_LeatherThorn_Part2Anim3:
	.byte $82
	.word (SpriteData_Pose6F_Whip_MStar_Part2Anim3) ;B2C8 (32C8) ()
	.byte $3B,$39
SpriteData_Pose6A_Whip_Chain_Anim2:
	.byte $82
	.word (SpriteData_Pose6D_Whip_MStarFire_Anim1) ;B2B8 (32B8) ()
	.byte $2F,$4D
SpriteData_Poses_6B_6C_70_Whip_Chain_Part1and2Anim3_MStar_Part1_Anim3:
	.byte $82
	.word (SpriteData_Pose6F_Whip_MStar_Part2Anim3) ;B2C8 (32C8) ()
	.byte $53,$53
SpriteData_Pose6D_Whip_MStarFire_Anim1:
	.byte $03,$E0,$27,$00, $F8,$F1,$49,$00, $11,$4B,$00
SpriteData_Pose6E_Whip_MStarFire_Anim2:
	.byte $82
	.word (SpriteData_Pose6D_Whip_MStarFire_Anim1) ;B2B8 (32B8) ()
	.byte $2F,$4F
SpriteData_Pose6F_Whip_MStar_Part2Anim3:
	.byte $03,$E0,$53,$00, $F8,$E1,$53,$00, $E1,$51,$F0
SpriteData_Pose71_Whip_Fire_Part1Anim3:
	.byte $03,$E0,$5F,$01, $00,$E1,$5F,$F8, $E1,$5D,$F0
SpriteData_Pose72_Whip_FIre_Part2Anim3:
	.byte $82
	.word (SpriteData_Pose71_Whip_Fire_Part1Anim3) ;B2D3 (32D3) ()
	.byte $5F,$5F
SpriteData_Pose73_SimonGettingThrownAround:
	.byte $84
	.word (SpriteData_Poses_06_B3_Simon_ClimbAnim2) ;B19F (319F) ()
	.byte $3D,$3F,$1F,$1D
SpriteData_Pose74_SimonCorpse:
	.byte $04,$F0,$41,$00, $F0,$F1,$43,$F8, $F1,$45,$00,$F1, $47,$08
SpriteData_Poses_78_A4_AC_Weapon_FlameThrown_Anim1_PileAnim1and9_HiddenAnim1_EnemyDeathAnim1:
	.byte $02,$F0,$5D,$01, $F9,$F0,$5D,$41, $FB
SpriteData_Pose79_Weapon_FlameThrown_Anim2_HiddenAnim2_EnemyDeathAnim2:
	.byte $02,$F0,$5F,$41, $F9,$F0,$5F,$01, $FB
SpriteData_Poses_A5_AB_Weapon_FlamePile_Anim2and8:
	.byte $04,$E8,$5D,$41, $F9,$F9,$5D,$F9, $E8,$5D,$01,$FB, $F9,$5D,$FB
SpriteData_Poses_A6_AA_Weapon_FlamePile_Anim3and7:
	.byte $06,$E0,$5D,$01, $F9,$F1,$5D,$F9, $01,$5D,$F9,$E0, $5D,$41,$FB,$F1
	.byte $5D,$FB,$01,$5D, $FB
SpriteData_Poses_A7_A9_Weapon_FlamePile_Anim4and6:
	.byte $06,$D8,$5D,$41, $F9,$F1,$5D,$F9, $09,$5D,$F9,$D8, $5D,$01,$FB,$F1
	.byte $5D,$FB,$09,$5D, $FB
SpriteData_PoseA8_Weapon_FlamePile_Anim5:
	.byte $0A,$D0,$5D,$01, $F9,$E1,$5D,$F9, $F1,$5D,$F9,$01, $5D,$F9,$09,$5D
	.byte $F9,$D0,$5D,$41, $FB,$E1,$5D,$FB, $F1,$5D,$FB,$01, $5D,$FB,$09,$5D
	.byte $FB
SpriteData_Pose8B_Heart1:
	.byte $81
	.word (SpriteData_Pose29_Fireball) ;B274 (3274) ()
	.byte $60
SpriteData_Pose8C_Heart2:
	.byte $01,$E8,$57,$00, $FC
SpriteData_Pose8D_Heart3:
	.byte $02,$F0,$57,$00, $F8,$F0,$57,$40, $00
SpriteData_Pose43_FloatingPlatform2:
	.byte $04,$FA,$F6,$03, $F0,$FB,$F8,$F8, $FB,$F6,$FF,$FB, $F8,$07
SpriteData_Pose51_FloatingPlatform3:
	.byte $04,$FA,$F6,$03, $F8,$FB,$F8,$00, $1B,$F6,$F8,$1B, $F8,$00
SpriteData_Pose1B_FloatingPlatform1:
	.byte $82
	.word (SpriteData_Pose51_FloatingPlatform3) ;B384 (3384) ()
	.byte $F6,$F8
SpriteData_Pose7E:
	.byte $01,$FA,$69,$00, $00
SpriteData_PoseB8_Weapon_Diamond_Anim1:
	.byte $82
	.word (SpriteData_PoseAD_Weapon_AllKnives) ;B279 (3279) ()
	.byte $6A,$67
SpriteData_PoseB9_Weapon_Diamond_Anim2:
	.byte $02,$EE,$6A,$80, $F8,$EF,$67,$00
SpriteData_PoseBA_Weapon_Diamond_Anim3:
	.byte $02,$EE,$6A,$C0, $01,$EF,$67,$F9
SpriteData_PoseBB_Weapon_Diamond_Anim4:
	.byte $02
DataTableEntry_33B2:
	.byte $F0,$6A,$40,$01,$F1,$67,$F9
SpriteData_Pose30_ClueBook:
	.byte $82
	.word (SpriteData_PoseAD_Weapon_AllKnives) ;B279 (3279) ()
	.byte $42,$44
SpriteData_Pose48_SpiderNet:
	.byte $02,$F0,$8D,$03, $F8,$F0,$8D,$C3, $00
SpriteData_PoseEF:
	.byte $01,$00,$2B,$00, $00
SpriteData_PoseF0_PasswordCursor:
	.byte $01,$00,$26,$01, $00
SpriteData_Pose15:
	.byte $02,$F0,$81,$03, $F8,$F1,$83,$00
SpriteData_Poses_16_18:
	.byte $82
	.word (SpriteData_Pose15) ;B3D1 (33D1) ()
	.byte $85,$87
SpriteData_Pose17:
	.byte $02,$FC,$89,$03, $F8,$FD,$8B,$00
SpriteData_Pose3F_TownZombie_Anim1:
	.byte $84
	.word (SpriteData_Pose22_TownBoy_Anim1) ;B41F (341F) ()
	.byte $D1,$D3,$D5,$D7
SpriteData_Pose40_TownZombie_Anim2:
	.byte $04,$DC,$D9,$02, $F8,$DD,$DB,$00, $FB,$D5,$F8,$FB, $D7,$00
SpriteData_Pose1C_TownLady_Anim1:
	.byte $03,$DA,$E1,$00, $FC,$FB,$E3,$FC, $FB,$E5,$04
SpriteData_Pose1D_TownLady_Anim2:
	.byte $03,$DC,$E1,$00, $FC,$FB,$E7,$FC, $FB,$E9,$04
SpriteData_Pose20_Priest_Anim1:
	.byte $84
	.word (SpriteData_Pose0E_Skeleton_Anim1) ;B21F (321F) ()
	.byte $91,$93,$95,$97
SpriteData_Pose21_Priest_Anim2:
	.byte $84
	.word (SpriteData_Pose0E_Skeleton_Anim1) ;B21F (321F) ()
	.byte $99,$9B,$9D,$9F
SpriteData_Pose22_TownBoy_Anim1:
	.byte $04,$DA,$C1,$02, $F8,$DB,$C3,$00, $FB,$C5,$F8,$FB, $C7,$00
SpriteData_Pose23_TownBoy_Anim2:
	.byte $84
	.word (SpriteData_Pose22_TownBoy_Anim1) ;B41F (341F) ()
	.byte $C9,$CB,$CD,$CF
SpriteData_Pose24_TownMonk_Anim1:
	.byte $84
	.word (SpriteData_Pose22_TownBoy_Anim1) ;B41F (341F) ()
	.byte $A1,$A3,$A5,$A7
SpriteData_Pose25_TownMonk_Anim2:
	.byte $84
	.word (SpriteData_Pose22_TownBoy_Anim1) ;B41F (341F) ()
	.byte $A9,$AB,$AD,$AF
SpriteData_Pose26_TownFriend_Anim1:
	.byte $84
	.word (SpriteData_Pose0E_Skeleton_Anim1) ;B21F (321F) ()
	.byte $B1,$B3,$B5,$B7
SpriteData_Pose27_TownFriend_Anim2:
	.byte $84
	.word (SpriteData_Pose0E_Skeleton_Anim1) ;B21F (321F) ()
	.byte $B9,$BB,$BD,$BF
SpriteData_Pose28_TownSittingMan:
	.byte $04,$DA,$8D,$00, $F8,$DB,$8F,$00, $FB,$DD,$F8,$FB, $DF,$00
SpriteData_Pose19_MansionUnusedMonster_Or_Fishman_Anim1:
	.byte $04,$E0,$D1,$02, $F8,$E1,$D3,$00, $01,$D5,$F8,$01, $D7,$00
SpriteData_Pose1A_MansionUnusedMonster_Or_Fishman_Anim2:
	.byte $04,$E2,$D1,$02, $F8,$E3,$D3,$00, $01,$D9,$F8,$01, $DB,$00
SpriteData_Pose31_Gargoyle_Anim1:
	.byte $06,$DA,$C1,$02, $F4,$DB,$C3,$FC, $DB,$C5,$04,$FB, $C7,$F4,$FB,$C9
	.byte $FC,$FB,$CB,$04
SpriteData_Pose32_Gargoyle_Anim2:
	.byte $05,$DC,$C1,$02, $F4,$DD,$C3,$FC, $DD,$C5,$04,$FB, $CD,$F9,$FB,$CF
	.byte $FF
SpriteData_Pose35_Knight_Pose1:
	.byte $05,$DE,$AB,$03, $EC,$DF,$AD,$F4, $DB,$A1,$FC,$DB, $A3,$04,$FB,$A5
	.byte $01
SpriteData_Pose36_Knight_Pose2:
	.byte $06,$E0,$AB,$03, $F0,$E1,$AD,$F4, $DD,$A1,$FC,$DD, $A3,$04,$FB,$A7
	.byte $FC,$FB,$A9,$04
SpriteData_Pose42_Weapon_OakStake:
	.byte $82
	.word (SpriteData_PoseAD_Weapon_AllKnives) ;B279 (3279) ()
	.byte $DD,$DF
SpriteData_PoseA1_BodypartBag:
	.byte $02,$FA,$6B,$00, $F8,$FB,$6D,$00
SpriteData_Pose3B_CrystalBall:
	.byte $82
	.word (SpriteData_PoseA1_BodypartBag) ;B4C9 (34C9) ()
	.byte $EC,$EE
SpriteData_Pose81_FallingStone_pose1:
	.byte $02,$F0,$D2,$03, $F8,$F1,$D4,$00
SpriteData_Pose82_FellingStone_pose2:
	.byte $02,$F0,$D2,$83, $F8,$F1,$D4,$00
SpriteData_Pose9F_MansionFlyingSpikeUp:
	.byte $01,$F0,$E4,$00, $FC
SpriteData_PoseA0_MansionFlyingSpikeDown:
	.byte $01,$F0,$E4,$80, $FC
SpriteData_Pose83:
	.byte $01,$E8,$AF,$00, $04
SpriteData_Pose84:
	.byte $81
	.word (SpriteData_Pose83) ;B4F0 (34F0) ()
	.byte $D1
SpriteData_Pose3C_Slimey_FlatMaybe:
	.byte $02,$F0,$91,$02,$F8,$F1,$93,$00
SpriteData_Pose3D_FlamingMan_Anim1:
	.byte $82
	.word (SpriteData_Pose3C_Slimey_FlatMaybe) ;B4F9 (34F9) ()
	.byte $95,$97
SpriteData_Pose3E_FlamingMan_Anim2:
	.byte $02,$F0,$99,$02, $F8,$F0,$99,$42, $00
SpriteData_Pose86_MansionSlimey_GoingUp:
	.byte $01,$F0,$9B,$02, $FC
SpriteData_Pose87_MansionSlimey_HangingInCeiling_Anim1:
	.byte $02,$F0,$91,$82, $F8,$F1,$93,$00
SpriteData_Pose88_MansionSlimey_HangingInCeiling_Anim2:
	.byte $82
	.word (SpriteData_Pose87_MansionSlimey_HangingInCeiling_Anim1) ;B514 (3514) ()
	.byte $95,$97
SpriteData_Pose89_MansionSlimey_BallShape:
	.byte $02,$F0,$99,$82, $F8,$F0,$99,$C2, $00
SpriteData_Pose8A_MansionSlimey_GoingDown:
	.byte $01,$F0,$9B,$82, $FC
SpriteData_Pose37_ThrownBone_Anim1:
	.byte $02,$F0,$9F,$03, $F8,$F0,$9F,$C3, $00
SpriteData_Pose38_ThrownBone_Anim2:
	.byte $82
	.word (SpriteData_Pose37_ThrownBone_Anim1) ;B52F (352F) ()
	.byte $AF,$AF
SpriteData_Pose39_ThrownBone_Anim3:
	.byte $02,$F0,$9F,$83, $F8,$F0,$9F,$43, $00
SpriteData_Pose12_MansionBat_Anim1:
	.byte $82
	.word (SpriteData_PoseAD_Weapon_AllKnives) ;B279 (3279) ()
	.byte $81,$83
SpriteData_Pose13_MansionBat_Anim2:
	.byte $82
	.word (SpriteData_PoseAD_Weapon_AllKnives) ;B279 (3279) ()
	.byte $85,$87
SpriteData_Pose14_MansionBat_Hang:
	.byte $02,$F0,$89,$00, $F8,$F0,$89,$40, $00
SpriteData_PoseDE_Rosary:
	.byte $02,$FA,$7F,$02, $F8,$FB,$BD,$00
SpriteData_PoseCA_Carmilla_Anim1:
	.byte $0A,$E0,$E1,$03, $F0,$E1,$E3,$F8, $E1,$E5,$00,$E1, $E7,$08,$01,$E9
	.byte $F0,$01,$EB,$F8, $01,$ED,$00,$01, $EF,$08,$21,$F1, $F8,$21,$F3,$00
SpriteData_PoseDF_Unknown_MansionDroppingFireMaybe:
	.byte $01,$F0,$F5,$00, $FC
SpriteData_Poses_E0_E1:
	.byte $02,$F0,$EB,$02, $F8,$F1,$ED,$00
SpriteData_Pose44_DeathBoss_Anim1:
	.byte $0B,$D0,$D3,$03, $F4,$D1,$D5,$FC, $D1,$D7,$04,$F1, $D9,$EC,$F1,$DB
	.byte $F4,$F1,$E1,$FC, $F1,$E3,$04,$11, $E5,$F4,$11,$E7, $FC,$11,$E9,$04
	.byte $D1,$D1,$EC
SpriteData_Pose45_DeathBoss_Anim2:
	.byte $0A,$D0,$EB
DataTableEntry_35B4:
	.byte $03,$F4,$D1,$ED,$FC,$D1,$EF,$04,$F1,$F1,$F4,$F1,$F3,$FC,$F1,$F5
	.byte $04,$F1,$F7,$0C,$11,$E5,$F4,$11,$E7,$FC,$11,$E9,$04
SpriteData_PoseCF_Death_SickleAnim1:
	.byte $02,$F0,$F9,$02, $F8,$F1,$FB,$00
SpriteData_PoseD0_Death_SickleAnim2:
	.byte $82
	.word (SpriteData_PoseCF_Death_SickleAnim1) ;B5D1 (35D1) ()
	.byte $FD,$FF
SpriteData_PoseD1_Death_SickleAnim3:
	.byte $02,$F0,$FB,$C2, $F8,$F1,$F9,$00
SpriteData_PoseD2_Death_SickleAnim4:
	.byte $82
	.word (SpriteData_PoseD1_Death_SickleAnim3) ;B5DE (35DE) ()
	.byte $FF,$FD
SpriteData_Pose10_FishMan_Anim1:
	.byte $84
	.word (SpriteData_Pose67_FishMan_Shoots) ;B600 (3600) ()
	.byte $D1,$D3,$D5,$D7
SpriteData_Pose11_FishMan_Anim2:
	.byte $04,$E2,$D1,$02, $F8,$E3,$D3,$00, $01,$D9,$F8,$01, $DB,$00
SpriteData_Pose67_FishMan_Shoots:
	.byte $04,$E0,$DD,$02, $F8,$E1,$DF,$00, $01,$D5,$F8,$01, $D7,$00
SpriteData_Pose59_Mudman_Anim1:
	.byte $02,$FA,$C1,$03, $F8,$FB,$C3,$00
SpriteData_Pose5A_Mudman_Anim2:
	.byte $82
	.word (SpriteData_Pose59_Mudman_Anim1) ;B60E (360E) ()
	.byte $C5,$C7
SpriteData_Pose5B_Mudman_Anim3:
	.byte $84
	.word (SpriteData_Pose0E_Skeleton_Anim1) ;B21F (321F) ()
	.byte $C9,$CB,$CD,$CF
SpriteData_Pose5D_TwoHeadedCreature_Anim1:
	.byte $05,$DA,$E1,$02, $F0,$DB,$E3,$F8, $DB,$E5,$00,$FB, $E7,$F8,$FB,$E9
	.byte $00
SpriteData_Pose5E_TwoHeadedCreature_Anim2:
	.byte $85
	.word (SpriteData_Pose5D_TwoHeadedCreature_Anim1) ;B622 (3622) ()
	.byte $EB,$ED,$E5,$EF,$F1
SpriteData_Pose61_Leech_Anim1:
	.byte $02,$E0,$BD,$00, $00,$01,$9A,$00
SpriteData_Pose62_Leech_Anim2:
	.byte $82
	.word (SpriteData_Pose61_Leech_Anim1) ;B63B (363B) ()
	.byte $9C,$9E
SpriteData_Pose63_Wolf_Anim1:
	.byte $04,$FA,$91,$03, $F0,$FB,$93,$F8, $FB,$95,$00,$FB, $97,$08
SpriteData_Pose64_Wolf_Anim2_Leap:
	.byte $84
	.word (SpriteData_Pose63_Wolf_Anim1) ;B648 (3648) ()
	.byte $99,$9B,$9D,$9F
SpriteData_Pose65_Werewolf_Anim1:
	.byte $84
	.word (SpriteData_Pose0E_Skeleton_Anim1) ;B21F (321F) ()
	.byte $A1,$A3,$A5,$A7
SpriteData_Pose66_Werewolf_Anim2:
	.byte $84
	.word (SpriteData_Pose0E_Skeleton_Anim1) ;B21F (321F) ()
	.byte $A9,$AB,$AD,$AF
SpriteData_Pose7F_Ferryman_Part1:
	.byte $07,$E0,$6F,$03, $F8,$E1,$71,$00, $01,$73,$F8,$01, $75,$00,$11,$FB
	.byte $F4,$21,$FD,$FC, $21,$FD,$04
SpriteData_Pose80_Ferryman_Part2:
	.byte $03,$00,$FD,$03, $F4,$01,$FD,$FC, $F0,$FB,$43,$04
SpriteData_PoseC6_Eyeball_Anim1:
	.byte $82
	.word (SpriteData_PoseAD_Weapon_AllKnives) ;B279 (3279) ()
	.byte $F3,$F5
SpriteData_PoseC7_Eyeball_Anim2:
	.byte $82
	.word (SpriteData_PoseAD_Weapon_AllKnives) ;B279 (3279) ()
	.byte $F7,$F9
SpriteData_PoseC8_CaveBat_Anim1:
	.byte $82
	.word (SpriteData_PoseAD_Weapon_AllKnives) ;B279 (3279) ()
	.byte $81,$83
SpriteData_PoseC9_CaveBat_Anim2:
	.byte $82
	.word (SpriteData_PoseAD_Weapon_AllKnives) ;B279 (3279) ()
	.byte $85,$87
SpriteData_Pose9C:
	.byte $06,$E0,$C5,$00, $F0,$E1,$C7,$F8, $E1,$C9,$00,$E1, $CB,$08,$01,$CD
	.byte $F8,$01,$CF,$00
SpriteData_Pose4F_MedusaHead_Anim1:
	.byte $02,$F0,$F3,$03, $F8,$F1,$F5,$00
SpriteData_Pose50_MedusaHead_Anim2:
	.byte $82
	.word (SpriteData_Pose4F_MedusaHead_Anim1) ;B6B6 (36B6) ()
	.byte $F7,$F9
SpriteData_Pose90_Raven_Anim1:
	.byte $84
	.word (SpriteData_Pose97_Gargoyle_FlyPose1) ;B6D6 (36D6) ()
	.byte $85,$87,$81,$83
SpriteData_Pose91_Raven_Anim2:
	.byte $82
	.word (SpriteData_Pose97_Gargoyle_FlyPose1) ;B6D6 (36D6) ()
	.byte $89,$8B
SpriteData_Pose92_Raven_Anim3:
	.byte $84
	.word (SpriteData_Pose97_Gargoyle_FlyPose1) ;B6D6 (36D6) ()
	.byte $FB,$FD,$8D,$8F
SpriteData_Pose97_Gargoyle_FlyPose1:
	.byte $05,$00,$A7,$03, $F8,$01,$A9,$00, $E1,$A1,$F8,$E1, $A3,$00,$E1,$A5
	.byte $08
SpriteData_Poses_98_9A_Gargoyle_FlyPose2and4:
	.byte $05,$D0,$AB,$03, $F8,$D1,$AD,$00, $E1,$AF,$08,$F1, $A7,$F8,$F1,$A9
	.byte $00
SpriteData_Pose99_Gargoyle_FlyPose3:
	.byte $05,$E0,$A7,$03, $F8,$E1,$B1,$00, $E1,$B3,$08,$01, $B5,$00,$01,$B7
	.byte $08
SpriteData_PoseED_Gargoyle_WalkPose1:
	.byte $84
	.word (SpriteData_PoseBC_Mummy_Anim1) ;B717 (3717) ()
	.byte $B9,$BB,$BD,$BF
SpriteData_PoseEE_Gargoyle_WalkPose2:
	.byte $84
	.word (SpriteData_Pose0E_Skeleton_Anim1) ;B21F (321F) ()
	.byte $B9,$BB,$C1,$C3
SpriteData_PoseBC_Mummy_Anim1:
	.byte $06,$DA,$E5,$03, $F8,$DB,$E7,$00, $FB,$E9,$F8,$FB, $EB,$00,$BB,$E1
	.byte $FD,$DB,$E3,$F0
SpriteData_PoseBD_Mummy_Anim2:
	.byte $06,$DC,$E5,$03, $F7,$DD,$E7,$FF, $FB,$ED,$F8,$FB, $EF,$00,$BD,$E1
	.byte $FC,$DD,$E3,$EF
SpriteData_PoseBE_PlantIdle:
	.byte $06,$DA,$D1,$00, $F4,$DB,$D3,$FC, $DA,$D5,$02,$04, $FB,$D7,$F4,$FB
	.byte $D9,$FC,$FB,$DB, $04
SpriteData_PoseBF_PlantShooting:
	.byte $08,$DA,$DD,$00, $EC,$DB,$9C,$F4, $DA,$9E,$02,$FC, $DB,$A0,$04,$FA
	.byte $DF,$00,$EC,$FA, $D7,$02,$F4,$FB, $D9,$FC,$FB,$DB, $04
SpriteData_PoseE6_FlamingFlyingPirateSkeleton_Anim1:
	.byte $04,$E0,$91,$02, $F8,$E1,$93,$00, $01,$95,$F8,$01, $97,$00
SpriteData_PoseE7_FlamingFlyingPirateSkeleton_Anim2:
	.byte $84
	.word (SpriteData_PoseE6_FlamingFlyingPirateSkeleton_Anim1) ;B771 (3771) ()
	.byte $99,$9B,$9D,$9F
SpriteData_Pose49_Skull_Anim1:
	.byte $02,$F0,$F3,$03, $F8,$F1,$F5,$00
SpriteData_Pose4A_Skull_Anim2:
	.byte $82
	.word (SpriteData_Pose49_Skull_Anim1) ;B786 (3786) ()
	.byte $F7,$F9
SpriteData_Pose56_DragonBone_Head_open:
	.byte $02,$E0,$D1,$03, $F8,$E1,$D3,$00
SpriteData_Pose57_DragonBone_Head_closed:
	.byte $82
	.word (SpriteData_Pose56_DragonBone_Head_open) ;B793 (3793) ()
	.byte $D5,$D7
SpriteData_PoseE2:
	.byte $04,$DA,$69,$03, $F0,$DB,$7F,$F8, $FB,$D9,$F8,$FB, $DB,$00
SpriteData_Poses_E3_E5:
	.byte $04,$DA,$D9,$03, $F4,$DB,$DB,$FC
DataTableEntry_37B6:
	.byte $FB,$69,$F8,$FB,$7F,$00
SpriteData_PoseE4:
	.byte $84
	.word (SpriteData_Pose0E_Skeleton_Anim1) ;B21F (321F) ()
	.byte $69,$7F,$69,$7F
SpriteData_PoseC0:
	.byte $82
	.word (SpriteData_PoseC2_Maybe_Mudman) ;B7CD (37CD) ()
	.byte $C1,$C3
SpriteData_PoseC1:
	.byte $82
	.word (SpriteData_PoseC2_Maybe_Mudman) ;B7CD (37CD) ()
	.byte $C5,$C7
SpriteData_PoseC2_Maybe_Mudman:
	.byte $04,$00,$CD,$03, $F8,$01,$CF,$00, $E1,$C9,$F8,$E1, $CB,$00
SpriteData_Pose46_Leech_Anim1_maybe:
	.byte $02,$E0,$BD,$00, $00,$01,$9A,$00
SpriteData_Pose47_Leech_Anim2_maybe:
	.byte $82
	.word (SpriteData_Pose46_Leech_Anim1_maybe) ;B7DB (37DB) ()
	.byte $9C,$9E
SpriteData_PoseC3_Slimey_FlatAnim1:
	.byte $02,$F8,$91,$02, $F8,$F9,$93,$00
SpriteData_PoseC4_Slimey_FlatAnim2:
	.byte $82
	.word (SpriteData_PoseC3_Slimey_FlatAnim1) ;B7E8 (37E8) ()
	.byte $95,$97
SpriteData_PoseC5_Slimey_Leap:
	.byte $02,$F8,$99,$02, $F8,$F8,$99,$42, $00
SpriteData_Pose8E_ZombieHand_Anim1closed:
	.byte $02,$20,$89,$02, $F8,$21,$9F,$00
SpriteData_Pose8F_ZombieHand_Anim2open:
	.byte $82
	.word (SpriteData_Pose8E_ZombieHand_Anim1closed) ;B7FE (37FE) ()
	.byte $FB,$FD
SpriteData_Pose93_HoodedSkeleton_WalkAnim1:
	.byte $84
	.word (SpriteData_Pose0E_Skeleton_Anim1) ;B21F (321F) ()
	.byte $E1,$E3,$E5,$E7
SpriteData_Pose94_HoodedSkeleton_WalkAnim2:
	.byte $84
	.word (SpriteData_Pose95_HoodedSkeleton_FistAnim1) ;B819 (3819) ()
	.byte $E1,$E3,$E9,$EB
SpriteData_Pose95_HoodedSkeleton_FistAnim1:
	.byte $05,$DC,$EF,$03, $F8,$DD,$E3,$00, $FB,$E9,$F8,$FB, $EB,$00,$DD,$ED
	.byte $F0
SpriteData_Pose96_HoodedSkeleton_FistAnim2:
	.byte $84
	.word (SpriteData_Pose0E_Skeleton_Anim1) ;B21F (321F) ()
	.byte $F1,$E3,$E5,$E7
SpriteData_Pose9D_BurningMan_Anim1:
	.byte $04,$DA,$A1,$01, $F8,$DB,$A3,$00, $FB,$A5,$F8,$FB, $A7,$00
SpriteData_Pose9E_BurningMan_Anim2:
	.byte $84
	.word (SpriteData_Pose9D_BurningMan_Anim1) ;B831 (3831) ()
	.byte $A9,$AB,$AD,$AF
Bank0unusedBegins:
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$D8,$78,$EE,$FF,$FF,$4C
	.byte $00,$C0,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$46,$C0,$D0,$FF,$96,$C0
