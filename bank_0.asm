.segment "BANK_00"

; Offset in ROM: $00000
.setcpu "6502X"
.feature org_per_seg
.feature pc_assignment

.include "globals.inc"


.ifndef custom_music
	.include "music/Dracula.asm"
.else
	.include "custom/Dracula.asm"
.endif

; -----------------------------------------------------------------------------

; 3 bytes per entry
; -----------------
; Bits 5-7: Number of channels for this song/sfx - 1
; Bits 0-4: Next pointer's channel number (0 to 6)
; Word: Pointer to channel data
Sound_Records:
	.byte $04
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
; -----------------------------------------------------------------------------

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
; Part of SFX $12, possibly referenced as result of bugged code, or unused
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
	.byte $02,$30,$88,$10,$00,$FE,$FF
	.word (SoundData2D_SFX_ch3)	; $A5,$85
SoundData2F_SFX_ch3:
	.byte $04,$F0,$81,$F0,$C0,$F0,$20,$E0,$80,$E0,$20,$D0,$80,$D0,$20,$C0
	.byte $80,$C0,$20,$B0,$80,$B0,$20,$A0,$80,$A0,$20,$90,$80,$90,$20,$80
	.byte $80,$80,$20,$70,$80,$70,$20,$60,$80,$60,$20,$50,$80,$50,$20,$40
	.byte $80,$40,$20,$30,$80,$30,$20,$FF
SoundData30_SFX_ch1:
	.byte $01,$F0,$88,$10,$00,$FE,$FF
	.word (SoundData2F_SFX_ch3)	; $CC,$85
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
	.byte $01,$70,$86,$10,$00,$FE,$FF
	.word (SoundData34_SFX_Death_ch3)	; $5B,$86
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
; -----------------------------------------------------------------------------

.ifndef custom_music
	.include "music/Ending.asm"
.else
	.include "custom/Ending.asm"
.endif

; -----------------------------------------------------------------------------

; Volume envelopes
SoundEnvelopePtrs_1:
	.word (SoundEnvelope_0B9A) ;8B9A (B9A) ()
	.word (SoundEnvelope_0BA0) ;8BA0 (BA0) ()
	.word (SoundEnvelope_0BA6) ;8BA6 (BA6) ()
	.word (SoundEnvelope_0BAF) ;8BAF (BAF) ()
	.word (SoundEnvelope_0BB3) ;8BB3 (BB3) ()
	.word (SoundEnvelope_0BBB) ;8BBB (BBB) ()
	.word (SoundEnvelope_0BC2) ;8BC2 (BC2) ()
	.word (SoundEnvelope_0BC7) ;8BC7 (BC7) ()
	.word (SoundEnvelope_0BD1) ;8BD1 (BD1) ()
	.word (SoundEnvelope_0BDC) ;8BDC (BDC) ()
	.word (SoundEnvelope_0BE1) ;8BE1 (BE1) ()
	.word (SoundEnvelope_0BEB) ;8BEB (BEB) ()
	.word (SoundEnvelope_0BF3) ;8BF3 (BF3) ()
	.word (SoundEnvelope_0BFA) ;8BFA (BFA) ()
	.word (SoundEnvelope_0C02) ;8C02 (C02) ()
	.word (SoundEnvelope_0C08) ;8C08 (C08) ()
	.word (SoundEnvelope_0C0E) ;8C0E (C0E) ()
	.word (SoundEnvelope_0C12) ;8C12 (C12) ()
	.word (SoundEnvelope_0C1B) ;8C1B (C1B) ()
	.word (SoundEnvelope_0C23) ;8C23 (C23) ()
	.word (SoundEnvelope_0C2C) ;8C2C (C2C) ()
	.word (SoundEnvelope_0C36) ;8C36 (C36) ()
	.word (SoundEnvelope_0C3D) ;8C3D (C3D) ()
	.word (SoundEnvelope_0C43) ;8C43 (C43) ()
	.word (SoundEnvelope_0C4B) ;8C4B (C4B) ()
	.word (SoundEnvelope_0C52) ;8C52 (C52) ()
	.word (SoundEnvelope_0C59) ;8C59 (C59) ()
	.word (SoundEnvelope_0C59) ;8C59 (C59) ()
	.word (SoundEnvelope_0C5F) ;8C5F (C5F) ()
	.word (SoundEnvelope_0C65) ;8C65 (C65) ()
	.word (SoundEnvelope_0C71) ;8C71 (C71) ()
	.word (SoundEnvelope_0C76) ;8C76 (C76) ()
	.word (SoundEnvelope_0C82) ;8C82 (C82) ()
	.word (SoundEnvelope_0C8B) ;8C8B (C8B) ()
	.word (SoundEnvelope_0C90) ;8C90 (C90) ()
	.word (SoundEnvelope_0C95) ;8C95 (C95) ()
	.word (SoundEnvelope_0C9C) ;8C9C (C9C) ()
	.word (SoundEnvelope_0CA2) ;8CA2 (CA2) ()
	.word (SoundEnvelope_0CAD) ;8CAD (CAD) ()
	.word (SoundEnvelope_0CB5) ;8CB5 (CB5) ()
	.word (SoundEnvelope_0CC8) ;8CC8 (CC8) ()

	.word (SoundEnvelopePtrs_2) ;8CD0 (CD0) ()
	.word (SoundEnvelopePtrs_2) ;8CD0 (CD0) ()
	.word (SoundEnvelopePtrs_2) ;8CD0 (CD0) ()
	.word (SoundEnvelopePtrs_2) ;8CD0 (CD0) ()
	.word (SoundEnvelopePtrs_2) ;8CD0 (CD0) ()
	.word (SoundEnvelopePtrs_2) ;8CD0 (CD0) ()
	.word (SoundEnvelopePtrs_2) ;8CD0 (CD0) ()
; -----------------------------------------------------------------------------

; Instrument (envelopes) definitions
; XY: X = duration (ticks) Y = volume (low nibble for reg 0)
; FB: Loop start
; FE, XX: Loop end, XX = repetitions
; FF: End of envelope
SoundEnvelope_0B9A:
	.byte $14,$16,$17,$16,$F5,$FF
SoundEnvelope_0BA0:
	.byte $14,$15,$17,$26,$F5,$FF
SoundEnvelope_0BA6:
	.byte $12,$13,$14,$15,$16,$27,$16,$F5,$FF
SoundEnvelope_0BAF:
	.byte $19,$27,$F6,$FF
SoundEnvelope_0BB3:
	.byte $1D,$1B,$1A,$15,$17,$16,$F5,$FF
SoundEnvelope_0BBB:
	.byte $13,$15,$17,$18,$17,$F6,$FF
SoundEnvelope_0BC2:
	.byte $14,$45,$F4,$F3,$FF
SoundEnvelope_0BC7:
	.byte $18,$16,$45,$54,$23,$25,$24,$23,$25,$FF
SoundEnvelope_0BD1:
	.byte $17,$18,$17,$16,$35,$14,$15,$16,$27,$28,$FF
SoundEnvelope_0BDC:
	.byte $18,$17,$26,$B5,$FF
SoundEnvelope_0BE1:
	.byte $17,$19,$18,$17,$36,$44,$45,$46,$47,$FF
SoundEnvelope_0BEB:
	.byte $42,$43,$44,$25,$26,$25,$F4,$FF
SoundEnvelope_0BF3:
	.byte $17,$19,$18,$17,$15,$76,$FF
SoundEnvelope_0BFA:
	.byte $17,$16,$15,$13,$15,$14,$A3,$FF
SoundEnvelope_0C02:
	.byte $15,$27,$26,$65,$F4,$FF
SoundEnvelope_0C08:
	.byte $82,$83,$84,$85,$86,$FF
SoundEnvelope_0C0E:
	.byte $16,$17,$F6,$FF
SoundEnvelope_0C12:
	.byte $14,$16,$17,$18,$12,$13,$14,$15,$FF
SoundEnvelope_0C1B:
	.byte $22,$23,$24,$25,$26,$45,$F4,$FF
SoundEnvelope_0C23:
	.byte $1A,$28,$17,$16,$15,$14,$15,$F6,$FF
SoundEnvelope_0C2C:
	.byte $12,$13,$14,$25,$26,$27,$16,$15,$F6,$FF
