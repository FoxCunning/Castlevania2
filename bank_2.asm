.segment "BANK_02"
; Offset in ROM: $08000
.setcpu "6502X"

.feature org_per_seg
.feature pc_assignment

.include "globals.inc"


LevelData_ScreenNumbers_0_Towns_7church:
	.word (LevelData_ScreenNumbers_0_Towns_5doina_80D2) ;80D2 (80D2) ()
	.byte $00,$FB,$00,$00,$FB,$00,$00
	.word (LevelData_ScreenNumbers_0_Towns_7church_0) ;800B (800B) ()
LevelData_ScreenNumbers_0_Towns_7church_0:
	.byte $10
LevelData_ScreenNumbers_0_Towns_8_0_9_0_10_1_16_1_18_0_19_2_20_0_22_0_23_0:
	.byte $07
LevelData_ScreenNumbers_0_Towns_10_0_16_0_19_0_19_1:
	.byte $08
LevelData_ScreenNumbers_0_Towns_13_1_14_1_15_1_17_1:
	.byte $0C
LevelData_ScreenNumbers_0_Towns_14_0_15_0:
	.byte $0D
LevelData_Screens_0_Towns_16_A:
	.byte $01,$01
	.word (LevelData_Screen_Map0_16) ;829F (829F) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
LevelData_Screens_0_Towns_7church_A:
	.byte $01,$01
	.word (LevelData_Screen_Map0_7_and_0_12) ;8117 (8117) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
LevelData_Screens_0_Towns_8_A:
	.byte $01,$01
	.word (LevelData_Screen_Map0_8) ;814F (814F) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
LevelData_Screens_0_Towns_12_A:
	.byte $01,$02
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Map0_7_and_0_12) ;8117 (8117) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
LevelData_Screens_0_Towns_13_A:
	.byte $01,$02
	.word (LevelData_Screen_Map0_10_and_0_13) ;8187 (8187) ([8:4][A:5])
	.word (LevelData_Screen_Map0_11_and_0_13_and_0_15) ;8267 (8267) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
LevelData_Palettes_0_Towns_7church_Day_Night:
	.byte $1D,$2E
LevelData_Stairs_0_Towns_13:
	.byte $0D,$1A,$99,$26,$13,$A6,$87,$B2,$FF
LevelData_Stairs_0_Towns_16:
	.byte $0F,$8E,$87,$96
LevelData_Stairs_0_Towns_7_8_12:
	.byte $FF
LevelData_ScreenNumbers_0_Towns:
	.word (LevelData_ScreenNumbers_0_Towns_0aldra) ;F9FF (1F9FF) ()
	.word (LevelData_ScreenNumbers_0_Towns_1veros) ;8657 (8657) ()
	.word (LevelData_ScreenNumbers_0_Towns_2aljiba) ;FAC2 (1FAC2) ()
	.word (LevelData_ScreenNumbers_0_Towns_3jova) ;FA0A (1FA0A) ()
	.word (LevelData_ScreenNumbers_0_Towns_4ondol) ;8662 (8662) ()
	.word (LevelData_ScreenNumbers_0_Towns_5doina) ;FACD (1FACD) ()
	.word (LevelData_ScreenNumbers_0_Towns_6yomi) ;FAD8 (1FAD8) ()
	.word (LevelData_ScreenNumbers_0_Towns_7church) ;8000 (8000) ()
	.word (LevelData_ScreenNumbers_0_Towns_8_9) ;FA15 (1FA15) ()
	.word (LevelData_ScreenNumbers_0_Towns_8_9) ;FA15 (1FA15) ()
	.word (LevelData_ScreenNumbers_0_Towns_10) ;866D (866D) ()
	.word (LevelData_ScreenNumbers_0_Towns_11) ;867A (867A) ()
	.word (LevelData_ScreenNumbers_0_Towns_12) ;FAE3 (1FAE3) ()
	.word (LevelData_ScreenNumbers_0_Towns_13) ;FAEE (1FAEE) ()
	.word (LevelData_ScreenNumbers_0_Towns_14) ;FAFB (1FAFB) ()
	.word (LevelData_ScreenNumbers_0_Towns_15) ;FA20 (1FA20) ()
	.word (LevelData_ScreenNumbers_0_Towns_16) ;FA2D (1FA2D) ()
	.word (LevelData_ScreenNumbers_0_Towns_17) ;8685 (8685) ()
	.word (LevelData_ScreenNumbers_0_Towns_18) ;8692 (8692) ()
	.word (LevelData_ScreenNumbers_0_Towns_19) ;869D (869D) ()
	.word (LevelData_ScreenNumbers_0_Towns_20_22_23) ;FB08 (1FB08) ()
	.word (LevelData_ScreenNumbers_0_Towns_21) ;FB13 (1FB13) ()
	.word (LevelData_ScreenNumbers_0_Towns_20_22_23) ;FB08 (1FB08) ()
	.word (LevelData_ScreenNumbers_0_Towns_20_22_23) ;FB08 (1FB08) ()
LevelData_Palettes_0_Towns:
	.word (LevelData_Palettes_0_Towns_0aldra_Day) ;FA3E (1FA3E) ()
	.word (LevelData_Palettes_0_Towns_0aldra_3jova_Night) ;FA4A (1FA4A) ()
	.word (LevelData_Palettes_0_Towns_1veros_Day) ;86B2 (86B2) ()
	.word (LevelData_Palettes_0_Towns_1veros_4ondol_Night) ;86BE (86BE) ()
	.word (LevelData_Palettes_0_Towns_2aljiba_Day) ;FB25 (1FB25) ()
	.word (LevelData_Palettes_0_Towns_2aljiba_5doina_6yomi_Night) ;FB33 (1FB33) ()
	.word (LevelData_Palettes_0_Towns_3jova_Day) ;FA40 (1FA40) ()
	.word (LevelData_Palettes_0_Towns_0aldra_3jova_Night) ;FA4A (1FA4A) ()
	.word (LevelData_Palettes_0_Towns_4ondol_Day) ;86B4 (86B4) ()
	.word (LevelData_Palettes_0_Towns_1veros_4ondol_Night) ;86BE (86BE) ()
	.word (LevelData_Palettes_0_Towns_5doina_Day) ;FB27 (1FB27) ()
	.word (LevelData_Palettes_0_Towns_2aljiba_5doina_6yomi_Night) ;FB33 (1FB33) ()
	.word (LevelData_Palettes_0_Towns_6yomi_Day) ;FB29 (1FB29) ()
	.word (LevelData_Palettes_0_Towns_2aljiba_5doina_6yomi_Night) ;FB33 (1FB33) ()
	.word (LevelData_Palettes_0_Towns_7church_Day_Night) ;8032 (8032) ()
	.word (LevelData_Palettes_0_Towns_7church_Day_Night) ;8032 (8032) ()
	.word (LevelData_Palettes_0_Towns_8_9_15_Day) ;FA42 (1FA42) ()
	.word (LevelData_Palettes_0_Towns_8_9_15_Day) ;FA42 (1FA42) ()
	.word (LevelData_Palettes_0_Towns_8_9_15_Day) ;FA42 (1FA42) ()
	.word (LevelData_Palettes_0_Towns_8_9_15_Day) ;FA42 (1FA42) ()
	.word (LevelData_Palettes_0_Towns_10_11_17_18_19_Day_10_11_17_18_Night) ;86B6 (86B6) ()
	.word (LevelData_Palettes_0_Towns_10_11_17_18_19_Day_10_11_17_18_Night) ;86B6 (86B6) ()
	.word (LevelData_Palettes_0_Towns_10_11_17_18_19_Day_10_11_17_18_Night) ;86B6 (86B6) ()
	.word (LevelData_Palettes_0_Towns_10_11_17_18_19_Day_10_11_17_18_Night) ;86B6 (86B6) ()
	.word (LevelData_Palettes_0_Towns_12_13_14_20_21_22_23_Day__12_13_14_20_21_22_Night) ;FB2B (1FB2B) ()
	.word (LevelData_Palettes_0_Towns_12_13_14_20_21_22_23_Day__12_13_14_20_21_22_Night) ;FB2B (1FB2B) ()
	.word (LevelData_Palettes_0_Towns_12_13_14_20_21_22_23_Day__12_13_14_20_21_22_Night) ;FB2B (1FB2B) ()
	.word (LevelData_Palettes_0_Towns_12_13_14_20_21_22_23_Day__12_13_14_20_21_22_Night) ;FB2B (1FB2B) ()
	.word (LevelData_Palettes_0_Towns_12_13_14_20_21_22_23_Day__12_13_14_20_21_22_Night) ;FB2B (1FB2B) ()
	.word (LevelData_Palettes_0_Towns_12_13_14_20_21_22_23_Day__12_13_14_20_21_22_Night) ;FB2B (1FB2B) ()
	.word (LevelData_Palettes_0_Towns_8_9_15_Day) ;FA42 (1FA42) ()
	.word (LevelData_Palettes_0_Towns_15garlicvendor_Night) ;FA48 (1FA48) ()
	.word (LevelData_Palettes_0_Towns_16laurelvendor_Day) ;FA4C (1FA4C) ()
	.word (LevelData_Palettes_0_Towns_16laurelvendor_Day) ;FA4C (1FA4C) ()
	.word (LevelData_Palettes_0_Towns_10_11_17_18_19_Day_10_11_17_18_Night) ;86B6 (86B6) ()
	.word (LevelData_Palettes_0_Towns_10_11_17_18_19_Day_10_11_17_18_Night) ;86B6 (86B6) ()
	.word (LevelData_Palettes_0_Towns_10_11_17_18_19_Day_10_11_17_18_Night) ;86B6 (86B6) ()
	.word (LevelData_Palettes_0_Towns_10_11_17_18_19_Day_10_11_17_18_Night) ;86B6 (86B6) ()
	.word (LevelData_Palettes_0_Towns_10_11_17_18_19_Day_10_11_17_18_Night) ;86B6 (86B6) ()
	.word (LevelData_Palettes_0_Towns_19laurelvendor_Night) ;86BC (86BC) ()
	.word (LevelData_Palettes_0_Towns_12_13_14_20_21_22_23_Day__12_13_14_20_21_22_Night) ;FB2B (1FB2B) ()
	.word (LevelData_Palettes_0_Towns_12_13_14_20_21_22_23_Day__12_13_14_20_21_22_Night) ;FB2B (1FB2B) ()
	.word (LevelData_Palettes_0_Towns_12_13_14_20_21_22_23_Day__12_13_14_20_21_22_Night) ;FB2B (1FB2B) ()
	.word (LevelData_Palettes_0_Towns_12_13_14_20_21_22_23_Day__12_13_14_20_21_22_Night) ;FB2B (1FB2B) ()
	.word (LevelData_Palettes_0_Towns_12_13_14_20_21_22_23_Day__12_13_14_20_21_22_Night) ;FB2B (1FB2B) ()
	.word (LevelData_Palettes_0_Towns_12_13_14_20_21_22_23_Day__12_13_14_20_21_22_Night) ;FB2B (1FB2B) ()
	.word (LevelData_Palettes_0_Towns_12_13_14_20_21_22_23_Day__12_13_14_20_21_22_Night) ;FB2B (1FB2B) ()
	.word (LevelData_Palettes_0_Towns_23yomiguy_Night) ;FB31 (1FB31) ()
LevelData_ScreenNumbers_0_Towns_5doina_80D2:
	.byte $00
LevelData_Screens_0_Towns:
	.word (LevelData_Screens_0_Towns_0aldra_A) ;FB66 (1FB66) ()
	.word (LevelData_Stairs_0_Towns_0aldra) ;FB35 (1FB35) ()
	.word (LevelData_Screens_0_Towns_1veros_A) ;86F8 (86F8) ()
	.word (LevelData_Stairs_0_Towns_1veros) ;86C0 (86C0) ()
	.word (LevelData_Screens_0_Towns_2aljiba_A) ;FB78 (1FB78) ()
	.word (LevelData_Stairs_0_Towns_2aljiba) ;FB3E (1FB3E) ()
	.word (LevelData_Screens_0_Towns_3jova_A) ;FA86 (1FA86) ()
	.word (LevelData_Stairs_0_Towns_3jova) ;FA50 (1FA50) ()
	.word (LevelData_Screens_0_Towns_4ondol_A) ;FAA0 (1FAA0) ()
	.word (LevelData_Stairs_0_Towns_4ondol) ;FA69 (1FA69) ()
	.word (LevelData_Screens_0_Towns_5doina_A) ;870A (870A) ()
	.word (LevelData_Stairs_0_Towns_5doina) ;86C5 (86C5) ()
	.word (LevelData_Screens_0_Towns_6yomi_A) ;FB92 (1FB92) ()
	.word (LevelData_Stairs_0_Towns_6yomi) ;FB47 (1FB47) ()
	.word (LevelData_Screens_0_Towns_7church_A) ;8016 (8016) ()
	.word (LevelData_Stairs_0_Towns_7_8_12) ;8041 (8041) ()
	.word (LevelData_Screens_0_Towns_8_A) ;801C (801C) ()
	.word (LevelData_Stairs_0_Towns_7_8_12) ;8041 (8041) ()
	.word (LevelData_Screens_0_Towns_9_A) ;872C (872C) ()
	.word (LevelData_Stairs_0_Towns_9) ;86E2 (86E2) ()
	.word (LevelData_Screens_0_Towns_10_A) ;FBA4 (1FBA4) ()
	.word (LevelData_Stairs_0_Towns_10_14) ;FB50 (1FB50) ()
	.word (LevelData_Screens_0_Towns_11_A) ;FBAC (1FBAC) ()
	.word (LevelData_Stairs_0_Towns_11) ;FB5D (1FB5D) ()
	.word (LevelData_Screens_0_Towns_12_A) ;8022 (8022) ()
	.word (LevelData_Stairs_0_Towns_7_8_12) ;8041 (8041) ()
	.word (LevelData_Screens_0_Towns_13_A) ;802A (802A) ()
	.word (LevelData_Stairs_0_Towns_13) ;8034 (8034) ()
	.word (LevelData_Screens_0_Towns_14_A) ;FBBC (1FBBC) ()
	.word (LevelData_Stairs_0_Towns_10_14) ;FB50 (1FB50) ()
	.word (LevelData_Screens_0_Towns_15_A) ;8734 (8734) ()
	.word (LevelData_Stairs_0_Towns_15) ;86EF (86EF) ()
	.word (LevelData_Screens_0_Towns_16_A) ;8010 (8010) ()
	.word (LevelData_Stairs_0_Towns_16) ;803D (803D) ()
LevelData_Screen_Map0_7_and_0_12:
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $01,$01,$01,$01,$01,$01,$01,$01,$06,$2F,$15,$2F,$15,$2F,$15,$07
	.byte $06,$35,$1F,$35,$1F,$35,$38,$07,$00,$32,$32,$32,$32,$32,$32,$07
	.byte $01,$01,$01,$01,$01,$01,$01,$01
LevelData_Screen_Map0_8:
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $01,$01,$01,$01,$01,$01,$01,$01,$06,$2F,$15,$2F,$15,$2F,$15,$07
	.byte $06,$35,$1F,$35,$1F,$35,$38,$07,$00,$32,$32,$32,$32,$32,$32,$09
	.byte $01,$01,$01,$01,$01,$01,$01,$01
LevelData_Screen_Map0_10_and_0_13:
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $01,$01,$01,$01,$01,$01,$01,$01,$06,$2F,$15,$2F,$15,$2F,$15,$07
	.byte $06,$35,$1F,$35,$1F,$35,$38,$07,$00,$32,$32,$32,$32,$32,$32,$07
	.byte $01,$01,$01,$0C,$0C,$0C,$01,$01
LevelData_Screen_Map0_9_and_0_11:
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $01,$01,$01,$01,$01,$01,$01,$01,$06,$2F,$15,$2F,$15,$2F,$15,$07
	.byte $06,$35,$1F,$35,$1F,$35,$38,$07,$00,$32,$32,$32,$32,$32,$32,$07
	.byte $01,$01,$0C,$0C,$01,$01,$01,$01
LevelData_Screen_Map0_14_and_0_15:
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $01,$01,$01,$01,$01,$01,$01,$01,$06,$2F,$15,$2F,$15,$2F,$15,$07
	.byte $06,$35,$1F,$35,$1F,$35,$38,$07,$00,$32,$32,$32,$32,$32,$32,$07
	.byte $01,$01,$00,$00,$00,$01,$01,$01
LevelData_Screen_Map0_9_and_0_10_and_0_14:
	.byte $06,$1F,$2E,$01,$01,$2E,$1F,$07,$06,$32,$01,$32,$32,$01,$32,$07
	.byte $01,$02,$0A,$01,$01,$0B,$03,$01,$06,$29,$04,$26,$27,$05,$3B,$07
	.byte $01,$02,$0A,$01,$01,$01,$0C,$01,$06,$29,$04,$26,$2E,$1F,$2E,$07
	.byte $01,$01,$01,$01,$01,$01,$01,$01
LevelData_Screen_Map0_11_and_0_13_and_0_15:
	.byte $06,$1F,$01,$02,$0A,$2E,$15,$07,$06,$15,$33,$29,$04,$26,$38,$07
	.byte $06,$38,$2E,$1F,$29,$04,$26,$07,$01,$0C,$01,$0B,$03,$01,$01,$01
	.byte $06,$2E,$27,$05,$3B,$15,$2E,$07,$06,$27,$05,$3B,$38,$1F,$38,$00
	.byte $01,$01,$01,$01,$01,$01,$01,$01
LevelData_Screen_Map0_16:
	.byte $22,$34,$22,$31,$22,$34,$22,$07,$22,$31,$22,$30,$22,$31,$22,$07
	.byte $22,$31,$22,$19,$22,$31,$23,$07,$22,$31,$23,$38,$23,$31,$01,$01
	.byte $22,$30,$0B,$03,$01,$30,$1F,$07,$23,$27,$05,$3B,$1F,$07,$42,$42
	.byte $01,$01,$01,$01,$01,$01,$01,$01
LevelData_Screen_Map0_3:
	.byte $12,$15,$1F,$21,$15,$1F,$21,$13,$12,$20,$37,$2C,$14,$37,$2C,$13
	.byte $12,$2B,$1F,$38,$28,$1F,$38,$13,$12,$01,$01,$02,$0A,$01,$01,$01
	.byte $12,$37,$20,$29,$04,$26,$1F,$13,$10,$25,$2B,$25,$1B,$04,$3A,$11
	.byte $01,$01,$01,$01,$01,$01,$01,$01
LevelData_Screen_Map0_2_and_0_5:
	.byte $12,$1F,$2E,$38,$2E,$1F,$2E,$13,$16,$1E,$1E,$1E,$1E,$1E,$1E,$17
	.byte $12,$1F,$15,$1F,$33,$15,$33,$13,$12,$37,$14,$38,$2E,$38,$2D,$13
	.byte $12,$1F,$28,$01,$01,$37,$2E,$13,$10,$01,$01,$00,$00,$01,$01,$11
	.byte $01,$24,$24,$24,$24,$24,$24,$01
LevelData_Screen_Map0_0_and_0_1_and_0_2_and_0_6:
	.byte $18,$12,$31,$15,$31,$15,$31,$13,$18,$12,$30,$38,$30,$1F,$30,$13
	.byte $18,$16,$1E,$1E,$1E,$1E,$1E,$17,$18,$12,$21,$1F,$15,$1F,$21,$13
	.byte $18,$12,$2C,$1F,$14,$37,$2C,$13,$18,$10,$25,$25,$28,$25,$0D,$11
	.byte $01,$01,$01,$24,$01,$24,$01,$01
LevelData_Screen_Map0_0_and_0_1_and_0_6:
	.byte $3C,$3D,$3D,$3D,$3D,$3D,$3E,$18,$12,$33,$1F,$15,$1F,$33,$13,$18
	.byte $12,$2D,$37,$14,$38,$2D,$13,$18,$12,$2E,$1F,$28,$1F,$2E,$13,$18
	.byte $12,$01,$02,$0A,$01,$1F,$13,$18,$10,$25,$1B,$04,$3A,$25,$11,$18
	.byte $01,$01,$01,$01,$01,$01,$01,$01
LevelData_Screen_Map0_3_and_0_4_and_0_5_one:
	.byte $18,$12,$29,$04,$26,$15,$20,$13,$18,$12,$33,$29,$04,$26,$2B,$13
	.byte $18,$12,$2D,$1F,$01,$0B,$03,$01,$18,$12,$2E,$1F,$27,$05,$3B,$13
	.byte $18,$12,$37,$27,$05,$3B,$37,$13,$18,$10,$39,$05,$1A,$25,$0D,$11
	.byte $01,$01,$01,$01,$24,$01,$01,$24
LevelData_Screen_Map0_5:
	.byte $12,$1C,$21,$36,$1C,$21,$36,$13,$12,$2A,$2C,$3F,$2A,$2C,$3F,$13
	.byte $16,$1E,$1D,$1E,$1E,$1E,$1E,$17,$12,$1C,$21,$36,$15,$14,$15,$13
	.byte $12,$2A,$2C,$3F,$37,$28,$1F,$13,$10,$25,$25,$25,$01,$01,$01,$11
	.byte $01,$01,$01,$01,$01,$01,$01,$01
LevelData_Screen_Map0_4:
	.byte $18,$12,$31,$1F,$31,$1F,$31,$13,$3C,$3D,$3D,$3D,$3D,$3E,$30,$13
	.byte $12,$38,$1F,$38,$1F,$13,$1E,$17,$12,$21,$15,$21,$15,$13,$15,$13
	.byte $12,$2C,$37,$2C,$14,$13,$20,$13,$10,$25,$25,$25,$28,$11,$2B,$11
	.byte $01,$01,$01,$01,$01,$01,$01,$01
LevelData_Screen_Map0_2_and_0_3_and_0_4_and_0_5_one:
	.byte $12,$29,$04,$26,$38,$14,$13,$41,$10,$25,$1B,$04,$3A,$28,$11,$42
	.byte $01,$02,$0A,$01,$01,$01,$01,$01,$12,$29,$04,$26,$1F,$37,$13,$18
	.byte $12,$37,$29,$04,$26,$15,$13,$18,$10,$25,$25,$1B,$04,$3A,$11,$18
	.byte $24,$01,$24,$01,$01,$01,$01,$01
LevelData_Screen_Map0_3_and_0_4_and_0_5_two:
	.byte $18,$3C,$3D,$3D,$3D,$3D,$3D,$3E,$18,$12,$21,$1F,$21,$1F,$21,$13
	.byte $18,$12,$2C,$38,$2C,$38,$2C,$13,$40,$12,$21,$1F,$15,$38,$21,$13
	.byte $40,$12,$2C,$1F,$20,$37,$2C,$13,$42,$10,$25,$25,$2B,$25,$25,$11
	.byte $01,$01,$02,$0A,$01,$01,$01,$01
LevelData_Screen_Map0_4_and_0_5:
	.byte $12,$29,$04,$26,$38,$38,$13,$18,$12,$38,$29,$04,$26,$33,$13,$18
	.byte $01,$02,$0A,$01,$01,$2D,$13,$18,$12,$29,$04,$26,$1F,$2E,$13,$41
	.byte $12,$20,$29,$04,$26,$37,$13,$41,$10,$2B,$25,$1B,$04,$3A,$11,$42
	.byte $01,$02,$0A,$01,$01,$01,$01,$01
LevelData_Screen_Map0_2_and_0_3_and_0_4_and_0_5_two:
	.byte $3C,$3D,$3D,$3D,$3D,$3D,$3E,$18,$12,$15,$1F,$15,$1F,$15,$13,$18
	.byte $16,$1E,$1E,$1E,$1E,$1E,$17,$18,$12,$21,$15,$21,$38,$15,$13,$41
	.byte $12,$2C,$38,$2C,$37,$20,$13,$41,$10,$25,$25,$25,$25,$2B,$11,$42
	.byte $01,$02,$0A,$01,$01,$01,$01,$01
LevelData_Screen_Map0_2_and_0_4_and_0_5:
	.byte $18,$12,$21,$1F,$21,$38,$21,$13,$18,$12,$2C,$1F,$2C,$1F,$2C,$13
	.byte $18,$16,$1E,$1E,$1D,$1E,$1D,$17,$40,$12,$15,$1F,$21,$1F,$21,$13
	.byte $40,$12,$20,$37,$2C,$38,$2C,$13,$42,$10,$2B,$25,$25,$25,$25,$11
	.byte $01,$01,$01,$01,$01,$01,$01,$01
LevelData_Screen_Map0_0_and_0_1_and_0_3_and_0_4:
	.byte $18,$12,$34,$31,$34,$13,$18,$18,$3D,$12,$31,$30,$31,$13,$3D,$3E
	.byte $15,$12,$31,$19,$31,$13,$15,$13,$21,$12,$30,$15,$30,$13,$21,$13
	.byte $2C,$12,$15,$14,$15,$13,$2C,$13,$25,$10,$25,$28,$25,$11,$25,$11
	.byte $01,$01,$01,$01,$01,$01,$01,$01
LevelData_Screen_Map0_2_and_0_3_and_0_4_and_0_5_and_0_6:
	.byte $12,$15,$21,$15,$21,$15,$21,$13,$3C,$3D,$3D,$3D,$3E,$1F,$2C,$13
	.byte $12,$33,$1F,$33,$13,$1E,$1E,$17,$12,$2D,$15,$2D,$13,$1F,$15,$13
	.byte $12,$2E,$20,$2E,$13,$37,$20,$13,$10,$25,$2B,$25,$11,$25,$2B,$11
	.byte $01,$01,$01,$01,$01,$01,$01,$01
LevelData_Screen_Map0_1_and_0_2_and_0_4_and_0_5:
	.byte $12,$1F,$21,$38,$21,$1F,$21,$13,$12,$37,$2C,$1F,$2C,$38,$2C,$13
	.byte $16,$1E,$1E,$1E,$1E,$1E,$1E,$17,$12,$15,$21,$15,$21,$15,$21,$13
	.byte $12,$20,$2C,$37,$2C,$20,$2C,$13,$10,$2B,$25,$25,$25,$2B,$25,$11
	.byte $01,$01,$01,$01,$01,$01,$01,$01
LevelData_Screen_Map0_0_and_0_3_and_0_4_and_0_5_and_0_6:
	.byte $12,$15,$1F,$21,$1F,$21,$1F,$13,$12,$20,$37,$2C,$1F,$2C,$1F,$13
	.byte $12,$2B,$38,$1F,$38,$1F,$1F,$13,$01,$01,$01,$0B,$03,$01,$01,$13
	.byte $12,$37,$27,$05,$3B,$20,$37,$13,$10,$39,$05,$1A,$25,$2B,$25,$11
	.byte $01,$01,$01,$01,$01,$01,$01,$01
LevelData_ScreenNumbers_0_Towns_1veros:
	.word (LevelData_ScreenNumbers_0_Towns_1veros_86B0) ;86B0 (86B0) ()
	.byte $00,$FC,$02,$00,$FC,$02,$03
	.word (LevelData_ScreenNumbers_0_Towns_1veros_0) ;86AC (86AC) ()
LevelData_ScreenNumbers_0_Towns_4ondol:
	.word (LevelData_ScreenNumbers_0_Towns_4ondol_86B1) ;86B1 (86B1) ()
	.byte $00,$FF,$04,$01,$FF,$03,$04
	.word (LevelData_ScreenNumbers_0_Towns_4ondol_0) ;86AD (86AD) ()
LevelData_ScreenNumbers_0_Towns_10:
	.word (LevelData_ScreenNumbers_0_Towns_5doina_80D2) ;80D2 (80D2) ()
	.byte $01,$FB,$00,$00,$FB,$00,$00
	.word (LevelData_ScreenNumbers_0_Towns_10_0_16_0_19_0_19_1) ;800D (800D) ()
	.word (LevelData_ScreenNumbers_0_Towns_8_0_9_0_10_1_16_1_18_0_19_2_20_0_22_0_23_0) ;800C (800C) ()
LevelData_ScreenNumbers_0_Towns_11:
	.word (LevelData_ScreenNumbers_0_Towns_5doina_80D2) ;80D2 (80D2) ()
	.byte $00,$FB,$00,$00,$FB,$00,$00
	.word (LevelData_ScreenNumbers_0_Towns_11_0) ;86AE (86AE) ()
LevelData_ScreenNumbers_0_Towns_17:
	.word (LevelData_ScreenNumbers_0_Towns_5doina_80D2) ;80D2 (80D2) ()
	.byte $01,$FB,$00,$00,$FB,$00,$00
	.word (LevelData_ScreenNumbers_0_Towns_17_0) ;86AF (86AF) ()
	.word (LevelData_ScreenNumbers_0_Towns_13_1_14_1_15_1_17_1) ;800E (800E) ()
LevelData_ScreenNumbers_0_Towns_18:
	.word (LevelData_ScreenNumbers_0_Towns_5doina_80D2) ;80D2 (80D2) ()
	.byte $00,$FB,$00,$00,$FB,$00,$00
	.word (LevelData_ScreenNumbers_0_Towns_8_0_9_0_10_1_16_1_18_0_19_2_20_0_22_0_23_0) ;800C (800C) ()
