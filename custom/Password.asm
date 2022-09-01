
SoundData55_PasswordSong_ch1:
	.byte $FB,$D7,$70,$20,$17,$CF,$FE,$FF
	.word (SoundData55_PasswordSong_ch1)
; ------------------------------------------------------------------------------

SoundData56_PasswordSong_ch0:
	.byte $FB,$D7,$70,$20,$17,$CF,$FE,$FF
	.word (SoundData56_PasswordSong_ch0)
; ------------------------------------------------------------------------------

; TODO Add fine pitch
SoundData57_PasswordSong_ch2:
	.byte $D7	; Tempo = 7 frames per note
	.byte $0E	; Notes are 5 frames long (out of 7)
	
	; --- 1
	.byte $FB				; Loop start
	.byte $E4,$B0			; B2
	.byte $E3,$60			; F#3
	.byte $E2,$10			; C#4
	.byte $E4,$B0			; B2
	.byte $E3,$60,$B0		; F#3, B3
	.byte $FE,$02			; Loop x2
	
	.byte $E4,$B0			; B2
	.byte $E3,$60			; F#3
	.byte $E2,$10			; C#4
	.byte $E3,$B0			; B3
	
	; --- 2
	.byte $E2,$20			; D4
	.byte $E3,$70			; G3
	.byte $E4,$70			; G2
	.byte $E2,$20			; D4
	.byte $E3,$90			; A3
	.byte $E4,$70			; G2
	.byte $E2,$20			; D4
	.byte $E3,$70			; G3
	.byte $E4,$90,$90		; A2, A2
	.byte $40,$40			; E2, E2
	.byte $A0,$A0			; A#2, A#2
	.byte $60,$A0			; F#2, A#2
	
	@Loop:

	; --- 3, 4, 5, 6
	.byte $FD				; Gosub
	.word (@Sub_0)

	; --- 7, 8, 9, 10
	.byte $E4				; Octave = 2
	.byte $FD				; Gosub
	.word (@Sub_0)
	
	; --- 11, 12
	.byte $FD
	.word (@Sub_2)

	; --- 12, 13
	.byte $FD
	.word (@Sub_1)
	
	; --- 14
	.byte $E4,$FB,$B0,$FE,$08	; B2 x 8

	.byte $FD
	.word (@Sub_1)

	; --- 16
	.byte $FD
	.word (@Sub_2_1)

	; --- 17
	.byte $FD
	.word (@Sub_1)

	; --- 18
	.byte $E4,$60,$60,$60	; F#2 x 3
	.byte $A3,$C0,$A0		; A#2, rest, A#2
	.byte $E3,$10,$10,$10	; C#3 x 3
	.byte $62,$C0,$A0		; F#3, rest, A#3
	.byte $E2,$10			; C#4

	; --- 19
	.byte $D7,$0F			; Legato

	.byte $FB				; Loop start

	.byte $E4,$72,$B2		; G2, B2
	.byte $E3,$21,$61,$73	; D3, F#3, G3

	.byte $FE,$02			; Loop x 2

	; --- END
	.byte $FE,$FF
	.word (@Loop)


	@Sub_0:
	
	; ---
	.byte $FB				; Loop start
	.byte $B0				; B2
	.byte $FE,$0E			; Loop x14
	
	.byte $90,$90			; A2, A2
	
	; ---
	.byte $70,$70,$B0,$B0	; G2, G2, B2, B2
	.byte $E3,$20,$20,$70,$70	; D3, D3, G3, G3
	.byte $E4,$70,$70,$70	; G2, G2, G2
	
	.byte $DE,$1C			; Tempo = 14 frames per note
	.byte $60				; F#2
	
	.byte $D7,$0E			; Tempo = 7 frames per note
	.byte $60,$A0			; F#2, A#2
	.byte $E3,$10			; C#3
	
	; ---
	.byte $E4				; Octave = 2
	.byte $FB				; Loop start
	.byte $B0				; B2
	.byte $FE,$0E			; Loop x14
	
	.byte $90,$90			; A2, A2
	
	; ---
	.byte $70,$70,$B0,$B0	; G2, G2, B2, B2
	.byte $E3,$20,$20,$70,$70	; D3, D3, G3, G3
	.byte $E4,$70,$70,$70	; G2, G2, G2
	
	.byte $DE,$1C			; Tempo = 14 frames per note
	.byte $90				; A2
	
	.byte $D7,$0E			; Tempo = 7 frames per note
	.byte $A0				; A#2
	.byte $E3,$10,$40		; C#3, E3
	
	; Return
	.byte $FF

	@Sub_1:
	
	; ---
	.byte $E4,$90,$90		; A2, A2
	.byte $E3,$10,$40		; C#3, E3
	.byte $E4,$40,$E3,$40	; E2, E3
	.byte $E4,$60,$E3,$60	; F#2, F#3

	; ---
	.byte $E3				; Octave = 3
	.byte $FB,$40,$FE,$10	; E3 x 16

	.byte $FF				; Return

	@Sub_2:

	; ---
	.byte $E3				; Octave = 3
	.byte $FB,$40,$FE,$10	; E3 x 16

	@Sub_2_1:
	; ---
	.byte $20,$20,$10,$10	; D3, D3, C#3, C#3
	.byte $E4,$90,$90		; A2, A2
	.byte $E3,$20,$20		; D3, D3
	
	.byte $FF				; Return
	
; ------------------------------------------------------------------------------

; TODO Add hi-hat
SoundData58_PasswordSong_ch5:
			; Intro
	
	.byte $D7 ; Tempo = 7
	; Loop x24
	.byte $FB,$00,$FE,$18
	
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