SoundEnvelope_0C36:
	.byte $1A,$18,$17,$16,$15,$A4,$FF
SoundEnvelope_0C3D:
	.byte $1A,$18,$17,$16,$A5,$FF
SoundEnvelope_0C43:
	.byte $18,$27,$26,$15,$14,$85,$76,$FF
SoundEnvelope_0C4B:
	.byte $1A,$17,$16,$13,$35,$F4,$FF
SoundEnvelope_0C52:
	.byte $26,$25,$24,$15,$24,$53,$FF
SoundEnvelope_0C59:
	.byte $24,$43,$14,$23,$62,$FF
SoundEnvelope_0C5F:
	.byte $17,$26,$25,$26,$F7,$FF
SoundEnvelope_0C65:
	.byte $FB,$83,$44,$85,$86,$45,$86,$45,$86,$45,$86,$FF
SoundEnvelope_0C71:
	.byte $18,$17,$16,$F5,$FF
SoundEnvelope_0C76:
	.byte $14,$16,$17,$F6,$F5,$F5,$F4,$F4,$F4,$F3,$F2,$FF
SoundEnvelope_0C82:
	.byte $13,$15,$26,$11,$22,$13,$14,$25,$FF
SoundEnvelope_0C8B:
	.byte $11,$12,$14,$F5,$FF
SoundEnvelope_0C90:
	.byte $31,$32,$33,$F4,$FF
SoundEnvelope_0C95:
	.byte $13,$15,$16,$35,$23,$F4,$FF
SoundEnvelope_0C9C:
	.byte $15,$16,$25,$14,$F5,$FF
SoundEnvelope_0CA2:
	.byte $F1,$F1,$F2,$F2,$F3,$F3,$F4,$F4,$F4,$F4,$FF
SoundEnvelope_0CAD:
	.byte $22,$23,$24,$25,$16,$F5,$F4,$FF
SoundEnvelope_0CB5:
	.byte $15,$16,$18,$16,$25,$24,$F5,$F5,$F4,$F4,$F4,$F3,$F3,$F3,$F2,$F2
	.byte $F2,$F2,$FF
SoundEnvelope_0CC8:
	.byte $41,$42,$43,$44,$45,$46,$F5,$FF
; -----------------------------------------------------------------------------

; Pitch envelopes
SoundEnvelopePtrs_2:
	.word (SoundEnvelope_0D10) ;8D10 (D10) ()
	.word (SoundEnvelope_0D13) ;8D13 (D13) ()
	.word (SoundEnvelope_0D24) ;8D24 (D24) ()
	.word (SoundEnvelope_0D32) ;8D32 (D32) ()
	.word (SoundEnvelope_0D43) ;8D43 (D43) ()
	.word (SoundEnvelope_0D54) ;8D54 (D54) ()
	.word (SoundEnvelope_0D6C) ;8D6C (D6C) ()
	.word (SoundEnvelope_0D7D) ;8D7D (D7D) ()
	.word (SoundEnvelope_0D8C) ;8D8C (D8C) ()
	.word (SoundEnvelope_0D9A) ;8D9A (D9A) ()
	.word (SoundEnvelope_0DA8) ;8DA8 (DA8) ()
	.word (SoundEnvelope_0DB1) ;8DB1 (DB1) ()
	.word (SoundEnvelope_0DC9) ;8DC9 (DC9) ()
	.word (SoundEnvelope_0DE1) ;8DE1 (DE1) ()
	.word (SoundEnvelope_0DEB) ;8DEB (DEB) ()
	.word (SoundEnvelope_0DF3) ;8DF3 (DF3) ()
	.word (SoundEnvelope_0E04) ;8E04 (E04) ()
	.word (SoundEnvelope_0E15) ;8E15 (E15) ()
	
	.word (SoundEnvelope_0E15) ;8E15 (E15) ()
	.word (SoundEnvelope_0E15) ;8E15 (E15) ()
	.word (SoundEnvelope_0E15) ;8E15 (E15) ()
	.word (SoundEnvelope_0E15) ;8E15 (E15) ()
	.word (SoundEnvelope_0E15) ;8E15 (E15) ()
	.word (SoundEnvelope_0E15) ;8E15 (E15) ()
	.word (SoundEnvelope_0E15) ;8E15 (E15) ()
	.word (SoundEnvelope_0E15) ;8E15 (E15) ()
	.word (SoundEnvelope_0E15) ;8E15 (E15) ()
	.word (SoundEnvelope_0E15) ;8E15 (E15) ()
	.word (SoundEnvelope_0E15) ;8E15 (E15) ()
	.word (SoundEnvelope_0E15) ;8E15 (E15) ()
	.word (SoundEnvelope_0E15) ;8E15 (E15) ()
	.word (SoundEnvelope_0E15) ;8E15 (E15) ()
; -----------------------------------------------------------------------------

; More instrument (envelopes) definitions
; XY: X = duration (ticks before value applied again) Y = pitch shift (signed: bit 3 is sign, max value is 7)
; FB: Loop start
; FE, XX: Loop end, XX = repetitions
; FF: End of envelope
SoundEnvelope_0D10:	; Constant -1 pitch (if multiplier is 1)
	.byte $FB,$1F,$FF
SoundEnvelope_0D13:
	.byte $FB,$80,$FB,$20,$2F,$20,$21,$FE,$01,$FB,$20,$2E,$20,$22,$FE,$0F
	.byte $FF
SoundEnvelope_0D24:
	.byte $FB,$17,$15,$13,$11,$C0,$FB,$20,$2F,$20,$21,$FE,$0F,$FF
SoundEnvelope_0D32:
	.byte $FB,$E0,$FB,$10,$2F,$20,$21,$FE,$02,$FB,$10,$2E,$20,$22,$FE,$0F
	.byte $FF
SoundEnvelope_0D43:
	.byte $FB,$80,$FB,$2F,$20,$21,$20,$FE,$03,$FB,$20,$2E,$20,$22,$FE,$0F
	.byte $FF
SoundEnvelope_0D54:
	.byte $FB,$80,$FB,$2F,$20,$21,$20,$FE,$02,$FB,$20,$2E,$20,$22,$FE,$02
	.byte $FB,$20,$2D,$20,$23,$FE,$0F,$FF
SoundEnvelope_0D6C:
	.byte $FB,$70,$FB,$10,$2F,$20,$21,$FE,$02,$FB,$10,$2E,$20,$22,$FE,$0F
	.byte $FF
SoundEnvelope_0D7D:
	.byte $FB,$17,$15,$13,$12,$11,$F0,$FB,$1F,$10,$11,$10,$FE,$0F,$FF
SoundEnvelope_0D8C:
	.byte $FB,$FB,$20,$2F,$20,$21,$20,$2E,$20,$22,$20,$FE,$0F,$FF
SoundEnvelope_0D9A:
	.byte $FB,$FB,$2F,$2E,$2F,$20,$2F,$2D,$2F,$21,$2F,$FE,$0F,$FF
SoundEnvelope_0DA8:
	.byte $FB,$FB,$20,$2F,$20,$21,$FE,$0F,$FF
SoundEnvelope_0DB1:
	.byte $FB,$E0,$FB,$20,$2F,$20,$21,$FE,$02,$FB,$20,$2E,$20,$22,$FE,$02
	.byte $FB,$20,$2D,$20,$23,$FE,$0F,$FF
SoundEnvelope_0DC9:
	.byte $FB,$EF,$FB,$2F,$2E,$2F,$20,$FE,$02,$FB,$2F,$2D,$2F,$21,$FE,$02
	.byte $FB,$2F,$2C,$2F,$22,$FE,$0F,$FF
SoundEnvelope_0DE1:
	.byte $FB,$90,$FB,$30,$3F,$30,$31,$FE,$0F,$FF
SoundEnvelope_0DEB:
	.byte $FB,$17,$15,$13,$12,$21,$F0,$FF
SoundEnvelope_0DF3:
	.byte $FB,$8F,$FB,$2F,$2E,$2F,$20,$FE,$04,$FB
	.byte $2F,$2D,$2F,$21,$FE,$0F,$FF
SoundEnvelope_0E04:
	.byte $FB,$80,$FB,$20,$2F,$20,$21,$FE,$04,$FB,$20,$2E,$20,$22,$FE,$0F
	.byte $FF