LevelData_ScreenNumbers_0_Towns_19:
	.word (LevelData_ScreenNumbers_0_Towns_5doina_80D2) ;80D2 (80D2) ()
	.byte $02,$FB,$00,$00,$FB,$00,$00
	.word (LevelData_ScreenNumbers_0_Towns_10_0_16_0_19_0_19_1) ;800D (800D) ()
	.word (LevelData_ScreenNumbers_0_Towns_10_0_16_0_19_0_19_1) ;800D (800D) ()
	.word (LevelData_ScreenNumbers_0_Towns_8_0_9_0_10_1_16_1_18_0_19_2_20_0_22_0_23_0) ;800C (800C) ()
LevelData_ScreenNumbers_0_Towns_1veros_0:
	.byte $01
LevelData_ScreenNumbers_0_Towns_4ondol_0:
	.byte $05
LevelData_ScreenNumbers_0_Towns_11_0:
	.byte $09
LevelData_ScreenNumbers_0_Towns_17_0:
	.byte $0F
LevelData_ScreenNumbers_0_Towns_1veros_86B0:
	.byte $00
LevelData_ScreenNumbers_0_Towns_4ondol_86B1:
	.byte $FE
LevelData_Palettes_0_Towns_1veros_Day:
	.byte $17,$2E
LevelData_Palettes_0_Towns_4ondol_Day:
	.byte $1A,$2E
LevelData_Palettes_0_Towns_10_11_17_18_19_Day_10_11_17_18_Night:
	.byte $15,$2E,$15,$2E,$15,$2E
LevelData_Palettes_0_Towns_19laurelvendor_Night:
	.byte $16,$2E
LevelData_Palettes_0_Towns_1veros_4ondol_Night:
	.byte $14,$37
LevelData_Stairs_0_Towns_1veros:
	.byte $69,$0E,$F1,$16,$FF
LevelData_Stairs_0_Towns_5doina:
	.byte $09,$32,$95,$3E,$1B,$BE,$8B,$CE,$53,$A6,$C7,$B2,$65,$16,$F1,$22
	.byte $65,$22,$F5,$32,$65,$32,$F1,$3E,$65,$3E,$F5,$4E,$FF
LevelData_Stairs_0_Towns_9:
	.byte $05,$22,$8D,$2A,$05,$2A,$8D,$32,$1B,$A2,$93,$AA,$FF
LevelData_Stairs_0_Towns_15:
	.byte $0D,$1A,$99,$26,$13,$A6,$87,$B2,$FF
LevelData_Screens_0_Towns_1veros_A:
	.byte $04,$01
	.word (LevelData_Screen_Map0_0_and_0_1_and_0_2_and_0_6) ;8347 (8347) ([8:4][A:5])
	.word (LevelData_Screen_Map0_0_and_0_1_and_0_3_and_0_4) ;8577 (8577) ([8:4][A:5])
	.word (LevelData_Screen_Map0_1_and_0_2_and_0_4_and_0_5) ;85E7 (85E7) ([8:4][A:5])
	.word (LevelData_Screen_Map0_0_and_0_1_and_0_6) ;837F (837F) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
LevelData_Screens_0_Towns_5doina_A:
	.byte $04,$03
	.word (LevelData_Screen_Map0_2_and_0_4_and_0_5) ;853F (853F) ([8:4][A:5])
	.word (LevelData_Screen_Map0_1_and_0_2_and_0_4_and_0_5) ;85E7 (85E7) ([8:4][A:5])
	.word (LevelData_Screen_Map0_2_and_0_3_and_0_4_and_0_5_and_0_6) ;85AF (85AF) ([8:4][A:5])
	.word (LevelData_Screen_Map0_2_and_0_3_and_0_4_and_0_5_two) ;8507 (8507) ([8:4][A:5])
	.word (LevelData_Screen_Map0_3_and_0_4_and_0_5_two) ;8497 (8497) ([8:4][A:5])
	.word (LevelData_Screen_Map0_5) ;83EF (83EF) ([8:4][A:5])
	.word (LevelData_Screen_Map0_0_and_0_3_and_0_4_and_0_5_and_0_6) ;861F (861F) ([8:4][A:5])
	.word (LevelData_Screen_Map0_4_and_0_5) ;84CF (84CF) ([8:4][A:5])
	.word (LevelData_Screen_Map0_3_and_0_4_and_0_5_one) ;83B7 (83B7) ([8:4][A:5])
	.word (LevelData_Screen_Map0_2_and_0_3_and_0_4_and_0_5_and_0_6) ;85AF (85AF) ([8:4][A:5])
	.word (LevelData_Screen_Map0_2_and_0_5) ;830F (830F) ([8:4][A:5])
	.word (LevelData_Screen_Map0_2_and_0_3_and_0_4_and_0_5_one) ;845F (845F) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
LevelData_Screens_0_Towns_9_A:
	.byte $01,$02
	.word (LevelData_Screen_Map0_9_and_0_11) ;81BF (81BF) ([8:4][A:5])
	.word (LevelData_Screen_Map0_9_and_0_10_and_0_14) ;822F (822F) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
LevelData_Screens_0_Towns_15_A:
	.byte $01,$02
	.word (LevelData_Screen_Map0_14_and_0_15) ;81F7 (81F7) ([8:4][A:5])
	.word (LevelData_Screen_Map0_11_and_0_13_and_0_15) ;8267 (8267) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
LevelData_ScreenNumbers_1_Mansions:
	.word (LevelData_ScreenNumbers_1_Mansions_0larubaEntrance) ;88C7 (88C7) ()
	.word (LevelData_ScreenNumbers_1_Mansions_1_12_13_14_15_16_17) ;8D3A (8D3A) ()
	.word (LevelData_ScreenNumbers_1_Mansions_2roverEntrance) ;924A (924A) ()
	.word (LevelData_ScreenNumbers_1_Mansions_3brahmEntrance) ;967B (967B) ()
	.word (LevelData_ScreenNumbers_1_Mansions_4bodleyEntrance) ;9A51 (9A51) ()
	.word (TempPtr00_lo) ;0 (0) ()
	.word (LevelData_ScreenNumbers_1_Mansions_6laruba) ;88D2 (88D2) ()
	.word (LevelData_ScreenNumbers_1_Mansions_7berkeley) ;8D45 (8D45) ()
	.word (LevelData_ScreenNumbers_1_Mansions_8rover) ;923D (923D) ()
	.word (LevelData_ScreenNumbers_1_Mansions_9brahm) ;9686 (9686) ()
	.word (LevelData_ScreenNumbers_1_Mansions_Abodley) ;9A5C (9A5C) ()
	.word (TempPtr00_lo) ;0 (0) ()
	.word (LevelData_ScreenNumbers_1_Mansions_1_12_13_14_15_16_17) ;8D3A (8D3A) ()
	.word (LevelData_ScreenNumbers_1_Mansions_1_12_13_14_15_16_17) ;8D3A (8D3A) ()
	.word (LevelData_ScreenNumbers_1_Mansions_1_12_13_14_15_16_17) ;8D3A (8D3A) ()
	.word (LevelData_ScreenNumbers_1_Mansions_1_12_13_14_15_16_17) ;8D3A (8D3A) ()
	.word (LevelData_ScreenNumbers_1_Mansions_1_12_13_14_15_16_17) ;8D3A (8D3A) ()
	.word (LevelData_ScreenNumbers_1_Mansions_1_12_13_14_15_16_17) ;8D3A (8D3A) ()
	.word (LevelData_ScreenNumbers_1_Mansions_18) ;8D52 (8D52) ()
LevelData_Palettes_1_Mansions:
	.word (LevelData_Palettes_1_Mansions_0larubaEntrance_Day_6) ;88E8 (88E8) ()
	.word (LevelData_Palettes_1_Mansions_0larubaEntrance_Night) ;88F0 (88F0) ()
	.word (LevelData_Palettes_1_Mansions_1berkeleyEntrance_Day_7) ;8D65 (8D65) ()
	.word (LevelData_Palettes_1_Mansions_1berkeleyEntrance_Night) ;8D69 (8D69) ()
	.word (LevelData_Palettes_1_Mansions_2roverEntrance_Day_8) ;9258 (9258) ()
	.word (LevelData_Palettes_1_Mansions_2roverEntrance_Night) ;925E (925E) ()
	.word (LevelData_Palettes_1_Mansions_3brahmEntrance_Day_9) ;969F (969F) ()
	.word (LevelData_Palettes_1_Mansions_3brahmEntrance_Night) ;96A7 (96A7) ()
	.word (LevelData_Palettes_1_Mansions_4bodleyEntrance_Day_10) ;9A6D (9A6D) ()
	.word (LevelData_Palettes_1_Mansions_4bodleyEntrance_Night) ;9A71 (9A71) ()
	.word (TempPtr00_lo) ;0 (0) ()
	.word (TempPtr00_lo) ;0 (0) ()
	.word (LevelData_Palettes_1_Mansions_0larubaEntrance_Day_6) ;88E8 (88E8) ()
	.word (LevelData_Palettes_1_Mansions_0larubaEntrance_Day_6) ;88E8 (88E8) ()
	.word (LevelData_Palettes_1_Mansions_1berkeleyEntrance_Day_7) ;8D65 (8D65) ()
	.word (LevelData_Palettes_1_Mansions_1berkeleyEntrance_Day_7) ;8D65 (8D65) ()
	.word (LevelData_Palettes_1_Mansions_2roverEntrance_Day_8) ;9258 (9258) ()
	.word (LevelData_Palettes_1_Mansions_2roverEntrance_Day_8) ;9258 (9258) ()
	.word (LevelData_Palettes_1_Mansions_3brahmEntrance_Day_9) ;969F (969F) ()
	.word (LevelData_Palettes_1_Mansions_3brahmEntrance_Day_9) ;969F (969F) ()
	.word (LevelData_Palettes_1_Mansions_4bodleyEntrance_Day_10) ;9A6D (9A6D) ()
	.word (LevelData_Palettes_1_Mansions_4bodleyEntrance_Day_10) ;9A6D (9A6D) ()
	.word (TempPtr00_lo) ;0 (0) ()
	.word (TempPtr00_lo) ;0 (0) ()
LevelData_Screens_1_Mansions:
	.word (LevelData_Screens_1_Mansions_0larubaEntrance_A) ;8910 (8910) ()
	.word (LevelData_Stairs_1_Mansions_0larubaEntrance) ;88F6 (88F6) ()
	.word (LevelData_Screens_1_Mansions_1berkeleyEntrance_A) ;892A (892A) ()
	.word (LevelData_Stairs_1_Mansions_1berkeleyEntrance) ;8907 (8907) ()
	.word (LevelData_Screens_1_Mansions_2roverEntrance_A) ;87CF (87CF) ()
	.word (LevelData_Stairs_1_Mansions_2_3_11_12) ;87CE (87CE) ()
	.word (LevelData_Screens_1_Mansions_3brahmEntrance_A) ;87D5 (87D5) ()
	.word (LevelData_Stairs_1_Mansions_2_3_11_12) ;87CE (87CE) ()
	.word (LevelData_Screens_1_Mansions_4bodleyEntrance_A) ;8D99 (8D99) ()
	.word (LevelData_Stairs_1_Mansions_4bodleyEntrance) ;8D6B (8D6B) ()
	.word (LevelData_Screens_1_Mansions_5_A) ;8DBB (8DBB) ()
	.word (LevelData_Stairs_1_Mansions_5) ;8D7C (8D7C) ()
	.word (LevelData_Screens_1_Mansions_6laruba_A) ;9287 (9287) ()
	.word (LevelData_Stairs_1_Mansions_6laruba) ;9261 (9261) ()
	.word (LevelData_Screens_1_Mansions_7berkeley_A) ;92A1 (92A1) ()
	.word (LevelData_Stairs_1_Mansions_7berkeley) ;9272 (9272) ()
	.word (LevelData_Screens_1_Mansions_8rover_A) ;96DD (96DD) ()
	.word (LevelData_Stairs_1_Mansions_8rover) ;96A9 (96A9) ()
	.word (LevelData_Screens_1_Mansions_9_10_A) ;96FD (96FD) ()
	.word (LevelData_Stairs_1_Mansions_9_10) ;96D8 (96D8) ()
	.word (LevelData_Screens_1_Mansions_9_10_A) ;96FD (96FD) ()
	.word (LevelData_Stairs_1_Mansions_9_10) ;96D8 (96D8) ()
	.word (LevelData_Screens_1_Mansions_11_A) ;87DB (87DB) ()
	.word (LevelData_Stairs_1_Mansions_2_3_11_12) ;87CE (87CE) ()
	.word (LevelData_Screens_1_Mansions_12_A) ;87E1 (87E1) ()
	.word (LevelData_Stairs_1_Mansions_2_3_11_12) ;87CE (87CE) ()
	.word (LevelData_Screens_1_Mansions_13_A) ;9AA9 (9AA9) ()
	.word (LevelData_Stairs_1_Mansions_13) ;9A73 (9A73) ()
	.word (LevelData_Screens_1_Mansions_14_A) ;9ACB (9ACB) ()
	.word (LevelData_Stairs_1_Mansions_14) ;9A8C (9A8C) ()
LevelData_Stairs_1_Mansions_2_3_11_12:
	.byte $FF
LevelData_Screens_1_Mansions_2roverEntrance_A:
	.byte $01,$01
	.word (LevelData_Screen_Map1_2) ;87E7 (87E7) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
LevelData_Screens_1_Mansions_3brahmEntrance_A:
	.byte $01,$01
	.word (LevelData_Screen_Map1_3) ;881F (881F) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
LevelData_Screens_1_Mansions_11_A:
	.byte $01,$01
	.word (LevelData_Screen_Map1_11) ;888F (888F) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
LevelData_Screens_1_Mansions_12_A:
	.byte $01,$01
	.word (LevelData_Screen_Map1_5_and_1_7_and_1_12_and_1_14) ;8857 (8857) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
LevelData_Screen_Map1_2:
	.byte $1F,$14,$1F,$2B,$14,$1F,$17,$1F,$1F,$21,$1F,$14,$2B,$1F,$2B,$1F
	.byte $12,$2B,$12,$14,$17,$12,$14,$12,$2B,$14,$2B,$2B,$14,$2B,$14,$2B
	.byte $3D,$3D,$3C,$10,$15,$27,$3D,$3D,$35,$35,$3A,$11,$34,$1B,$35,$35
	.byte $01,$01,$01,$01,$01,$01,$01,$01
LevelData_Screen_Map1_3:
	.byte $1F,$14,$1F,$2B,$14,$1F,$17,$1F,$1F,$21,$1F,$14,$2B,$1F,$2B,$1F
	.byte $12,$2B,$12,$14,$17,$12,$14,$12,$2B,$14,$2B,$2B,$14,$2B,$14,$40
	.byte $3D,$3D,$3C,$10,$15,$27,$3D,$40,$35,$35,$3A,$11,$34,$1B,$35,$40
	.byte $01,$01,$01,$01,$01,$01,$01,$01
LevelData_Screen_Map1_5_and_1_7_and_1_12_and_1_14:
	.byte $40,$01,$01,$01,$01,$01,$01,$40,$06,$13,$2E,$13,$13,$13,$17,$07
	.byte $06,$13,$31,$13,$19,$13,$14,$07,$06,$19,$13,$19,$00,$19,$28,$07
	.byte $06,$21,$19,$39,$39,$01,$01,$01,$00,$1A,$1E,$39,$01,$39,$39,$07
	.byte $40,$40,$40,$40,$40,$40,$40,$40
LevelData_Screen_Map1_11:
	.byte $40,$01,$01,$01,$01,$01,$01,$40,$06,$21,$2B,$2B,$39,$14,$17,$07
	.byte $06,$2B,$14,$14,$14,$39,$39,$07,$06,$39,$2B,$2B,$2B,$39,$39,$07
	.byte $06,$39,$39,$14,$14,$2B,$39,$07,$00,$1A,$1A,$1A,$1A,$1A,$1A,$00
	.byte $40,$40,$40,$40,$40,$40,$40,$40
LevelData_ScreenNumbers_1_Mansions_0larubaEntrance:
	.word (LevelData_ScreenNumbers_1_Mansions_0larubaEntrance_88F2) ;88F2 (88F2) ()
	.byte $00,$FF,$03,$00,$FF,$03,$03
	.word (LevelData_ScreenNumbers_1_Mansions_0larubaEntrance_0) ;88E3 (88E3) ()
LevelData_ScreenNumbers_1_Mansions_6laruba:
	.word (LevelData_ScreenNumbers_1_Mansions_6laruba_88F3) ;88F3 (88F3) ()
	.byte $03,$FB,$00,$00,$FB,$00,$00
	.word (LevelData_ScreenNumbers_1_Mansions_6laruba_0) ;88E4 (88E4) ()
	.word (LevelData_ScreenNumbers_1_Mansions_6laruba_1) ;88E5 (88E5) ()
	.word (LevelData_ScreenNumbers_1_Mansions_6laruba_2) ;88E6 (88E6) ()
	.word (LevelData_ScreenNumbers_1_Mansions_6laruba_3) ;88E7 (88E7) ()
LevelData_ScreenNumbers_1_Mansions_0larubaEntrance_0:
	.byte $02
LevelData_ScreenNumbers_1_Mansions_6laruba_0:
	.byte $00
LevelData_ScreenNumbers_1_Mansions_6laruba_1:
	.byte $01
LevelData_ScreenNumbers_1_Mansions_6laruba_2:
	.byte $0B
LevelData_ScreenNumbers_1_Mansions_6laruba_3:
	.byte $0C
LevelData_Palettes_1_Mansions_0larubaEntrance_Day_6:
	.byte $0E,$47,$0E,$47,$0E,$47,$0E,$47
LevelData_Palettes_1_Mansions_0larubaEntrance_Night:
	.byte $0D,$47
LevelData_ScreenNumbers_1_Mansions_0larubaEntrance_88F2:
	.byte $00
LevelData_ScreenNumbers_1_Mansions_6laruba_88F3:
	.byte $01,$FD,$00
LevelData_Stairs_1_Mansions_0larubaEntrance:
	.byte $0D,$1A,$95,$22,$97,$96,$27,$86,$49,$22,$D5,$2E,$59,$0E,$E5,$1A
	.byte $FF
LevelData_Stairs_1_Mansions_1berkeleyEntrance:
	.byte $05,$22,$91,$2E,$29,$0A,$B5,$16,$FF
LevelData_Screens_1_Mansions_0larubaEntrance_A:
	.byte $04,$02
	.word (LevelData_Screen_Map1_0_one) ;89F2 (89F2) ([8:4][A:5])
	.word (LevelData_Screen_Map1_0_two) ;8A2A (8A2A) ([8:4][A:5])
	.word (LevelData_Screen_Map1_0_three) ;8A62 (8A62) ([8:4][A:5])
	.word (LevelData_Screen_Map1_0_four) ;8A9A (8A9A) ([8:4][A:5])
	.word (LevelData_Screen_Map1_0_five) ;8B42 (8B42) ([8:4][A:5])
	.word (LevelData_Screen_Map1_0_six) ;8B7A (8B7A) ([8:4][A:5])
	.word (LevelData_Screen_Map1_0_seven) ;8BB2 (8BB2) ([8:4][A:5])
	.word (LevelData_Screen_Map1_0_eight) ;8BEA (8BEA) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
LevelData_Screens_1_Mansions_1berkeleyEntrance_A:
	.byte $03,$04
	.word (LevelData_Screen_Map1_1_one) ;894A (894A) ([8:4][A:5])
	.word (LevelData_Screen_Map1_1_two) ;8982 (8982) ([8:4][A:5])
	.word (LevelData_Screen_Map1_1_three) ;89BA (89BA) ([8:4][A:5])
	.word (LevelData_Screen_Map1_1_four) ;8AD2 (8AD2) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Map1_1_five) ;8B0A (8B0A) ([8:4][A:5])
	.word (LevelData_Screen_Map1_1_six) ;8C22 (8C22) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Map1_1_seven) ;8C5A (8C5A) ([8:4][A:5])
	.word (LevelData_Screen_Map1_1_eight) ;8C92 (8C92) ([8:4][A:5])
	.word (LevelData_Screen_Map1_1_nine) ;8CCA (8CCA) ([8:4][A:5])
	.word (LevelData_Screen_Map1_1_ten) ;8D02 (8D02) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
LevelData_Screen_Map1_1_one:
	.byte $01,$01,$01,$01,$01,$01,$01,$01,$06,$21,$1F,$2B,$1F,$2B,$1F,$14
	.byte $06,$2B,$1F,$14,$1F,$14,$1F,$14,$06,$14,$1F,$14,$1F,$17,$1F,$21
	.byte $06,$17,$12,$17,$12,$2B,$12,$2B,$06,$2B,$14,$2B,$14,$2B,$14,$1A
	.byte $06,$14,$14,$14,$1A,$1A,$1A,$07
LevelData_Screen_Map1_1_two:
	.byte $01,$01,$01,$01,$01,$01,$01,$01,$1E,$21,$1E,$17,$1E,$2B,$1E,$14
	.byte $1A,$1A,$1A,$1A,$1A,$1A,$1A,$1A,$17,$01,$02,$0A,$01,$01,$01,$01
	.byte $14,$14,$23,$04,$1D,$14,$17,$07,$1A,$1A,$1A,$25,$04,$1D,$1A,$07
	.byte $40,$36,$40,$40,$40,$40,$40,$40
LevelData_Screen_Map1_1_three:
	.byte $01,$01,$01,$01,$01,$01,$01,$01,$2B,$14,$2B,$14,$14,$17,$23,$07
	.byte $1A,$1A,$14,$14,$2B,$14,$17,$07,$01,$01,$21,$1E,$14,$1E,$14,$07
	.byte $06,$21,$2B,$2C,$2B,$2C,$14,$07,$06,$1A,$1A,$1A,$1A,$1A,$1A,$07
	.byte $01,$01,$01,$01,$01,$01,$00,$07
LevelData_Screen_Map1_0_one:
	.byte $06,$26,$14,$18,$14,$18,$14,$26,$06,$26,$1A,$1A,$1A,$1A,$1A,$26
	.byte $01,$01,$01,$01,$01,$01,$01,$01,$06,$26,$14,$16,$14,$16,$14,$1C
	.byte $06,$26,$14,$18,$14,$18,$1C,$05,$06,$26,$14,$14,$14,$1C,$05,$24
	.byte $06,$26,$1A,$1A,$25,$01,$01,$01
LevelData_Screen_Map1_0_two:
	.byte $14,$18,$2B,$18,$14,$26,$14,$16,$1A,$1A,$1A,$1A,$2B,$26,$2B,$3E
	.byte $0B,$03,$01,$22,$14,$26,$14,$3E,$05,$22,$14,$14,$2B,$26,$2B,$18
	.byte $22,$14,$14,$2B,$14,$26,$14,$1A,$1A,$1A,$1A,$1A,$1A,$26,$1A,$07
	.byte $01,$01,$01,$01,$01,$01,$01,$01
LevelData_Screen_Map1_0_three:
	.byte $14,$16,$2B,$16,$14,$26,$2B,$18,$2B,$3E,$14,$3E,$2B,$26,$14,$2B
	.byte $14,$18,$2B,$18,$14,$26,$14,$1A,$1A,$1A,$1A,$1A,$1A,$26,$1A,$01
	.byte $07,$01,$01,$01,$01,$01,$02,$1D,$01,$21,$14,$2B,$14,$14,$17,$04
	.byte $21,$2B,$14,$14,$2B,$14,$2B,$26
LevelData_Screen_Map1_0_four:
	.byte $14,$18,$14,$18,$2B,$3E,$2B,$3E,$1A,$1A,$1A,$1A,$14,$3E,$14,$3E
	.byte $01,$01,$01,$01,$1A,$18,$2B,$3E,$21,$16,$14,$16,$01,$1A,$14,$18
	.byte $14,$3E,$2B,$3E,$17,$01,$1A,$1A,$1D,$18,$14,$18,$2B,$17,$01,$01
	.byte $04,$1D,$1A,$1A,$1A,$1A,$1A,$07
LevelData_Screen_Map1_1_four:
	.byte $06,$14,$1A,$17,$01,$01,$01,$01,$06,$1A,$01,$22,$14,$14,$17,$38
	.byte $01,$02,$1D,$14,$1E,$17,$1E,$38,$14,$23,$04,$1D,$2C,$23,$2C,$38
	.byte $1A,$2B,$17,$04,$1D,$1A,$1A,$38,$01,$1A,$17,$01,$01,$01,$01,$01
	.byte $06,$01,$1A,$14,$14,$2B,$17,$07
LevelData_Screen_Map1_1_five:
	.byte $06,$22,$14,$1E,$14,$1E,$17,$07,$06,$1E,$21,$39,$2B,$39,$14,$07
	.byte $06,$39,$01,$01,$36,$01,$01,$01,$06,$39,$1A,$1E,$00,$1E,$25,$07
	.byte $01,$01,$01,$01,$01,$01,$00,$07,$06,$1E,$21,$1E,$21,$1E,$17,$07
	.byte $06,$14,$2B,$14,$2B,$2B,$14,$07
LevelData_Screen_Map1_0_five:
	.byte $01,$01,$01,$02,$1D,$14,$14,$26,$06,$26,$1A,$25,$04,$1D,$1A,$26
	.byte $01,$01,$01,$01,$01,$01,$01,$01,$00,$26,$23,$16,$17,$16,$22,$26
	.byte $00,$26,$17,$18,$14,$18,$14,$26,$00,$26,$1A,$1A,$1A,$1A,$1A,$26
	.byte $40,$40,$40,$40,$40,$40,$40,$40
LevelData_Screen_Map1_0_six:
	.byte $14,$14,$14,$14,$14,$26,$14,$14,$1A,$1A,$1A,$1A,$1A,$26,$1A,$1A
	.byte $01,$01,$01,$01,$01,$01,$01,$01,$23,$16,$17,$16,$21,$26,$14,$16
	.byte $17,$18,$14,$18,$14,$26,$14,$18,$1A,$1A,$1A,$1A,$1A,$26,$1A,$1A
	.byte $40,$40,$40,$40,$40,$40,$40,$40
LevelData_Screen_Map1_0_seven:
	.byte $2B,$14,$2B,$14,$14,$14,$14,$26,$1A,$1A,$1A,$1A,$14,$2B,$14,$26
	.byte $01,$01,$02,$0A,$21,$14,$2B,$26,$14,$16,$17,$04,$1D,$14,$1A,$26
	.byte $14,$18,$14,$17,$04,$1D,$07,$40,$1A,$1A,$1A,$07,$40,$40,$40,$40
	.byte $40,$40,$40,$40,$40,$40,$40,$40
LevelData_Screen_Map1_0_eight:
	.byte $17,$01,$01,$01,$01,$01,$01,$01,$14,$14,$18,$14,$18,$14,$17,$07
	.byte $1A,$1A,$1A,$1A,$1A,$1A,$1A,$07,$07,$40,$40,$40,$40,$40,$40,$40
	.byte $40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40
	.byte $40,$40,$40,$40,$40,$40,$40,$40
LevelData_Screen_Map1_1_six:
	.byte $01,$01,$01,$21,$2B,$2B,$14,$07,$06,$21,$1A,$1A,$01,$1A,$1A,$07
	.byte $06,$1A,$17,$01,$01,$01,$01,$01,$06,$01,$1A,$17,$14,$26,$17,$07
	.byte $01,$01,$01,$1A,$2B,$26,$14,$07,$06,$21,$17,$01,$1A,$26,$2B,$07
	.byte $06,$14,$2B,$17,$01,$26,$14,$07
LevelData_Screen_Map1_1_seven:
	.byte $06,$1E,$2B,$1E,$14,$1E,$17,$07,$06,$1A,$1A,$1A,$1A,$1A,$1A,$07
	.byte $06,$17,$01,$01,$01,$01,$01,$01,$06,$14,$2B,$17,$16,$14,$16,$07
	.byte $06,$1A,$1A,$2B,$18,$2B,$18,$07,$01,$01,$01,$21,$2B,$14,$14,$07
	.byte $06,$14,$14,$14,$14,$14,$1A,$07
LevelData_Screen_Map1_1_eight:
	.byte $06,$2B,$2B,$14,$17,$3F,$21,$07,$06,$1E,$14,$1E,$14,$26,$3F,$17
	.byte $06,$2C,$2B,$2C,$14,$26,$01,$01,$06,$2B,$2B,$14,$17,$01,$21,$14
	.byte $06,$1A,$1A,$1A,$14,$26,$14,$2B,$40,$40,$40,$40,$24,$26,$1A,$1A
	.byte $40,$40,$40,$40,$40,$36,$36,$36
LevelData_Screen_Map1_1_nine:
	.byte $01,$01,$01,$01,$01,$01,$01,$01,$1E,$1A,$1E,$1A,$1E,$26,$1E,$25
	.byte $01,$01,$01,$01,$01,$01,$01,$01,$1E,$21,$1E,$21,$1E,$26,$1E,$21
	.byte $14,$2B,$14,$1A,$1A,$26,$1A,$1A,$1A,$1A,$25,$40,$40,$40,$40,$40
	.byte $36,$36,$40,$40,$40,$40,$40,$40
