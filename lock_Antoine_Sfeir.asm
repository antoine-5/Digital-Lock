	#include<p18f4520.inc>
	config pbaden =off
	config wdt = off
	fini equ 0x00
	digit1 equ 0x01 
	digit2 equ 0x02 
	digit3 equ 0x03 
	digit4 equ 0x04 
	input1 equ 0x05
	input2 equ 0x06
	input3 equ 0x07
	input4 equ 0x08
	nb_entered equ 0x09 ; pour savoir si c'est le premier nombre entree le deuxieme etc...
	charriot equ 0x10 ; pour emporter les nb vers les input register
	correct equ 0x11
	pass1 equ 0x12
	pass2 equ 0x13
	pass3 equ 0x14
	inter1 equ 0x15
	inter2 equ 0x16
	inter3 equ 0x17
	inter4 equ 0x18
	pass4 equ 0x19
	inpass equ 0x20
	org 0x00	
	goto init
	
	org 0x08
	bcf TMR0ON,7
	setf fini
	bcf intcon,TMR0IF
	retfie
	
init 
	;enter code : code
	org 0x100
	clrf correct
	clrf pass1
	clrf pass2
	clrf pass3
	clrf pass4
	clrf inpass
	movlw 0x01
	movwf digit1
	movlw 0x01
	movwf digit2
	movlw 0x01
	movwf digit3
	movlw 0x01
	movwf digit4
	bcf intcon2,rbpu
	clrf LATC
	clrf TRISC
	clrf LATA
	bcf TRISA,0
	bcf TRISA,1
	bcf TRISA,2
	bcf LATA,0
	bcf LATA,1
	bcf LATA,2
	movlw b'00001111' ; display on
	movwf LATC
	bsf LATA,0 ;enable clock
	bcf LATA,0 ; aussi	
	clrf fini
	bsf intcon,gie
	
	movlw b'01000010' ; init timer
	movwf T0CON
	bcf intcon,TMR0IF
	bsf intcon,TMR0IE
	bsf intcon2,TMR0IP
	bsf T0CON,7
	;faire qlq chose pendant ce temps
	bcf TRISB,7; fin mettre en sortie
	btfss fini,7
	bra $-2
	
	clrf fini
	movlw b'00111000'
	movwf LATC
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	movlw 0x01
	movwf nb_entered ; faire qlq chose
	btfss fini,7
	bra $-2
debut
	clrf fini ; debut de l'ecriture du mot
	movlw b'01000101'
	movwf LATC
	bsf LATA,2
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2

	clrf fini
	movlw b'01001110'
	movwf LATC
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2
	
	clrf fini
	movlw b'01010100'; lettre T
	movwf LATC
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2

	clrf fini
	movlw b'01000101'; lettre E
	movwf LATC
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2

	clrf fini
	movlw b'01010010'; lettre R
	movwf LATC
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2

	clrf fini
	movlw b'10001111'; space
	movwf LATC
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2
	
	clrf fini
	movlw b'01000011'; lettre C
	movwf LATC
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2
	
	clrf fini
	movlw b'01001111'; lettre O
	movwf LATC
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2
		
	
	clrf fini
	movlw b'01000100'; lettre D
	movwf LATC
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2

	clrf fini
	movlw b'01000101'; lettre E
	movwf LATC
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2	

	clrf fini
	movlw b'10001111'; space
	movwf LATC
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2

	clrf fini
	movlw b'01001111'; lettre O
	movwf LATC
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2	
	
	
	clrf fini
	movlw b'01010010'; lettre R
	movwf LATC
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2	

	clrf fini
	movlw b'11000000'; nzal aal sater
	movwf LATC
	bcf LATA,2
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2	

	clrf fini
	movlw b'01010000'; P
	movwf LATC
	bsf LATA,2
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2

	clrf fini
	movlw b'01010010'; R
	movwf LATC
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2

	clrf fini
	movlw b'01000101'; lettre E
	movwf LATC
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2	

	clrf fini
	movlw b'01010011'; lettre S
	movwf LATC
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2	

	clrf fini
	movlw b'01010011'; lettre S
	movwf LATC
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2	

	clrf fini
	movlw b'01010011'; lettre S
	movwf LATC
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2	

	clrf fini
	movlw b'10001111'; space
	movwf LATC
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2

	clrf fini
	movlw b'00100011';#
	movwf LATC
	bsf LATA,2
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2	

	clrf fini
	movlw b'00100011';#
	movwf LATC
	bsf LATA,2
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2	
	
	clrf fini
	movlw b'00100011';#
	movwf LATC
	bsf LATA,2
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2	
	
	clrf fini
	movlw b'00100011';#
	movwf LATC
	bsf LATA,2
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2	