SoundEnvelope_0E15:
	.byte $FF
; -----------------------------------------------------------------------------

.ifndef custom_music
	.include "music/Town.asm"
	.include "music/Wilderness.asm"
.else
	.include "custom/Town.asm"
	.include "custom/Wilderness.asm"
.endif

; -----------------------------------------------------------------------------

	.export SoundCode_NMIcallback
SoundCode_NMIcallback:
	lda APU_HW__4015_EnableChannelsMask
	and #$10
	bne @9689

		lda #$00
		sta Sound_PCMsampleActive

	@9689:
	inc Sound_FadeCounter
	lda Sound_FadeValue
	beq @no_fade

		; Fade sound

		lda Sound_FadeCounter
		and #$3F
		bne @no_fade

		inc Sound_FadeValue
		lda Sound_FadeValue
		cmp #$04
		bne :+

			jsr Bank0TerminateSound
			jmp @no_fade

	:	cmp #$03
		bne :+

			lda #$00
			sta Sound_CUrrentSongNumber_Channel5_Percussion

	:	cmp #$02
		bne @no_fade

			lda #$00
			sta Sound_CurrentSongNumber_Channel2_triangle
			sta APU_HW__4008_Reg0_channel2

	@no_fade:
	ldx #$00
	ldy #$00
	
	@next_logical_channel:
	stx Sound_CurrentLogicalChannel
	lda Sound_CurrentSongNumber_Channel0_square0,x
	beq @channel_not_in_use

		jsr SoundCode_ExecuteTickForLogicalChannelX

	@channel_not_in_use:
	inx
	cpx #$06	; Loop from 0 to 5 (inclusive)
	bcc @next_logical_channel

	_loc_16C9:
	rts
;------------------------------------------

; Parameters:
; X = Logical channel (0 to 5 inclusive)
SoundCode_ExecuteTickForLogicalChannelX:
	jsr Sound_Set_TrackPtr_From_TrackDataPointer1
	dec Sound_NoteTicksLeft_Channel0_square0,x
	bne :+

		jmp SoundCode_ReadNextCommand_From_TrackPtr_y

:	cpx #$05	; Music noise channel tick
	beq _loc_16C9		; $96C9 -> rts

	cpx #$02	; Music triangle channel tick
	beq _loc_16C9		; $96C9 -> rts

	cpx #$04	; SFX noise channel tick
	beq _loc_16C9		; $96C9 -> rts

; -------
; Execute a tick for a channel to keep playing the current note
SoundCode_TickForSquareWaveChannel:
	lda #$41
	sta Sound_TempPtr015C_lo
	lda Sound_SoundFlags,x
	bit Sound_TempPtr015C_lo
	beq @pitch_envelope
	bne _loc_16C9		; $96C9 -> rts

	@pitch_envelope:
	lda #$00
	sta SoundEnvelopePtrLo
	dec Sound_Env2_TicksLeft,x
	bne @volume_envelope

		;inc Sound_TabUnknown0152,x
		inc Sound_Env2_BytesRead,x

		jsr Sound_CalculatePitch_Env2
		jsr Sound_SetCalculatedPeriod
		jsr _func_1BB7_apply_note_period

	@volume_envelope:
	lda Sound_CurrentEnvelopeIndex_1,x
	and #$80
	beq @9718

	lda Sound_Env1_BytesRead,x
	beq @9723

		dec Sound_Env1_BytesRead,x
		inc Sound_0140_Env1_ReleaseAttenuation,x
		jmp @9723

	@9718:
	dec Sound_Env1_TicksLeft,x
	bne @9723

		inc Sound_Env1_BytesRead,x
		jsr Sound_NextEnvValue_Env1

	@9723:
	lda Sound_CacheAPUreg0and1_twonibbles,x
	sta SoundEnvelopePtrHi
	lda Sound_NoteTicksLeft_Channel0_square0,x
	cmp Sound_NoteSustainTicks,x
	bcs @skip_release

		; Ticks left < sustain = apply release
		dec Sound_013C_Env1_ReleaseTicksLeft,x
		bne @apply_duty

			; Reload initial value into $013C,x
			lda Sound_0138_SustainReleaseSpeed,x
			lsr a
			lsr a
			lsr a
			lsr a
			sta Sound_013C_Env1_ReleaseTicksLeft,x
			; Increase volume attenuation
			inc Sound_0140_Env1_ReleaseAttenuation,x

		@apply_duty:
		jsr _release_duty

	@skip_release:
	jsr _calculate_volume

	jsr Sound_SetCarry_If_X_is_00_and_B4_is_nonzero
	bcs :+

		jmp Sound_PokeChannelSoundRegister0_preserveAX

:	rts
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
; -----------------------------------------
; Sound_JumpWithParams will read a pointer from this table
; by manipulating the stack
_JumpPointerTable_1760:
	.word (Sound_TrackCommandFBtoFC_LoopBegin) ;976A (176A) ()
	.word (Sound_TrackCommandFBtoFC_LoopBegin) ;976A (176A) ()
	.word (Sound_TrackCommandFD_Gosub_FollowedByGosubAddress) ;977B (177B) ()
	.word (Sound_TrackCommandFE_LoopEnd_FollowedByLoopCount_Or_FF_and_gotoAddress) ;978D (178D) ()
	.word (Sound_TrackCommandFF_ReturnOrSFXEnd) ;97D2 (17D2) ()
; -----------------------------------------

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
	lda Sound_SoundFlags,x
	ora #$02	; Set "gosub" flag
	sta Sound_SoundFlags,x
	
	; Save next word as "subroutine" address
	jsr Sound_Fetch_TrackDataPointer1
	; Set return pointer
	jsr Sound_Set_ReturnPointer_From_TrackPtr_y

	; Move track data pointer to "subroutine" and start reading data from there
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

Sound_TrackCommandFF_ReturnOrSFXEnd:
	lda Sound_SoundFlags,x
	and #$02
	beq @sfx_end

		; Clear "gosub" flag
		lda Sound_SoundFlags,x
		and #$FD
		sta Sound_SoundFlags,x

		lda Sound_ReturnPointerLo_Channel0_square0,x
		sta Sound_TrackDataPointer1Lo_Channel0_square0,x
		lda Sound_ReturnPointerHi_Channel0_square0,x
		sta Sound_TrackDataPointer1Hi_Channel0_square0,x
		jsr Sound_Set_TrackPtr_From_TrackDataPointer1
		jmp SoundCode_ReadNextCommand_From_TrackPtr_y

	@sfx_end:
	lda Sound_CurrentSongNumber_Channel0_square0,x
	sta SoundEnvelopePtrLo

	lda #$00
	sta Sound_CurrentSongNumber_Channel0_square0,x
	sta Sound_CacheAPUreg3,x
	sta Sound_SoundFlags,x

	lda SoundEnvelopePtrLo
	cmp #$2F
	bne :+

		; Start playing the "Mansion" song as soon as SFX $2F ends?
		jsr Bank0TerminateSound
		lda #$45
		jmp Bank0PlayTracks

:	cpx #$05
	beq @982B	; -> rts

	cpx #$03
	bne @9816

	lda Sound_CurrentSongNumber_Channel0_square0
	beq @9816

		; Fade out pulse channels?
		jmp _loc_1E41

	@9816:
	lda #$00
	sta Sound_CacheAPUreg3,x
	sta Sound_SoundFlags,x
	cpx #$02
	beq @9823

		lda #$30

	@9823:
	jsr Sound_SetCarry_If_X_is_00_and_B4_is_nonzero
	bcs @982B	; -> rts

		jmp Sound_PokeChannelSoundRegister0_preserveAX

	@982B:
	rts
;------------------------------------------

Sound_TrackCommand00toFA:
	lda Sound_SoundFlags,x
	and #$01
	bne Sound_TrackCommand00toFA_for_SFX

		jmp Sound_TrackCommand00toFA_for_Music
;------------------------------------------

Sound_TrackCommand00toFA_for_SFX:
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
	lda Sound_ChannelTempo_Channel0_square0,x
	sta Sound_NoteTicksLeft_Channel0_square0,x
	cpx #$04
	bne Sound_TrackCommand00to0F_followedBy00_or_10toFA_for_LogicalChannelNot4

		jmp Sound_TrackCommand00to0F_followedBy00_or_10toFA_for_LogicalChannel4