LevelData_Screen_Map1_1_ten:
	.byte $06,$14,$14,$07,$1A,$17,$01,$01,$24,$1A,$1A,$07,$01,$21,$1A,$07
	.byte $01,$01,$01,$01,$21,$1A,$01,$01,$2B,$14,$2B,$14,$2B,$01,$17,$07
	.byte $1A,$1A,$1A,$1A,$01,$2B,$14,$07,$40,$40,$40,$06,$1A,$1A,$1A,$00
	.byte $40,$40,$40,$40,$40,$40,$40,$40
LevelData_ScreenNumbers_1_Mansions_1_12_13_14_15_16_17:
	.word (LevelData_ScreenNumbers_1_Mansions_1_12_13_14_15_16_17_8D62) ;8D62 (8D62) ()
	.byte $00,$FF,$02,$01,$FF,$02,$04
	.word (LevelData_ScreenNumbers_1_Mansions_1_0_12_0_13_0_14_0_15_0_16_0_17_0) ;8D61 (8D61) ()
LevelData_ScreenNumbers_1_Mansions_7berkeley:
	.word (LevelData_ScreenNumbers_1_Mansions_7berkeley_8D63) ;8D63 (8D63) ()
	.byte $01,$FB,$01,$00,$FB,$01,$00
	.word (LevelData_ScreenNumbers_1_Mansions_7_0_18_0) ;8D5F (8D5F) ()
	.word (LevelData_ScreenNumbers_1_Mansions_7_1_18_1) ;8D60 (8D60) ()
LevelData_ScreenNumbers_1_Mansions_18:
	.word (LevelData_ScreenNumbers_1_Mansions_7berkeley_8D63) ;8D63 (8D63) ()
	.byte $01,$FB,$01,$00,$FB,$01,$00
	.word (LevelData_ScreenNumbers_1_Mansions_7_0_18_0) ;8D5F (8D5F) ()
	.word (LevelData_ScreenNumbers_1_Mansions_7_1_18_1) ;8D60 (8D60) ()
LevelData_ScreenNumbers_1_Mansions_7_0_18_0:
	.byte $04
LevelData_ScreenNumbers_1_Mansions_7_1_18_1:
	.byte $05
LevelData_ScreenNumbers_1_Mansions_1_0_12_0_13_0_14_0_15_0_16_0_17_0:
	.byte $02
LevelData_ScreenNumbers_1_Mansions_1_12_13_14_15_16_17_8D62:
	.byte $00
LevelData_ScreenNumbers_1_Mansions_7berkeley_8D63:
	.byte $00,$00
LevelData_Palettes_1_Mansions_1berkeleyEntrance_Day_7:
	.byte $0F,$48,$0F,$48
LevelData_Palettes_1_Mansions_1berkeleyEntrance_Night:
	.byte $0D,$48
LevelData_Stairs_1_Mansions_4bodleyEntrance:
	.byte $87,$9A,$13,$8E,$49,$2E,$D5,$3A,$F3,$CA,$7B,$C2,$45,$3A,$D5,$4A
	.byte $FF
LevelData_Stairs_1_Mansions_5:
	.byte $25,$16,$AD,$1E,$25,$1E,$B1,$2A,$37,$AA,$AB,$B6,$2D,$42,$B5,$4A
	.byte $49,$0A,$D5,$16,$5B,$96,$CF,$A2,$5F,$B2,$D7,$BA,$FF
LevelData_Screens_1_Mansions_4bodleyEntrance_A:
	.byte $04,$03
	.word (LevelData_Screen_Map1_4_one) ;8DDD (8DDD) ([8:4][A:5])
	.word (LevelData_Screen_Map1_4_two) ;8E15 (8E15) ([8:4][A:5])
	.word (LevelData_Screen_Map1_4_three) ;8E4D (8E4D) ([8:4][A:5])
	.word (LevelData_Screen_Map1_4_four) ;8E85 (8E85) ([8:4][A:5])
	.word (LevelData_Screen_Map1_4_five) ;8F65 (8F65) ([8:4][A:5])
	.word (LevelData_Screen_Map1_4_six) ;8F9D (8F9D) ([8:4][A:5])
	.word (LevelData_Screen_Map1_4_seven) ;8FD5 (8FD5) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Map1_4_eight) ;907D (907D) ([8:4][A:5])
	.word (LevelData_Screen_Map1_4_nine) ;90B5 (90B5) ([8:4][A:5])
	.word (LevelData_Screen_Map1_4_ten) ;90ED (90ED) ([8:4][A:5])
	.word (LevelData_Screen_Map1_4_eleven) ;9125 (9125) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
LevelData_Screens_1_Mansions_5_A:
	.byte $04,$03
	.word (LevelData_Screen_Map1_5_one) ;8EBD (8EBD) ([8:4][A:5])
	.word (LevelData_Screen_Map1_5_two) ;8EF5 (8EF5) ([8:4][A:5])
	.word (LevelData_Screen_Map1_5_three) ;8F2D (8F2D) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Map1_5_four) ;900D (900D) ([8:4][A:5])
	.word (LevelData_Screen_Map1_5_five) ;9045 (9045) ([8:4][A:5])
	.word (LevelData_Screen_Map1_5_and_1_7_and_1_12_and_1_14) ;8857 (8857) ([8:4][A:5])
	.word (LevelData_Screen_Map1_5_six) ;915D (915D) ([8:4][A:5])
	.word (LevelData_Screen_Map1_5_seven) ;9195 (9195) ([8:4][A:5])
	.word (LevelData_Screen_Map1_5_eight) ;91CD (91CD) ([8:4][A:5])
	.word (LevelData_Screen_Map1_5_nine) ;9205 (9205) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
LevelData_Screen_Map1_4_one:
	.byte $01,$01,$01,$01,$01,$01,$01,$01,$06,$26,$21,$1F,$17,$1F,$14,$1F
	.byte $06,$26,$14,$1F,$2B,$1F,$14,$1F,$06,$26,$2B,$12,$14,$12,$2B,$12
	.byte $06,$26,$14,$0B,$03,$01,$01,$01,$06,$26,$1C,$05,$22,$2B,$14,$2B
	.byte $06,$20,$05,$24,$1A,$1A,$1A,$1A
LevelData_Screen_Map1_4_two:
	.byte $01,$01,$01,$01,$01,$01,$01,$01,$21,$1F,$26,$1F,$17,$1F,$26,$1F
	.byte $2B,$1F,$26,$1F,$14,$1F,$26,$1F,$14,$12,$26,$12,$2B,$12,$26,$12
	.byte $01,$01,$01,$01,$01,$01,$01,$01,$21,$2B,$26,$2B,$21,$14,$26,$2B
	.byte $1A,$1A,$26,$1A,$1A,$1A,$26,$1A
LevelData_Screen_Map1_4_three:
	.byte $01,$01,$01,$01,$01,$01,$01,$01,$14,$1F,$26,$1F,$21,$1F,$26,$21
	.byte $14,$1F,$26,$1F,$2B,$1F,$26,$1A,$2B,$12,$26,$12,$2B,$12,$3B,$01
	.byte $01,$01,$01,$01,$01,$01,$26,$14,$2B,$17,$26,$14,$2B,$17,$26,$1A
	.byte $1A,$1A,$26,$1A,$1A,$1A,$26,$07
LevelData_Screen_Map1_4_four:
	.byte $01,$01,$01,$01,$01,$01,$01,$01,$17,$18,$26,$18,$21,$18,$26,$18
	.byte $1A,$1A,$26,$1A,$1A,$1A,$26,$1A,$01,$01,$01,$01,$01,$01,$01,$01
	.byte $17,$1E,$26,$1E,$21,$1E,$26,$40,$1A,$1A,$26,$1A,$1A,$1A,$26,$0E
	.byte $40,$36,$40,$36,$40,$36,$40,$40
LevelData_Screen_Map1_5_one:
	.byte $01,$01,$01,$01,$01,$01,$01,$01,$21,$18,$26,$18,$17,$18,$26,$18
	.byte $1A,$1A,$26,$1A,$1A,$1A,$26,$1A,$01,$01,$01,$01,$01,$01,$01,$01
	.byte $40,$21,$26,$1E,$21,$1E,$26,$1E,$0F,$1A,$26,$1A,$1A,$1A,$26,$1A
	.byte $40,$40,$36,$01,$36,$01,$36,$01
LevelData_Screen_Map1_5_two:
	.byte $01,$01,$01,$01,$01,$01,$01,$01,$14,$14,$26,$14,$14,$14,$26,$14
	.byte $1A,$1A,$26,$1A,$1A,$1A,$26,$1A,$01,$01,$01,$01,$01,$01,$01,$01
	.byte $14,$14,$26,$14,$06,$21,$26,$14,$1A,$1A,$26,$25,$06,$1A,$26,$1A
	.byte $01,$02,$0A,$00,$01,$01,$01,$01
LevelData_Screen_Map1_5_three:
	.byte $01,$01,$01,$01,$01,$01,$01,$01,$14,$14,$26,$14,$14,$14,$17,$07
	.byte $1A,$1A,$26,$1A,$14,$14,$14,$07,$01,$01,$02,$0A,$21,$14,$14,$07
	.byte $14,$14,$26,$04,$1D,$14,$14,$07,$1A,$1A,$26,$25,$04,$1D,$14,$07
	.byte $01,$01,$01,$01,$01,$0B,$03,$01
LevelData_Screen_Map1_4_five:
	.byte $01,$01,$01,$00,$00,$01,$01,$01,$06,$26,$21,$1F,$01,$1F,$17,$1F
	.byte $06,$26,$01,$1F,$14,$1F,$2B,$1F,$06,$26,$14,$12,$01,$12,$14,$12
	.byte $06,$26,$01,$1A,$1A,$1A,$1A,$1A,$01,$01,$01,$01,$01,$01,$01,$01
	.byte $06,$26,$21,$14,$17,$12,$2B,$12
LevelData_Screen_Map1_4_six:
	.byte $01,$01,$01,$01,$01,$01,$01,$01,$17,$1F,$21,$1F,$17,$1F,$26,$21
	.byte $14,$1F,$2B,$1F,$14,$1F,$26,$2B,$2B,$12,$17,$12,$2B,$12,$26,$14
	.byte $1A,$1A,$1A,$1A,$1A,$1A,$26,$1A,$01,$01,$01,$01,$01,$01,$01,$01
	.byte $2B,$12,$17,$12,$21,$12,$26,$12
LevelData_Screen_Map1_4_seven:
	.byte $01,$01,$01,$01,$01,$01,$01,$01,$21,$1F,$17,$1F,$21,$1F,$26,$07
	.byte $2B,$1F,$14,$1F,$2B,$1F,$26,$07,$14,$12,$2B,$12,$21,$12,$26,$38
	.byte $1A,$1A,$1A,$1A,$1A,$1A,$26,$38,$01,$01,$02,$0A,$01,$01,$01,$01
	.byte $2B,$12,$23,$04,$1D,$12,$26,$38
LevelData_Screen_Map1_5_four:
	.byte $06,$17,$04,$1D,$1A,$17,$26,$14,$40,$02,$0A,$01,$06,$1A,$26,$1A
	.byte $06,$23,$04,$2D,$01,$01,$01,$01,$06,$1A,$25,$04,$1D,$1A,$26,$1A
	.byte $01,$01,$01,$01,$0B,$03,$01,$01,$06,$21,$14,$1C,$05,$22,$26,$21
	.byte $06,$1A,$1C,$05,$22,$14,$26,$2B
LevelData_Screen_Map1_5_five:
	.byte $14,$14,$26,$14,$1C,$05,$22,$07,$1A,$1A,$26,$1C,$05,$24,$1A,$07
	.byte $01,$01,$01,$01,$01,$01,$01,$40,$39,$1A,$26,$1A,$39,$1A,$39,$0E
	.byte $01,$01,$01,$01,$01,$01,$01,$01,$16,$21,$26,$17,$16,$23,$26,$1A
	.byte $18,$2B,$26,$14,$18,$17,$0B,$03
LevelData_Screen_Map1_4_eight:
	.byte $06,$26,$14,$2B,$14,$1A,$1A,$1A,$06,$26,$1E,$14,$17,$01,$01,$01
	.byte $06,$26,$14,$01,$2B,$06,$13,$30,$01,$2F,$21,$2B,$1E,$06,$19,$2E
	.byte $00,$26,$2B,$14,$2B,$06,$00,$31,$00,$26,$1E,$1A,$1A,$01,$01,$01
	.byte $40,$40,$2A,$2A,$2A,$2A,$2A,$2A
LevelData_Screen_Map1_4_nine:
	.byte $1A,$1A,$1A,$1A,$1A,$1A,$26,$1A,$01,$01,$01,$01,$01,$01,$01,$01
	.byte $3F,$16,$2B,$16,$17,$16,$26,$16,$08,$18,$14,$18,$2B,$18,$26,$18
	.byte $08,$1A,$1A,$1A,$1A,$1A,$26,$1A,$00,$01,$01,$01,$01,$01,$01,$01
	.byte $2A,$2A,$2A,$2A,$2A,$2A,$2A,$2A
LevelData_Screen_Map1_4_ten:
	.byte $1A,$1A,$1A,$25,$04,$1D,$26,$38,$01,$02,$0A,$01,$01,$01,$01,$01
	.byte $3F,$17,$04,$1D,$17,$16,$26,$16,$08,$21,$17,$04,$1D,$18,$26,$18
	.byte $08,$1A,$1A,$25,$04,$1D,$26,$1A,$00,$01,$01,$01,$01,$01,$01,$01
	.byte $2A,$2A,$2A,$2A,$2A,$2A,$2A,$2A
LevelData_Screen_Map1_4_eleven:
	.byte $01,$01,$01,$01,$01,$01,$01,$01,$21,$16,$21,$16,$17,$14,$26,$17
	.byte $14,$3E,$14,$3E,$14,$14,$26,$14,$14,$18,$14,$18,$17,$0B,$03,$01
	.byte $1A,$1A,$1A,$1A,$1C,$05,$26,$1A,$01,$01,$01,$01,$01,$01,$01,$01
	.byte $2A,$2A,$2A,$2A,$2A,$2A,$2A,$2A
LevelData_Screen_Map1_5_six:
	.byte $01,$01,$01,$01,$01,$01,$01,$01,$1E,$17,$1E,$22,$1E,$21,$26,$21
	.byte $2C,$14,$2C,$14,$2C,$14,$26,$14,$01,$01,$3B,$01,$01,$01,$3B,$01
	.byte $1A,$1A,$1A,$1A,$1A,$1A,$26,$1A,$01,$01,$01,$01,$01,$01,$01,$01
	.byte $2A,$2A,$2A,$2A,$2A,$2A,$2A,$2A
LevelData_Screen_Map1_5_seven:
	.byte $01,$01,$01,$01,$01,$06,$26,$1A,$1E,$17,$1E,$17,$1E,$01,$01,$01
	.byte $2C,$14,$2C,$14,$2C,$21,$26,$21,$3B,$01,$01,$02,$0A,$21,$26,$17
	.byte $1A,$1A,$1A,$25,$04,$1D,$26,$1A,$01,$01,$01,$01,$01,$01,$01,$01
	.byte $2A,$2A,$2A,$2A,$2A,$2A,$2A,$2A
LevelData_Screen_Map1_5_eight:
	.byte $1A,$1A,$26,$1A,$1A,$1C,$05,$24,$01,$01,$3B,$01,$01,$01,$01,$01
	.byte $22,$23,$21,$23,$17,$23,$26,$21,$21,$2B,$17,$2B,$17,$22,$26,$14
	.byte $1A,$00,$01,$00,$01,$24,$26,$1A,$2F,$00,$1E,$00,$1E,$00,$01,$01
	.byte $2A,$2A,$2A,$2A,$2A,$2A,$2A,$2A
LevelData_Screen_Map1_5_nine:
	.byte $40,$40,$40,$40,$40,$40,$40,$40,$01,$01,$01,$01,$01,$01,$01,$01
	.byte $06,$21,$2B,$14,$14,$17,$26,$07,$32,$2B,$14,$2B,$14,$2B,$26,$07
	.byte $06,$1E,$1A,$1A,$1E,$14,$26,$07,$01,$01,$01,$01,$01,$1A,$26,$07
	.byte $2A,$2A,$2A,$2A,$2A,$2A,$40,$40
LevelData_ScreenNumbers_1_Mansions_8rover:
	.word (LevelData_ScreenNumbers_1_Mansions_2roverEntrance_9260) ;9260 (9260) ()
	.byte $02,$FB,$02,$00,$FB,$02,$00
	.word (LevelData_ScreenNumbers_1_Mansions_8rover_0) ;9255 (9255) ()
	.word (LevelData_ScreenNumbers_1_Mansions_8rover_1) ;9256 (9256) ()
LevelData_ScreenNumbers_1_Mansions_2roverEntrance:
	.word (LevelData_ScreenNumbers_1_Mansions_2roverEntrance_9260) ;9260 (9260) ()
	.byte $00,$FC,$02,$05,$FF,$00,$01
	.word (LevelData_ScreenNumbers_1_Mansions_2roverEntrance_0) ;9257 (9257) ()
LevelData_ScreenNumbers_1_Mansions_8rover_0:
	.byte $06
LevelData_ScreenNumbers_1_Mansions_8rover_1:
	.byte $07
LevelData_ScreenNumbers_1_Mansions_2roverEntrance_0:
	.byte $03
LevelData_Palettes_1_Mansions_2roverEntrance_Day_8:
	.byte $10,$49,$10,$49,$10,$49
LevelData_Palettes_1_Mansions_2roverEntrance_Night:
	.byte $0D,$49
LevelData_ScreenNumbers_1_Mansions_2roverEntrance_9260:
	.byte $00
LevelData_Stairs_1_Mansions_6laruba:
	.byte $05,$12,$91,$1E,$09,$32,$95,$3E,$0D,$3E,$9D,$4E,$4F,$9E,$C3,$AA
	.byte $FF
LevelData_Stairs_1_Mansions_7berkeley:
	.byte $25,$26,$B5,$36,$25,$36,$B1,$42,$AB,$CE,$37,$C2,$C3,$B2,$53,$A2
	.byte $6D,$0E,$F9,$1A,$FF
LevelData_Screens_1_Mansions_6laruba_A:
	.byte $03,$03
	.word (LevelData_Screen_Map1_6_one) ;92C3 (92C3) ([8:4][A:5])
	.word (LevelData_Screen_Map1_6_two) ;92FB (92FB) ([8:4][A:5])
	.word (LevelData_Screen_Map1_6_three) ;9333 (9333) ([8:4][A:5])
	.word (LevelData_Screen_Map1_6_four) ;93DB (93DB) ([8:4][A:5])
	.word (LevelData_Screen_Map1_6_five) ;9413 (9413) ([8:4][A:5])
	.word (LevelData_Screen_Map1_6_six) ;944B (944B) ([8:4][A:5])
	.word (LevelData_Screen_Map1_6_seven) ;94F3 (94F3) ([8:4][A:5])
	.word (LevelData_Screen_Map1_6_eight) ;952B (952B) ([8:4][A:5])
	.word (LevelData_Screen_Map1_6_nine) ;9563 (9563) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
LevelData_Screens_1_Mansions_7berkeley_A:
	.byte $04,$03
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Map1_7_one) ;936B (936B) ([8:4][A:5])
	.word (LevelData_Screen_Map1_7_two) ;93A3 (93A3) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Map1_7_three) ;9483 (9483) ([8:4][A:5])
	.word (LevelData_Screen_Map1_7_four) ;94BB (94BB) ([8:4][A:5])
	.word (LevelData_Screen_Map1_5_and_1_7_and_1_12_and_1_14) ;8857 (8857) ([8:4][A:5])
	.word (LevelData_Screen_Map1_7_five) ;959B (959B) ([8:4][A:5])
	.word (LevelData_Screen_Map1_7_six) ;95D3 (95D3) ([8:4][A:5])
	.word (LevelData_Screen_Map1_7_seven) ;960B (960B) ([8:4][A:5])
	.word (LevelData_Screen_Map1_7_eight) ;9643 (9643) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
LevelData_Screen_Map1_6_one:
	.byte $2A,$2A,$2A,$2A,$2A,$2A,$2A,$2A,$01,$01,$01,$01,$01,$01,$01,$01
	.byte $06,$21,$26,$14,$14,$14,$26,$14,$06,$39,$26,$39,$39,$39,$26,$39
	.byte $06,$39,$26,$39,$39,$39,$26,$39,$01,$02,$0A,$01,$00,$01,$01,$01
	.byte $06,$23,$04,$1D,$17,$14,$1E,$17
LevelData_Screen_Map1_6_two:
	.byte $2A,$2A,$2A,$2A,$2A,$2A,$2A,$2A,$01,$01,$01,$01,$01,$01,$01,$01
	.byte $14,$14,$26,$14,$14,$14,$26,$14,$39,$39,$26,$39,$39,$39,$26,$39
	.byte $39,$39,$26,$39,$39,$39,$26,$39,$01,$0C,$0C,$0C,$0C,$0C,$01,$00
	.byte $1E,$21,$1E,$17,$1E,$21,$00,$21
LevelData_Screen_Map1_6_three:
	.byte $2A,$2A,$2A,$2A,$2A,$2A,$2A,$2A,$01,$01,$01,$01,$01,$01,$01,$01
	.byte $14,$14,$26,$14,$17,$30,$13,$40,$39,$39,$26,$39,$39,$30,$13,$40
	.byte $39,$39,$26,$39,$39,$30,$13,$40,$01,$00,$01,$00,$01,$30,$01,$40
	.byte $2B,$14,$2B,$17,$07,$30,$13,$40
LevelData_Screen_Map1_7_one:
	.byte $40,$2A,$2A,$2A,$2A,$2A,$2A,$2A,$01,$01,$01,$01,$01,$01,$01,$01
	.byte $06,$21,$26,$14,$2B,$17,$26,$14,$06,$1E,$26,$1E,$1A,$1E,$26,$1E
	.byte $01,$00,$01,$01,$01,$01,$01,$01,$06,$2F,$06,$21,$2B,$17,$26,$21
	.byte $01,$00,$06,$1E,$1A,$1E,$26,$1E
LevelData_Screen_Map1_7_two:
	.byte $40,$2A,$2A,$2A,$2A,$2A,$2A,$2A,$01,$01,$01,$01,$01,$01,$01,$01
	.byte $2B,$17,$26,$21,$2B,$17,$26,$40,$1A,$1E,$26,$1E,$1A,$1E,$26,$0E
	.byte $01,$01,$01,$02,$0A,$01,$01,$40,$2B,$17,$26,$23,$04,$1D,$17,$40
	.byte $1A,$1E,$26,$1E,$25,$04,$1D,$40
LevelData_Screen_Map1_6_four:
	.byte $06,$1A,$25,$04,$1D,$38,$37,$1A,$01,$01,$01,$01,$01,$01,$01,$01
	.byte $06,$21,$26,$3E,$17,$18,$26,$18,$06,$14,$26,$3E,$2B,$1A,$26,$1A
	.byte $06,$2B,$26,$18,$1A,$01,$01,$01,$06,$1A,$26,$1A,$01,$21,$26,$16
	.byte $01,$01,$02,$0A,$21,$14,$26,$3E
LevelData_Screen_Map1_6_five:
	.byte $1A,$38,$37,$1A,$1A,$38,$37,$1A,$01,$01,$01,$01,$01,$01,$01,$01
	.byte $14,$18,$26,$18,$21,$18,$26,$18,$1A,$1A,$26,$1A,$1A,$1A,$26,$1A
	.byte $01,$01,$01,$01,$01,$01,$01,$01,$21,$16,$26,$16,$17,$16,$26,$16
	.byte $2B,$3E,$26,$3E,$2B,$3E,$26,$3E
LevelData_Screen_Map1_6_six:
	.byte $1A,$1A,$1A,$1A,$07,$01,$13,$40,$01,$01,$0B,$03,$01,$30,$13,$40
	.byte $14,$1C,$05,$22,$33,$2E,$19,$40,$1C,$05,$24,$1A,$07,$31,$00,$40
	.byte $01,$01,$01,$01,$01,$00,$01,$40,$14,$14,$2B,$14,$14,$14,$14,$40
	.byte $2B,$14,$14,$14,$16,$01,$01,$01
LevelData_Screen_Map1_7_three:
	.byte $01,$01,$01,$01,$01,$01,$01,$01,$06,$21,$14,$14,$2B,$14,$2B,$23
	.byte $06,$14,$2B,$14,$14,$2B,$14,$14,$01,$02,$0A,$01,$22,$14,$14,$2B
	.byte $06,$23,$04,$2D,$01,$01,$22,$14,$06,$14,$23,$04,$1D,$14,$01,$01
	.byte $06,$2B,$14,$23,$04,$1D,$14,$07
LevelData_Screen_Map1_7_four:
	.byte $06,$2F,$01,$01,$01,$01,$3F,$00,$01,$24,$1A,$1A,$1A,$07,$00,$01
	.byte $17,$2F,$01,$0B,$03,$01,$3F,$07,$2B,$14,$1C,$05,$22,$07,$00,$01
	.byte $14,$1C,$05,$22,$14,$07,$3F,$07,$1C,$05,$24,$1A,$1A,$07,$2F,$00
	.byte $40,$40,$40,$40,$40,$40,$40,$40
LevelData_Screen_Map1_6_seven:
	.byte $06,$21,$26,$04,$1D,$14,$26,$18,$06,$1A,$26,$25,$04,$1D,$26,$1A
	.byte $01,$01,$01,$02,$0A,$01,$01,$01,$00,$1E,$26,$23,$04,$1D,$14,$1E
	.byte $00,$39,$26,$14,$23,$04,$1D,$39,$00,$1A,$26,$1A,$1A,$25,$04,$1D
	.byte $40,$40,$40,$40,$40,$40,$40,$40
LevelData_Screen_Map1_6_eight:
	.byte $14,$18,$26,$18,$2B,$18,$26,$18,$1A,$1A,$26,$1A,$1A,$1A,$26,$1A
	.byte $01,$01,$01,$01,$01,$01,$01,$01,$17,$1E,$26,$1E,$21,$1E,$26,$1E
	.byte $2B,$39,$26,$39,$2B,$39,$26,$39,$1A,$1A,$26,$1A,$1A,$1A,$26,$1A
	.byte $40,$40,$40,$40,$40,$40,$40,$40
LevelData_Screen_Map1_6_nine:
	.byte $14,$2B,$16,$01,$3E,$14,$16,$07,$1A,$01,$3E,$14,$3E,$2B,$3E,$07
	.byte $01,$21,$3E,$2B,$18,$21,$18,$07,$21,$14,$18,$17,$01,$01,$01,$01
	.byte $14,$2B,$1A,$39,$32,$39,$39,$39,$1A,$1A,$40,$39,$32,$39,$39,$39
	.byte $40,$2A,$40,$2A,$40,$2A,$40,$40
LevelData_Screen_Map1_7_five:
	.byte $01,$01,$01,$01,$01,$01,$01,$01,$06,$16,$14,$3E,$2B,$16,$2B,$14
	.byte $06,$3E,$21,$18,$14,$3E,$14,$1A,$3F,$18,$2B,$14,$17,$18,$17,$01
	.byte $39,$39,$39,$17,$39,$39,$14,$2B,$39,$39,$39,$1A,$39,$39,$1A,$1A
	.byte $40,$40,$2A,$40,$2A,$40,$2A,$40
LevelData_Screen_Map1_7_six:
	.byte $01,$02,$0A,$01,$01,$01,$21,$07,$17,$23,$04,$1D,$17,$14,$2B,$07
	.byte $1A,$1E,$25,$04,$1D,$1E,$1A,$07,$01,$01,$01,$01,$0B,$03,$01,$01
	.byte $14,$2B,$14,$1C,$05,$22,$14,$14,$1A,$1E,$1C,$05,$24,$1E,$1A,$1A
	.byte $40,$40,$40,$40,$40,$40,$40,$40
LevelData_Screen_Map1_7_seven:
	.byte $06,$00,$00,$00,$00,$00,$00,$00,$06,$21,$2B,$14,$14,$14,$1A,$1A
	.byte $06,$2B,$14,$39,$1A,$17,$01,$01,$3F,$39,$2B,$17,$01,$21,$2B,$17
	.byte $14,$14,$1A,$1A,$1A,$1A,$39,$2B,$1A,$25,$01,$01,$01,$01,$24,$1A
	.byte $40,$2A,$2A,$2A,$2A,$2A,$2A,$40
LevelData_Screen_Map1_7_eight:
	.byte $00,$00,$00,$00,$00,$00,$00,$40,$14,$1E,$14,$1E,$14,$1E,$17,$40
	.byte $1A,$39,$1A,$39,$1A,$39,$1A,$0E,$01,$3B,$01,$3B,$01,$3B,$01,$01
	.byte $14,$1E,$14,$1E,$14,$1E,$17,$40,$1A,$39,$1A,$39,$1A,$39,$1A,$40
	.byte $40,$36,$40,$36,$40,$36,$40,$40
LevelData_ScreenNumbers_1_Mansions_3brahmEntrance:
	.word (LevelData_ScreenNumbers_1_Mansions_3brahmEntrance_969C) ;969C (969C) ()
	.byte $00,$FF,$04,$00,$FF,$02,$06
	.word (LevelData_ScreenNumbers_1_Mansions_3brahmEntrance_0) ;9697 (9697) ()