; fin init
	; fin init

;debut entering_code
	movlw b'11111000'
	clrf LATD
	movwf TRISD
	goto entering_code
number1
	incf nb_entered
	movff charriot,input1
	movlw b'00000010' ; init timer
	movwf T0CON
	clrf fini
	movlw b'00000001'; erase
	movwf LATC
	bcf LATA,2
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2	
	clrf fini
	movlw b'00101010'; lettre *
	movwf LATC
	bsf LATA,2
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2	

	goto entering_code
number2
	incf nb_entered
	movff charriot,input2
	movlw b'00000011' ; init timer
	movwf T0CON
	clrf fini
	movlw b'00101010'; lettre *
	movwf LATC
	bsf LATA,2
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2	

	goto entering_code
number3
	incf nb_entered
	movff charriot,input3

	movlw b'00000011' ; init timer
	movwf T0CON
	clrf fini
	movlw b'00101010'; lettre *
	movwf LATC
	bsf LATA,2
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2	

	goto entering_code
number4
	movlw 0x01
	movwf nb_entered
	movff charriot,input4
	
	movlw b'00000011' ; init timer
	movwf T0CON
	clrf fini
	movlw b'00101010'; lettre *
	movwf LATC
	bsf LATA,2
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	clrf pass1
	btfss fini,7
	bra $-2
	

	btfsc pass3,0
	goto changing_pass_try1
	btfsc pass4,0
	goto changing_pass_try2
	

	movf digit1,w
	cpfseq input1
	incf correct
	movlw 0x17
	cpfseq input1
	incf pass1
	movf digit2,w
	cpfseq input2
	incf correct
	movlw 0x17
	cpfseq input1
	incf pass1
	movf digit3,w
	cpfseq input3
	incf correct
	movlw 0x17
	cpfseq input1
	incf pass1
	movf digit4,w
	cpfseq input4
	incf correct
	movlw 0x17
	cpfseq input1
	incf pass1
	movlw 0x00
	cpfseq correct
	goto wrong
	clrf correct
	btfsc inpass,0
	bra ch
	bra normalcorrect
wrong
	btfsc inpass,0
	bra ch
	cpfseq pass1
	bra normalwrong
ch
	btfss pass2,0
	bra ch2
	cpfseq correct
	goto re
ch2
	btfss pass2,0
	goto pass
	goto changing_pass
normalwrong
	goto w_code
normalcorrect
	bsf LATB,7
; writing
	
	movlw b'01000010' ; init timer
	movwf T0CON
	clrf fini
	movlw b'11000000'; nzal aal sater
	movwf LATC
	bcf LATA,2
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2	
	
	clrf fini
	movlw b'01001100';L
	movwf LATC
	bsf LATA,2
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2	
	clrf fini
	movlw b'01001111';O
	movwf LATC
	bsf LATA,2
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2	
	clrf fini
	movlw b'01000011';C
	movwf LATC
	bsf LATA,2
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2	
	clrf fini
	movlw b'01001011';K
	movwf LATC
	bsf LATA,2
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2	
	clrf fini
	movlw b'10001111'; space
	movwf LATC
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2
	clrf fini
	movlw b'01001111';o
	movwf LATC
	bsf LATA,2
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2	
	clrf fini
	movlw b'01010000';p
	movwf LATC
	bsf LATA,2
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2	
	clrf fini
	movlw b'01000101';E
	movwf LATC
	bsf LATA,2
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2	
	clrf fini
	movlw b'01001110';N
	movwf LATC
	bsf LATA,2
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2	
	clrf fini
	movlw b'01000101';E
	movwf LATC
	bsf LATA,2
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2	
	clrf fini
	movlw b'01000100';D
	movwf LATC
	bsf LATA,2
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2	

	bra $
	
un
	movlw 0x01
	movwf charriot
	movlw 0x01
	cpfsgt nb_entered
	bra number1
	movlw 0x02
	cpfsgt nb_entered
	bra number2
	movlw 0x03
	cpfsgt nb_entered
	bra number3
	movlw 0x04
	cpfsgt nb_entered
	bra number4
quatre
	movlw 0x04
	movwf charriot
	movlw 0x01
	cpfsgt nb_entered
	bra number1
	movlw 0x02
	cpfsgt nb_entered
	bra number2
	movlw 0x03
	cpfsgt nb_entered
	bra number3
	movlw 0x04
	cpfsgt nb_entered
	bra number4