;------------------------------------------

Sound_TrackCommand00to0F_for_LogicalChannel0_or_1_or_3:
	lda (SoundTrackPtrLo),y
	bne @985D
		jmp _989F

	@985D:
	sta Sound_ChannelTempo_Channel0_square0,x
	iny
	lda (SoundTrackPtrLo),y
	and #$F0
	sta Sound_CacheAPUreg0and1_twonibbles,x
	iny
	lda Sound_SoundFlags,x
	ora #$08
	sta Sound_SoundFlags,x
	lda (SoundTrackPtrLo),y
	beq @9876

	cmp #$88
	bne _loc_187C

	@9876:
	lda Sound_SoundFlags,x
	and #$F7
	sta Sound_SoundFlags,x
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
	sta Sound_ChannelTempo_Channel0_square0,x
	iny
	jmp _loc_187C
;------------------------------------------

Sound_TrackCommand00to0F_for_LogicalChannel4:
	lda (SoundTrackPtrLo),y
	beq _98C8

	sta Sound_ChannelTempo_Channel0_square0,x
	lda #$30
	sta Sound_CacheAPUreg0and1_twonibbles,x
	jmp SoundCode_ReadNextCommand_From_TrackPtr_ypp

	_989F:
	 iny
Sound_TrackCommand00to0F_followedBy00_or_10toFA_for_LogicalChannelNot4:
	lda Sound_ChannelTempo_Channel0_square0,x
	sta Sound_NoteTicksLeft_Channel0_square0,x
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
	lda Sound_ChannelTempo_Channel0_square0,x
	sta Sound_NoteTicksLeft_Channel0_square0,x
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
Sound_TrackCommand00toFA_for_Music:
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
; -------------------
_JumpPointerTable_18FB:
	.word (Sound_TrackCommandD0toDF) ;9901 (1901) ()
	.word (Sound_TrackCommandE0toEF) ;995F (195F) ()
	.word (Sound_TrackCommandF0toFA_savesLoNibbleTo13E) ;9987 (1987) ()
; -----------------------------------------

Sound_TrackCommandD0toDF:
	lda (SoundTrackPtrLo),y
	and #$0F	; Get low nibble
	sta Sound_ChannelTempo_Channel0_square0,x

	iny
	cpx #$05
	bne :+

		; Music Noise channel does not have further parameters after this command
		jmp SoundCode_ReadNextCommand_From_TrackPtr_y

:	lda (SoundTrackPtrLo),y
	sta Sound_Env1_Volume,x	; Temporarily store the whole byte here
	cpx #$02
	bne :+

		; Triangle channel doesn't have bytes 2 and 3 for this command
		jmp SoundCode_ReadNextCommand_From_TrackPtr_ypp

:	and #$F0
	sta Sound_CacheAPUreg0and1_twonibbles,x

	lda Sound_Env1_Volume,x
	and #$0F
	sta Sound_013E_Env1_Attenuation,x
	sta Sound_Env1_Volume,x

	iny
	cpx #$02
	bne :+

		; Triangle channel ignores this and skips next byte
		jmp SoundCode_ReadNextCommand_From_TrackPtr_ypp

:	lda (SoundTrackPtrLo),y
	sta Sound_CurrentEnvelopeIndex_1,x
	and #$80	; Bit 7 flag = use low nibble for something
	beq :+

		lda (SoundTrackPtrLo),y
		and #$0F
		sta Sound_Env1_BytesRead,x

:	iny
	lda (SoundTrackPtrLo),y

	_loc_1946:
	sta Sound_0138_SustainReleaseSpeed,x
	and #$F0
	bne :+

		; If ticks left (high nibble) would be zero, set it to 1
		lda Sound_0138_SustainReleaseSpeed,x
		ora #$10
		sta Sound_0138_SustainReleaseSpeed,x

:	lsr a
	lsr a
	lsr a
	lsr a
	; Store high nibble here
	sta Sound_013C_Env1_ReleaseTicksLeft,x
	jmp _process_next_track_command
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
	.word (Sound_TrackCommandE6_setTempo) ;999D (199D) ()
	.word (Sound_TrackCommandE7_selectVolumeEnvelope) ;99A4 (19A4) ()
	.word (Sound_TrackCommandE8_savesNextTwoNibblesTo138and13C) ;99AD (19AD) ()
	.word (Sound_TrackCommandE9_savesNextByteTo134or129) ;99B3 (19B3) ()
	.word (Sound_TrackCommandEA_setIntervalShift) ;99CE (19CE) ()
	.word (Sound_TrackCommandEB_savesNextTwoNibblesTo146and148_andNextByteTo14A) ;99D7 (19D7) ()
	.word (Sound_TrackCommandECtoEF_flag_and_likeEB) ;99F1 (19F1) ()
	.word (Sound_TrackCommandECtoEF_flag_and_likeEB) ;99F1 (19F1) ()
	.word (Sound_TrackCommandECtoEF_flag_and_likeEB) ;99F1 (19F1) ()
	.word (Sound_TrackCommandECtoEF_flag_and_likeEB) ;99F1 (19F1) ()

Sound_TrackCommandE0toE5_savesThisByteTo12E:
	sta Sound_FreqDividerExp,x
	jmp _process_next_track_command
;------------------------------------------

Sound_TrackCommandF0toFA_savesLoNibbleTo13E:
	lda (SoundTrackPtrLo),y
	and #$0F
	sta Sound_013E_Env1_Attenuation,x
	jmp _process_next_track_command	; (This could be just removed)
;------------------------------------------

_process_next_track_command:
	iny
	lda (SoundTrackPtrLo),y
	and #$F0
	cmp #$E0
	beq Sound_TrackCommandE0toEF

		jmp SoundCode_ReadNextCommand_From_TrackPtr_y
;------------------------------------------

; Next byte = tempo
Sound_TrackCommandE6_setTempo:
	iny
	lda (SoundTrackPtrLo),y
	sta Sound_ChannelTempo_Channel0_square0,x
	bne _process_next_track_command

; Next byte = envelope index
Sound_TrackCommandE7_selectVolumeEnvelope:
	iny
	lda (SoundTrackPtrLo),y
	sta Sound_CurrentEnvelopeIndex_1,x
	jmp _process_next_track_command
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
	sta Sound_0134_Env1_Flags,x
	jmp _process_next_track_command

	@99C8:
	sta Sound_CacheAPUreg0and1_twonibbles,x
	jmp _process_next_track_command
;------------------------------------------

Sound_TrackCommandEA_setIntervalShift:
	iny
	lda (SoundTrackPtrLo),y
	sta Sound_0131_IntervalShift,x
	jmp _process_next_track_command
;------------------------------------------

Sound_TrackCommandEB_savesNextTwoNibblesTo146and148_andNextByteTo14A:
	iny
	lda (SoundTrackPtrLo),y
	and #$0F
	sta Sound_0146_Env2_Multiplier,x
	lda (SoundTrackPtrLo),y
	lsr a
	lsr a
	lsr a
	lsr a
	sta Sound_0148_Env2_Duration,x
	iny
	lda (SoundTrackPtrLo),y
	sta Sound_CurrentEnvelopeIndex_2,x
	jmp _process_next_track_command
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
	sta Sound_0134_Env1_Flags,x
	jmp @9A09

	@9A06:
	sta Sound_CacheAPUreg0and1_twonibbles,x

	@9A09:
	iny
	lda (SoundTrackPtrLo),y
	and #$0F
	sta Sound_0146_Env2_Multiplier,x

	lda (SoundTrackPtrLo),y
	lsr a
	lsr a
	lsr a
	lsr a
	sta Sound_0148_Env2_Duration,x
	
	iny
	lda (SoundTrackPtrLo),y
	sta Sound_CurrentEnvelopeIndex_2,x
	iny
	jmp Sound_TrackCommandD0toDF
;------------------------------------------