LevelData_ScreenNumbers_1_Mansions_9brahm:
	.word (LevelData_ScreenNumbers_1_Mansions_3brahmEntrance_969C) ;969C (969C) ()
	.byte $03,$FB,$03,$00,$FB,$03,$00
	.word (LevelData_ScreenNumbers_1_Mansions_9brahm_0) ;9698 (9698) ()
	.word (LevelData_ScreenNumbers_1_Mansions_9brahm_1) ;9699 (9699) ()
	.word (LevelData_ScreenNumbers_1_Mansions_9brahm_2) ;969A (969A) ()
	.word (LevelData_ScreenNumbers_1_Mansions_9brahm_3) ;969B (969B) ()
LevelData_ScreenNumbers_1_Mansions_3brahmEntrance_0:
	.byte $02
LevelData_ScreenNumbers_1_Mansions_9brahm_0:
	.byte $08
LevelData_ScreenNumbers_1_Mansions_9brahm_1:
	.byte $0A
LevelData_ScreenNumbers_1_Mansions_9brahm_2:
	.byte $0B
LevelData_ScreenNumbers_1_Mansions_9brahm_3:
	.byte $0C
LevelData_ScreenNumbers_1_Mansions_3brahmEntrance_969C:
	.byte $00,$FD,$00
LevelData_Palettes_1_Mansions_3brahmEntrance_Day_9:
	.byte $11,$4A,$11,$4A,$11,$4A,$11,$4A
LevelData_Palettes_1_Mansions_3brahmEntrance_Night:
	.byte $0D,$4A
LevelData_Stairs_1_Mansions_8rover:
	.byte $09,$2A,$99,$3A,$13,$BA,$87,$C6,$3B,$8E,$AF,$9A,$25,$1A,$B5,$2A
	.byte $33,$C6,$A7,$D2,$2D,$52,$B9,$5E,$2D,$5E,$B9,$6A,$4B,$A2,$45,$3E
	.byte $D1,$4A,$55,$22,$DD,$2A,$5B,$CA,$C7,$DE,$5B,$DE,$CF,$EA,$FF
LevelData_Stairs_1_Mansions_9_10:
	.byte $1B,$96,$87,$AA,$FF
LevelData_Screens_1_Mansions_8rover_A:
	.byte $03,$04
	.word (LevelData_Screen_Map1_8_one) ;9709 (9709) ([8:4][A:5])
	.word (LevelData_Screen_Map1_8_two) ;9741 (9741) ([8:4][A:5])
	.word (LevelData_Screen_Map1_8_three) ;9779 (9779) ([8:4][A:5])
	.word (LevelData_Screen_Map1_8_four) ;97E9 (97E9) ([8:4][A:5])
	.word (LevelData_Screen_Map1_8_five) ;9821 (9821) ([8:4][A:5])
	.word (LevelData_Screen_Map1_8_six) ;9859 (9859) ([8:4][A:5])
	.word (LevelData_Screen_Map1_8_seven) ;98C9 (98C9) ([8:4][A:5])
	.word (LevelData_Screen_Map1_8_eight) ;9901 (9901) ([8:4][A:5])
	.word (LevelData_Screen_Map1_8_nine) ;9939 (9939) ([8:4][A:5])
	.word (LevelData_Screen_Map1_8_ten) ;9971 (9971) ([8:4][A:5])
	.word (LevelData_Screen_Map1_8_eleven) ;99A9 (99A9) ([8:4][A:5])
	.word (LevelData_Screen_Map1_8_twelve) ;99E1 (99E1) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
LevelData_Screens_1_Mansions_9_10_A:
	.byte $01,$04
	.word (LevelData_Screen_Map1_9_10_one) ;97B1 (97B1) ([8:4][A:5])
	.word (LevelData_Screen_Map1_9_10_two) ;9891 (9891) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Map1_9_10_three) ;9A19 (9A19) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
LevelData_Screen_Map1_8_one:
	.byte $01,$01,$01,$01,$01,$01,$01,$01,$06,$21,$16,$14,$16,$17,$16,$07
	.byte $06,$2B,$3E,$17,$18,$2B,$18,$07,$06,$14,$3E,$2B,$1A,$1A,$1A,$00
	.byte $06,$17,$18,$2B,$07,$01,$01,$01,$06,$1A,$1A,$1A,$33,$22,$17,$07
	.byte $06,$01,$01,$01,$01,$22,$14,$07
LevelData_Screen_Map1_8_two:
	.byte $01,$01,$01,$01,$01,$01,$01,$01,$06,$21,$16,$22,$16,$21,$16,$17
	.byte $06,$2B,$18,$14,$18,$2B,$18,$2B,$00,$1A,$1A,$1A,$1A,$1A,$1A,$1A
	.byte $01,$01,$01,$01,$01,$0B,$03,$01,$06,$21,$39,$14,$1C,$05,$22,$07
	.byte $06,$1A,$1A,$1C,$05,$24,$1A,$07
LevelData_Screen_Map1_8_three:
	.byte $01,$01,$01,$01,$01,$01,$01,$01,$23,$16,$21,$16,$21,$16,$17,$07
	.byte $14,$18,$2B,$18,$2B,$18,$14,$07,$1A,$1A,$1A,$1A,$1A,$1A,$1A,$00
	.byte $01,$01,$01,$01,$01,$01,$01,$01,$06,$21,$14,$2B,$14,$2B,$17,$07
	.byte $40,$14,$2B,$2B,$14,$14,$2B,$07
LevelData_Screen_Map1_9_10_one:
	.byte $01,$01,$01,$01,$01,$01,$01,$01,$06,$21,$14,$39,$39,$14,$17,$07
	.byte $06,$14,$2B,$14,$2B,$39,$14,$07,$00,$14,$39,$39,$21,$2B,$14,$07
	.byte $01,$21,$39,$01,$01,$01,$39,$07,$06,$01,$22,$39,$2B,$39,$39,$07
	.byte $06,$21,$01,$01,$01,$0B,$03,$01
LevelData_Screen_Map1_8_four:
	.byte $0F,$22,$14,$2B,$14,$2B,$14,$07,$01,$01,$16,$17,$16,$14,$16,$07
	.byte $06,$2B,$18,$2B,$18,$21,$18,$07,$06,$1A,$1A,$1A,$1A,$1A,$1A,$00
	.byte $01,$01,$02,$0A,$01,$01,$01,$01,$06,$21,$23,$04,$1D,$1E,$17,$07
	.byte $06,$14,$1E,$23,$04,$1D,$14,$07
LevelData_Screen_Map1_8_five:
	.byte $01,$02,$0A,$01,$01,$01,$01,$01,$06,$23,$04,$1D,$14,$14,$17,$07
	.byte $06,$21,$23,$04,$1D,$14,$39,$07,$00,$1A,$1A,$25,$04,$1D,$1A,$07
	.byte $01,$01,$01,$01,$01,$01,$01,$01,$06,$21,$14,$2B,$14,$21,$17,$07
	.byte $06,$14,$2B,$14,$2B,$14,$2B,$07
LevelData_Screen_Map1_8_six:
	.byte $01,$01,$01,$14,$2B,$1E,$14,$07,$06,$21,$1E,$01,$14,$39,$17,$07
	.byte $06,$17,$39,$21,$01,$02,$1D,$07,$06,$1A,$14,$17,$1E,$23,$04,$2D
	.byte $06,$01,$1E,$1A,$1A,$01,$01,$01,$06,$1A,$17,$01,$01,$21,$1E,$07
	.byte $01,$01,$1A,$1E,$1A,$14,$14,$07
LevelData_Screen_Map1_9_10_two:
	.byte $06,$2B,$1E,$14,$1C,$05,$22,$07,$06,$14,$2B,$1C,$05,$22,$2B,$07
	.byte $06,$1E,$1C,$05,$22,$1E,$2B,$07,$00,$1C,$05,$24,$1A,$1A,$1A,$07
	.byte $40,$40,$40,$36,$40,$36,$3F,$0E,$40,$40,$40,$40,$40,$40,$40,$40
	.byte $40,$40,$40,$40,$40,$40,$40,$40
LevelData_Screen_Map1_8_seven:
	.byte $06,$14,$1A,$1A,$25,$04,$1D,$07,$06,$17,$01,$0B,$03,$01,$01,$01
	.byte $06,$21,$1C,$05,$22,$18,$14,$07,$06,$1C,$05,$24,$1A,$1A,$1A,$00
	.byte $01,$01,$01,$01,$01,$01,$01,$01,$06,$26,$21,$18,$21,$18,$17,$07
	.byte $06,$26,$14,$1A,$1A,$1A,$1A,$07
LevelData_Screen_Map1_8_eight:
	.byte $06,$1E,$1A,$1E,$14,$14,$1E,$07,$01,$01,$01,$01,$21,$17,$01,$07
	.byte $06,$21,$21,$14,$01,$21,$17,$07,$00,$1A,$1A,$1A,$1A,$1A,$01,$07
	.byte $01,$01,$01,$0B,$03,$01,$01,$01,$06,$21,$1C,$05,$22,$14,$17,$07
	.byte $06,$1C,$05,$24,$1A,$1A,$14,$07
LevelData_Screen_Map1_8_nine:
	.byte $06,$21,$17,$01,$01,$21,$1A,$07,$06,$1A,$1E,$1A,$1A,$1A,$01,$01
	.byte $01,$02,$0A,$01,$01,$01,$21,$07,$06,$00,$04,$1D,$14,$1E,$14,$07
	.byte $01,$06,$00,$04,$1D,$1A,$1A,$07,$06,$01,$01,$01,$01,$0B,$03,$01
	.byte $06,$14,$14,$14,$1C,$05,$22,$07
LevelData_Screen_Map1_8_ten:
	.byte $06,$26,$17,$01,$01,$01,$01,$01,$01,$01,$21,$18,$21,$18,$17,$07
	.byte $06,$26,$01,$1A,$1A,$1A,$1A,$07,$01,$01,$01,$01,$3B,$01,$3F,$00
	.byte $00,$26,$1E,$00,$1E,$00,$1E,$01,$00,$26,$39,$00,$39,$00,$39,$00
	.byte $40,$40,$36,$01,$36,$01,$36,$40
LevelData_Screen_Map1_8_eleven:
	.byte $01,$01,$01,$02,$0A,$01,$21,$07,$06,$21,$14,$23,$04,$1D,$14,$07
	.byte $06,$1A,$1A,$1A,$25,$04,$1D,$07,$00,$2F,$01,$02,$0A,$01,$01,$01
	.byte $01,$1E,$00,$1E,$04,$2D,$00,$07,$00,$39,$00,$39,$00,$04,$2D,$07
	.byte $40,$36,$01,$36,$40,$40,$40,$40
LevelData_Screen_Map1_8_twelve:
	.byte $06,$14,$1E,$1C,$05,$22,$14,$07,$06,$14,$1C,$05,$22,$14,$14,$07
	.byte $06,$1C,$05,$24,$1A,$1E,$1A,$07,$01,$01,$01,$01,$01,$0B,$03,$01
	.byte $06,$21,$14,$14,$1C,$05,$22,$07,$06,$1E,$1A,$1C,$05,$24,$1E,$00
	.byte $40,$40,$40,$40,$40,$40,$40,$40
LevelData_Screen_Map1_9_10_three:
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$01,$01,$01,$01,$01,$01,$01,$01
	.byte $06,$21,$2B,$14,$2B,$14,$17,$07,$00,$1A,$1E,$1A,$1A,$1E,$1A,$00
	.byte $40,$40,$40,$40,$40,$40,$40,$40
LevelData_ScreenNumbers_1_Mansions_4bodleyEntrance:
	.word (LevelData_ScreenNumbers_1_Mansions_4bodleyEntrance_9A6C) ;9A6C (9A6C) ()
	.byte $00,$FF,$03,$03,$FF,$04,$02
	.word (LevelData_ScreenNumbers_1_Mansions_4bodleyEntrance_0) ;9A69 (9A69) ()
LevelData_ScreenNumbers_1_Mansions_Abodley:
	.word (LevelData_ScreenNumbers_1_Mansions_4bodleyEntrance_9A6C) ;9A6C (9A6C) ()
	.byte $01,$FB,$04,$00,$FB,$04,$00
	.word (LevelData_ScreenNumbers_1_Mansions_Abodley_0) ;9A6A (9A6A) ()
	.word (LevelData_ScreenNumbers_1_Mansions_Abodley_1) ;9A6B (9A6B) ()
LevelData_ScreenNumbers_1_Mansions_4bodleyEntrance_0:
	.byte $02
LevelData_ScreenNumbers_1_Mansions_Abodley_0:
	.byte $0D
LevelData_ScreenNumbers_1_Mansions_Abodley_1:
	.byte $0E
LevelData_ScreenNumbers_1_Mansions_4bodleyEntrance_9A6C:
	.byte $00
LevelData_Palettes_1_Mansions_4bodleyEntrance_Day_10:
	.byte $13,$4B,$13,$4B
LevelData_Palettes_1_Mansions_4bodleyEntrance_Night:
	.byte $0D,$4B
LevelData_Stairs_1_Mansions_13:
	.byte $33,$96,$A7,$A2,$3B,$A2,$AB,$B2,$3B,$B2,$AF,$BE,$25,$3E,$B5,$4E
	.byte $41,$0E,$C9,$16,$6D,$3E,$F9,$4A,$FF
LevelData_Stairs_1_Mansions_14:
	.byte $0D,$32,$99,$3E,$09,$4E,$91,$56,$17,$D6,$87,$E6,$1B,$DE,$8F,$EA
	.byte $7B,$A6,$EF,$B2,$69,$32,$F5,$3E,$6D,$3E,$F9,$4A,$FF
LevelData_Screens_1_Mansions_13_A:
	.byte $04,$03
	.word (LevelData_Screen_Map1_13_one) ;9AF5 (9AF5) ([8:4][A:5])
	.word (LevelData_Screen_Map1_13_two) ;9B2D (9B2D) ([8:4][A:5])
	.word (LevelData_Screen_Map1_13_three) ;9B65 (9B65) ([8:4][A:5])
	.word (LevelData_Screen_Map1_13_four) ;9B9D (9B9D) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Map1_13_five) ;9C0D (9C0D) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Map1_13_six) ;9D25 (9D25) ([8:4][A:5])
	.word (LevelData_Screen_Map1_13_seven) ;9D5D (9D5D) ([8:4][A:5])
	.word (LevelData_Screen_Map1_13_eight) ;9D95 (9D95) ([8:4][A:5])
	.word (LevelData_Screen_Map1_13_nine) ;9DCD (9DCD) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
LevelData_Screens_1_Mansions_14_A:
	.byte $04,$04
	.word (LevelData_Screen_Map1_14_one) ;9BD5 (9BD5) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Map1_14_two) ;9C45 (9C45) ([8:4][A:5])
	.word (LevelData_Screen_Map1_14_three) ;9C7D (9C7D) ([8:4][A:5])
	.word (LevelData_Screen_Map1_14_four) ;9CB5 (9CB5) ([8:4][A:5])
	.word (LevelData_Screen_Map1_14_five) ;9CED (9CED) ([8:4][A:5])
	.word (LevelData_Screen_Map1_14_six) ;9E05 (9E05) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Map1_14_seven) ;9E3D (9E3D) ([8:4][A:5])
	.word (LevelData_Screen_Map1_14_eight) ;9E75 (9E75) ([8:4][A:5])
	.word (LevelData_Screen_Map1_14_nine) ;9EAD (9EAD) ([8:4][A:5])
	.word (LevelData_Screen_Map1_5_and_1_7_and_1_12_and_1_14) ;8857 (8857) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
LevelData_Screen_Map1_13_one:
	.byte $01,$01,$01,$01,$01,$01,$01,$01,$06,$21,$26,$21,$16,$17,$26,$39
	.byte $06,$39,$26,$39,$3E,$2B,$26,$39,$06,$21,$26,$39,$3E,$14,$26,$39
	.byte $06,$2B,$26,$39,$18,$39,$26,$21,$06,$39,$26,$39,$39,$1A,$26,$1A
	.byte $01,$01,$01,$01,$01,$01,$01,$01
LevelData_Screen_Map1_13_two:
	.byte $01,$01,$01,$01,$01,$01,$01,$01,$16,$21,$16,$17,$16,$14,$16,$21
	.byte $3E,$14,$3E,$2B,$3E,$17,$18,$14,$18,$2B,$18,$21,$18,$2B,$14,$1A
	.byte $2B,$14,$2B,$14,$14,$2B,$1A,$07,$1A,$1A,$1A,$1A,$1A,$1A,$07,$40
	.byte $01,$01,$01,$0B,$03,$01,$01,$40
LevelData_Screen_Map1_13_three:
	.byte $01,$01,$01,$01,$01,$01,$01,$01,$16,$21,$16,$17,$16,$21,$16,$14
	.byte $18,$14,$18,$14,$18,$2B,$18,$2B,$1A,$1A,$1A,$1A,$01,$01,$1A,$1A
	.byte $02,$0A,$01,$00,$00,$00,$00,$01,$00,$04,$2D,$1E,$00,$00,$1E,$00
	.byte $40,$40,$40,$36,$40,$40,$36,$40
LevelData_Screen_Map1_13_four:
	.byte $01,$01,$01,$01,$01,$01,$01,$01,$16,$21,$16,$26,$16,$17,$16,$33
	.byte $18,$2B,$18,$26,$18,$14,$18,$07,$1A,$01,$01,$01,$01,$01,$01,$01
	.byte $06,$1A,$2B,$26,$14,$2B,$17,$07,$40,$06,$1A,$26,$1A,$1A,$1A,$07
	.byte $40,$40,$40,$40,$40,$40,$40,$40
LevelData_Screen_Map1_14_one:
	.byte $01,$01,$01,$01,$01,$01,$01,$01,$32,$21,$18,$14,$17,$18,$17,$07
	.byte $06,$1A,$1A,$1A,$1A,$1A,$14,$07,$01,$01,$01,$01,$01,$01,$21,$07
	.byte $06,$21,$1E,$21,$22,$1E,$17,$07,$06,$14,$39,$1A,$1A,$39,$1A,$07
	.byte $06,$17,$01,$01,$01,$01,$01,$40
LevelData_Screen_Map1_13_five:
	.byte $06,$21,$1C,$05,$22,$2B,$17,$07,$06,$1C,$05,$24,$1A,$1A,$1A,$07
	.byte $01,$01,$01,$3B,$01,$0B,$03,$01,$06,$21,$2B,$14,$1C,$05,$22,$07
	.byte $06,$2B,$14,$1C,$05,$22,$2B,$07,$06,$1A,$1C,$05,$24,$1A,$1A,$07
	.byte $01,$3B,$01,$01,$01,$0B,$03,$01
LevelData_Screen_Map1_14_two:
	.byte $06,$14,$39,$39,$39,$21,$17,$01,$06,$14,$2C,$39,$2C,$39,$39,$14
	.byte $06,$1A,$1A,$1A,$1A,$1A,$1A,$1A,$01,$01,$01,$01,$01,$01,$01,$01
	.byte $06,$21,$18,$21,$18,$17,$18,$17,$06,$1A,$1A,$1A,$1A,$1A,$1A,$1A
	.byte $40,$01,$01,$02,$0A,$01,$01,$01
LevelData_Screen_Map1_14_three:
	.byte $01,$01,$01,$01,$01,$01,$01,$40,$14,$14,$17,$07,$06,$21,$17,$07
	.byte $14,$23,$39,$07,$06,$14,$14,$07,$1A,$39,$39,$09,$08,$21,$39,$07
	.byte $01,$01,$01,$01,$3F,$39,$39,$07,$39,$39,$39,$09,$08,$1A,$1A,$00
	.byte $01,$01,$01,$01,$01,$01,$01,$01
LevelData_Screen_Map1_14_four:
	.byte $40,$01,$01,$01,$01,$01,$01,$01,$06,$13,$2E,$13,$13,$13,$21,$14
	.byte $06,$13,$31,$13,$19,$13,$1A,$1A,$06,$19,$13,$19,$00,$19,$0E,$01
	.byte $06,$21,$19,$39,$39,$01,$01,$21,$00,$1A,$1E,$39,$39,$39,$39,$1A
	.byte $01,$01,$36,$01,$01,$01,$01,$01
LevelData_Screen_Map1_14_five:
	.byte $01,$01,$01,$01,$01,$01,$01,$01,$17,$26,$39,$21,$17,$26,$17,$07
	.byte $1A,$26,$1A,$39,$39,$26,$1A,$07,$01,$01,$01,$01,$01,$0B,$03,$01
	.byte $17,$26,$39,$14,$1C,$05,$22,$07,$1A,$26,$1A,$1C,$05,$26,$14,$07
	.byte $01,$01,$02,$0A,$01,$01,$21,$07
LevelData_Screen_Map1_13_six:
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $01,$01,$01,$01,$01,$01,$01,$01,$00,$26,$21,$16,$17,$26,$21,$16
	.byte $00,$26,$14,$18,$2B,$26,$2B,$18,$00,$26,$1A,$1A,$1A,$26,$1A,$1A
	.byte $40,$40,$40,$40,$40,$40,$40,$40
LevelData_Screen_Map1_13_seven:
	.byte $06,$21,$2B,$14,$1C,$05,$22,$07,$06,$1A,$1A,$1C,$05,$22,$14,$07
	.byte $01,$02,$0A,$01,$01,$21,$2B,$07,$14,$23,$04,$1D,$14,$2B,$14,$07
	.byte $2B,$14,$23,$04,$1D,$14,$2B,$33,$1A,$1A,$1A,$25,$04,$1D,$1A,$07
	.byte $40,$40,$40,$40,$40,$40,$40,$40
LevelData_Screen_Map1_13_eight:
	.byte $40,$01,$01,$01,$01,$01,$01,$01,$06,$21,$14,$1A,$1E,$1A,$1E,$1A
	.byte $06,$14,$17,$41,$41,$41,$41,$41,$06,$14,$2B,$14,$14,$2B,$14,$2B
	.byte $32,$2B,$14,$2B,$0C,$14,$0C,$14,$06,$1A,$1A,$07,$01,$1E,$01,$1E
	.byte $40,$40,$40,$40,$2A,$2A,$2A,$2A
LevelData_Screen_Map1_13_nine:
	.byte $01,$01,$01,$01,$01,$01,$01,$01,$1E,$1A,$1E,$1A,$1E,$14,$14,$2B
	.byte $41,$41,$41,$02,$0A,$21,$2B,$14,$14,$14,$2B,$17,$04,$1D,$14,$1A
	.byte $0C,$2B,$0C,$2B,$17,$04,$2D,$40,$01,$1E,$01,$1E,$01,$1E,$01,$40
	.byte $2A,$2A,$2A,$2A,$2A,$2A,$2A,$40
LevelData_Screen_Map1_14_six:
	.byte $01,$21,$14,$17,$04,$1D,$14,$07,$14,$2B,$39,$14,$17,$04,$1D,$07
	.byte $14,$39,$39,$1A,$01,$01,$01,$01,$1A,$14,$39,$01,$14,$39,$17,$07
	.byte $40,$39,$14,$2B,$39,$39,$14,$07,$40,$3F,$1A,$1A,$14,$39,$39,$07
	.byte $01,$01,$02,$0A,$21,$2B,$14,$07
LevelData_Screen_Map1_14_seven:
	.byte $06,$14,$23,$04,$1D,$14,$2B,$07,$06,$2B,$1A,$25,$04,$1D,$1A,$07
	.byte $06,$17,$01,$02,$0A,$01,$01,$01,$06,$2B,$14,$23,$04,$1D,$17,$07
	.byte $32,$14,$2B,$1A,$25,$04,$1D,$07,$06,$1A,$1A,$07,$40,$40,$40,$40
	.byte $40,$40,$40,$40,$40,$40,$40,$40
LevelData_Screen_Map1_14_eight:
	.byte $06,$21,$17,$04,$1D,$1A,$1A,$07,$06,$39,$17,$01,$0B,$03,$01,$01
	.byte $06,$1A,$01,$20,$05,$24,$1A,$39,$01,$01,$20,$05,$21,$0B,$03,$01
	.byte $06,$20,$05,$21,$1C,$05,$22,$1E,$40,$01,$3F,$1C,$05,$24,$1A,$39
	.byte $40,$40,$40,$40,$40,$40,$40,$40
LevelData_Screen_Map1_14_nine:
	.byte $01,$3B,$3B,$01,$01,$01,$01,$40,$21,$1E,$17,$1E,$21,$1E,$17,$07
	.byte $1A,$39,$1A,$39,$1A,$39,$1A,$07,$01,$01,$01,$01,$01,$01,$01,$40
	.byte $17,$1E,$21,$1E,$21,$1E,$17,$07,$1A,$39,$1A,$39,$1A,$39,$1A,$00
	.byte $40,$40,$40,$40,$40,$40,$40,$40
LevelData_ScreenNumbers_2_ForestsAndBridges:
	.word (LevelData_ScreenNumbers_2_ForestsAndBridges_0jovaFororest) ;A149 (A149) ()
	.word (LevelData_ScreenNumbers_2_ForestsAndBridges_1verosForest) ;A15A (A15A) ()
	.word (LevelData_ScreenNumbers_2_ForestsAndBridges_2) ;A69A (A69A) ()
	.word (LevelData_ScreenNumbers_2_ForestsAndBridges_3) ;A6A5 (A6A5) ()
	.word (LevelData_ScreenNumbers_2_ForestsAndBridges_4) ;A6B6 (A6B6) ()
	.word (LevelData_ScreenNumbers_2_ForestsAndBridges_5) ;A6C3 (A6C3) ()
	.word (LevelData_ScreenNumbers_2_ForestsAndBridges_6) ;A165 (A165) ()
	.word (LevelData_ScreenNumbers_2_ForestsAndBridges_7) ;A170 (A170) ()
	.word (LevelData_ScreenNumbers_2_ForestsAndBridges_8) ;A17F (A17F) ()
	.word (LevelData_ScreenNumbers_2_ForestsAndBridges_9) ;A18E (A18E) ()
LevelData_Palettes_2_ForestsAndBridges:
	.word (LevelData_Palettes_2_ForestsAndBridges_0aldraRightsideVerosLeftside_Day) ;A1C0 (A1C0) ()
	.word (LevelData_Palettes_2_ForestsAndBridges_0aldraRightsideVerosLeftside_Night) ;A1DC (A1DC) ()
	.word (LevelData_Palettes_2_ForestsAndBridges_1verosForest_Day) ;A1BE (A1BE) ()
	.word (LevelData_Palettes_2_ForestsAndBridges_1verosForest_Night) ;A1DA (A1DA) ()
	.word (LevelData_Palettes_2_ForestsAndBridges_2_Day) ;A6E9 (A6E9) ()
	.word (LevelData_Palettes_2_ForestsAndBridges_2_Night) ;A6FB (A6FB) ()
	.word (LevelData_Palettes_2_ForestsAndBridges_3_Day) ;A6EB (A6EB) ()
	.word (LevelData_Palettes_2_ForestsAndBridges_3_Night) ;A6FD (A6FD) ()
	.word (LevelData_Palettes_2_ForestsAndBridges_4_Day) ;A6F7 (A6F7) ()
	.word (LevelData_Palettes_2_ForestsAndBridges_4_Night) ;A707 (A707) ()
	.word (LevelData_Palettes_2_ForestsAndBridges_5_Day) ;A6F3 (A6F3) ()
	.word (LevelData_Palettes_2_ForestsAndBridges_5_Night) ;A70B (A70B) ()
	.word (LevelData_Palettes_2_ForestsAndBridges_6_Day) ;A1BC (A1BC) ()
	.word (LevelData_Palettes_2_ForestsAndBridges_6_Night) ;A1E4 (A1E4) ()
	.word (LevelData_Palettes_2_ForestsAndBridges_7_Day) ;A1C8 (A1C8) ()
	.word (LevelData_Palettes_2_ForestsAndBridges_7_Night) ;A1E6 (A1E6) ()
	.word (LevelData_Palettes_2_ForestsAndBridges_8_Day) ;A1CE (A1CE) ()
	.word (LevelData_Palettes_2_ForestsAndBridges_8_Night) ;A1EC (A1EC) ()
	.word (LevelData_Palettes_2_ForestsAndBridges_9_Day) ;A1D4 (A1D4) ()
	.word (LevelData_Palettes_2_ForestsAndBridges_9_Night) ;A1F2 (A1F2) ()
