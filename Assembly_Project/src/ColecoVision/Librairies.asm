;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;    NMI Routine
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
NMI:
;    TODO Later

SET_SCREEN_MODE_2_2:
    LD BC,0002h	;Reg 0: Mode 2
    CALL WRITE_REGISTER
    LD BC,0206h        ; Name table 1800h
    CALL WRITE_REGISTER
    LD BC,03ffh        ; Colour table 2000h
    CALL WRITE_REGISTER
    LD BC,0403h        ; Pattern table 0000h
    CALL WRITE_REGISTER
    LD BC,0536h        ; Sprite attribute table 1b00h
    CALL WRITE_REGISTER
    LD BC,0607h        ; Sprite pattern table 3800h
    CALL WRITE_REGISTER
    LD BC,0700h        ; Base colours
    CALL WRITE_REGISTER
    LD BC,01c2h	;Reg 1: Mode 2, 16k, no interrupts, 16x16 sprites
    CALL WRITE_REGISTER
    RET

;   Seed Random numbers
SEED:    DS 4
;   Seed in HL
SEED_RANDOM:
    LD (SEED),HL
    RR H
    RL L
    LD (SEED+2),HL
    RET

;     Signals for timers
TickTimer:    DS 1 ; Signal that 3 frames has elapsed
HalfSecTimer: DS 1 ; Signal that 1/2 second has elapsed
QtrSecTimer:  DS 1 ; Signal that 1/4 second has elapsed
;    Create and enable standard timers to keep the framerate
CREATE_TIMERS:
	LD	HL,(AMERICA)	;How long a second is (beetween 50 and 60 ticks per second)
	SRA L
	LD	H,0
	LD	A,1	;set to repeating
	CALL	REQUEST_SIGNAL
	LD	(HalfSecTimer),A		;Happens once per half second
	LD	HL,(AMERICA)	;How long a second is
	SRA L
	SRA L
	LD	H,0
	LD	A,1	;set to repeating
	CALL	REQUEST_SIGNAL
	LD	(QtrSecTimer),A		;Happens once per quarter second
	LD	HL,1
	LD	A,1	;set to repeating
	CALL	REQUEST_SIGNAL
	LD	(TickTimer),A		;Happens once per tick
    RET