_loc_1A24_drums_play_note:
	lda (SoundTrackPtrLo),y
	lsr a
	lsr a
	lsr a
	lsr a
	cmp #$0C	; Rest
	beq @9A46	; -> rts

		tax
		cmp #$0A
		bne @9A3A

			; Note index 10: play the "snare" on the noise channel first
			lda #$03
			jsr Bank0PlayTracks
			ldx #$0A	; Then play the DPCM snare ($5D)

		@9A3A:
		lda @drum_track_indexes,x
		sta Sound_StartSong_LatestSongIndex
		jsr Bank0PlayTracks
		ldx Sound_CurrentLogicalChannel

	@9A46:
	rts

	@drum_track_indexes:
	.byte $02,$02,$02,$02,$03,$03,$03,$03,$03,$04,$5D,$5E
; -----------------------------------------

; Low nibble: note duration (0 = use tempo as value, 1 to F = use tempo * value)
Sound_TrackCommand00toCF_or_10toCF:
	jsr Sound_Set_TrackDataPointer1_From_TrackPtr_y
	dey	; Re-read the same byte (will be $00-$CF)
	lda (SoundTrackPtrLo),y
	and #$0F
	sta SoundEnvelopePtrLo	; Used as counter
	beq @keep_tempo

		lda Sound_ChannelTempo_Channel0_square0,x
		clc

		@tempo_multiply:
		adc Sound_ChannelTempo_Channel0_square0,x
		dec SoundEnvelopePtrLo
		bne @tempo_multiply

		beq @set_ticks_left	; Same effect as JMP

	@keep_tempo:
	lda Sound_ChannelTempo_Channel0_square0,x

	@set_ticks_left:
	sta Sound_NoteTicksLeft_Channel0_square0,x
	cpx #$05
	bne :+

		; Percussion channel jumps into a specialised routine
		jmp _loc_1A24_drums_play_note

	; Non-percussion channels
:	lda (SoundTrackPtrLo),y
	and #$F0
	cmp #$C0	; Note value 12 = rest?
	bne @not_rest

		lda #$40	; Set bit 6
		ora Sound_SoundFlags,x
		sta Sound_SoundFlags,x

		cpx #$02
		beq @triangle_rest

			lda #$30	; Full duty, no volume
			ora Sound_CacheAPUreg0and1_twonibbles,x
			jsr Sound_SetCarry_If_X_is_00_and_B4_is_nonzero
			bcs :+	; Do not output note if channel is used by SFX?

				jmp Sound_PokeChannelSoundRegister0_preserveAX

		:	rts

		@triangle_rest:
		lda #$00
		jsr Sound_PokeChannelSoundRegister0_preserveAX
		lda #$FF
		sta Sound_CacheAPUreg3_Channel2_Triangle
		jmp Sound_PokeChannelSoundRegister3_preserveAX

	@not_rest:
	lda Sound_SoundFlags,x
	; Clear bit 6
	and #$BF
	sta Sound_SoundFlags,x

	cpx #$02
	bne @square_channels_note

		; Triangle channel note

		lda Sound_Env1_Volume,x	; This will be used to calculate the length
		cmp #$81
		bcs @counter_halted

			; Env1 values < $81 for Triangle channel
			lda (SoundTrackPtrLo),y
			and #$0F	; Take the low nibble (tempo multiplier)
			sta SoundEnvelopePtrLo
			sta Sound_CalcPeriod_Lo
			beq @counter_halted	; If zero, use the Emv1 value as is

				; Do (Env1 value * Tempo multiplier) + Tempo multiplier
				lda Sound_Env1_Volume,x
				clc

				@9AC1:
				adc Sound_Env1_Volume,x
				cmp #$81	; Max value cap
				bcs @9ACC

				dec SoundEnvelopePtrLo
				bne @9AC1

				@9ACC:
				clc
				adc Sound_CalcPeriod_Lo	; Here used as frame counter
				jmp @9AD5

		@counter_halted:
		; Env1 Values >= $81 for Triangle channel
		lda Sound_Env1_Volume,x

		@9AD5:
		sta Sound_CalcPeriod_Lo	; Here used as frame counter

		lda Sound_SoundFlags,x
		and #$80
		beq @9AE9

			; "Mute" channel

			lda #$FF	; Value for Reg 3 (length counter load and timer high)
			sta Sound_CacheAPUreg3_Channel2_Triangle
			jsr Sound_PokeChannelSoundRegister3_preserveAX

			lda #$00	; Value for Reg 0
			beq @9AEB	; Same as JMP

		@9AE9:
		lda Sound_CalcPeriod_Lo
		@9AEB:
		jmp @poke_reg0

	@square_channels_note:
	lda Sound_0138_SustainReleaseSpeed,x
	and #$0F
	sta SoundEnvelopePtrLo	; Counter
	beq @set_note_sustain

		lda #$00
		sta SoundEnvelopePtrHi	; Carry counter

		; Sustain = [Ticks left * base duration value (low nibble)] / 16
		@multiply_loop:
		clc
		adc Sound_NoteTicksLeft_Channel0_square0,x
		bcc :+

			; Carry value
			inc SoundEnvelopePtrHi

		:
		dec SoundEnvelopePtrLo	; Count down to zero
		bne @multiply_loop

		sta SoundEnvelopePtrLo
		lda #$04	; Repeat 4 times (why not unroll the loop?)
		sta Sound_CalcPeriod_Lo	; Counter

		:
		lsr SoundEnvelopePtrHi
		ror SoundEnvelopePtrLo
		dec Sound_CalcPeriod_Lo	; Counter
		bne :-

			lda SoundEnvelopePtrLo

	@set_note_sustain:
	sta Sound_NoteSustainTicks,x
	
	; Reset/Start envelopes
	lda #$00
	sta Sound_Env1_BytesRead,x
	sta Sound_Env1_BytesRead_Copy,x
	sta Sound_Env1_LoopCounter,x
	sta Sound_0140_Env1_ReleaseAttenuation,x

	sta Sound_Env2_BytesRead,x
	sta Sound_Env2_BytesRead_Copy,x
	sta Sound_Env2_LoopCounter,x

	lda #$01
	sta Sound_Env1_TicksLeft,x

	lda Sound_0148_Env2_Duration,x
	sta Sound_Env2_TicksLeft,x

	lda #$80
	sta Sound_TempPtr015C_lo
	lda Sound_CurrentEnvelopeIndex_1,x
	bit Sound_TempPtr015C_lo
	bne @9B4E

		jsr Sound_NextEnvValue_Env1
		jmp @9B53

	@9B4E:
	and #$0F
	sta Sound_Env1_BytesRead,x

	@9B53:
	jsr _new_note_duty
	jsr _calculate_volume
	; Skip register write if muted / SFX using channel 0?
	jsr Sound_SetCarry_If_X_is_00_and_B4_is_nonzero
	bcs @read_note

	@poke_reg0:
		jsr Sound_PokeChannelSoundRegister0_preserveAX

	; Play a note
	@read_note:
	lda (SoundTrackPtrLo),y	; High nibble = note index (0 to B, i.e. one octave range)
	lsr a
	lsr a
	lsr a
	lsr a
	sta SoundEnvelopePtrLo	; Index in period table

	jsr Sound_GetNoteShift	; Select interval shift, if any
	clc
	adc SoundEnvelopePtrLo
	clc
	adc #$0C		; Add 12 (i.e., default octave is octave 1)
	asl a
	tay
	lda SoundPeriodTable+0,y
	sta Sound_CurrentPeriodLo,x
	lda SoundPeriodTable+1,y
	sta Sound_CurrentPeriodHi,x

	; Adjust octave according to channel settings
	ldy Sound_FreqDividerExp,x
:	tya	; Why are we doing this instead of CPY?
	cmp #$05
	beq _func_1B92

		lsr Sound_CurrentPeriodHi,x
		ror Sound_CurrentPeriodLo,x
		iny
		jmp :-
;------------------------------------------

_func_1B92:
	lda Sound_CurrentPeriodHi,x
	ora #$08
	sta Sound_CurrentPeriodHi,x
	jsr Sound_SetCalculatedPeriod	; Set initial period for this note

	lda #$00
	sta SoundEnvelopePtrLo
	cpx #$02
	beq _9BED

	cpx #$04
	beq _func_1BB7_apply_note_period

	lda Sound_SoundFlags,x
	and #$01
	bne _func_1BB7_apply_note_period

	lda Sound_Env2_TicksLeft,x
	bne _func_1BB7_apply_note_period

	jsr Sound_CalculatePitch_Env2