LevelData_Screens_2_ForestsAndBridges:
	.word (LevelData_Screens_2_ForestsAndBridges_0aldraRightsideVerosLeftside_A) ;A22C (A22C) ()
	.word (LevelData_Stairs_2_ForestsAndBridges_0_2_3_4_11_12_14_16_17_18_22_25) ;A221 (A221) ()
	.word (LevelData_Screens_2_ForestsAndBridges_1verosForest_A) ;A222 (A222) ()
	.word (LevelData_Stairs_2_ForestsAndBridges_1_6_13) ;A1F8 (A1F8) ()
	.word (LevelData_Screens_2_ForestsAndBridges_2_3_A) ;A23E (A23E) ()
	.word (LevelData_Stairs_2_ForestsAndBridges_0_2_3_4_11_12_14_16_17_18_22_25) ;A221 (A221) ()
	.word (LevelData_Screens_2_ForestsAndBridges_2_3_A) ;A23E (A23E) ()
	.word (LevelData_Stairs_2_ForestsAndBridges_0_2_3_4_11_12_14_16_17_18_22_25) ;A221 (A221) ()
	.word (LevelData_Screens_2_ForestsAndBridges_4_A) ;A250 (A250) ()
	.word (LevelData_Stairs_2_ForestsAndBridges_0_2_3_4_11_12_14_16_17_18_22_25) ;A221 (A221) ()
	.word (LevelData_Screens_2_ForestsAndBridges_5_A) ;A262 (A262) ()
	.word (LevelData_Stairs_2_ForestsAndBridges_5) ;A218 (A218) ()
	.word (LevelData_Screens_2_ForestsAndBridges_6_A) ;A26C (A26C) ()
	.word (LevelData_Stairs_2_ForestsAndBridges_1_6_13) ;A1F8 (A1F8) ()
	.word (LevelData_Screens_2_ForestsAndBridges_7_A) ;A730 (A730) ()
	.word (LevelData_Stairs_2_ForestsAndBridges_7) ;A70F (A70F) ()
	.word (LevelData_Screens_2_ForestsAndBridges_8_A) ;A73E (A73E) ()
	.word (LevelData_Stairs_2_ForestsAndBridges_8_20_23_24) ;A72F (A72F) ()
	.word (LevelData_Screens_2_ForestsAndBridges_9_A) ;A748 (A748) ()
	.word (LevelData_Stairs_2_ForestsAndBridges_9) ;A714 (A714) ()
	.word (LevelData_Screens_2_ForestsAndBridges_1verosForest0_A) ;A756 (A756) ()
	.word (LevelData_Stairs_2_ForestsAndBridges_10) ;A719 (A719) ()
	.word (LevelData_Screens_2_ForestsAndBridges_11_A) ;A27A (A27A) ()
	.word (LevelData_Stairs_2_ForestsAndBridges_0_2_3_4_11_12_14_16_17_18_22_25) ;A221 (A221) ()
	.word (LevelData_Screens_2_ForestsAndBridges_12_A) ;A28C (A28C) ()
	.word (LevelData_Stairs_2_ForestsAndBridges_0_2_3_4_11_12_14_16_17_18_22_25) ;A221 (A221) ()
	.word (LevelData_Screens_2_ForestsAndBridges_13_14_A) ;A296 (A296) ()
	.word (LevelData_Stairs_2_ForestsAndBridges_1_6_13) ;A1F8 (A1F8) ()
	.word (LevelData_Screens_2_ForestsAndBridges_13_14_A) ;A296 (A296) ()
	.word (LevelData_Stairs_2_ForestsAndBridges_0_2_3_4_11_12_14_16_17_18_22_25) ;A221 (A221) ()
	.word (LevelData_Screens_2_ForestsAndBridges_15_A) ;A2A0 (A2A0) ()
	.word (LevelData_Stairs_2_ForestsAndBridges_15) ;A207 (A207) ()
	.word (LevelData_Screens_2_ForestsAndBridges_16_17_A) ;A2B2 (A2B2) ()
	.word (LevelData_Stairs_2_ForestsAndBridges_0_2_3_4_11_12_14_16_17_18_22_25) ;A221 (A221) ()
	.word (LevelData_Screens_2_ForestsAndBridges_16_17_A) ;A2B2 (A2B2) ()
	.word (LevelData_Stairs_2_ForestsAndBridges_0_2_3_4_11_12_14_16_17_18_22_25) ;A221 (A221) ()
	.word (LevelData_Screens_2_ForestsAndBridges_18_A) ;A2BC (A2BC) ()
	.word (LevelData_Stairs_2_ForestsAndBridges_0_2_3_4_11_12_14_16_17_18_22_25) ;A221 (A221) ()
	.word (LevelData_Screens_2_ForestsAndBridges_19_A) ;A75E (A75E) ()
	.word (LevelData_Stairs_2_ForestsAndBridges_19) ;A71E (A71E) ()
	.word (LevelData_Screens_2_ForestsAndBridges_20_A) ;A76C (A76C) ()
	.word (LevelData_Stairs_2_ForestsAndBridges_8_20_23_24) ;A72F (A72F) ()
	.word (LevelData_Screens_2_ForestsAndBridges_21_A) ;A776 (A776) ()
	.word (LevelData_Stairs_2_ForestsAndBridges_21) ;A72B (A72B) ()
	.word (LevelData_Screens_2_ForestsAndBridges_22_A) ;A2C6 (A2C6) ()
	.word (LevelData_Stairs_2_ForestsAndBridges_0_2_3_4_11_12_14_16_17_18_22_25) ;A221 (A221) ()
	.word (LevelData_Screens_2_ForestsAndBridges_23_A) ;A788 (A788) ()
	.word (LevelData_Stairs_2_ForestsAndBridges_8_20_23_24) ;A72F (A72F) ()
	.word (LevelData_Screens_2_ForestsAndBridges_24_A) ;A792 (A792) ()
	.word (LevelData_Stairs_2_ForestsAndBridges_8_20_23_24) ;A72F (A72F) ()
	.word (LevelData_Screens_2_ForestsAndBridges_25_A) ;A2D0 (A2D0) ()
	.word (LevelData_Stairs_2_ForestsAndBridges_0_2_3_4_11_12_14_16_17_18_22_25) ;A221 (A221) ()
LevelData_Screen_Map2_2_3_and_2_8_and_2_9:
	.byte $00,$41,$00,$41,$00,$41,$00,$41,$41,$12,$41,$12,$41,$12,$41,$12
	.byte $11,$11,$11,$11,$11,$11,$11,$11,$10,$10,$10,$10,$10,$10,$42,$42
	.byte $15,$15,$15,$15,$16,$16,$17,$17,$14,$14,$14,$20,$17,$17,$19,$19
	.byte $17,$17,$17,$17,$19,$19,$19,$19,$00,$41,$00,$41,$00,$41,$00,$41
	.byte $41,$12,$41,$12,$41,$12,$41,$12,$11,$11,$11,$11,$11,$11,$11,$11
	.byte $42,$42,$10,$10,$10,$10,$10,$10,$17,$17,$16,$16,$15,$15,$15,$15
	.byte $19,$19,$02,$0A,$20,$14,$14,$14,$19,$22,$00,$04,$0A,$01,$01,$17
	.byte $19,$00,$00,$00,$04,$36,$00,$3C,$19,$00,$00,$00,$00,$04,$36,$00
	.byte $19,$39,$39,$39,$39,$39,$04,$36,$19,$17,$17,$17,$17,$17,$17,$17
	.byte $19,$19,$19,$19,$19,$19,$19,$19,$19,$19,$19,$19,$19,$19,$19,$19
	.byte $19,$19,$19,$19,$19,$19,$19,$19,$18,$19,$19,$19,$19,$19,$19,$19
	.byte $00,$3C,$18,$18,$19,$19,$19,$19,$00,$00,$00,$00,$3C,$18,$18,$19
	.byte $39,$39,$39,$00,$00,$00,$00,$3C,$17,$17,$17,$39,$39,$39,$00,$00
	.byte $19,$19,$19,$17,$17,$17,$39,$39,$19,$19,$19,$19,$19,$19,$17,$17
	.byte $00,$41,$00,$41,$00,$41,$00,$41,$41,$12,$41,$12,$41,$12,$41,$12
	.byte $11,$11,$11,$11,$11,$11,$11,$11,$42,$42,$42,$10,$10,$10,$10,$10
	.byte $17,$17,$17,$16,$16,$16,$15,$15,$19,$19,$19,$17,$17,$17,$14,$14
	.byte $19,$19,$19,$19,$19,$19,$17,$17,$00,$41,$00,$41,$00,$41,$00,$41
	.byte $41,$12,$41,$12,$41,$12,$12,$12,$11,$11,$11,$11,$11,$11,$11,$11
	.byte $10,$10,$42,$17,$17,$17,$17,$17,$15,$16,$17,$22,$43,$43,$43,$43
	.byte $14,$0C,$43,$39,$39,$40,$39,$3D,$17,$17,$17,$17,$17,$31,$17,$31
	.byte $00,$41,$00,$41,$00,$41,$00,$41,$41,$12,$41,$12,$41,$12,$41,$12
	.byte $11,$11,$11,$11,$11,$11,$11,$11,$10,$10,$10,$10,$10,$10,$10,$10
	.byte $15,$15,$16,$16,$16,$16,$15,$15,$14,$20,$17,$17,$17,$17,$20,$14
	.byte $17,$17,$19,$19,$19,$19,$17,$17,$00,$41,$00,$41,$00,$41,$00,$41
	.byte $41,$12,$41,$12,$41,$12,$41,$12,$11,$11,$11,$11,$11,$11,$11,$11
	.byte $10,$10,$10,$10,$10,$10,$10,$10,$15,$15,$15,$15,$15,$15,$15,$15
	.byte $14,$14,$14,$14,$14,$14,$14,$14,$17,$17,$17,$17,$17,$17,$17,$17
LevelData_ScreenNumbers_2_ForestsAndBridges_0jovaFororest:
	.word (LevelData_ScreenNumbers_2_ForestsAndBridges_0jovaFororest_A1B7) ;A1B7 (A1B7) ()
	.byte $03,$FF,$00,$00,$00,$00,$01
	.word (LevelData_ScreenNumbers_2_ForestsAndBridges_0jovaFororest_0) ;A1A0 (A1A0) ()
	.word (LevelData_ScreenNumbers_2_ForestsAndBridges_0southBridge_1) ;A1A1 (A1A1) ()
	.word (LevelData_ScreenNumbers_2_ForestsAndBridges_0verosForest_2) ;A1A2 (A1A2) ()
	.word (LevelData_ScreenNumbers_2_ForestsAndBridges_0verosForest_3) ;A1A3 (A1A3) ()
LevelData_ScreenNumbers_2_ForestsAndBridges_1verosForest:
	.word (LevelData_ScreenNumbers_2_ForestsAndBridges_1verosForest_A1B6) ;A1B6 (A1B6) ()
	.byte $00,$00,$00,$00,$FF,$01,$01
	.word (LevelData_ScreenNumbers_2_ForestsAndBridges_1verosForest_0) ;A1A8 (A1A8) ()
LevelData_ScreenNumbers_2_ForestsAndBridges_6:
	.word (LevelData_ScreenNumbers_2_ForestsAndBridges_0jovaFororest_A1B7) ;A1B7 (A1B7) ()
	.byte $00,$FF,$01,$03,$00,$00,$07
	.word (LevelData_ScreenNumbers_2_ForestsAndBridges_6_0_7_0) ;A19D (A19D) ()
LevelData_ScreenNumbers_2_ForestsAndBridges_7:
	.word (LevelData_ScreenNumbers_2_ForestsAndBridges_7_A1B3) ;A1B3 (A1B3) ()
	.byte $02,$FF,$00,$03,$FF,$00,$00
	.word (LevelData_ScreenNumbers_2_ForestsAndBridges_6_0_7_0) ;A19D (A19D) ()
	.word (LevelData_ScreenNumbers_2_ForestsAndBridges_7_1) ;A19E (A19E) ()
	.word (LevelData_ScreenNumbers_2_ForestsAndBridges_7_2) ;A19F (A19F) ()
LevelData_ScreenNumbers_2_ForestsAndBridges_8:
	.word (LevelData_ScreenNumbers_2_ForestsAndBridges_0jovaFororest_A1B7) ;A1B7 (A1B7) ()
	.byte $02,$FF,$00,$05,$00,$00,$09
	.word (LevelData_ScreenNumbers_2_ForestsAndBridges_8_0) ;A1A9 (A1A9) ()
	.word (LevelData_ScreenNumbers_2_ForestsAndBridges_8_1) ;A1AA (A1AA) ()
	.word (LevelData_ScreenNumbers_2_ForestsAndBridges_8_2) ;A1AB (A1AB) ()
LevelData_ScreenNumbers_2_ForestsAndBridges_9:
	.word (LevelData_ScreenNumbers_2_ForestsAndBridges_0jovaFororest_A1B7) ;A1B7 (A1B7) ()
	.byte $02,$00,$00,$08,$FF,$00,$09
	.word (LevelData_ScreenNumbers_2_ForestsAndBridges_9_0) ;A1B0 (A1B0) ()
	.word (LevelData_ScreenNumbers_2_ForestsAndBridges_9_1) ;A1B1 (A1B1) ()
	.word (LevelData_ScreenNumbers_2_ForestsAndBridges_9_2) ;A1B2 (A1B2) ()
LevelData_ScreenNumbers_2_ForestsAndBridges_6_0_7_0:
	.byte $10
LevelData_ScreenNumbers_2_ForestsAndBridges_7_1:
	.byte $12
LevelData_ScreenNumbers_2_ForestsAndBridges_7_2:
	.byte $00
LevelData_ScreenNumbers_2_ForestsAndBridges_0jovaFororest_0:
	.byte $02
LevelData_ScreenNumbers_2_ForestsAndBridges_0southBridge_1:
	.byte $04
LevelData_ScreenNumbers_2_ForestsAndBridges_0verosForest_2:
	.byte $05
LevelData_ScreenNumbers_2_ForestsAndBridges_0verosForest_3:
	.byte $FE,$06,$FF,$00,$01
LevelData_ScreenNumbers_2_ForestsAndBridges_1verosForest_0:
	.byte $16
LevelData_ScreenNumbers_2_ForestsAndBridges_8_0:
	.byte $0B
LevelData_ScreenNumbers_2_ForestsAndBridges_8_1:
	.byte $0C
LevelData_ScreenNumbers_2_ForestsAndBridges_8_2:
	.byte $FE,$0D,$FF,$00,$06
LevelData_ScreenNumbers_2_ForestsAndBridges_9_0:
	.byte $01
LevelData_ScreenNumbers_2_ForestsAndBridges_9_1:
	.byte $19
LevelData_ScreenNumbers_2_ForestsAndBridges_9_2:
	.byte $0F
LevelData_ScreenNumbers_2_ForestsAndBridges_7_A1B3:
	.byte $00,$00,$01
LevelData_ScreenNumbers_2_ForestsAndBridges_1verosForest_A1B6:
	.byte $00
LevelData_ScreenNumbers_2_ForestsAndBridges_0jovaFororest_A1B7:
	.byte $00,$00,$00,$00,$00
LevelData_Palettes_2_ForestsAndBridges_6_Day:
	.byte $20,$30
LevelData_Palettes_2_ForestsAndBridges_1verosForest_Day:
	.byte $23,$30
LevelData_Palettes_2_ForestsAndBridges_0aldraRightsideVerosLeftside_Day:
	.byte $22,$2F,$1F,$2F,$23,$30,$23,$30
LevelData_Palettes_2_ForestsAndBridges_7_Day:
	.byte $1F,$2F,$1F,$2F,$22,$32
LevelData_Palettes_2_ForestsAndBridges_8_Day:
	.byte $20,$33,$24,$33,$24,$33
LevelData_Palettes_2_ForestsAndBridges_9_Day:
	.byte $24,$33,$1F,$2F,$27,$34
LevelData_Palettes_2_ForestsAndBridges_1verosForest_Night:
	.byte $25,$2F
LevelData_Palettes_2_ForestsAndBridges_0aldraRightsideVerosLeftside_Night:
	.byte $25,$2F,$21,$2F,$25,$30,$25,$30
LevelData_Palettes_2_ForestsAndBridges_6_Night:
	.byte $21,$30
LevelData_Palettes_2_ForestsAndBridges_7_Night:
	.byte $21,$2F,$21,$2F,$25,$32
LevelData_Palettes_2_ForestsAndBridges_8_Night:
	.byte $21,$33,$25,$33,$25,$33
LevelData_Palettes_2_ForestsAndBridges_9_Night:
	.byte $25,$33,$21,$2F,$28,$34
LevelData_Stairs_2_ForestsAndBridges_1_6_13:
	.byte $09,$12,$9D,$26,$FF,$51,$0E,$D9,$16,$FF,$13,$A6,$8B,$AE,$FF
LevelData_Stairs_2_ForestsAndBridges_15:
	.byte $13,$8A,$87,$96,$6D,$0A,$F9,$16,$FF,$3B,$96,$AF,$A2,$31,$2A,$B9
	.byte $32
LevelData_Stairs_2_ForestsAndBridges_5:
	.byte $29,$0A,$B5,$16,$FF,$39,$0A,$C1,$12
LevelData_Stairs_2_ForestsAndBridges_0_2_3_4_11_12_14_16_17_18_22_25:
	.byte $FF
LevelData_Screens_2_ForestsAndBridges_1verosForest_A:
	.byte $02,$01
	.word (LevelData_Screen_Map2_1_and_2_22) ;A3C2 (A3C2) ([8:4][A:5])
	.word (LevelData_Screen_Map2_0_and_2_1_and_2_2_3) ;A4DA (A4DA) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
LevelData_Screens_2_ForestsAndBridges_0aldraRightsideVerosLeftside_A:
	.byte $04,$01
	.word (LevelData_Screen_Map2_0) ;A582 (A582) ([8:4][A:5])
	.word (LevelData_Screen_Map2_0_and_2_12) ;A5BA (A5BA) ([8:4][A:5])
	.word (LevelData_Screen_Map2_0_and_2_2_3) ;A3FA (A3FA) ([8:4][A:5])
	.word (LevelData_Screen_Map2_0_and_2_1_and_2_2_3) ;A4DA (A4DA) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
LevelData_Screens_2_ForestsAndBridges_2_3_A:
	.byte $04,$01
	.word (LevelData_Screen_Map2_0_and_2_1_and_2_2_3) ;A4DA (A4DA) ([8:4][A:5])
	.word (LevelData_Screen_Map2_2_3_and_2_8_and_2_9) ;9F89 (9F89) ([8:4][A:5])
	.word (LevelData_Screen_Map2_0_and_2_2_3) ;A3FA (A3FA) ([8:4][A:5])
	.word (LevelData_Screen_Map2_2_3_and_2_12_and_2_22) ;A4A2 (A4A2) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
LevelData_Screens_2_ForestsAndBridges_4_A:
	.byte $04,$01
	.word (LevelData_Screen_Map2_4_and_2_11_and_2_25) ;F8E7 (1F8E7) ([8:4][A:5])
	.word (LevelData_Screen_Map2_4) ;F98F (1F98F) ([8:4][A:5])
	.word (LevelData_Screen_Map2_4) ;F98F (1F98F) ([8:4][A:5])
	.word (LevelData_Screen_Map2_4_and_2_11_and_2_25_and_4_2) ;F91F (1F91F) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
LevelData_Screens_2_ForestsAndBridges_5_A:
	.byte $02,$01
	.word (LevelData_Screen_Map2_5a) ;A432 (A432) ([8:4][A:5])
	.word (LevelData_Screen_Map2_5b) ;A46A (A46A) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
LevelData_Screens_2_ForestsAndBridges_6_A:
	.byte $02,$02
	.word (LevelData_Screen_Map2_6_and_2_13_14_one) ;A2E2 (A2E2) ([8:4][A:5])
	.word (LevelData_Screen_Map2_6_and_2_13_14_four) ;A38A (A38A) ([8:4][A:5])
	.word (LevelData_Screen_Map2_6_and_2_13_14_two) ;A31A (A31A) ([8:4][A:5])
	.word (LevelData_Screen_Map2_6_and_2_13_14_three) ;A352 (A352) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
LevelData_Screens_2_ForestsAndBridges_11_A:
	.byte $04,$01
	.word (LevelData_Screen_Map2_4_and_2_11_and_2_25) ;F8E7 (1F8E7) ([8:4][A:5])
	.word (LevelData_Screen_Map2_11) ;F9C7 (1F9C7) ([8:4][A:5])
	.word (LevelData_Screen_Map2_11) ;F9C7 (1F9C7) ([8:4][A:5])
	.word (LevelData_Screen_Map2_4_and_2_11_and_2_25_and_4_2) ;F91F (1F91F) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
LevelData_Screens_2_ForestsAndBridges_12_A:
	.byte $02,$01
	.word (LevelData_Screen_Map2_2_3_and_2_12_and_2_22) ;A4A2 (A4A2) ([8:4][A:5])
	.word (LevelData_Screen_Map2_0_and_2_12) ;A5BA (A5BA) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
LevelData_Screens_2_ForestsAndBridges_13_14_A:
	.byte $02,$02
	.word (LevelData_Screen_Map2_6_and_2_13_14_one) ;A2E2 (A2E2) ([8:4][A:5])
	.word (LevelData_Screen_Map2_6_and_2_13_14_four) ;A38A (A38A) ([8:4][A:5])
	.word (LevelData_Screen_Map2_6_and_2_13_14_two) ;A31A (A31A) ([8:4][A:5])
	.word (LevelData_Screen_Map2_6_and_2_13_14_three) ;A352 (A352) ([8:4][A:5])
LevelData_Screens_2_ForestsAndBridges_15_A:
	.byte $04,$01
	.word (LevelData_Screen_Map2_15_one) ;A5F2 (A5F2) ([8:4][A:5])
	.word (LevelData_Screen_Map2_15_two) ;A62A (A62A) ([8:4][A:5])
	.word (LevelData_Screen_Map2_15_two) ;A62A (A62A) ([8:4][A:5])
	.word (LevelData_Screen_Map2_15_three) ;A662 (A662) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
LevelData_Screens_2_ForestsAndBridges_16_17_A:
	.byte $02,$01
	.word (LevelData_Screen_Map2_16_17_and_2_18_and_3_10_and_4_5_6) ;F877 (1F877) ([8:4][A:5])
	.word (LevelData_Screen_Map2_16_17_and_2_18_and_4_5_6) ;F83F (1F83F) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
LevelData_Screens_2_ForestsAndBridges_18_A:
	.byte $02,$01
	.word (LevelData_Screen_Map2_16_17_and_2_18_and_4_5_6) ;F83F (1F83F) ([8:4][A:5])
	.word (LevelData_Screen_Map2_16_17_and_2_18_and_3_10_and_4_5_6) ;F877 (1F877) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
LevelData_Screens_2_ForestsAndBridges_22_A:
	.byte $02,$01
	.word (LevelData_Screen_Map2_1_and_2_22) ;A3C2 (A3C2) ([8:4][A:5])
	.word (LevelData_Screen_Map2_2_3_and_2_12_and_2_22) ;A4A2 (A4A2) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
LevelData_Screens_2_ForestsAndBridges_25_A:
	.byte $04,$01
	.word (LevelData_Screen_Map2_4_and_2_11_and_2_25) ;F8E7 (1F8E7) ([8:4][A:5])
	.word (LevelData_Screen_Map2_25_and_4_2) ;F957 (1F957) ([8:4][A:5])
	.word (LevelData_Screen_Map2_25_and_4_2) ;F957 (1F957) ([8:4][A:5])
	.word (LevelData_Screen_Map2_4_and_2_11_and_2_25_and_4_2) ;F91F (1F91F) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
LevelData_Screen_Map2_6_and_2_13_14_one:
	.byte $00,$41,$00,$41,$00,$41,$00,$41,$41,$12,$41,$12,$41,$12,$41,$12
	.byte $11,$11,$11,$11,$11,$11,$11,$11,$42,$42,$10,$10,$10,$10,$10,$10
	.byte $17,$17,$16,$16,$15,$15,$15,$15,$19,$19,$02,$0A,$20,$14,$14,$14
	.byte $19,$22,$00,$04,$0A,$01,$01,$17
LevelData_Screen_Map2_6_and_2_13_14_two:
	.byte $19,$00,$00,$00,$04,$36,$00,$3C,$19,$00,$00,$00,$00,$04,$36,$00
	.byte $19,$39,$39,$39,$39,$39,$04,$36,$19,$17,$17,$17,$17,$17,$17,$17
	.byte $19,$19,$19,$19,$19,$19,$19,$19,$19,$19,$19,$19,$19,$19,$19,$19
	.byte $19,$19,$19,$19,$19,$19,$19,$19
LevelData_Screen_Map2_6_and_2_13_14_three:
	.byte $18,$19,$19,$19,$19,$19,$19,$19,$00,$3C,$18,$18,$19,$19,$19,$19
	.byte $00,$00,$00,$00,$3C,$18,$18,$19,$39,$39,$39,$00,$00,$00,$00,$3C
	.byte $17,$17,$17,$39,$39,$39,$00,$00,$19,$19,$19,$17,$17,$17,$39,$39
	.byte $19,$19,$19,$19,$19,$19,$17,$17
LevelData_Screen_Map2_6_and_2_13_14_four:
	.byte $00,$41,$00,$41,$00,$41,$00,$41,$41,$12,$41,$12,$41,$12,$41,$12
	.byte $11,$11,$11,$11,$11,$11,$11,$11,$10,$10,$10,$10,$10,$42,$42,$42
	.byte $15,$15,$16,$16,$16,$17,$17,$17,$14,$14,$01,$40,$01,$19,$19,$19
	.byte $17,$31,$31,$31,$31,$19,$19,$19
LevelData_Screen_Map2_1_and_2_22:
	.byte $00,$41,$00,$41,$00,$41,$00,$41,$41,$12,$41,$12,$41,$12,$41,$12
	.byte $11,$11,$11,$11,$11,$11,$11,$11,$42,$42,$10,$10,$10,$10,$10,$10
	.byte $17,$17,$16,$15,$15,$15,$15,$15,$19,$19,$17,$14,$20,$20,$14,$14
	.byte $19,$19,$19,$34,$34,$34,$34,$17
LevelData_Screen_Map2_0_and_2_2_3:
	.byte $00,$41,$00,$41,$00,$41,$00,$41,$41,$12,$41,$12,$41,$12,$41,$12
	.byte $11,$11,$11,$11,$11,$11,$11,$11,$42,$42,$42,$10,$10,$10,$10,$10
	.byte $17,$17,$17,$16,$16,$16,$15,$15,$19,$19,$19,$17,$17,$17,$14,$14
	.byte $19,$19,$19,$19,$19,$19,$17,$17
LevelData_Screen_Map2_5a:
	.byte $00,$41,$00,$41,$00,$41,$00,$41,$41,$12,$41,$12,$41,$12,$12,$12
	.byte $11,$11,$11,$11,$11,$11,$11,$11,$10,$10,$42,$17,$17,$17,$17,$17
	.byte $15,$16,$17,$22,$43,$43,$43,$43,$14,$0C,$43,$39,$39,$40,$39,$3D
	.byte $17,$17,$17,$17,$17,$31,$17,$31
LevelData_Screen_Map2_5b:
	.byte $00,$41,$00,$41,$00,$41,$00,$41,$12,$12,$41,$12,$41,$12,$41,$12
	.byte $11,$11,$11,$11,$11,$11,$11,$11,$17,$17,$02,$0A,$01,$17,$42,$42
	.byte $43,$43,$00,$04,$36,$3C,$17,$17,$39,$3D,$39,$39,$04,$36,$43,$19
	.byte $17,$17,$17,$17,$17,$17,$17,$19
LevelData_Screen_Map2_2_3_and_2_12_and_2_22:
	.byte $00,$41,$00,$41,$00,$41,$00,$41,$41,$12,$41,$12,$41,$12,$41,$12
	.byte $11,$11,$11,$11,$11,$11,$11,$11,$10,$10,$10,$10,$10,$10,$10,$10
	.byte $15,$15,$16,$16,$16,$16,$15,$15,$14,$20,$17,$17,$17,$17,$20,$14
	.byte $17,$17,$19,$19,$19,$19,$17,$17
LevelData_Screen_Map2_0_and_2_1_and_2_2_3:
	.byte $00,$41,$00,$41,$00,$41,$00,$41,$41,$12,$41,$12,$41,$12,$41,$12
	.byte $11,$11,$11,$11,$11,$11,$11,$11,$10,$10,$10,$10,$10,$10,$10,$10
	.byte $15,$15,$15,$15,$15,$15,$15,$15,$14,$14,$14,$14,$14,$14,$14,$14
	.byte $17,$17,$17,$17,$17,$17,$17,$17,$00,$41,$00,$41,$00,$41,$00,$41
	.byte $41,$12,$41,$12,$41,$12,$41,$12,$11,$11,$11,$11,$11,$11,$11,$11
	.byte $17,$17,$42,$42,$42,$42,$42,$42,$43,$43,$01,$01,$02,$0A,$01,$01
	.byte $39,$3D,$00,$3E,$00,$04,$36,$39,$17,$31,$31,$31,$31,$17,$17,$17
	.byte $19,$19,$00,$41,$00,$41,$00,$41,$19,$19,$41,$12,$41,$12,$41,$12
	.byte $19,$19,$11,$11,$11,$11,$11,$11,$18,$18,$10,$10,$42,$42,$42,$10
	.byte $00,$15,$15,$16,$01,$0C,$01,$16,$39,$20,$14,$01,$39,$3D,$40,$01
	.byte $17,$17,$44,$34,$34,$34,$34,$34
LevelData_Screen_Map2_0:
	.byte $00,$41,$00,$41,$00,$41,$00,$41,$41,$12,$41,$12,$41,$12,$41,$12
	.byte $11,$11,$11,$11,$11,$11,$11,$11,$10,$10,$10,$10,$10,$10,$10,$10
	.byte $15,$15,$15,$15,$15,$15,$15,$15,$14,$14,$14,$14,$14,$14,$14,$14
	.byte $17,$17,$31,$31,$31,$31,$31,$31