sept
	movlw 0x07
	movwf charriot
	movlw 0x01
	cpfsgt nb_entered
	bra number1
	movlw 0x02
	cpfsgt nb_entered
	bra number2
	movlw 0x03
	cpfsgt nb_entered
	bra number3
	movlw 0x04
	cpfsgt nb_entered
	bra number4
dieze
	movlw 0x16
	movwf charriot
	movlw 0x01
	cpfsgt nb_entered
	bra number1
	movlw 0x02
	cpfsgt nb_entered
	bra number2
	movlw 0x03
	cpfsgt nb_entered
	bra number3
	movlw 0x04
	cpfsgt nb_entered
	bra number4	
deux
	movlw 0x02
	movwf charriot
	movlw 0x01
	cpfsgt nb_entered
	bra number1
	movlw 0x02
	cpfsgt nb_entered
	bra number2
	movlw 0x03
	cpfsgt nb_entered
	bra number3
	movlw 0x04
	cpfsgt nb_entered
	bra number4
cinq
	movlw 0x05
	movwf charriot
	movlw 0x01
	cpfsgt nb_entered
	bra number1
	movlw 0x02
	cpfsgt nb_entered
	bra number2
	movlw 0x03
	cpfsgt nb_entered
	bra number3
	movlw 0x04
	cpfsgt nb_entered
	bra number4
huit
	movlw 0x08
	movwf charriot
	movlw 0x01
	cpfsgt nb_entered
	bra number1
	movlw 0x02
	cpfsgt nb_entered
	bra number2
	movlw 0x03
	cpfsgt nb_entered
	bra number3
	movlw 0x04
	cpfsgt nb_entered
	bra number4
zero
	movlw 0x00
	movwf charriot
	movlw 0x01
	cpfsgt nb_entered
	bra number1
	movlw 0x02
	cpfsgt nb_entered
	bra number2
	movlw 0x03
	cpfsgt nb_entered
	bra number3
	movlw 0x04
	cpfsgt nb_entered
	bra number4
trois
	movlw 0x03
	movwf charriot
	movlw 0x01
	cpfsgt nb_entered
	bra number1
	movlw 0x02
	cpfsgt nb_entered
	bra number2
	movlw 0x03
	cpfsgt nb_entered
	bra number3
	movlw 0x04
	cpfsgt nb_entered
	bra number4
six
	movlw 0x06
	movwf charriot
	movlw 0x01
	cpfsgt nb_entered
	bra number1
	movlw 0x02
	cpfsgt nb_entered
	bra number2
	movlw 0x03
	cpfsgt nb_entered
	bra number3
	movlw 0x04
	cpfsgt nb_entered
	bra number4
neuf
	movlw 0x09
	movwf charriot
	movlw 0x01
	cpfsgt nb_entered
	bra number1
	movlw 0x02
	cpfsgt nb_entered
	bra number2
	movlw 0x03
	cpfsgt nb_entered
	bra number3
	movlw 0x04
	cpfsgt nb_entered
	bra number4
para
	movlw 0x17
	movwf charriot
	movlw 0x01
	cpfsgt nb_entered
	goto number1
	movlw 0x02
	cpfsgt nb_entered
	goto number2
	movlw 0x03
	cpfsgt nb_entered
	goto number3
	movlw 0x04
	cpfsgt nb_entered
	goto number4

entering_code
	
	bsf LATD,0
	btfsc PORTD,3
	goto un
	btfsc PORTD,4
	goto quatre
	btfsc PORTD,5
	goto sept
	btfsc PORTD,6
	goto dieze
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	bcf LATD,0
	bsf LATD,1
	btfsc PORTD,3
	goto deux
	btfsc PORTD,4
	goto cinq
	btfsc PORTD,5
	goto huit
	btfsc PORTD,6
	goto zero
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	bcf LATD,1
	bsf LATD,2
	btfsc PORTD,3
	goto trois
	btfsc PORTD,4
	goto six
	btfsc PORTD,5
	goto neuf
	btfsc PORTD,6
	goto para
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	bcf LATD,2
	goto entering_code