;------------------------------------------

; Applies note period modifiers from Pitch Envelope and writes the resulting
; value to Registers 2 and 3 if needed
_func_1BB7_apply_note_period:
	lda SoundEnvelopePtrLo	; This is now a signed period shift value
	bmi @9BC9

		; Positive period shift
		lda Sound_CalcPeriod_Lo
		clc
		adc SoundEnvelopePtrLo
		sta Sound_CalcPeriod_Lo
		bcc @9BD4

		inc Sound_CalcPeriod_Hi
		jmp @9BD4

	; Negative period shift
	@9BC9:
	lda Sound_CalcPeriod_Lo
	clc
	adc SoundEnvelopePtrLo
	sta Sound_CalcPeriod_Lo
	bcs @9BD4

		dec Sound_CalcPeriod_Hi

	@9BD4:
	lda Sound_CalcPeriod_Hi
	cmp Sound_CacheAPUreg3,x
	bne @9BEA

	lda Sound_CacheAPUreg0and1_twonibbles,x
	and #$10
	beq _9BED

	lda Sound_SoundFlags,x
	and #$08
	bne _9BED
	beq _Set_Reg2

	@9BEA:
	sta Sound_CacheAPUreg3,x

	; Writes CalcPeriod_Lo to channel 2
	; and, if needed, CalcPeriod_Hi to channel 3
	_9BED:
	lda Sound_CalcPeriod_Hi
	jsr Sound_SetCarry_If_X_is_00_and_B4_is_nonzero
	bcs _Set_Reg2

		jsr Sound_PokeChannelSoundRegister3_preserveAX
	
	_Set_Reg2:
	lda Sound_CalcPeriod_Lo
	sta Sound_CacheAPUreg2,x
	jsr Sound_SetCarry_If_X_is_00_and_B4_is_nonzero
	bcs :+	; -> rts

		jsr Sound_PokeChannelSoundRegister2_preserveAX

:	rts
;------------------------------------------

; Notes are C to B
SoundPeriodTable:
	; Base octave
	.word $0D5C,$0C9C,$0BE8,$0B3C,$0A9A,$0A02,$0972,$08EA
	.word $086A,$07F2,$0780,$0714
	; Octave + 1
	.word $06AE,$064E,$05F4,$059E,$054D,$0501,$04B9,$0475
	.word $0435,$03F9,$03C0,$038A
	; Octave + 2
	.word $0357,$0327,$02FA,$02CF,$02A7,$0281,$025D,$023B
	.word $021B,$01FC,$01E0,$01C5
;------------------------------------------

; Returns:
; A = Signed value to be added to note index, according to channel settings
Sound_GetNoteShift:
	lda #$80
	sta Sound_TempPtr015C_lo
	lda Sound_0131_IntervalShift,x
	bit Sound_TempPtr015C_lo
	beq :+	; Return +shift

		; Return -shift
		and #$0F
		sta SoundEnvelopePtrHi	; This is used as temporary storage
		lda #$00
		sec
		sbc SoundEnvelopePtrHi	; just to invert the sign

:	rts
;------------------------------------------