LevelData_Screen_Map2_0_and_2_12:
	.byte $00,$41,$00,$41,$00,$41,$00,$41,$41,$12,$41,$12,$41,$12,$41,$12
	.byte $11,$11,$11,$11,$11,$11,$11,$11,$10,$10,$10,$10,$10,$10,$42,$42
	.byte $15,$15,$15,$15,$15,$16,$17,$17,$14,$14,$14,$14,$14,$17,$19,$19
	.byte $31,$31,$31,$31,$17,$19,$19,$19
LevelData_Screen_Map2_15_one:
	.byte $15,$15,$15,$15,$15,$15,$15,$15,$14,$14,$14,$14,$14,$14,$14,$14
	.byte $2B,$2D,$2C,$2B,$2C,$2B,$2D,$2C,$29,$23,$2A,$0B,$03,$01,$23,$01
	.byte $00,$00,$3F,$05,$00,$23,$00,$23,$39,$3F,$05,$39,$40,$24,$3D,$40
	.byte $17,$17,$13,$31,$31,$31,$31,$31
LevelData_Screen_Map2_15_two:
	.byte $15,$15,$15,$15,$15,$15,$15,$15,$14,$14,$14,$14,$14,$14,$14,$14
	.byte $23,$2B,$2D,$2D,$2D,$2D,$2D,$2C,$00,$01,$23,$01,$2B,$01,$2C,$01
	.byte $25,$24,$26,$23,$29,$23,$2A,$23,$27,$28,$2E,$24,$40,$3D,$39,$3E
	.byte $31,$31,$31,$31,$31,$31,$31,$31
LevelData_Screen_Map2_15_three:
	.byte $15,$15,$15,$15,$15,$15,$15,$19,$14,$14,$14,$14,$14,$14,$14,$19
	.byte $2B,$2D,$2D,$2D,$2D,$2D,$2D,$19,$29,$01,$01,$01,$2B,$2C,$23,$19
	.byte $00,$29,$23,$2A,$29,$2A,$00,$19,$39,$3D,$24,$40,$24,$39,$39,$19
	.byte $31,$31,$31,$31,$31,$13,$13,$18
LevelData_ScreenNumbers_2_ForestsAndBridges_2:
	.word (LevelData_ScreenNumbers_2_ForestsAndBridges_2_A6E1) ;A6E1 (A6E1) ()
	.byte $00,$00,$00,$03,$FF,$00,$02
	.word (LevelData_ScreenNumbers_2_ForestsAndBridges_2_0) ;A6D0 (A6D0) ()
LevelData_ScreenNumbers_2_ForestsAndBridges_3:
	.word (LevelData_ScreenNumbers_2_ForestsAndBridges_3_A6E2) ;A6E2 (A6E2) ()
	.byte $03,$00,$00,$04,$00,$00,$02
	.word (LevelData_ScreenNumbers_2_ForestsAndBridges_3_0) ;A6D1 (A6D1) ()
	.word (LevelData_ScreenNumbers_2_ForestsAndBridges_3_1) ;A6D6 (A6D6) ()
	.word (LevelData_ScreenNumbers_2_ForestsAndBridges_3_2) ;A6D7 (A6D7) ()
	.word (LevelData_ScreenNumbers_2_ForestsAndBridges_3_3) ;A6D8 (A6D8) ()
LevelData_ScreenNumbers_2_ForestsAndBridges_4:
	.word (LevelData_ScreenNumbers_2_ForestsAndBridges_3_A6E2) ;A6E2 (A6E2) ()
	.byte $01,$FF,$01,$01,$00,$00,$03
	.word (LevelData_ScreenNumbers_2_ForestsAndBridges_4_0) ;A6DD (A6DD) ()
	.word (LevelData_ScreenNumbers_2_ForestsAndBridges_4_1) ;A6DE (A6DE) ()
LevelData_ScreenNumbers_2_ForestsAndBridges_5:
	.word (LevelData_ScreenNumbers_2_ForestsAndBridges_5_A6E7) ;A6E7 (A6E7) ()
	.byte $01,$FA,$00,$03,$FF,$01,$02
	.word (LevelData_ScreenNumbers_2_ForestsAndBridges_5_0) ;A6DF (A6DF) ()
	.word (LevelData_ScreenNumbers_2_ForestsAndBridges_5_1) ;A6E0 (A6E0) ()
LevelData_ScreenNumbers_2_ForestsAndBridges_2_0:
	.byte $18
LevelData_ScreenNumbers_2_ForestsAndBridges_3_0:
	.byte $FD,$13,$FF,$00,$01
LevelData_ScreenNumbers_2_ForestsAndBridges_3_1:
	.byte $14
LevelData_ScreenNumbers_2_ForestsAndBridges_3_2:
	.byte $08
LevelData_ScreenNumbers_2_ForestsAndBridges_3_3:
	.byte $FE,$09,$00,$00,$05
LevelData_ScreenNumbers_2_ForestsAndBridges_4_0:
	.byte $07
LevelData_ScreenNumbers_2_ForestsAndBridges_4_1:
	.byte $17
LevelData_ScreenNumbers_2_ForestsAndBridges_5_0:
	.byte $15
LevelData_ScreenNumbers_2_ForestsAndBridges_5_1:
	.byte $0A
LevelData_ScreenNumbers_2_ForestsAndBridges_2_A6E1:
	.byte $01
LevelData_ScreenNumbers_2_ForestsAndBridges_3_A6E2:
	.byte $00,$00,$00,$00,$00
LevelData_ScreenNumbers_2_ForestsAndBridges_5_A6E7:
	.byte $00,$FF
LevelData_Palettes_2_ForestsAndBridges_2_Day:
	.byte $23,$31
LevelData_Palettes_2_ForestsAndBridges_3_Day:
	.byte $26,$31,$26,$31,$23,$31,$23,$31
LevelData_Palettes_2_ForestsAndBridges_5_Day:
	.byte $26,$32,$1F,$32
LevelData_Palettes_2_ForestsAndBridges_4_Day:
	.byte $23,$31,$23,$31
LevelData_Palettes_2_ForestsAndBridges_2_Night:
	.byte $25,$31
LevelData_Palettes_2_ForestsAndBridges_3_Night:
	.byte $26,$31,$26,$31,$25,$31,$25,$31,$25,$31
LevelData_Palettes_2_ForestsAndBridges_4_Night:
	.byte $25,$31,$25,$31
LevelData_Palettes_2_ForestsAndBridges_5_Night:
	.byte $26,$32,$21,$32
LevelData_Stairs_2_ForestsAndBridges_7:
	.byte $51,$0E,$D9,$16,$FF
LevelData_Stairs_2_ForestsAndBridges_9:
	.byte $09,$12,$9D,$26,$FF
LevelData_Stairs_2_ForestsAndBridges_10:
	.byte $13,$A6,$8B,$AE,$FF
LevelData_Stairs_2_ForestsAndBridges_19:
	.byte $29,$0A,$B5,$16,$3B,$96,$AF,$A2,$31,$2A,$B9,$32,$FF
LevelData_Stairs_2_ForestsAndBridges_21:
	.byte $39,$0A,$C1,$12
LevelData_Stairs_2_ForestsAndBridges_8_20_23_24:
	.byte $FF
LevelData_Screens_2_ForestsAndBridges_7_A:
	.byte $03,$01
	.word (LevelData_Screen_Map2_7_and_2_24) ;AC6C (AC6C) ([8:4][A:5])
	.word (LevelData_Screen_Map2_7_one) ;ABFC (ABFC) ([8:4][A:5])
	.word (LevelData_Screen_Map2_7_two) ;ACDC (ACDC) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
LevelData_Screens_2_ForestsAndBridges_8_A:
	.byte $02,$01
	.word (LevelData_Screen_Map2_8) ;AD14 (AD14) ([8:4][A:5])
	.word (LevelData_Screen_Map2_2_3_and_2_8_and_2_9) ;9F89 (9F89) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
LevelData_Screens_2_ForestsAndBridges_9_A:
	.byte $02,$02
	.word (LevelData_Screen_Map2_9_one) ;AA74 (AA74) ([8:4][A:5])
	.word (LevelData_Screen_Map2_2_3_and_2_8_and_2_9) ;9F89 (9F89) ([8:4][A:5])
	.word (LevelData_Screen_Map2_9_two) ;AAAC (AAAC) ([8:4][A:5])
	.word (LevelData_Screen_Map2_9_three) ;AAE4 (AAE4) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
LevelData_Screens_2_ForestsAndBridges_1verosForest0_A:
	.byte $01,$02
	.word (LevelData_Screen_Map2_10_and_3_4) ;F8AF (1F8AF) ([8:4][A:5])
	.word (LevelData_Screen_Map2_10) ;A9CC (A9CC) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
LevelData_Screens_2_ForestsAndBridges_19_A:
	.byte $02,$02
	.word (LevelData_Screen_Map2_19_one) ;A79C (A79C) ([8:4][A:5])
	.word (LevelData_Screen_Map2_19_two) ;A7D4 (A7D4) ([8:4][A:5])
	.word (LevelData_Screen_Map2_19_three) ;A95C (A95C) ([8:4][A:5])
	.word (LevelData_Screen_Map2_19_four) ;A994 (A994) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
LevelData_Screens_2_ForestsAndBridges_20_A:
	.byte $02,$01
	.word (LevelData_Screen_Map2_20_one) ;A80C (A80C) ([8:4][A:5])
	.word (LevelData_Screen_Map2_20_two) ;A844 (A844) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
LevelData_Screens_2_ForestsAndBridges_21_A:
	.byte $04,$01
	.word (LevelData_Screen_Map2_21_one) ;A87C (A87C) ([8:4][A:5])
	.word (LevelData_Screen_Map2_21_two) ;A8B4 (A8B4) ([8:4][A:5])
	.word (LevelData_Screen_Map2_21_three) ;A8EC (A8EC) ([8:4][A:5])
	.word (LevelData_Screen_Map2_21) ;A924 (A924) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
LevelData_Screens_2_ForestsAndBridges_23_A:
	.byte $02,$01
	.word (LevelData_Screen_Map2_23_two) ;ACA4 (ACA4) ([8:4][A:5])
	.word (LevelData_Screen_Map2_23_one) ;AB1C (AB1C) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
LevelData_Screens_2_ForestsAndBridges_24_A:
	.byte $02,$01
	.word (LevelData_Screen_Map2_24) ;ABC4 (ABC4) ([8:4][A:5])
	.word (LevelData_Screen_Map2_7_and_2_24) ;AC6C (AC6C) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
LevelData_Screen_Map2_19_one:
	.byte $19,$18,$18,$18,$18,$18,$18,$18,$19,$2D,$2C,$23,$23,$23,$23,$23
	.byte $18,$23,$2A,$25,$24,$24,$26,$25,$25,$24,$01,$01,$01,$01,$01,$01
	.byte $01,$01,$2D,$2D,$2D,$2D,$2D,$2D,$06,$2B,$2D,$2D,$2D,$2D,$2D,$2D
	.byte $01,$01,$01,$2C,$01,$2B,$01,$2C
LevelData_Screen_Map2_19_two:
	.byte $18,$18,$18,$18,$18,$18,$18,$18,$23,$23,$2A,$29,$23,$23,$23,$23
	.byte $24,$24,$26,$30,$25,$24,$24,$01,$01,$01,$02,$0A,$01,$01,$01,$07
	.byte $2D,$2C,$23,$04,$36,$23,$23,$07,$2C,$2A,$24,$26,$04,$36,$24,$07
	.byte $01,$01,$01,$01,$01,$0B,$03,$17
LevelData_Screen_Map2_20_one:
	.byte $18,$18,$18,$18,$18,$18,$18,$18,$23,$24,$23,$23,$24,$23,$29,$23
	.byte $01,$01,$01,$01,$01,$01,$24,$24,$06,$2B,$2D,$2D,$2D,$2D,$01,$01
	.byte $06,$29,$2B,$2C,$23,$2B,$2D,$2C,$0F,$30,$29,$2A,$30,$29,$23,$2A
	.byte $17,$17,$17,$17,$17,$17,$17,$17
LevelData_Screen_Map2_20_two:
	.byte $18,$18,$18,$19,$19,$19,$19,$19,$23,$23,$23,$3C,$18,$19,$19,$19
	.byte $24,$24,$26,$00,$23,$23,$18,$19,$01,$01,$01,$25,$24,$00,$23,$18
	.byte $23,$23,$25,$01,$28,$2E,$24,$26,$25,$24,$27,$28,$0C,$28,$28,$2E
	.byte $17,$17,$17,$17,$17,$17,$17,$17
LevelData_Screen_Map2_21_one:
	.byte $19,$18,$18,$18,$18,$18,$18,$18,$19,$2D,$2D,$2D,$2D,$2C,$2B,$2D
	.byte $19,$2C,$2B,$2D,$2C,$2A,$29,$23,$18,$2A,$29,$23,$2A,$39,$39,$00
	.byte $00,$00,$39,$39,$24,$01,$01,$25,$25,$24,$01,$01,$28,$2E,$24,$27
	.byte $17,$17,$17,$17,$17,$17,$17,$17
LevelData_Screen_Map2_21_two:
	.byte $18,$18,$18,$18,$18,$18,$18,$18,$2C,$2A,$29,$23,$23,$29,$2B,$2D
	.byte $2A,$00,$00,$39,$39,$39,$29,$23,$3A,$3A,$00,$01,$01,$01,$02,$0A
	.byte $24,$26,$00,$25,$26,$00,$00,$04,$28,$2E,$24,$27,$2E,$24,$26,$17
	.byte $17,$17,$17,$17,$17,$17,$17,$19
LevelData_Screen_Map2_21_three:
	.byte $18,$18,$18,$18,$18,$18,$18,$18,$2C,$2A,$29,$23,$2A,$29,$23,$23
	.byte $2A,$00,$25,$24,$24,$17,$17,$17,$00,$00,$01,$01,$01,$18,$18,$18
	.byte $36,$33,$23,$23,$23,$23,$23,$23,$17,$39,$39,$39,$39,$30,$39,$39
	.byte $19,$17,$17,$17,$34,$34,$34,$17
LevelData_Screen_Map2_21:
	.byte $18,$18,$18,$18,$18,$18,$18,$19,$23,$23,$23,$23,$2B,$2D,$2D,$19
	.byte $17,$17,$17,$17,$29,$2B,$2D,$19,$18,$18,$18,$18,$01,$01,$23,$19
	.byte $23,$23,$23,$23,$23,$23,$00,$18,$39,$30,$39,$39,$39,$39,$39,$00
	.byte $17,$34,$34,$34,$17,$17,$17,$17
LevelData_Screen_Map2_19_three:
	.byte $06,$29,$23,$2A,$23,$29,$23,$2A,$06,$24,$24,$26,$25,$24,$24,$26
	.byte $01,$01,$01,$01,$01,$01,$01,$01,$23,$23,$23,$23,$2B,$2D,$2C,$23
	.byte $00,$25,$24,$26,$29,$23,$2A,$00,$24,$27,$28,$2E,$01,$24,$01,$24
	.byte $17,$17,$17,$31,$31,$31,$31,$31
LevelData_Screen_Map2_19_four:
	.byte $29,$23,$23,$2A,$3F,$05,$00,$19,$25,$24,$24,$3F,$05,$00,$00,$19
	.byte $01,$01,$01,$01,$01,$01,$00,$19,$23,$2B,$2D,$2C,$23,$2A,$33,$19
	.byte $00,$29,$23,$01,$02,$0A,$00,$19,$01,$24,$26,$25,$24,$04,$36,$19
	.byte $31,$31,$17,$17,$17,$17,$17,$19
LevelData_Screen_Map2_10:
	.byte $19,$01,$00,$00,$00,$21,$21,$19,$19,$21,$01,$00,$00,$3C,$19,$19
	.byte $19,$19,$21,$32,$00,$00,$3C,$19,$19,$19,$22,$3F,$03,$32,$00,$18
	.byte $18,$22,$3F,$05,$00,$33,$00,$00,$00,$00,$01,$01,$00,$3A,$3A,$00
	.byte $34,$34,$34,$34,$34,$34,$34,$17,$3B,$3B,$3B,$3B,$3B,$3B,$3B,$3B
	.byte $1F,$1F,$1F,$1F,$1F,$1F,$1F,$1F,$1F,$1F,$1E,$1F,$1F,$1F,$1E,$1F
	.byte $1A,$1B,$1C,$1D,$1A,$1B,$1C,$1D,$38,$00,$38,$00,$38,$00,$00,$38
	.byte $35,$35,$37,$35,$35,$37,$35,$35,$34,$34,$34,$34,$34,$34,$34,$34
	.byte $3B,$3B,$3B,$3B,$3B,$3B,$3B,$3B,$1F,$1F,$1F,$1F,$1F,$1F,$1F,$1F
	.byte $1F,$1F,$1E,$1F,$1F,$1F,$1E,$1F,$1A,$1B,$1C,$1D,$1A,$1B,$1C,$1D
	.byte $38,$00,$00,$00,$00,$00,$00,$38,$35,$35,$37,$35,$35,$37,$35,$35
	.byte $34,$34,$34,$34,$34,$34,$34,$34
LevelData_Screen_Map2_9_one:
	.byte $00,$41,$00,$41,$00,$41,$00,$41,$41,$12,$41,$12,$41,$12,$41,$12
	.byte $11,$11,$11,$11,$11,$11,$11,$11,$42,$42,$10,$10,$10,$10,$10,$10
	.byte $17,$17,$16,$16,$15,$15,$15,$15,$19,$19,$02,$0A,$20,$14,$14,$14
	.byte $19,$22,$00,$04,$0A,$01,$01,$17
LevelData_Screen_Map2_9_two:
	.byte $19,$00,$00,$00,$04,$36,$00,$3C,$19,$00,$00,$00,$00,$04,$36,$00
	.byte $19,$39,$39,$39,$39,$39,$04,$36,$19,$17,$17,$17,$17,$17,$17,$17
	.byte $19,$19,$19,$19,$19,$19,$19,$19,$19,$19,$19,$19,$19,$19,$19,$19
	.byte $19,$19,$19,$19,$19,$19,$19,$19
LevelData_Screen_Map2_9_three:
	.byte $18,$19,$19,$19,$19,$19,$19,$19,$00,$3C,$18,$18,$19,$19,$19,$19
	.byte $00,$00,$00,$00,$3C,$18,$18,$19,$39,$39,$39,$00,$00,$00,$00,$3C
	.byte $17,$17,$17,$39,$39,$39,$00,$00,$19,$19,$19,$17,$17,$17,$39,$39
	.byte $19,$19,$19,$19,$19,$19,$17,$17
LevelData_Screen_Map2_23_one:
	.byte $00,$41,$00,$41,$00,$41,$19,$19,$41,$12,$41,$12,$41,$12,$19,$19
	.byte $11,$11,$11,$11,$11,$11,$18,$18,$10,$10,$10,$10,$10,$10,$42,$00
	.byte $15,$15,$15,$16,$16,$16,$17,$17,$14,$14,$14,$17,$17,$17,$19,$19
	.byte $17,$17,$17,$19,$19,$19,$19,$19,$00,$41,$00,$41,$00,$41,$00,$41
	.byte $41,$12,$41,$12,$41,$12,$41,$12,$11,$11,$11,$11,$11,$11,$11,$11
	.byte $10,$10,$10,$10,$10,$42,$42,$42,$15,$15,$16,$16,$16,$17,$17,$17
	.byte $14,$14,$01,$40,$01,$19,$19,$19,$17,$31,$31,$31,$31,$19,$19,$19
	.byte $00,$41,$00,$41,$00,$41,$00,$41,$41,$12,$41,$12,$41,$12,$41,$12
	.byte $11,$11,$11,$11,$11,$11,$11,$11,$42,$42,$10,$10,$10,$10,$10,$10
	.byte $17,$17,$16,$15,$15,$15,$15,$15,$19,$19,$17,$14,$20,$20,$14,$14
	.byte $19,$19,$19,$34,$34,$34,$34,$17
LevelData_Screen_Map2_24:
	.byte $00,$41,$00,$41,$00,$41,$00,$41,$41,$12,$41,$12,$41,$12,$41,$12
	.byte $11,$11,$11,$11,$11,$11,$11,$11,$42,$42,$42,$10,$10,$10,$10,$10
	.byte $17,$17,$17,$16,$16,$16,$15,$15,$19,$19,$19,$17,$17,$17,$14,$14
	.byte $19,$19,$19,$19,$19,$19,$17,$17
LevelData_Screen_Map2_7_one:
	.byte $00,$41,$00,$41,$00,$41,$00,$41,$41,$12,$41,$12,$41,$12,$12,$12
	.byte $11,$11,$11,$11,$11,$11,$11,$11,$10,$10,$42,$17,$17,$17,$17,$17
	.byte $15,$16,$17,$22,$43,$43,$43,$43,$14,$0C,$43,$39,$39,$40,$39,$3D
	.byte $17,$17,$17,$17,$17,$31,$17,$31,$00,$41,$00,$41,$00,$41,$00,$41
	.byte $12,$12,$41,$12,$41,$12,$41,$12,$11,$11,$11,$11,$11,$11,$11,$11
	.byte $17,$17,$02,$0A,$01,$17,$42,$42,$43,$43,$00,$04,$36,$3C,$17,$17
	.byte $39,$3D,$39,$39,$04,$36,$43,$19,$17,$17,$17,$17,$17,$17,$17,$19
LevelData_Screen_Map2_7_and_2_24:
	.byte $00,$41,$00,$41,$00,$41,$00,$41,$41,$12,$41,$12,$41,$12,$41,$12
	.byte $11,$11,$11,$11,$11,$11,$11,$11,$10,$10,$10,$10,$10,$10,$10,$10
	.byte $15,$15,$16,$16,$16,$16,$15,$15,$14,$20,$17,$17,$17,$17,$20,$14
	.byte $17,$17,$19,$19,$19,$19,$17,$17
LevelData_Screen_Map2_23_two:
	.byte $00,$41,$00,$41,$00,$41,$00,$41,$41,$12,$41,$12,$41,$12,$41,$12
	.byte $11,$11,$11,$11,$11,$11,$11,$11,$10,$10,$10,$10,$10,$10,$10,$10
	.byte $15,$15,$15,$15,$15,$15,$15,$15,$14,$14,$14,$14,$14,$14,$14,$14
	.byte $17,$17,$17,$17,$17,$17,$17,$17
LevelData_Screen_Map2_7_two:
	.byte $00,$41,$00,$41,$00,$41,$00,$41,$41,$12,$41,$12,$41,$12,$41,$12
	.byte $11,$11,$11,$11,$11,$11,$11,$11,$17,$17,$42,$42,$42,$42,$42,$42
	.byte $43,$43,$01,$01,$02,$0A,$01,$01,$39,$3D,$00,$3E,$00,$04,$36,$39
	.byte $17,$31,$31,$31,$31,$17,$17,$17
LevelData_Screen_Map2_8:
	.byte $19,$19,$00,$41,$00,$41,$00,$41,$19,$19,$41,$12,$41,$12,$41,$12
	.byte $19,$19,$11,$11,$11,$11,$11,$11,$18,$18,$10,$10,$42,$42,$42,$10
	.byte $00,$15,$15,$16,$01,$01,$01,$16,$39,$20,$14,$01,$39,$3D,$40,$01
	.byte $17,$17,$44,$34,$34,$34,$34,$34,$00,$41,$00,$41,$00,$41,$00,$41
	.byte $41,$12,$41,$12,$41,$12,$41,$12,$11,$11,$11,$11,$11,$11,$11,$11
	.byte $10,$10,$10,$10,$10,$10,$10,$10,$15,$15,$15,$15,$15,$15,$15,$15
	.byte $14,$14,$14,$14,$14,$14,$14,$14,$17,$17,$31,$31,$31,$31,$31,$31
	.byte $00,$41,$00,$41,$00,$41,$00,$41,$41,$12,$41,$12,$41,$12,$41,$12
	.byte $11,$11,$11,$11,$11,$11,$11,$11,$10,$10,$10,$10,$10,$10,$42,$42
	.byte $15,$15,$15,$15,$15,$16,$17,$17,$14,$14,$14,$14,$14,$17,$19,$19
	.byte $31,$31,$31,$31,$17,$19,$19,$19,$15,$15,$15,$15,$15,$15,$15,$15
	.byte $14,$14,$14,$14,$14,$14,$14,$14,$2B,$2D,$2C,$2B,$2C,$2B,$2D,$2C
	.byte $29,$23,$2A,$0B,$03,$01,$23,$01,$00,$00,$3F,$05,$00,$23,$00,$23
	.byte $39,$3F,$05,$39,$40,$24,$3D,$40,$17,$17,$13,$31,$31,$31,$31,$31
	.byte $15,$15,$15,$15,$15,$15,$15,$15,$14,$14,$14,$14,$14,$14,$14,$14
	.byte $23,$2B,$2D,$2D,$2D,$2D,$2D,$2C,$00,$01,$23,$01,$2B,$01,$2C,$01
	.byte $25,$24,$26,$23,$29,$23,$2A,$23,$27,$28,$2E,$24,$40,$3D,$39,$3E
	.byte $31,$31,$31,$31,$31,$31,$31,$31,$15,$15,$15,$15,$15,$15,$15,$15
	.byte $14,$14,$14,$14,$14,$14,$14,$14,$2B,$2D,$2D,$2D,$2D,$2D,$2D,$2C
	.byte $29,$2B,$2D,$2C,$2B,$2C,$23,$2A,$00,$29,$23,$2A,$29,$2A,$00,$00
	.byte $39,$3D,$24,$40,$24,$39,$39,$39,$31,$31,$31,$31,$31,$13,$17,$17
LevelData_ScreenNumbers_4_Wastelands:
	.word (LevelData_ScreenNumbers_4_Wastelands_0) ;AE6C (AE6C) ()
	.word (LevelData_ScreenNumbers_4_Wastelands_1) ;AE79 (AE79) ()
	.word (LevelData_ScreenNumbers_4_Wastelands_2) ;AE86 (AE86) ()
	.word (LevelData_ScreenNumbers_4_Wastelands_3) ;AE91 (AE91) ()
LevelData_ScreenNumbers_4_Wastelands_0:
	.word (LevelData_ScreenNumbers_4_Wastelands_0_AEA5) ;AEA5 (AEA5) ()
	.byte $01,$00,$00,$00,$FF,$01,$03
	.word (LevelData_ScreenNumbers_4_Wastelands_0_0) ;AE9E (AE9E) ()
	.word (LevelData_ScreenNumbers_4_Wastelands_0_1) ;AE9F (AE9F) ()
LevelData_ScreenNumbers_4_Wastelands_1:
	.word (LevelData_ScreenNumbers_4_Wastelands_1_AEA8) ;AEA8 (AEA8) ()
	.byte $01,$FF,$01,$04,$FF,$00,$04
	.word (LevelData_ScreenNumbers_4_Wastelands_1_0) ;AEA4 (AEA4) ()
	.word (LevelData_ScreenNumbers_4_Wastelands_1_1) ;AEA0 (AEA0) ()
LevelData_ScreenNumbers_4_Wastelands_2:
	.word (LevelData_ScreenNumbers_4_Wastelands_2_AEAA) ;AEAA (AEAA) ()
	.byte $00,$FF,$01,$04,$FF,$00,$05
	.word (LevelData_ScreenNumbers_4_Wastelands_2_0) ;AEA1 (AEA1) ()
LevelData_ScreenNumbers_4_Wastelands_3:
	.word (LevelData_ScreenNumbers_4_Wastelands_3_AEAB) ;AEAB (AEAB) ()
	.byte $01,$FF,$00,$06,$FF,$05,$00
	.word (LevelData_ScreenNumbers_4_Wastelands_3_0) ;AEA2 (AEA2) ()
	.word (LevelData_ScreenNumbers_4_Wastelands_3_1) ;AEA3 (AEA3) ()
LevelData_ScreenNumbers_4_Wastelands_0_0:
	.byte $04
LevelData_ScreenNumbers_4_Wastelands_0_1:
	.byte $05
LevelData_ScreenNumbers_4_Wastelands_1_1:
	.byte $03
LevelData_ScreenNumbers_4_Wastelands_2_0:
	.byte $00
LevelData_ScreenNumbers_4_Wastelands_3_0:
	.byte $01
LevelData_ScreenNumbers_4_Wastelands_3_1:
	.byte $02
LevelData_ScreenNumbers_4_Wastelands_1_0:
	.byte $07
LevelData_ScreenNumbers_4_Wastelands_0_AEA5:
	.byte $00,$00,$00
LevelData_ScreenNumbers_4_Wastelands_1_AEA8:
	.byte $00,$02
LevelData_ScreenNumbers_4_Wastelands_2_AEAA:
	.byte $00
LevelData_ScreenNumbers_4_Wastelands_3_AEAB:
	.byte $00,$00
LevelData_Palettes_4_Wastelands:
	.word (LevelData_Palettes_4_Wastelands_0_Day) ;AEBD (AEBD) ()
	.word (LevelData_Palettes_4_Wastelands_0_Night) ;AECD (AECD) ()
	.word (LevelData_Palettes_4_Wastelands_1_Day) ;AEC3 (AEC3) ()
	.word (LevelData_Palettes_4_Wastelands_1_Night) ;AED3 (AED3) ()
	.word (LevelData_Palettes_4_Wastelands_2_Day) ;AEC7 (AEC7) ()
	.word (LevelData_Palettes_4_Wastelands_2_Night) ;AED7 (AED7) ()
	.word (LevelData_Palettes_4_Wastelands_3_Day) ;AEC9 (AEC9) ()
	.word (LevelData_Palettes_4_Wastelands_3_Night) ;AED9 (AED9) ()