w_code

	movlw b'01000010' ; init timer
	movwf T0CON
	clrf fini
	movlw b'11000000'; nzal aal sater
	movwf LATC
	bcf LATA,2
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2	
	
	clrf fini
	movlw b'01010111';W
	movwf LATC
	bsf LATA,2
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2	
	clrf fini
	movlw b'01010010';R
	movwf LATC
	bsf LATA,2
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2	
	clrf fini
	movlw b'01001111';C
	movwf LATC
	bsf LATA,2
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2	
	clrf fini
	movlw b'01001110';K
	movwf LATC
	bsf LATA,2
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2	
	clrf fini
	movlw b'01000111';g
	movwf LATC
	bsf LATA,2
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2	
	clrf fini
	movlw b'10001111'; space
	movwf LATC
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2
	clrf fini
	movlw b'01000011';p
	movwf LATC
	bsf LATA,2
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2	
	clrf fini
	movlw b'01001111';E
	movwf LATC
	bsf LATA,2
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2	
	clrf fini
	movlw b'01000100';N
	movwf LATC
	bsf LATA,2
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2	
	clrf fini
	movlw b'01000101';E
	movwf LATC
	bsf LATA,2
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2	
	clrf input1
	clrf input2
	clrf input3
	clrf input4
	clrf correct
	clrf pass
	goto entering_code
	
pass
	clrf pass1
	setf pass2
	setf inpass
	call writing1
	clrf correct
	goto entering_code
changing_pass
	setf pass3
	call writing2
	goto entering_code
changing_pass_try1
	movff input1,inter1
	movff input2,inter2
	movff input3,inter3
	movff input4,inter4
	clrf pass3
	setf pass4
	call writing3
	goto entering_code
changing_pass_try2
	clrf correct
	movf inter1,w
	cpfseq input1
	incf correct
	movf inter2,w
	cpfseq input2
	incf correct
	movf inter3,w
	cpfseq input3
	incf correct
	movf inter4,w
	cpfseq input4
	incf correct
	movlw 0x00
	cpfseq correct
	goto re
	clrf correct
	;if all ok
	clrf pass2
	clrf pass3
	clrf pass4
	clrf inpass
	movff inter1,digit1
	movff inter2,digit2
	movff inter3,digit3
	movff inter4,digit4
	goto final
	goto entering_code
re

	movlw b'01000010' ; init timer
	movwf T0CON
	clrf fini
	movlw b'00000001'; erase
	movwf LATC
	bcf LATA,2
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2	
	clrf fini
	movlw b'01000101';E
	movwf LATC
	bsf LATA,2
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2	

	clrf fini
	movlw b'01010010'; lettre R
	movwf LATC
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2
	
	clrf fini
	movlw b'01001111';o
	movwf LATC
	bsf LATA,2
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2	
	
	clrf fini
	movlw b'01010010'; lettre R
	movwf LATC
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2
	
	clrf fini
	movlw b'01010010'; lettre R
	movwf LATC
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2
		
	clrf fini
	movlw b'10001111'; space
	movwf LATC
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2	

	clrf fini
	movlw b'01010010'; lettre R
	movwf LATC
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2

	clrf fini
	movlw b'01000101';E
	movwf LATC
	bsf LATA,2
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2	
	
	clrf fini
	movlw b'01010011'; lettre S
	movwf LATC
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2	
	
	clrf fini
	movlw b'01000101';E
	movwf LATC
	bsf LATA,2
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2
	
	clrf fini
	movlw b'01010100'; lettre T
	movwf LATC
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2


	bra $

writing1
	movlw b'01000010' ; init timer
	movwf T0CON
	clrf fini
	movlw b'00000001'; erase
	movwf LATC
	bcf LATA,2
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2	
	clrf fini
	movlw b'01010000';p
	movwf LATC
	bsf LATA,2
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2	
	clrf fini
	movlw b'01000001';a
	movwf LATC
	bsf LATA,2
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2
	clrf fini
	movlw b'01010011'; lettre S
	movwf LATC
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2	

	clrf fini
	movlw b'01010011'; lettre S
	movwf LATC
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2	
	
	clrf fini
	movlw b'10001111'; space
	movwf LATC
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2	

	clrf fini
	movlw b'01000011'; lettre C
	movwf LATC
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2	

	clrf fini
	movlw b'01001000'; lettre H
	movwf LATC
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2	
		
	clrf fini
	movlw b'01000001';a
	movwf LATC
	bsf LATA,2
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2
	
	clrf fini
	movlw b'01001110';n
	movwf LATC
	bsf LATA,2
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2
	
	clrf fini
	movlw b'01000111';G
	movwf LATC
	bsf LATA,2
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2
	
	clrf fini
	movlw b'01000101';E
	movwf LATC
	bsf LATA,2
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2	
	
	clrf fini
	movlw b'11000000'; nzal aal sater
	movwf LATC
	bcf LATA,2
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2	

	clrf fini ; debut de l'ecriture du mot
	movlw b'01000101'
	movwf LATC
	bsf LATA,2
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2

	clrf fini
	movlw b'01001110'
	movwf LATC
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2
	
	clrf fini
	movlw b'01010100'; lettre T
	movwf LATC
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2

	clrf fini
	movlw b'01000101'; lettre E
	movwf LATC
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2

	clrf fini
	movlw b'01010010'; lettre R
	movwf LATC
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2

	clrf fini
	movlw b'10001111'; space
	movwf LATC
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2	
	
	clrf fini
	movlw b'01001111';o
	movwf LATC
	bsf LATA,2
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2	

	clrf fini
	movlw b'01001100';L
	movwf LATC
	bsf LATA,2
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2	
	
	clrf fini
	movlw b'01000100';d
	movwf LATC
	bsf LATA,2
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2	

	return

