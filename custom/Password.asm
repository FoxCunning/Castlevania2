
SoundData55_PasswordSong_ch1:
	.byte $FB,$D7,$70,$20,$17,$CF,$FE,$FF
	.word (SoundData55_PasswordSong_ch1)
SoundData56_PasswordSong_ch0:
	.byte $FB,$D7,$70,$20,$17,$CF,$FE,$FF
	.word (SoundData56_PasswordSong_ch0)
SoundData57_PasswordSong_ch2:
	.byte $FB,$D7,$90,$CF,$FE,$FF
	.word (SoundData57_PasswordSong_ch2)
SoundData58_PasswordSong_ch5:
			; Intro
	
	.byte $D7 ; Tempo = 7
	; Loop x16
	.byte $FB,$00,$FE,$10
	
	; No loop
	.byte $A0,$A0,$A0,$A0

	@Loop:
	
	; Tempo = 1
	.byte $D1
	; Loop x4
	.byte $FB,$A2,$A3,$FE,$04
	
			; First movement
	
	; Tempo = 7
	.byte $D7
	; Loop x7
	.byte $FB
	.byte $B1,$A0,$B1,$B0,$A1,$B0,$B0,$A0,$B1,$B0,$A1
	.byte $FE,$07
	
	; No loop
	.byte $B1,$A0,$B1,$B0,$A1
	.byte $A0,$A0,$A0,$A1,$A0,$A0,$A0
	
			; Second movement
	
	; Loop x7
	.byte $FB
	.byte $B1,$A0,$B1,$B0,$A1,$B0,$B0,$A0,$B1,$B0,$A1
	.byte $FE,$07
	
	; No loop
	.byte $B1,$A0,$B1,$B0,$A1
	.byte $A0,$A0,$A0,$A1,$A0,$A0,$A0
	
			; Third movement
			
	; Loop x7
	.byte $FB
	.byte $A0,$B0,$B0,$A2,$A1,$A1
	.byte $D1	; Tempo = 1
	.byte $A2,$A3
	.byte $D7	; Tempo = 7
	.byte $A0,$A0,$A0
	.byte $FE,$07
	
	; No loop
	.byte $A0,$B0,$B0,$A2,$A1,$A2,$A0,$A0,$A0
	
		; Fourth movement
	
	; Loop x7
	.byte $FB
	.byte $B1,$A0,$B1,$B0,$A1,$B0,$B0,$A0,$B1,$B0,$A1
	.byte $FE,$07
	
	; Loop x4
	.byte $FB
	.byte $A0,$B0,$B0
	.byte $FE,$04
	
	; End
	.byte $FE,$FF
	.word (@Loop)