LevelData_Palettes_4_Wastelands_0_Day:
	.byte $3F,$44,$1F,$44,$1F,$44
LevelData_Palettes_4_Wastelands_1_Day:
	.byte $3F,$44,$3F,$44
LevelData_Palettes_4_Wastelands_2_Day:
	.byte $40,$45
LevelData_Palettes_4_Wastelands_3_Day:
	.byte $42,$46,$20,$46
LevelData_Palettes_4_Wastelands_0_Night:
	.byte $41,$44,$21,$44,$21,$44
LevelData_Palettes_4_Wastelands_1_Night:
	.byte $41,$44,$41,$44
LevelData_Palettes_4_Wastelands_2_Night:
	.byte $41,$45
LevelData_Palettes_4_Wastelands_3_Night:
	.byte $43,$46,$21,$46
LevelData_Screens_4_Wastelands:
	.word (LevelData_Screens_4_Wastelands_0_A) ;AEFE (AEFE) ()
	.word (LevelData_Stairs_4_Wastelands_0_1_2_3_4_5_6_7) ;AEFD (AEFD) ()
	.word (LevelData_Screens_4_Wastelands_1_A) ;AF10 (AF10) ()
	.word (LevelData_Stairs_4_Wastelands_0_1_2_3_4_5_6_7) ;AEFD (AEFD) ()
	.word (LevelData_Screens_4_Wastelands_2_A) ;AF22 (AF22) ()
	.word (LevelData_Stairs_4_Wastelands_0_1_2_3_4_5_6_7) ;AEFD (AEFD) ()
	.word (LevelData_Screens_4_Wastelands_3_A) ;AF34 (AF34) ()
	.word (LevelData_Stairs_4_Wastelands_0_1_2_3_4_5_6_7) ;AEFD (AEFD) ()
	.word (LevelData_Screens_4_Wastelands_4_A) ;AF46 (AF46) ()
	.word (LevelData_Stairs_4_Wastelands_0_1_2_3_4_5_6_7) ;AEFD (AEFD) ()
	.word (LevelData_Screens_4_Wastelands_5_6_A) ;AF58 (AF58) ()
	.word (LevelData_Stairs_4_Wastelands_0_1_2_3_4_5_6_7) ;AEFD (AEFD) ()
	.word (LevelData_Screens_4_Wastelands_5_6_A) ;AF58 (AF58) ()
	.word (LevelData_Stairs_4_Wastelands_0_1_2_3_4_5_6_7) ;AEFD (AEFD) ()
	.word (LevelData_Screens_4_Wastelands_7_A) ;AF6A (AF6A) ()
	.word (LevelData_Stairs_4_Wastelands_0_1_2_3_4_5_6_7) ;AEFD (AEFD) ()
LevelData_Stairs_4_Wastelands_0_1_2_3_4_5_6_7:
	.byte $FF
LevelData_Screens_4_Wastelands_0_A:
	.byte $04,$01
	.word (LevelData_Screen_Map4_0_and_4_3_and_4_4) ;B018 (B018) ([8:4][A:5])
	.word (LevelData_Screen_Map4_0_and_4_4) ;B050 (B050) ([8:4][A:5])
	.word (LevelData_Screen_Map4_0) ;B0F8 (B0F8) ([8:4][A:5])
	.word (LevelData_Screen_Map4_0_and_4_3) ;AFE0 (AFE0) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
LevelData_Screens_4_Wastelands_1_A:
	.byte $04,$01
	.word (LevelData_Screen_Map4_1_one) ;B130 (B130) ([8:4][A:5])
	.word (LevelData_Screen_Map4_1_two) ;B168 (B168) ([8:4][A:5])
	.word (LevelData_Screen_Map4_1_three) ;B1A0 (B1A0) ([8:4][A:5])
	.word (LevelData_Screen_Map4_1_four) ;B1D8 (B1D8) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
LevelData_Screens_4_Wastelands_2_A:
	.byte $04,$01
	.word (LevelData_Screen_Map4_2) ;B248 (B248) ([8:4][A:5])
	.word (LevelData_Screen_Map2_25_and_4_2) ;F957 (1F957) ([8:4][A:5])
	.word (LevelData_Screen_Map2_25_and_4_2) ;F957 (1F957) ([8:4][A:5])
	.word (LevelData_Screen_Map2_4_and_2_11_and_2_25_and_4_2) ;F91F (1F91F) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
LevelData_Screens_4_Wastelands_3_A:
	.byte $04,$01
	.word (LevelData_Screen_Map4_3_one) ;AF70 (AF70) ([8:4][A:5])
	.word (LevelData_Screen_Map4_3_two) ;AFA8 (AFA8) ([8:4][A:5])
	.word (LevelData_Screen_Map4_0_and_4_3) ;AFE0 (AFE0) ([8:4][A:5])
	.word (LevelData_Screen_Map4_0_and_4_3_and_4_4) ;B018 (B018) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
LevelData_Screens_4_Wastelands_4_A:
	.byte $04,$01
	.word (LevelData_Screen_Map4_4_two) ;B0C0 (B0C0) ([8:4][A:5])
	.word (LevelData_Screen_Map4_0_and_4_4) ;B050 (B050) ([8:4][A:5])
	.word (LevelData_Screen_Map4_4_one) ;B088 (B088) ([8:4][A:5])
	.word (LevelData_Screen_Map4_0_and_4_3_and_4_4) ;B018 (B018) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
LevelData_Screens_4_Wastelands_5_6_A:
	.byte $04,$01
	.word (LevelData_Screen_Map2_16_17_and_2_18_and_3_10_and_4_5_6) ;F877 (1F877) ([8:4][A:5])
	.word (LevelData_Screen_Map2_16_17_and_2_18_and_4_5_6) ;F83F (1F83F) ([8:4][A:5])
	.word (LevelData_Screen_Map2_16_17_and_2_18_and_4_5_6) ;F83F (1F83F) ([8:4][A:5])
	.word (LevelData_Screen_Map2_16_17_and_2_18_and_3_10_and_4_5_6) ;F877 (1F877) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
LevelData_Screens_4_Wastelands_7_A:
	.byte $01,$01
	.word (LevelData_Screen_Map4_7) ;B210 (B210) ([8:4][A:5])
	.word (LevelData_Screen_Map4_7) ;B210 (B210) ([8:4][A:5])
LevelData_Screen_Map4_3_one:
	.byte $19,$3B,$3B,$3B,$3B,$3B,$3B,$3B,$19,$1F,$1F,$1F,$1F,$1F,$1F,$1F
	.byte $19,$1F,$1E,$1F,$1F,$1F,$1E,$1F,$19,$1B,$1C,$1D,$1A,$1B,$1C,$1D
	.byte $19,$17,$17,$28,$11,$12,$13,$11,$19,$19,$19,$3D,$15,$10,$16,$15
	.byte $19,$19,$19,$19,$17,$17,$17,$17
LevelData_Screen_Map4_3_two:
	.byte $3B,$3B,$3B,$3B,$3B,$3B,$3B,$3B,$1F,$1F,$1F,$1F,$1F,$1F,$1F,$1F
	.byte $1F,$1F,$1E,$1F,$1F,$1F,$1E,$1F,$1A,$1B,$1C,$1D,$1A,$1B,$1C,$1D
	.byte $12,$28,$31,$28,$13,$28,$24,$20,$10,$26,$16,$23,$16,$23,$27,$10
	.byte $17,$34,$34,$34,$34,$34,$34,$17
LevelData_Screen_Map4_0_and_4_3:
	.byte $3B,$3B,$3B,$3B,$3B,$3B,$3B,$3B,$1F,$1F,$1F,$1F,$1F,$1F,$1F,$1F
	.byte $1F,$1F,$1E,$1F,$1F,$1F,$1E,$1F,$1A,$1B,$1C,$1D,$1A,$1B,$1C,$1D
	.byte $28,$13,$11,$12,$28,$28,$11,$20,$36,$16,$15,$10,$36,$17,$27,$10
	.byte $21,$17,$17,$17,$21,$19,$17,$17
LevelData_Screen_Map4_0_and_4_3_and_4_4:
	.byte $3B,$3B,$3B,$3B,$3B,$3B,$3B,$3B,$1F,$1F,$1F,$1F,$1F,$1F,$1F,$1F
	.byte $1F,$1F,$1E,$1F,$1F,$1F,$1E,$1F,$1A,$1B,$1C,$1D,$1A,$1B,$1C,$1D
	.byte $3C,$14,$28,$31,$11,$12,$28,$28,$25,$10,$36,$16,$15,$10,$36,$23
	.byte $17,$17,$21,$17,$17,$17,$21,$17
LevelData_Screen_Map4_0_and_4_4:
	.byte $3B,$3B,$3B,$3B,$3B,$3B,$3B,$3B,$1F,$1F,$1F,$1F,$1F,$1F,$1F,$1F
	.byte $1F,$1F,$1E,$1F,$1F,$1F,$1E,$1F,$1A,$1B,$1C,$1D,$1A,$1B,$1C,$1D
	.byte $13,$11,$20,$28,$28,$31,$11,$12,$16,$27,$10,$36,$17,$17,$17,$10
	.byte $17,$17,$17,$21,$19,$19,$19,$17
LevelData_Screen_Map4_4_one:
	.byte $3B,$3B,$3B,$3B,$3B,$3B,$3B,$3B,$1F,$1F,$1F,$1F,$1F,$1F,$1F,$1F
	.byte $1F,$1F,$1E,$1F,$1F,$1F,$1E,$1F,$1A,$1B,$1C,$1D,$1A,$1B,$1C,$1D
	.byte $28,$13,$11,$12,$31,$28,$24,$20,$23,$16,$36,$10,$16,$36,$15,$10
	.byte $17,$34,$21,$17,$17,$21,$34,$17
LevelData_Screen_Map4_4_two:
	.byte $19,$3B,$3B,$3B,$3B,$3B,$3B,$3B,$19,$1F,$1F,$1F,$1F,$1F,$1F,$1F
	.byte $19,$1F,$1E,$1F,$1F,$1F,$1E,$1F,$19,$1B,$1C,$1D,$1A,$1B,$1C,$1D
	.byte $19,$17,$28,$13,$28,$24,$20,$28,$19,$19,$17,$16,$23,$27,$10,$26
	.byte $19,$19,$19,$17,$17,$17,$17,$17
LevelData_Screen_Map4_0:
	.byte $3B,$3B,$3B,$3B,$3B,$3B,$3B,$3B,$1F,$1F,$1F,$1F,$1F,$1F,$1F,$1F
	.byte $1F,$1F,$1E,$1F,$1F,$1F,$1E,$1F,$1A,$1B,$1C,$1D,$1A,$1B,$1C,$1D
	.byte $11,$20,$31,$3C,$14,$11,$12,$28,$15,$10,$16,$15,$10,$15,$10,$26
	.byte $17,$17,$17,$17,$17,$17,$17,$17
LevelData_Screen_Map4_1_one:
	.byte $3B,$3B,$3B,$3B,$3B,$3B,$3B,$3B,$1F,$1F,$1F,$1F,$1F,$1F,$1F,$1F
	.byte $1F,$1F,$1E,$1F,$1F,$1F,$1E,$1F,$1A,$1B,$1C,$1D,$1A,$1B,$1C,$1D
	.byte $35,$35,$35,$35,$35,$35,$35,$35,$29,$30,$2C,$2E,$2F,$2C,$29,$2A
	.byte $17,$17,$17,$17,$17,$17,$17,$17
LevelData_Screen_Map4_1_two:
	.byte $3B,$3B,$3B,$3B,$3B,$3B,$3B,$3B,$1F,$1F,$1F,$1F,$1F,$1F,$1F,$1F
	.byte $1F,$1F,$1E,$1F,$1F,$1F,$1E,$1F,$1A,$1B,$1C,$1D,$1A,$1B,$1C,$1D
	.byte $35,$35,$35,$35,$35,$35,$35,$35,$30,$2C,$2E,$2C,$29,$2F,$2C,$2A
	.byte $17,$17,$17,$17,$17,$17,$17,$17
LevelData_Screen_Map4_1_three:
	.byte $3B,$3B,$3B,$3B,$3B,$3B,$3B,$3B,$1F,$1F,$1F,$1F,$1F,$1F,$1F,$1F
	.byte $1F,$1F,$1E,$1F,$1F,$1F,$1E,$1F,$1A,$1B,$1C,$1D,$1A,$1B,$1C,$1D
	.byte $35,$35,$35,$35,$35,$35,$35,$35,$30,$29,$2A,$2F,$29,$2A,$2C,$2A
	.byte $17,$17,$3A,$3A,$3A,$17,$17,$17
LevelData_Screen_Map4_1_four:
	.byte $3B,$3B,$3B,$3B,$3B,$3B,$3B,$3B,$1F,$1F,$1F,$1F,$1F,$1F,$1F,$1F
	.byte $1F,$1F,$1E,$1F,$1F,$1F,$1E,$1F,$1A,$1B,$1C,$1D,$1A,$1B,$1C,$1D
	.byte $35,$35,$35,$35,$35,$35,$35,$35,$2F,$29,$2F,$29,$2C,$2A,$2F,$29
	.byte $3A,$3A,$3A,$17,$17,$17,$17,$17
LevelData_Screen_Map4_7:
	.byte $19,$19,$19,$19,$19,$19,$19,$19,$19,$19,$19,$19,$19,$19,$19,$19
	.byte $19,$19,$19,$19,$19,$19,$19,$19,$19,$19,$19,$19,$19,$19,$19,$19
	.byte $19,$19,$19,$19,$19,$19,$19,$19,$19,$19,$19,$19,$19,$19,$19,$19
	.byte $19,$19,$19,$19,$19,$19,$19,$19
LevelData_Screen_Map4_2:
	.byte $3B,$3B,$3B,$3B,$3B,$3B,$3B,$3B,$1F,$1F,$1F,$1F,$1F,$1F,$1F,$1F
	.byte $1F,$1F,$1E,$1F,$1F,$1F,$1E,$1F,$1A,$1B,$1C,$1D,$1A,$1B,$1C,$1D
	.byte $00,$00,$0E,$38,$38,$38,$38,$38,$39,$39,$17,$17,$32,$35,$35,$37
	.byte $17,$17,$19,$19,$34,$34,$34,$34
LevelData_ScreenNumbers_3_Wilderness:
	.word (LevelData_ScreenNumbers_3_Wilderness_0carmillaCemetery) ;B372 (B372) ()
	.word (LevelData_ScreenNumbers_3_Wildernesss_1) ;B37F (B37F) ()
	.word (LevelData_ScreenNumbers_3_Wildernesss_2) ;B38A (B38A) ()
	.word (LevelData_ScreenNumbers_3_Wildernesss_3) ;B7C7 (B7C7) ()
	.word (LevelData_ScreenNumbers_3_Wildernesss_4) ;B397 (B397) ()
LevelData_Palettes_3_Wilderness:
	.word (LevelData_Palettes_3_Wilderness_0carmillaCemetery_Day) ;B3B2 (B3B2) ()
	.word (LevelData_Palettes_3_Wilderness_0carmillaCemetery_Night) ;B3C0 (B3C0) ()
	.word (LevelData_Palettes_3_Wilderness_1strigoiCemetery_Day) ;B3B6 (B3B6) ()
	.word (LevelData_Palettes_3_Wilderness_1strigoiCemetery_Night) ;B3C4 (B3C4) ()
	.word (LevelData_Palettes_3_Wildernesss_2_Day) ;B3B8 (B3B8) ()
	.word (LevelData_Palettes_3_Wildernesss_2_Night) ;B3C6 (B3C6) ()
	.word (LevelData_Palettes_3_Wildernesss_3_Day) ;B7E4 (B7E4) ()
	.word (LevelData_Palettes_3_Wildernesss_3_Night) ;B7EE (B7EE) ()
	.word (LevelData_Palettes_3_Wildernesss_4_Day) ;B3BE (B3BE) ()
	.word (LevelData_Palettes_3_Wildernesss_4_Night) ;B3CC (B3CC) ()
LevelData_Screens_3_Wilderness:
	.word (LevelData_Screens_3_Wilderness_0carmillaCemetery_A) ;B3EF (B3EF) ()
	.word (LevelData_Stairs_3_Wilderness_0carmillaCemetery) ;B3EE (B3EE) ()
	.word (LevelData_Screens_3_Wilderness_1strigoiCemetery_A) ;B401 (B401) ()
	.word (LevelData_Stairs_3_Wilderness_1strigoiCemetery) ;B3CE (B3CE) ()
	.word (LevelData_Screens_3_Wildernesss_2_A) ;B802 (B802) ()
	.word (LevelData_Stairs_3_Wildernesss_2) ;B7F8 (B7F8) ()
	.word (LevelData_Screens_3_Wildernesss_3_A) ;B814 (B814) ()
	.word (LevelData_Stairs_3_Wildernesss_3_8_10) ;B801 (B801) ()
	.word (LevelData_Screens_3_Wildernesss_4_A) ;B826 (B826) ()
	.word (LevelData_Stairs_3_Wildernesss_4) ;B7FD (B7FD) ()
	.word (LevelData_Screens_3_Wildernesss_5_A) ;B413 (B413) ()
	.word (LevelData_Stairs_3_Wildernesss_5) ;B3D3 (B3D3) ()
	.word (LevelData_Screens_3_Wildernesss_6_A) ;B425 (B425) ()
	.word (LevelData_Stairs_3_Wildernesss_6) ;B3D8 (B3D8) ()
	.word (LevelData_Screens_3_Wildernesss_7_A) ;B433 (B433) ()
	.word (LevelData_Stairs_3_Wildernesss_7) ;B3E5 (B3E5) ()
	.word (LevelData_Screens_3_Wildernesss_8_A) ;B82E (B82E) ()
	.word (LevelData_Stairs_3_Wildernesss_3_8_10) ;B801 (B801) ()
	.word (LevelData_Screens_3_Wildernesss_9_A) ;B43D (B43D) ()
	.word (LevelData_Stairs_3_Wildernesss_9) ;B3EA (B3EA) ()
	.word (LevelData_Screens_3_Wildernesss_10_A) ;B850 (B850) ()
	.word (LevelData_Stairs_3_Wildernesss_3_8_10) ;B801 (B801) ()
LevelData_Screen_Map3_1_and_3_2_one:
	.byte $3B,$3B,$3B,$3B,$3B,$3B,$3B,$3B,$1F,$1F,$1F,$1F,$1F,$1F,$1F,$1F
	.byte $1F,$1F,$1E,$1F,$1F,$1F,$1E,$1F,$1A,$1B,$1C,$1D,$1A,$1B,$20,$1D
	.byte $15,$15,$15,$15,$14,$15,$12,$15,$40,$40,$40,$40,$11,$40,$11,$40
	.byte $17,$17,$17,$31,$31,$31,$31,$31
LevelData_Screen_Map3_1_and_3_2_two:
	.byte $3B,$3B,$3B,$3B,$3B,$3B,$3B,$3B,$1F,$1F,$1F,$1F,$1F,$1F,$1F,$1F
	.byte $1F,$1F,$1E,$1F,$1F,$1F,$1E,$1F,$1A,$1B,$20,$1D,$1A,$1B,$1C,$1D
	.byte $14,$15,$12,$15,$14,$15,$14,$42,$11,$40,$11,$40,$41,$40,$11,$44
	.byte $31,$31,$31,$31,$31,$31,$31,$31
LevelData_Screen_Map3_3_and_3_9:
	.byte $3B,$3B,$3B,$3B,$3B,$3B,$3B,$3B,$1F,$1F,$1F,$1F,$1F,$1F,$1F,$1F
	.byte $1F,$1F,$1E,$1F,$1F,$1F,$1E,$1F,$1A,$1B,$20,$1D,$1A,$1B,$20,$1D
	.byte $14,$14,$12,$16,$14,$14,$12,$14,$41,$11,$41,$10,$41,$11,$11,$41
	.byte $17,$17,$17,$17,$17,$17,$17,$17
LevelData_ScreenNumbers_3_Wilderness_0carmillaCemetery:
	.word (LevelData_ScreenNumbers_3_Wilderness_0carmillaCemetery_B3AC) ;B3AC (B3AC) ()
	.byte $01,$FF,$00,$02,$FF,$01,$00
	.word (LevelData_ScreenNumbers_3_Wilderness_0_0carmillaCemetery) ;B3A2 (B3A2) ()
	.word (LevelData_ScreenNumbers_3_Wilderness_0_1jomaSwampLeft) ;B3A3 (B3A3) ()
LevelData_ScreenNumbers_3_Wildernesss_1:
	.word (LevelData_ScreenNumbers_3_Wildernesss_1_B3AE) ;B3AE (B3AE) ()
	.byte $00,$00,$00,$00,$00,$00,$02
	.word (LevelData_ScreenNumbers_3_Wilderness_1_0strigoiCemetery) ;B3A4 (B3A4) ()
LevelData_ScreenNumbers_3_Wildernesss_2:
	.word (LevelData_ScreenNumbers_3_Wildernesss_2_B3AF) ;B3AF (B3AF) ()
	.byte $01,$00,$00,$04,$FF,$00,$03
	.word (LevelData_ScreenNumbers_3_Wildernesss_2_0) ;B3A5 (B3A5) ()
	.word (LevelData_ScreenNumbers_3_Wildernesss_2_1) ;B3AA (B3AA) ()
LevelData_ScreenNumbers_3_Wildernesss_4:
	.word (LevelData_ScreenNumbers_3_Wildernesss_4_B3B1) ;B3B1 (B3B1) ()
	.byte $00,$FF,$00,$04,$00,$00,$02
	.word (LevelData_ScreenNumbers_3_Wildernesss_4_0) ;B3AB (B3AB) ()
LevelData_ScreenNumbers_3_Wilderness_0_0carmillaCemetery:
	.byte $00
LevelData_ScreenNumbers_3_Wilderness_0_1jomaSwampLeft:
	.byte $01
LevelData_ScreenNumbers_3_Wilderness_1_0strigoiCemetery:
	.byte $05
LevelData_ScreenNumbers_3_Wildernesss_2_0:
	.byte $FD,$06,$00,$00,$01
LevelData_ScreenNumbers_3_Wildernesss_2_1:
	.byte $07
LevelData_ScreenNumbers_3_Wildernesss_4_0:
	.byte $09
LevelData_ScreenNumbers_3_Wilderness_0carmillaCemetery_B3AC:
	.byte $00,$00
LevelData_ScreenNumbers_3_Wildernesss_1_B3AE:
	.byte $01
LevelData_ScreenNumbers_3_Wildernesss_2_B3AF:
	.byte $00,$02
LevelData_ScreenNumbers_3_Wildernesss_4_B3B1:
	.byte $00
LevelData_Palettes_3_Wilderness_0carmillaCemetery_Day:
	.byte $29,$35,$2C,$35
LevelData_Palettes_3_Wilderness_1strigoiCemetery_Day:
	.byte $2A,$36
LevelData_Palettes_3_Wildernesss_2_Day:
	.byte $2D,$36,$2D,$36,$2D,$36
LevelData_Palettes_3_Wildernesss_4_Day:
	.byte $2D,$36
LevelData_Palettes_3_Wilderness_0carmillaCemetery_Night:
	.byte $2B,$35,$3D,$35
LevelData_Palettes_3_Wilderness_1strigoiCemetery_Night:
	.byte $2B,$36
LevelData_Palettes_3_Wildernesss_2_Night:
	.byte $3D,$36,$3D,$36,$3D,$36
LevelData_Palettes_3_Wildernesss_4_Night:
	.byte $3D,$36
LevelData_Stairs_3_Wilderness_1strigoiCemetery:
	.byte $09,$92,$9D,$26,$FF
LevelData_Stairs_3_Wildernesss_5:
	.byte $29,$0A,$B5,$16,$FF
LevelData_Stairs_3_Wildernesss_6:
	.byte $37,$92,$AB,$9E,$31,$1E,$B9,$26,$33,$A6,$AB,$AE,$FF
LevelData_Stairs_3_Wildernesss_7:
	.byte $51,$0E,$D9,$16,$FF
LevelData_Stairs_3_Wildernesss_9:
	.byte $09,$12,$9D,$26
LevelData_Stairs_3_Wilderness_0carmillaCemetery:
	.byte $FF
LevelData_Screens_3_Wilderness_0carmillaCemetery_A:
	.byte $04,$01
	.word (LevelData_Screen_Map3_0_one) ;B447 (B447) ([8:4][A:5])
	.word (LevelData_Screen_Map3_0_two) ;B47F (B47F) ([8:4][A:5])
	.word (LevelData_Screen_Map3_0_three) ;B4B7 (B4B7) ([8:4][A:5])
	.word (LevelData_Screen_Map3_0_one) ;B447 (B447) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
LevelData_Screens_3_Wilderness_1strigoiCemetery_A:
	.byte $04,$01
	.word (LevelData_Screen_Map3_1_and_3_2_one) ;B2CA (B2CA) ([8:4][A:5])
	.word (LevelData_Screen_Map3_1_two) ;B6E7 (B6E7) ([8:4][A:5])
	.word (LevelData_Screen_Map3_1_and_3_2_two) ;B302 (B302) ([8:4][A:5])
	.word (LevelData_Screen_Map3_1_one) ;B6AF (B6AF) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
LevelData_Screens_3_Wildernesss_5_A:
	.byte $04,$01
	.word (LevelData_Screen_Map3_5_one) ;B4EF (B4EF) ([8:4][A:5])
	.word (LevelData_Screen_Map3_5_two) ;B527 (B527) ([8:4][A:5])
	.word (LevelData_Screen_Map3_5_three) ;B55F (B55F) ([8:4][A:5])
	.word (LevelData_Screen_Map3_5_four) ;B597 (B597) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
LevelData_Screens_3_Wildernesss_6_A:
	.byte $02,$02
	.word (LevelData_Screen_Map3_6_four) ;B71F (B71F) ([8:4][A:5])
	.word (LevelData_Screen_Map3_6_three) ;B63F (B63F) ([8:4][A:5])
	.word (LevelData_Screen_Map3_6_two) ;B607 (B607) ([8:4][A:5])
	.word (LevelData_Screen_Map3_6_one) ;B5CF (B5CF) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
LevelData_Screens_3_Wildernesss_7_A:
	.byte $02,$01
	.word (LevelData_Screen_Map3_7_one) ;B677 (B677) ([8:4][A:5])
	.word (LevelData_Screen_Map3_7_two) ;B757 (B757) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
LevelData_Screens_3_Wildernesss_9_A:
	.byte $02,$01
	.word (LevelData_Screen_Map3_3_and_3_9) ;B33A (B33A) ([8:4][A:5])
	.word (LevelData_Screen_Map3_9) ;B78F (B78F) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
LevelData_Screen_Map3_0_one:
	.byte $3B,$3B,$3B,$3B,$3B,$3B,$3B,$3B,$1F,$1F,$1F,$1F,$1F,$1F,$1F,$1F
	.byte $1F,$1F,$1E,$1F,$1F,$1F,$1E,$1F,$1A,$1B,$3E,$1D,$1A,$1B,$3E,$1D
	.byte $38,$38,$3D,$37,$38,$13,$3D,$38,$27,$23,$27,$2E,$23,$2E,$30,$27
	.byte $17,$17,$17,$17,$17,$17,$17,$17
LevelData_Screen_Map3_0_two:
	.byte $3B,$3B,$3B,$3B,$3B,$3B,$3B,$3B,$1F,$1F,$1F,$1F,$1F,$1F,$1F,$1F
	.byte $1F,$1F,$1E,$1F,$1F,$1F,$1E,$1F,$1A,$1B,$3E,$1D,$1A,$1B,$3E,$1D
	.byte $38,$13,$3D,$13,$3A,$39,$3D,$38,$30,$2E,$30,$2E,$21,$17,$3A,$23
	.byte $17,$17,$17,$34,$19,$19,$21,$17
LevelData_Screen_Map3_0_three:
	.byte $3B,$3B,$3B,$3B,$3B,$3B,$3B,$3B,$1F,$1F,$1F,$1F,$1F,$1F,$1F,$1F
	.byte $1F,$1F,$1E,$1F,$1F,$1F,$1E,$1F,$1A,$1B,$3E,$1D,$1A,$1B,$3E,$1D
	.byte $38,$37,$3D,$38,$38,$38,$3D,$13,$30,$2E,$23,$30,$3A,$3A,$3A,$2E
	.byte $17,$17,$17,$17,$21,$21,$21,$17
LevelData_Screen_Map3_5_one:
	.byte $3B,$3B,$3B,$3B,$3B,$3B,$3B,$3B,$1F,$1F,$1F,$1F,$1F,$1F,$1F,$1F
	.byte $1F,$1F,$1E,$1F,$1F,$1F,$1E,$1F,$1A,$1B,$1C,$1D,$1A,$1B,$1C,$1D
	.byte $17,$35,$37,$35,$13,$35,$35,$13,$19,$23,$2E,$23,$2E,$30,$23,$2E
	.byte $19,$17,$17,$17,$17,$17,$17,$17
