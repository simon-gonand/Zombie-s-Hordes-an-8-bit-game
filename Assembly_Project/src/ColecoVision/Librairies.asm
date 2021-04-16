;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;    NMI Routine
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
NMI:
	PUSH	AF
	PUSH	BC
	PUSH	DE
	PUSH	HL
	PUSH	IX
	PUSH	IY
	EX	AF,AF'
	PUSH	AF
	EXX
	PUSH	BC
	PUSH	DE
	PUSH	HL
	; update our time counter
    LD HL,(TIME)
    DEC HL
    LD (TIME),HL
    ;Now we can safely call any OS7 calls
	CALL	PLAY_SONGS	;Update active music
	CALL	SOUND_MAN	;Prepare for next go at music
	; write sprite table
    CALL    SPRWRT
    LD A,(VDU_HOOK)
    CP 0cdh
    JR NZ,NMI2
    CALL VDU_HOOK
 NMI2:
	CALL	TIME_MGR

;Now restore everything
	POP	HL
	POP	DE
	POP	BC
	EXX
	POP	AF
	EX	AF,AF'
	POP	IY
	POP	IX
	POP	HL
	POP	DE
	POP	BC

	CALL	READ_REGISTER	;Side effect allows another NMI to happen

	POP	AF

	RETN	;Non maskable interrupt used for:
		;music, processing timers, sprite motion processing

SET_SCREEN_MODE_2_2:
    LD BC,0002h	; Reg 0: Mode 2
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
    LD BC,01c2h	; Reg 1: Mode 2, 16k, no interrupts, 16x16 sprites
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
TIME:         DS 2
;    Create and enable standard timers to keep the framerate
CREATE_TIMERS:
	LD	HL,(AMERICA)	;How long a second is (beetween 50 and 60 ticks per second)
	SRA L
	LD	H,0
	LD	A,1	;Set to repeating
	CALL	REQUEST_SIGNAL
	LD	(HalfSecTimer),A		;Happens once per half second
	LD	HL,(AMERICA)	;How long a second is
	SRA L
	SRA L
	LD	H,0
	LD	A,1	;Set to repeating
	CALL	REQUEST_SIGNAL
	LD	(QtrSecTimer),A		;Happens once per quarter second
	LD	HL,1
	LD	A,1	;Set to repeating
	CALL	REQUEST_SIGNAL
	LD	(TickTimer),A		;Happens once per tick
    RET

; Disable Non Maskable Interrupt that are accepted by the CPU at any time to avoid any conflicts when displaying on screen
DISABLE_NMI:
	LD      A,(073C4h)
	AND     0DFh
DNMI1:
	LD      C,A
	LD      B,1
	JP      01FD9h

ENABLE_NMI:
	LD      A,(073C4h)
	OR      020h
	CALL    DNMI1
	JP      01FDCh

; Load, Increment and Repeat, copies the nomber of bytes that is in BC from HL register into DE
LDIRVM:
    CALL SETWRT
LLOOP:
    LD A,(DE)
    OUT (DATA_PORT),A
    INC DE
    DEC BC
    LD A,C
    OR B
    CP 0
    JR NZ,LLOOP
    RET

; Set write to Video Ram
; HL = VRAM Address
SETWRT:
    DI
    LD A,L
    OUT (CTRL_PORT),A
    LD A,H
    AND 3Fh
    OR 40h
    OUT (CTRL_PORT),A
    EI
    RET

; Write Sprite positions to VRAM
SPRWRT:
    LD A,(SPRORDER)
    BIT 0,A
    JR NZ,SW1
    ; Write sprites normal order
    SET 0,A
    LD (SPRORDER),A
    LD HL,VRAM_SPRATTR
    LD DE,SPRTBL
    LD BC,80h
    CALL LDIRVM
    RET
SW1:
    ; Write sprites reverse order
    RES 0,A
    LD (SPRORDER),A
    LD HL,VRAM_SPRATTR
    CALL SETWRT
    LD HL,SPRTBL+80h-4
    LD B,32
    LD DE,7
SW2:
    LD A,(HL)
    INC HL
    OUT (DATA_PORT),A
    LD A,(HL)
    INC HL
    OUT (DATA_PORT),A
    LD A,(HL)
    INC HL
    OUT (DATA_PORT),A
    LD A,(HL)
    OUT (DATA_PORT),A
    XOR A
    SBC HL,DE
    DJNZ SW2
    RET

; Clear the sprites from the screen (set Y=209, coordinate that is outside from the screen)
CLEARSPRITES:
	LD B,80h
	LD DE,SPRTBL
CSPR1:
    LD A,209
	LD (DE),A
	INC DE
	;DEC B
	;LD A,B
	;CP 0
	DJNZ CSPR1
	RET

; Clear the VDP Pattern table (clears screen)
CLEARPAT:
	LD HL,VRAM_NAME
	LD BC,768
	XOR A
	CALL FILVRM
    RET

; Fill a section of VRAM with value in A
; HL = VRAM Address
; BC = Length
FILVRM:
    LD E,A
    CALL SETWRT
FLOOP:
    LD A,E
    OUT (DATA_PORT),A
    DEC BC
    LD A,C
    OR B
    CP 0
    JR NZ,FLOOP
    RET

; HL = Hook Address
SET_VDU_HOOK:
   LD A,0cdh
   LD (VDU_HOOK),A
   LD (VDU_HOOK+1),HL
   LD A,0c9h
   LD (VDU_HOOK+3),A
   RET

ORG 07030h ; RAM origin, not 07000h to avoid Coleco BIOS RAM usage area
;    Sprites variables
SPRTBL:   DS 80h ; Allocates memory for the sprites in the RAM, each sprites takes 4 dataspace to store position, pattern and color
SPRORDER:     DS 1 ; Flag to indicate the current sprite write direction
VDU_HOOK: DS 4 ; NMI VDU Delayed writes hook