; Calculates current envelope pitch using Envelope_2
; Prameters:
; X = Logical channel (0 or 1 only)
Sound_CalculatePitch_Env2:
	lda #$00
	sta SoundEnvelopePtrLo

	lda Sound_CurrentEnvelopeIndex_2,x
	asl a	; Index a two bytes per entry table
	
	sty Sound_TempA5	; Preserve Y (for no reason?)

	tay
	lda SoundEnvelopePtrs_2,y
	sta SoundEnvelopePtrLo
	lda SoundEnvelopePtrs_2+1,y
	sta SoundEnvelopePtrHi

	stx Sound_TempA5	; Forget Y and preserve X instead

	; Logical channel + 2
	; (Why not do two inx instead?)
	lda #$02
	clc
	adc Sound_TempA5
	tax
	jsr Sound_EnvelopeCommandReadNext
	
	ldx Sound_TempA5	; Restore X

	; Save high nibble to $14E,x
	lda SoundEnvelopePtrLo
	lsr a
	lsr a
	lsr a
	lsr a
	sta Sound_Env2_TicksLeft,x

	; Keep low nibble in SoundEnvelopePtrLo
	lda SoundEnvelopePtrLo
	and #$0F
	sta SoundEnvelopePtrLo

	ldy Sound_0146_Env2_Multiplier,x
	bne @9C9D
	
	tya
	beq @9CB6	; Same effect as JMP since Y must be zero if we got here
	
	@9C9D:
	lda #$08
	sta Sound_TempPtr015C_lo
	lda SoundEnvelopePtrLo
	bit Sound_TempPtr015C_lo
	beq @9CAD
	
		; Make it negative
		ora #$F0
		sta SoundEnvelopePtrLo

	@9CAD:
	dey
	beq @9CB6
	
		clc
		adc SoundEnvelopePtrLo
		jmp @9CAD

	@9CB6:
	sta SoundEnvelopePtrLo
	ldy Sound_TempA5	; Restore the wrong Y (it's actually X), probably not used
	rts
;------------------------------------------

; Sets the calculated period to the current note period value
; CalcPeriod_Lo/Hi = CurrentPeriodLo/Hi
Sound_SetCalculatedPeriod:
	lda Sound_CurrentPeriodLo,x
	sta Sound_CalcPeriod_Lo
	lda Sound_CurrentPeriodHi,x
	sta Sound_CalcPeriod_Hi
	rts
;------------------------------------------

; Reads and processes the next entry in the envelope for logical channel X.
; Parameters:
; X = Logical channel index (0 or 1 only)
Sound_NextEnvValue_Env1:
	lda Sound_CurrentEnvelopeIndex_1,x
	asl a
	
	sty Sound_TempA5	; Preserve Y

	; Get envelope pointer
	tay
	lda SoundEnvelopePtrs_1,y
	sta SoundEnvelopePtrLo
	lda SoundEnvelopePtrs_1+1,y
	sta SoundEnvelopePtrHi

	jsr Sound_EnvelopeCommandReadNext

	lda SoundEnvelopePtrLo
	and #$0F
	sta Sound_Env1_Volume,x

	lda SoundEnvelopePtrLo
	lsr a
	lsr a
	lsr a
	lsr a
	sta Sound_Env1_TicksLeft,x

	; Restore Y and return
	ldy Sound_TempA5
	rts
;------------------------------------------

_calculate_volume:
	lda Sound_0134_Env1_Flags,x
	and #$04
	beq Sound_CalculateMomentaryVolume

		; If the note is past the sustain, cut volume to 2
		; instead of releasing gradually
		lda #$02
		sta SoundEnvelopePtrLo
		lda Sound_NoteTicksLeft_Channel0_square0,x
		cmp Sound_NoteSustainTicks,x
		bcc _prepare_reg0_value

; Uses envelope, channel attenuation, release and fade to calculate an actual
; output volume for the active square wave channel
Sound_CalculateMomentaryVolume:
	lda Sound_Env1_Volume,x
	beq @set_volume	; Branch if envelope volume is zero

		sec
		sbc Sound_013E_Env1_Attenuation,x
		bcc @set_volume_to_1	; Branch on underflow

		sec
		sbc Sound_0140_Env1_ReleaseAttenuation,x
		bcc @set_volume_to_1	; Branch on underflow

		sec
		sbc Sound_FadeValue
		beq @set_volume_to_1	; Value becomes 1 if result would be 0
		bcs @set_volume			; Otherwise, store result of subtraction

		@set_volume_to_1:
		lda #$01

	@set_volume:
	sta SoundEnvelopePtrLo

	; Parameters:
	; SoundEnvelopePtrHi = high nibble (duty/flags)
	; SoundEnvelopePtrLo = low nibble (volume)
	_prepare_reg0_value:
	lda SoundEnvelopePtrHi	; Duty/Flags
	ora SoundEnvelopePtrLo	; Volume
	rts
;------------------------------------------

; If Env1 Flag 1 is set: SoundEnvelopePtrHi = High nibble of flags
; Don't change the value otherwise
_release_duty:
	lda Sound_0134_Env1_Flags,x
	and #$02
	beq :+

		; Take Duty value from $0134,x if bit 1 is set
		lda Sound_0134_Env1_Flags,x
		and #$F0
		sta SoundEnvelopePtrHi

:	rts
;------------------------------------------

; If Env1 Flag 0 is set: prepare Reg0 values using high nibble of flags
; Otherwise use the previous value in CacheAPUReg0
_new_note_duty:
	lda Sound_CacheAPUreg0and1_twonibbles,x
	sta SoundEnvelopePtrHi

	lda #$01
	sta Sound_TempPtr015C_lo
	lda Sound_0134_Env1_Flags,x
	bit Sound_TempPtr015C_lo
	beq _prepare_reg0_value

		; Take Duty value from $0134,x instead of cache if bit 0 is set
		and #$F0
		sta SoundEnvelopePtrHi

	jmp _prepare_reg0_value
;------------------------------------------

; Parameters:
; X = Logical channel index (0, 1 only) or index + 2 (= 2, 3)
; SoundEnvelopePtrLo = pointer to start of current envelope for this channel
; Returns:
; Value of next envelope in SoundEnvelopePtrLo and A
Sound_EnvelopeCommandReadNext:
	ldy Sound_Env1_BytesRead,x
	lda (SoundEnvelopePtrLo),y
	cmp #$FB
	bcc Sound_EnvelopeCommand00toFA_ReturnWithA

	sec
	sbc #$FB
	jsr Sound_JumpWithParams
_JumpPointerTable_1D57:
	.word (Sound_EnvelopeCommandFBtoFD_BeginLoop) ;9D64 (1D64) ()
	.word (Sound_EnvelopeCommandFBtoFD_BeginLoop) ;9D64 (1D64) ()
	.word (Sound_EnvelopeCommandFBtoFD_BeginLoop) ;9D64 (1D64) ()
	.word (Sound_EnvelopeCommandFE_LoopUntil) ;9D70 (1D70) ()
	.word (Sound_EnvelopeCommandFF_End_ReturnWithPreviousA) ;9D8D (1D8D) ()
; -----------------------------------------
Sound_EnvelopeCommand00toFA_ReturnWithA:
	sta SoundEnvelopePtrLo
	rts
;------------------------------------------

Sound_EnvelopeCommandFBtoFD_BeginLoop:
	inc Sound_Env1_BytesRead,x
	lda Sound_Env1_BytesRead,x
	sta Sound_Env1_BytesRead_Copy,x
	jmp Sound_EnvelopeCommandReadNext
;------------------------------------------

Sound_EnvelopeCommandFE_LoopUntil:
	iny
	lda (SoundEnvelopePtrLo),y
	cmp Sound_Env1_LoopCounter,x
	beq :+

		inc Sound_Env1_LoopCounter,x
		lda Sound_Env1_BytesRead_Copy,x
		sta Sound_Env1_BytesRead,x
		jmp Sound_EnvelopeCommandReadNext

:	inc Sound_Env1_BytesRead,x
	inc Sound_Env1_BytesRead,x
	jmp Sound_EnvelopeCommandReadNext
;------------------------------------------

Sound_EnvelopeCommandFF_End_ReturnWithPreviousA:
	dec Sound_Env1_BytesRead,x
	jmp Sound_EnvelopeCommandReadNext
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

; Sets SoundTrackPtr to the start of data for logical channel X
; Y set to 0
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
	bcc :+

		lda SoundTrackPtrHi
		adc #$00
		sta Sound_TrackDataPointer1Hi_Channel0_square0,x

:	rts
;------------------------------------------

; TraclDataPoiinter1 = next word read from track data
Sound_Fetch_TrackDataPointer1:
	iny
	lda (SoundTrackPtrLo),y
	sta Sound_TrackDataPointer1Lo_Channel0_square0,x
	iny
	lda (SoundTrackPtrLo),y
	sta Sound_TrackDataPointer1Hi_Channel0_square0,x
	rts
;------------------------------------------

; ReturnPointer = current track data position + 1
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

; Parameters:
; X = Logical channel (0-5)
; A = Value to write to APU channel's register 0
Sound_PokeChannelSoundRegister0_preserveAX:
	jsr Sound_TranslateChannelToRegisterOffset_PreserveA
	sta APU_HW__4000_Reg0,x
	jmp Sound_PokeChannel_Common_RestoreX
;------------------------------------------

; Parameters:
; X = Logical channel (0-5)
; A = Value to write to APU channel's register 1
Sound_PokeChannelSoundRegister1_preserveAX:
	jsr Sound_TranslateChannelToRegisterOffset_PreserveA
	sta APU_HW__4001_Reg1_SweepControl,x
	jmp Sound_PokeChannel_Common_RestoreX
;------------------------------------------

; Parameters:
; X = Logical channel (0-5)
; A = Value to write to APU channel's register 2
Sound_PokeChannelSoundRegister2_preserveAX:
	jsr Sound_TranslateChannelToRegisterOffset_PreserveA
	sta APU_HW__4002_Reg2_WaveLengthLo,x
	jmp Sound_PokeChannel_Common_RestoreX
;------------------------------------------

; Parameters:
; X = Logical channel (0-5)
; A = Value to write to APU channel's register 3
Sound_PokeChannelSoundRegister3_preserveAX:
	jsr Sound_TranslateChannelToRegisterOffset_PreserveA
	sta APU_HW__4003_Reg3_WaveLengthHi,x
	jmp Sound_PokeChannel_Common_RestoreX
;------------------------------------------

Sound_TranslateChannelToRegisterOffset_PreserveA:
	sta SoundEnvelopePtrLo
	jsr Sound_TranslateChannelToRegisterOffset
	lda SoundEnvelopePtrLo
	rts
;------------------------------------------

Sound_PokeChannel_Common_RestoreX:
	jsr SoundCode_JustDoEightNOPs_28cyclesOfDelay
	ldx Sound_CurrentLogicalChannel
	rts
;------------------------------------------

; Translates logical channel index to offset to its first register, from $4000
; 0 = Square0, 1 = Square1, 2 = Triangle, 3 = Square0, 4 = Noise, 5 = Noise
Sound_ChannelRegisterOffsetTable:
	.byte $00,$04,$08,$00,$0C,$0C
Sound_TranslateChannelToRegisterOffset:
	lda Sound_ChannelRegisterOffsetTable,x
	tax
	rts
;------------------------------------------

; Returns:
; Carry set if a SFX is currently playing, clear otherwise
; Preserves A
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
	sta SoundEnvelopePtrHi
	lda #$00
	sta SoundEnvelopePtrLo
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

	lda Sound_SoundFlags
	and #$40
	bne @9E73

		jsr Sound_CalculateMomentaryVolume

	@9E73:
	lda SoundEnvelopePtrHi
	ora SoundEnvelopePtrLo
	jsr Sound_PokeChannelSoundRegister0_preserveAX
	ldx Sound_CurrentLogicalChannel
	rts
;------------------------------------------

; Jumps to address taken from a table of pointers.
; ----
; Parameters:
; A = index of command pointer
; Stack: address of first pointer - 1
Sound_JumpWithParams:
	asl a	; multiply by 2 to index a 2 bytes per entry table

	; Preserve X and Y
	stx Sound_TempPtr015C_hi
	sty Sound_TempPtr015C_lo

	tay
	iny

	; Retrieve first pointer from stack
	pla
	sta Sound_TempPtrA7_lo
	pla
	sta Sound_TempPtrA7_hi

	; Use index to get the desired pointer
	lda (Sound_TempPtrA7_lo),y
	tax
	iny
	lda (Sound_TempPtrA7_lo),y

	sta Sound_TempPtrA7_hi
	stx Sound_TempPtrA7_lo
	
	; Restore X and Y
	ldy Sound_TempPtr015C_lo
	ldx Sound_TempPtr015C_hi

	jmp (Sound_TempPtrA7_lo)
; -----------------------------------------------------------------------------

	.byte $FF

.ifndef custom_music
	.include "music/Password.asm"
	.include "music/GameOver.asm"
	.include "music/Ruins.asm"
.else
	.include "custom/Password.asm"
	.include "custom/GameOver.asm"
	.include "custom/Ruins.asm"
.endif

; -----------------------------------------------------------------------------

Sound_Records_Locator:
	.word (Sound_Records -3) ;813A (13A) ()
; -----------------------------------------

	.export Bank0PlayTracks
; Parameters:
; A = Song / SFX index ($5E, $5F and $60 are PCM sound effects)
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

	.export Bank0TerminateSound
Bank0TerminateSound:
	lda #$00
	ldx #$06
	@mute_loop:
	dex
	sta Sound_CurrentSongNumber_Channel0_square0,x
	sta Sound_CacheAPUreg3,x
	sta Sound_SoundFlags,x
	bne @mute_loop

	sta Sound_FadeValue
	jmp SoundCode_MuteAllChannelsButDontDisableThem
;------------------------------------------

_func_22C2_square_channels:
	sta Sound_0134_Env1_Flags,x
	sta Sound_0146_Env2_Multiplier,x
_func_22C8_triangle_channel:
	sta Sound_0131_IntervalShift,x
	rts
;------------------------------------------

Sound_StartTracks:
	ldx #$03	; Three bytes per entry in the records table
	lda Sound_Records_Locator
	sta Sound_RecordPtrLo
	lda Sound_Records_Locator+1
	sta Sound_RecordPtrHi

	; Calculate the offset to this song's entry in the table
	@calc_entry_offset:
	lda Sound_StartSong_LatestSongIndex
	clc
	adc Sound_RecordPtrLo
	sta Sound_RecordPtrLo
	lda #$00
	adc Sound_RecordPtrHi
	sta Sound_RecordPtrHi
	dex
	bne @calc_entry_offset

	; Bits 5-7 = number of channels used - 1
	ldy #$00
	sty Sound_StartSong_MainPtrOffset
	lda (Sound_RecordPtrLo),y
	rol a
	rol a
	rol a
	and #$03
	sta Sound_StartSong_NumTracksRemaining
	jmp @next_channel_track

	; ---------------
	@Unused22FB:
	jmp @loc_23A0

	@A2FE:
	jmp @loc_23B1	; -> RecordPtrHi = 0, restore X and return

	; ---------------
	@next_channel_track:
	ldy Sound_StartSong_MainPtrOffset
	lda (Sound_RecordPtrLo),y	; Read logical channel number
	and #$1F
	sta Sound_StartSong_CurrentLogicalChannel
	tax	; X = channel number (0-6), until end of routine

	lda Sound_StartSong_LatestSongIndex
	beq @A315

		cmp Sound_CurrentSongNumber_Channel0_square0,x
		bcc @A2FE

	@A315:
	; Latest song index == 0 or < current channel's song number

	lda #$00
	sta Sound_CurrentSongNumber_Channel0_square0,x

	cpx #$02	; X == 2 (triangle channel)
	beq @A325_triangle_channel

	bcs @read_track_ptr	; Skip if X > 2 (noise and DPCM)

		; This is only for X == 0 or 1 (square channels)
		jsr _func_22C2_square_channels
		jmp @read_track_ptr

	@A325_triangle_channel:
	jsr _func_22C8_triangle_channel

	@read_track_ptr:
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
	sta Sound_NoteTicksLeft_Channel0_square0,x
	lda #$00
	sta Sound_LoopCounter_Channel0_square0,x
	cpx #$02
	beq :+

		; Cache APU register 3 for this channel (except Triangle channel)
		sta Sound_CacheAPUreg3,x
		cpx #$04
		beq @A361
	
:	ldy #$00	; Read first byte of song data (only channels 0, 1, 2, 5)
	lda (Sound_StartSong_TrackDataPtr_Lo),y
	bne @A35D

	sta Sound_StartSong_LatestSongIndex
	cpx #$04	; Should never be 4 if we got here?
	beq @A361
	
	@A35D:
	and #$F0	; The first byte of sound effects has 0 in the high nibble
	bne @A365	; while music usually starts with $E in the first high nibble

	@A361:
	lda #$01
	bne @A367	; Same as jmp

	@A365:
	lda #$00

	@A367:
	sta Sound_SoundFlags,x	; Set to 1 for SFX, 0 for music
	
	lda Sound_StartSong_CurrentLogicalChannel
	tay
	lda Sound_ChannelRegisterOffsetTable,y
	tay
	cpx #$00
	bne @A379

	; Check if a sound effect is using APU channel 0
	lda Sound_CurrentSongNumber_Channel3_effectsquare
	bne @A39B	; Don't mute channel 0 if a sound effect is using it

	@A379:
	lda #$00
	cpx #$02
	bne @A38B

	; Mute Triangle channel
	sta APU_HW__4008_Reg0_channel2
	jsr SoundCode_JustDoEightNOPs_28cyclesOfDelay
	sta APU_HW__400B_Reg3_channel2_WaveLengthHi
	jmp @A39B

	@A38B:
	; Mute other channels
	lda #$30
	sta APU_HW__4000_Reg0,y
	jsr SoundCode_JustDoEightNOPs_28cyclesOfDelay
	lda #$7F
	sta APU_HW__4001_Reg1_SweepControl,y
	jsr SoundCode_JustDoEightNOPs_28cyclesOfDelay
	
	@A39B:
	lda Sound_StartSong_LatestSongIndex
	sta Sound_CurrentSongNumber_Channel0_square0,x
	@loc_23A0:
	dec Sound_StartSong_NumTracksRemaining
	bmi @loc_23B1

	; Advance song pointer offset (3 bytes)
	ldy Sound_StartSong_MainPtrOffset
	iny
	iny
	iny
	sty Sound_StartSong_MainPtrOffset
	jmp @next_channel_track

	; ---------------
	@loc_23B1:
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
; -----------------------------------------------------------------------------

	.byte $FF

.ifndef custom_music
	.include "music/Mansion.asm"
	.include "music/Night.asm"
.else
	.include "custom/Mansion.asm"
	.include "custom/Night.asm"
.endif

; -----------------------------------------------------------------------------


	_loc_2ACE:
	clc
	adc TempPtr00_hi
	sta $0200,x
	jsr _func_2B7C
	lda Temp96
	jmp _loc_2B36
;------------------------------------------
SpriteConstructionProcess:
	ldy #$00
	lda (TempPtr08_lo),y
	bne :+
	
		rts

:	iny
	sta $0F
	and #$7F
	sta TempPtr02_hi
	sta $15
	ldx $04
	lda $0F
	bpl _AB02

	lda (TempPtr08_lo),y
	sta $0D
	iny
	lda (TempPtr08_lo),y
	sta $0E
	iny
	sty $0C
	ldy #$01
	lda ($0D),y

	_AB02:
	jsr LoadFrom08_or_0D__if0Fnegative
	clc
	bpl :+

		sec

:	iny
	ror a
	bcs _loc_2ACE
	adc TempPtr00_hi
	sta $0200,x
	jsr _func_2B7C
	clc
	lda TempPtr00_lo
	and #$03
	beq :+

		sec

:	jsr LoadFrom08_or_0D__if0Fnegative
	bcc :+

		and #$DC
		ora TempPtr00_lo

:	sta Temp96
	sta $0202,x
	iny
	lda Unknown10_CollisionAndScrollingTemp
	beq _AB39

		lda Temp96
		eor #$40
		sta Temp96

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
	:	clc
		adc #$C4
		cmp $16
		bcc :-

		tax
		dec Temp07
		@AB55:
		iny
		dec TempPtr02_hi
		beq :+

			jmp _AB02

	:	stx $04
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
	lda SpriteConstructionData_2,y
	sta TempPtr08_lo
	lda SpriteConstructionData_2+1,y
	sta TempPtr08_hi
	rts
;------------------------------------------
	.export NMI_RenderSprites
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
	.word $0000 ;0 (0) ()
	.word $0000 ;0 (0) ()
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
SpriteConstructionData_2:
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
	.word (SpriteData_Poses_06_B3_Simon_ClimbAnim2)	;B19F
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
	.byte $02,$F0,$6A,$40,$01,$F1,$67,$F9
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
	.byte $FF,$FF,$FF,$FF

.segment "VECT_00"
	;$46,$C0,$D0,$FF,$96,$C0
	.word (_NMI) ;C046 (1C046) ()
	.word (_Reset) ;FFD0 (1FFD0) ()
	.word (_IRQ)