LevelData_Screen_Map3_5_two:
	.byte $3B,$3B,$3B,$3B,$3B,$3B,$3B,$3B,$1F,$1F,$1F,$1F,$1F,$1F,$1F,$1F
	.byte $1F,$1F,$1E,$1F,$1F,$1F,$1E,$1F,$1A,$1B,$1C,$1D,$1A,$1B,$1C,$1D
	.byte $35,$39,$3A,$3A,$3A,$3A,$39,$35,$23,$17,$21,$21,$21,$21,$17,$30
	.byte $17,$19,$19,$19,$19,$19,$19,$17
LevelData_Screen_Map3_5_three:
	.byte $3B,$3B,$3B,$3B,$3B,$3B,$3B,$3B,$1F,$1F,$1F,$1F,$1F,$1F,$1F,$1F
	.byte $1F,$1F,$1E,$1F,$1F,$1F,$1E,$1F,$1A,$1B,$3E,$1D,$1A,$1B,$3E,$1D
	.byte $13,$38,$3D,$38,$37,$38,$3D,$38,$2E,$3A,$3A,$3A,$2E,$23,$30,$17
	.byte $17,$21,$21,$21,$17,$17,$17,$19
LevelData_Screen_Map3_5_four:
	.byte $3B,$3B,$3B,$3B,$3B,$3B,$3B,$3B,$1F,$1F,$1F,$1F,$1F,$1F,$1F,$1F
	.byte $1F,$1F,$1E,$1F,$1F,$1F,$1E,$1F,$1A,$1B,$3E,$1D,$1A,$1B,$1C,$1D
	.byte $38,$37,$3D,$35,$38,$13,$35,$38,$17,$2E,$27,$30,$27,$2E,$30,$23
	.byte $19,$17,$17,$17,$17,$17,$17,$17
LevelData_Screen_Map3_6_one:
	.byte $22,$00,$3F,$05,$39,$39,$00,$19,$00,$00,$01,$01,$02,$0A,$00,$19
	.byte $39,$39,$39,$39,$39,$04,$36,$19,$01,$24,$01,$0B,$03,$01,$01,$19
	.byte $00,$00,$3F,$05,$39,$39,$39,$19,$39,$39,$17,$17,$17,$17,$17,$19
	.byte $17,$17,$19,$19,$19,$19,$19,$19
LevelData_Screen_Map3_6_two:
	.byte $19,$19,$19,$19,$19,$19,$18,$18,$19,$18,$18,$18,$18,$22,$00,$00
	.byte $22,$00,$00,$00,$00,$00,$00,$39,$00,$00,$00,$00,$39,$39,$39,$01
	.byte $00,$00,$3A,$3A,$01,$24,$01,$00,$39,$39,$39,$39,$39,$39,$39,$39
	.byte $17,$31,$31,$31,$31,$31,$31,$17
LevelData_Screen_Map3_6_three:
	.byte $3B,$3B,$3B,$3B,$3B,$3B,$3B,$3B,$1F,$1F,$1F,$1F,$1F,$1F,$1F,$1F
	.byte $1F,$1F,$1E,$1F,$1F,$1F,$1E,$1F,$1A,$1B,$1C,$1D,$1A,$1B,$1C,$1D
	.byte $15,$16,$42,$15,$15,$15,$15,$17,$40,$10,$41,$40,$0B,$03,$17,$19
	.byte $17,$01,$01,$0B,$05,$00,$3C,$19
LevelData_Screen_Map3_7_one:
	.byte $3B,$3B,$3B,$3B,$3B,$3B,$3B,$3B,$1F,$1F,$1F,$1F,$1F,$1F,$1F,$1F
	.byte $1F,$1F,$1E,$1F,$1F,$1F,$1E,$1F,$1A,$1B,$1C,$1D,$1A,$1B,$1C,$1D
	.byte $17,$17,$17,$15,$15,$16,$14,$16,$19,$19,$19,$17,$40,$10,$41,$10
	.byte $19,$19,$19,$19,$17,$17,$17,$17
LevelData_Screen_Map3_1_one:
	.byte $3B,$3B,$3B,$3B,$3B,$3B,$3B,$3B,$1F,$1F,$1F,$1F,$1F,$1F,$1F,$1F
	.byte $1F,$1F,$1E,$1F,$1F,$1F,$1E,$1F,$1A,$1B,$1C,$1D,$1A,$1B,$20,$1D
	.byte $14,$42,$16,$15,$14,$42,$12,$15,$11,$10,$10,$40,$11,$44,$41,$40
	.byte $31,$31,$31,$31,$31,$31,$17,$17
LevelData_Screen_Map3_1_two:
	.byte $3B,$3B,$3B,$3B,$3B,$3B,$3B,$3B,$1F,$1F,$1F,$1F,$1F,$1F,$1F,$1F
	.byte $1F,$1F,$1E,$1F,$1F,$1F,$1E,$1F,$1A,$1B,$20,$1D,$1A,$1B,$1C,$1D
	.byte $15,$42,$12,$14,$15,$14,$15,$14,$40,$44,$11,$11,$40,$41,$40,$11
	.byte $31,$31,$31,$31,$31,$31,$31,$31
LevelData_Screen_Map3_6_four:
	.byte $3B,$3B,$3B,$3B,$3B,$3B,$3B,$3B,$1F,$1F,$1F,$1F,$1F,$1F,$1F,$1F
	.byte $1F,$1F,$1E,$1F,$1F,$1F,$1E,$1F,$1A,$1B,$1C,$1D,$1A,$1B,$1C,$1D
	.byte $17,$17,$15,$15,$16,$15,$14,$15,$19,$19,$17,$40,$10,$40,$41,$40
	.byte $19,$19,$19,$17,$17,$17,$17,$17
LevelData_Screen_Map3_7_two:
	.byte $3B,$3B,$3B,$3B,$3B,$3B,$3B,$3B,$1F,$1F,$1F,$1F,$1F,$1F,$1F,$1F
	.byte $1F,$1F,$1E,$1F,$1F,$1F,$1E,$1F,$1A,$1B,$20,$1D,$1A,$1B,$20,$1D
	.byte $14,$16,$12,$42,$14,$14,$12,$15,$11,$10,$11,$44,$11,$41,$11,$40
	.byte $17,$17,$17,$17,$17,$17,$17,$17
LevelData_Screen_Map3_9:
	.byte $3B,$3B,$3B,$3B,$3B,$3B,$3B,$3B,$1F,$1F,$1F,$1F,$1F,$1F,$1F,$1F
	.byte $1F,$1F,$1E,$1F,$1F,$1F,$1E,$1F,$1A,$1B,$1C,$1D,$1A,$1B,$1C,$1D
	.byte $15,$15,$16,$15,$15,$15,$17,$17,$40,$40,$10,$17,$17,$17,$19,$19
	.byte $17,$17,$17,$19,$19,$19,$19,$19
LevelData_ScreenNumbers_3_Wildernesss_3:
	.word (LevelData_ScreenNumbers_3_Wildernesss_3_B7DF) ;B7DF (B7DF) ()
	.byte $04,$FF,$01,$00,$FF,$01,$04
	.word (LevelData_ScreenNumbers_3_Wildernesss_3_0) ;B7DA (B7DA) ()
	.word (LevelData_ScreenNumbers_3_Wildernesss_3_1) ;B7DB (B7DB) ()
	.word (LevelData_ScreenNumbers_3_Wildernesss_3_2) ;B7DC (B7DC) ()
	.word (LevelData_ScreenNumbers_3_Wildernesss_3_3) ;B7DD (B7DD) ()
	.word (LevelData_ScreenNumbers_3_Wildernesss_3_4) ;B7DE (B7DE) ()
LevelData_ScreenNumbers_3_Wildernesss_3_0:
	.byte $02
LevelData_ScreenNumbers_3_Wildernesss_3_1:
	.byte $03
LevelData_ScreenNumbers_3_Wildernesss_3_2:
	.byte $08
LevelData_ScreenNumbers_3_Wildernesss_3_3:
	.byte $04
LevelData_ScreenNumbers_3_Wildernesss_3_4:
	.byte $0A
LevelData_ScreenNumbers_3_Wildernesss_3_B7DF:
	.byte $00,$02,$FF,$00,$00
LevelData_Palettes_3_Wildernesss_3_Day:
	.byte $2C,$38,$3C,$37,$3E,$37,$20,$37,$20,$37
LevelData_Palettes_3_Wildernesss_3_Night:
	.byte $3D,$38,$3D,$37,$3E,$37,$21,$37,$21,$37
LevelData_Stairs_3_Wildernesss_2:
	.byte $37,$92,$A3,$A6,$FF
LevelData_Stairs_3_Wildernesss_4:
	.byte $0D,$26,$95,$2E
LevelData_Stairs_3_Wildernesss_3_8_10:
	.byte $FF
LevelData_Screens_3_Wildernesss_2_A:
	.byte $04,$01
	.word (LevelData_Screen_Map3_1_and_3_2_one) ;B2CA (B2CA) ([8:4][A:5])
	.word (LevelData_Screen_Map3_1_and_3_2_two) ;B302 (B302) ([8:4][A:5])
	.word (LevelData_Screen_Map3_2_two) ;BB66 (BB66) ([8:4][A:5])
	.word (LevelData_Screen_Map3_2_one) ;BB2E (BB2E) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
LevelData_Screens_3_Wildernesss_3_A:
	.byte $04,$01
	.word (LevelData_Screen_Map3_3_and_3_9) ;B33A (B33A) ([8:4][A:5])
	.word (LevelData_Screen_Map3_3_one) ;BB9E (BB9E) ([8:4][A:5])
	.word (LevelData_Screen_Map3_3_two) ;BBD6 (BBD6) ([8:4][A:5])
	.word (LevelData_Screen_Map3_3_three) ;BC0E (BC0E) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
LevelData_Screens_3_Wildernesss_4_A:
	.byte $01,$02
	.word (LevelData_Screen_Map2_10_and_3_4) ;F8AF (1F8AF) ([8:4][A:5])
	.word (LevelData_Screen_Map3_4) ;BAF6 (BAF6) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
LevelData_Screens_3_Wildernesss_8_A:
	.byte $04,$03
	.word (LevelData_Screen_Map3_8_one) ;B856 (B856) ([8:4][A:5])
	.word (LevelData_Screen_Map3_8_two) ;B88E (B88E) ([8:4][A:5])
	.word (LevelData_Screen_Map3_8_three) ;B8C6 (B8C6) ([8:4][A:5])
	.word (LevelData_Screen_Map3_8_four) ;B8FE (B8FE) ([8:4][A:5])
	.word (LevelData_Screen_Map3_8_five) ;B936 (B936) ([8:4][A:5])
	.word (LevelData_Screen_Map3_8_six) ;B96E (B96E) ([8:4][A:5])
	.word (LevelData_Screen_Map3_8_seven) ;B9A6 (B9A6) ([8:4][A:5])
	.word (LevelData_Screen_Map3_8_eight) ;B9DE (B9DE) ([8:4][A:5])
	.word (LevelData_Screen_Map3_8_nine) ;BA16 (BA16) ([8:4][A:5])
	.word (LevelData_Screen_Map3_8_ten) ;BA4E (BA4E) ([8:4][A:5])
	.word (LevelData_Screen_Map3_8_eleven) ;BA86 (BA86) ([8:4][A:5])
	.word (LevelData_Screen_Map3_8_twelve) ;BABE (BABE) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
LevelData_Screens_3_Wildernesss_10_A:
	.byte $01,$01
	.word (LevelData_Screen_Map2_16_17_and_2_18_and_3_10_and_4_5_6) ;F877 (1F877) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
LevelData_Screen_Map3_8_one:
	.byte $19,$18,$18,$18,$18,$18,$18,$18,$19,$2B,$25,$26,$25,$25,$2B,$25
	.byte $19,$25,$26,$26,$26,$25,$25,$26,$19,$26,$26,$26,$01,$01,$01,$01
	.byte $19,$01,$24,$01,$2B,$25,$25,$25,$19,$25,$25,$25,$25,$26,$25,$26
	.byte $19,$25,$25,$25,$26,$26,$26,$26
LevelData_Screen_Map3_8_two:
	.byte $18,$18,$18,$18,$18,$18,$18,$18,$26,$25,$25,$25,$25,$25,$25,$26
	.byte $26,$26,$25,$25,$25,$25,$26,$26,$01,$26,$26,$25,$25,$25,$01,$01
	.byte $25,$01,$01,$01,$01,$01,$25,$25,$25,$25,$25,$25,$25,$25,$25,$26
	.byte $25,$29,$25,$29,$25,$29,$25,$25
LevelData_Screen_Map3_8_three:
	.byte $18,$18,$18,$18,$18,$18,$18,$18,$26,$26,$2B,$25,$25,$25,$25,$25
	.byte $26,$25,$25,$25,$25,$25,$25,$26,$01,$01,$01,$25,$25,$01,$01,$01
	.byte $26,$26,$25,$01,$25,$25,$25,$25,$26,$26,$25,$25,$01,$25,$29,$25
	.byte $25,$26,$26,$2B,$25,$25,$01,$01
LevelData_Screen_Map3_8_four:
	.byte $18,$18,$18,$18,$18,$18,$18,$19,$26,$26,$2B,$25,$25,$25,$25,$19
	.byte $26,$26,$26,$25,$25,$25,$25,$19,$01,$01,$26,$25,$29,$25,$25,$19
	.byte $25,$25,$01,$01,$01,$25,$25,$19,$25,$25,$25,$25,$25,$01,$01,$19
	.byte $01,$25,$29,$25,$25,$25,$25,$19
LevelData_Screen_Map3_8_five:
	.byte $19,$01,$01,$01,$26,$26,$26,$25,$19,$2B,$25,$25,$01,$01,$01,$01
	.byte $19,$25,$25,$25,$25,$29,$25,$29,$19,$01,$25,$25,$01,$01,$01,$01
	.byte $19,$25,$32,$25,$2B,$25,$25,$25,$19,$25,$25,$32,$25,$25,$25,$26
	.byte $19,$25,$25,$25,$32,$25,$26,$25
LevelData_Screen_Map3_8_six:
	.byte $26,$01,$24,$01,$01,$01,$01,$01,$01,$2B,$25,$25,$2B,$25,$06,$26
	.byte $25,$29,$25,$29,$25,$29,$2F,$26,$01,$01,$01,$01,$01,$24,$01,$01
	.byte $25,$26,$25,$25,$25,$25,$25,$25,$26,$26,$26,$25,$29,$25,$29,$25
	.byte $26,$26,$25,$01,$01,$01,$01,$01
LevelData_Screen_Map3_8_seven:
	.byte $01,$01,$01,$01,$01,$01,$25,$25,$26,$07,$25,$2A,$25,$2A,$25,$29
	.byte $26,$07,$25,$26,$25,$26,$25,$26,$01,$01,$01,$01,$01,$01,$01,$01
	.byte $25,$25,$25,$25,$25,$25,$25,$25,$29,$25,$29,$25,$29,$25,$29,$25
	.byte $01,$25,$01,$25,$01,$25,$01,$25
LevelData_Screen_Map3_8_eight:
	.byte $25,$01,$01,$01,$25,$25,$25,$19,$25,$29,$2B,$25,$25,$32,$25,$19
	.byte $25,$26,$25,$25,$32,$25,$25,$19,$01,$01,$01,$25,$25,$01,$01,$19
	.byte $25,$25,$25,$33,$25,$25,$25,$19,$25,$25,$25,$25,$33,$25,$25,$19
	.byte $01,$01,$01,$01,$01,$01,$01,$19
LevelData_Screen_Map3_8_nine:
	.byte $19,$25,$25,$01,$01,$01,$01,$01,$19,$25,$32,$2B,$25,$25,$26,$25
	.byte $19,$32,$25,$25,$26,$26,$25,$25,$18,$01,$01,$25,$26,$01,$01,$25
	.byte $00,$25,$25,$25,$32,$25,$25,$33,$00,$25,$25,$32,$25,$25,$2D,$25
	.byte $17,$17,$17,$17,$17,$34,$28,$34
LevelData_Screen_Map3_8_ten:
	.byte $01,$01,$01,$25,$25,$25,$25,$26,$25,$25,$25,$25,$26,$26,$26,$25
	.byte $25,$25,$25,$26,$25,$26,$26,$25,$25,$25,$01,$01,$01,$01,$01,$01
	.byte $25,$33,$06,$2B,$25,$25,$25,$09,$33,$25,$06,$29,$25,$25,$25,$09
	.byte $17,$17,$17,$17,$17,$17,$17,$17
LevelData_Screen_Map3_8_eleven:
	.byte $25,$25,$25,$25,$2D,$25,$25,$25,$25,$29,$25,$29,$2C,$29,$25,$29
	.byte $25,$01,$25,$01,$2C,$01,$25,$01,$25,$2D,$25,$2D,$2C,$2D,$25,$2D
	.byte $25,$2C,$25,$2C,$2C,$2C,$25,$2C,$25,$2C,$2D,$2C,$2C,$2C,$2D,$2C
	.byte $34,$28,$28,$28,$28,$28,$28,$28
LevelData_Screen_Map3_8_twelve:
	.byte $25,$09,$25,$25,$25,$25,$25,$19,$25,$09,$25,$25,$25,$25,$25,$19
	.byte $01,$01,$01,$25,$25,$25,$25,$19,$25,$25,$25,$01,$25,$25,$25,$18
	.byte $2A,$25,$25,$25,$01,$25,$25,$00,$26,$25,$25,$25,$25,$33,$25,$00
	.byte $17,$17,$17,$17,$17,$17,$17,$17
LevelData_Screen_Map3_4:
	.byte $19,$21,$21,$00,$00,$00,$01,$19,$19,$19,$22,$00,$00,$01,$21,$19
	.byte $18,$22,$00,$00,$33,$21,$19,$19,$00,$00,$33,$02,$36,$3C,$19,$19
	.byte $00,$00,$32,$00,$04,$36,$3C,$18,$00,$3A,$3A,$00,$01,$32,$00,$00
	.byte $17,$34,$34,$34,$34,$34,$34,$34
LevelData_Screen_Map3_2_one:
	.byte $3B,$3B,$3B,$3B,$3B,$3B,$3B,$3B,$1F,$1F,$1F,$1F,$1F,$1F,$1F,$1F
	.byte $1F,$1F,$1E,$1F,$1F,$1F,$1E,$1F,$1A,$1B,$20,$1D,$1A,$1B,$1C,$1D
	.byte $14,$16,$12,$15,$15,$14,$15,$15,$11,$10,$11,$40,$40,$41,$40,$40
	.byte $31,$31,$31,$31,$31,$31,$17,$17
LevelData_Screen_Map3_2_two:
	.byte $3B,$3B,$3B,$3B,$3B,$3B,$3B,$3B,$1F,$1F,$1F,$1F,$1F,$1F,$1F,$1F
	.byte $1F,$1F,$1E,$1F,$1F,$1F,$1E,$1F,$1A,$1B,$20,$1D,$1A,$1B,$1C,$1D
	.byte $42,$15,$12,$14,$15,$14,$15,$16,$44,$40,$41,$41,$40,$11,$40,$10
	.byte $31,$31,$31,$31,$31,$31,$17,$17
LevelData_Screen_Map3_3_one:
	.byte $3B,$3B,$3B,$3B,$3B,$3B,$3B,$3B,$1F,$1F,$1F,$1F,$1F,$1F,$1F,$1F
	.byte $1F,$1F,$1E,$1F,$1F,$1F,$1E,$1F,$1A,$1B,$20,$1D,$1A,$1B,$20,$1D
	.byte $16,$14,$12,$15,$15,$15,$12,$15,$10,$11,$3A,$3A,$40,$40,$3A,$3A
	.byte $17,$17,$21,$21,$17,$17,$21,$21
LevelData_Screen_Map3_3_two:
	.byte $3B,$3B,$3B,$3B,$3B,$3B,$3B,$3B,$1F,$1F,$1F,$1F,$1F,$1F,$1F,$1F
	.byte $1F,$1F,$1E,$1F,$1F,$1F,$1E,$1F,$1A,$1B,$1C,$1D,$1A,$1B,$20,$1D
	.byte $15,$16,$14,$16,$14,$42,$12,$42,$40,$10,$41,$10,$41,$44,$41,$44
	.byte $17,$34,$34,$34,$34,$34,$34,$17
LevelData_Screen_Map3_3_three:
	.byte $3B,$3B,$3B,$3B,$3B,$3B,$3B,$3B,$1F,$1F,$1F,$1F,$1F,$1F,$1F,$1F
	.byte $1F,$1F,$1E,$1F,$1F,$1F,$1E,$1F,$1A,$1B,$20,$1D,$1A,$1B,$20,$1D
	.byte $15,$16,$12,$15,$14,$15,$12,$15,$40,$10,$11,$40,$41,$40,$11,$40
	.byte $17,$3A,$17,$3A,$3A,$43,$3A,$17
LevelData_Screens_5_Ruins:
	.word (LevelData_Screens_5_Ruins_0_A) ;BC82 (BC82) ()
	.word (LevelData_Stairs_5_Ruins_0) ;BC68 (BC68) ()
	.word (LevelData_Screens_5_Ruins_1_A) ;BCAC (BCAC) ()
	.word (LevelData_Stairs_5_Ruins_1) ;BC81 (BC81) ()
LevelData_Palettes_5_Ruins:
	.word (LevelData_Palettes_5_Ruins_0_DayOrNight) ;BC52 (BC52) ()
	.word (LevelData_Palettes_5_Ruins_0_DayOrNight) ;BC52 (BC52) ()
LevelData_Palettes_5_Ruins_0_DayOrNight:
	.byte $57,$4C,$57,$4C
LevelData_ScreenNumbers_5_Ruins:
	.word (LevelData_ScreenNumbers_5_Ruins_0) ;BC58 (BC58) ()
LevelData_ScreenNumbers_5_Ruins_0:
	.word (LevelData_ScreenNumbers_5_Ruins_0_BC67) ;BC67 (BC67) ()
	.byte $01,$FF,$04,$03,$00,$00,$00
	.word (LevelData_ScreenNumbers_5_Ruins_0_0) ;BC65 (BC65) ()
	.word (LevelData_ScreenNumbers_5_Ruins_0_1) ;BC66 (BC66) ()
LevelData_ScreenNumbers_5_Ruins_0_0:
	.byte $00
LevelData_ScreenNumbers_5_Ruins_0_1:
	.byte $01
LevelData_ScreenNumbers_5_Ruins_0_BC67:
	.byte $FD
LevelData_Stairs_5_Ruins_0:
	.byte $77,$9A,$EB,$A6,$59,$3E,$DD,$42,$63,$C2,$DB,$CA,$4F,$D2,$CB,$D6
	.byte $55,$52,$D9,$56,$5F,$D6,$CB,$EA,$FF
LevelData_Stairs_5_Ruins_1:
	.byte $FF
LevelData_Screens_5_Ruins_0_A:
	.byte $04,$04
	.word (LevelData_Screen_Map5_0_one) ;BCB2 (BCB2) ([8:4][A:5])
	.word (LevelData_Screen_Map5_0_two) ;BCEA (BCEA) ([8:4][A:5])
	.word (LevelData_Screen_Map5_0_three) ;BD22 (BD22) ([8:4][A:5])
	.word (LevelData_Screen_Map5_0_four) ;BD5A (BD5A) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Map5_0_five) ;BD92 (BD92) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Map5_0_six) ;BDCA (BDCA) ([8:4][A:5])
	.word (LevelData_Screen_Map5_0_seven) ;BE02 (BE02) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Map5_0_eight) ;BE3A (BE3A) ([8:4][A:5])
	.word (LevelData_Screen_Map5_0_nine) ;BE72 (BE72) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
LevelData_Screens_5_Ruins_1_A:
	.byte $01,$01
	.word (LevelData_Screen_Map5_1) ;BEAA (BEAA) ([8:4][A:5])
	.word (LevelData_Screen_Blank) ;F807 (1F807) ([8:4][A:5])
LevelData_Screen_Map5_0_one:
	.byte $2A,$2A,$2A,$2A,$2A,$2A,$2A,$2A,$2B,$2B,$2B,$2B,$2B,$2B,$2B,$2B
	.byte $29,$29,$29,$29,$29,$29,$29,$29,$15,$00,$00,$00,$15,$00,$00,$00
	.byte $28,$26,$2F,$27,$28,$26,$2E,$25,$2C,$21,$2D,$24,$2C,$21,$2D,$01
	.byte $01,$01,$01,$01,$01,$01,$01,$01
LevelData_Screen_Map5_0_two:
	.byte $2A,$2A,$2A,$2A,$2A,$2A,$2A,$2A,$29,$2B,$2B,$2B,$29,$2B,$29,$2B
	.byte $15,$29,$29,$29,$15,$29,$00,$29,$28,$00,$00,$00,$28,$00,$00,$00
	.byte $28,$26,$2F,$00,$28,$27,$2F,$00,$2C,$21,$2D,$25,$2C,$24,$2D,$26
	.byte $01,$01,$01,$01,$01,$01,$01,$01
LevelData_Screen_Map5_0_three:
	.byte $2A,$2A,$2A,$2A,$2A,$2A,$2A,$2A,$29,$2B,$2B,$2B,$29,$2B,$2B,$2B
	.byte $00,$29,$29,$29,$15,$29,$29,$29,$15,$00,$00,$00,$28,$00,$00,$00
	.byte $28,$26,$2F,$23,$28,$26,$2E,$25,$2C,$21,$2D,$25,$2C,$20,$2D,$21
	.byte $01,$01,$01,$01,$01,$01,$01,$01
LevelData_Screen_Map5_0_four:
	.byte $2A,$2A,$2A,$2A,$2A,$2A,$2A,$2A,$29,$2B,$2B,$2B,$2B,$2B,$2B,$07
	.byte $15,$2B,$29,$2B,$29,$2B,$29,$07,$28,$29,$00,$29,$00,$29,$00,$07
	.byte $28,$00,$00,$00,$00,$00,$07,$16,$2C,$26,$00,$00,$00,$09,$30,$16
	.byte $01,$01,$01,$01,$01,$0C,$0C,$16
LevelData_Screen_Map5_0_five:
	.byte $06,$28,$01,$01,$0B,$03,$01,$01,$06,$28,$10,$13,$05,$10,$10,$07
	.byte $06,$2C,$13,$05,$17,$11,$14,$07,$01,$01,$01,$01,$01,$10,$16,$16
	.byte $06,$28,$10,$11,$10,$14,$16,$16,$06,$28,$14,$14,$14,$16,$16,$16
	.byte $06,$28,$16,$16,$16,$16,$16,$16
LevelData_Screen_Map5_0_six:
	.byte $06,$28,$10,$10,$10,$10,$10,$07,$06,$28,$10,$11,$10,$11,$10,$01
	.byte $06,$28,$14,$10,$01,$01,$02,$12,$06,$28,$06,$10,$11,$10,$01,$0B
	.byte $06,$28,$06,$10,$10,$10,$13,$05,$06,$28,$16,$16,$16,$16,$16,$16
	.byte $06,$28,$39,$18,$18,$18,$39,$39
LevelData_Screen_Map5_0_seven:
	.byte $06,$2C,$00,$18,$18,$18,$18,$3B,$01,$01,$01,$01,$01,$01,$01,$3B
	.byte $14,$28,$14,$14,$14,$14,$14,$3B,$03,$01,$01,$01,$01,$01,$01,$01
	.byte $17,$28,$14,$14,$14,$14,$14,$3B,$16,$16,$16,$16,$16,$16,$16,$16
	.byte $06,$00,$00,$00,$00,$00,$00,$07
LevelData_Screen_Map5_0_eight:
	.byte $06,$2C,$13,$03,$16,$02,$12,$14,$16,$01,$01,$01,$01,$01,$0B,$03
	.byte $06,$28,$10,$11,$10,$13,$05,$1A,$06,$28,$10,$10,$13,$05,$1A,$10
	.byte $06,$28,$10,$13,$05,$1F,$10,$10,$06,$2C,$13,$05,$17,$14,$14,$14
	.byte $16,$16,$16,$16,$16,$16,$16,$16
LevelData_Screen_Map5_0_nine:
	.byte $06,$00,$00,$00,$00,$00,$00,$07,$06,$00,$37,$34,$35,$34,$36,$07
	.byte $39,$15,$00,$38,$00,$38,$00,$07,$10,$28,$1F,$28,$1F,$28,$1F,$07
	.byte $10,$28,$1F,$28,$1F,$28,$1F,$15,$14,$2C,$17,$2C,$17,$2C,$17,$2C
	.byte $16,$16,$16,$16,$16,$16,$16,$16
LevelData_Screen_Map5_1:
	.byte $06,$00,$28,$00,$00,$28,$00,$07,$06,$00,$28,$00,$00,$28,$00,$07
	.byte $06,$00,$28,$00,$00,$28,$00,$07,$06,$00,$28,$00,$00,$28,$00,$07
	.byte $00,$00,$28,$3C,$3D,$28,$00,$07,$00,$00,$3A,$3E,$3F,$3A,$00,$07
	.byte $16,$16,$16,$16,$16,$16,$16,$16,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
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
	.byte $46,$C0,$D0,$FF,$96,$C0