writing2
	movlw b'01000010' ; init timer
	movwf T0CON
	clrf fini
	movlw b'00000001'; erase
	movwf LATC
	bcf LATA,2
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2	
	clrf fini ; debut de l'ecriture du mot
	movlw b'01000101'
	movwf LATC
	bsf LATA,2
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2

	clrf fini
	movlw b'01001110'
	movwf LATC
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2
	
	clrf fini
	movlw b'01010100'; lettre T
	movwf LATC
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2

	clrf fini
	movlw b'01000101'; lettre E
	movwf LATC
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2

	clrf fini
	movlw b'01010010'; lettre R
	movwf LATC
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2
	
	clrf fini
	movlw b'10001111'; space
	movwf LATC
	bsf LATA,2
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2	
	
	

	clrf fini
	movlw b'01001110'; lettre N
	movwf LATC
	bsf LATA,2
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2

	clrf fini
	movlw b'01000101'; lettre E
	movwf LATC
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2

	clrf fini
	movlw b'01010111'; lettre W
	movwf LATC
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2
	
	return
writing3
	movlw b'01000010' ; init timer
	movwf T0CON
	clrf fini
	movlw b'00000001'; erase
	movwf LATC
	bcf LATA,2
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2	
	clrf fini ; debut de l'ecriture du mot
	movlw b'01001111'
	movwf LATC
	bsf LATA,2
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2

	clrf fini
	movlw b'01001110'; lettre N
	movwf LATC
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2

	clrf fini
	movlw b'01000101'; lettre E
	movwf LATC
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2
	
	clrf fini
	movlw b'10001111'; space
	movwf LATC
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2	
	
	clrf fini
	movlw b'01001101'; lettre M
	movwf LATC
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2

	clrf fini ; debut de l'ecriture du mot
	movlw b'01001111'
	movwf LATC
	bsf LATA,2
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2

	clrf fini
	movlw b'01010010'; lettre R
	movwf LATC
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2

	clrf fini
	movlw b'01000101'; lettre E
	movwf LATC
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2

	clrf fini
	movlw b'10001111'; space
	movwf LATC
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2	
	
	clrf fini
	movlw b'01010100'; lettre T
	movwf LATC
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2
	
	clrf fini
	movlw b'01001001'; lettre I
	movwf LATC
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2
	
	clrf fini
	movlw b'01001101'; lettre M
	movwf LATC
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2

	clrf fini
	movlw b'01000101'; lettre E
	movwf LATC
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2
	
	return

final

	movlw b'01000010' ; init timer
	movwf T0CON
	clrf fini
	movlw b'00000001'; erase
	movwf LATC
	bcf LATA,2
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2	
	clrf fini ; debut de l'ecriture du mot
	movlw b'01000100'
	movwf LATC
	bsf LATA,2
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2


	clrf fini ; debut de l'ecriture du mot
	movlw b'01001111'
	movwf LATC
	bsf LATA,2
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2

	clrf fini
	movlw b'01001110'; lettre N
	movwf LATC
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2
	clrf fini
	movlw b'01000101'; lettre E
	movwf LATC
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2
	movlw b'00000011' ; init timer
	movwf T0CON
	clrf fini
	bsf T0CON,7
	btfss fini,7
	bra $-2
	clrf fini
	bsf T0CON,7
	btfss fini,7
	bra $-2
	movlw b'01000010' ; init timer
	movwf T0CON

	clrf fini
	movlw b'00000001'; erase
	movwf LATC
	bcf LATA,2
	bsf LATA,0
	bcf LATA,0
	bsf T0CON,7
	btfss fini,7
	bra $-2	
	goto debut
	end