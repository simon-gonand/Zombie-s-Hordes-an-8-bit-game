;--------------------------------------------
; MSX ver 1.0 (C) Electric Adventures 2015
;--------------------------------------------

; VDP Access Standard Values
; --------------------------

; VDP - Write ports
DATA_PORT: EQU 098h
CTRL_PORT: EQU 099h

; VDP - Read Ports
DATAR_PORT:  EQU 098h
CTRLR_PORT:  EQU 099h

; Video modes
SCRMODE_STANDARD:               EQU 00h
SCRMODE_TEXT:                   EQU 10h
SCRMODE_MULTICOLOR:             EQU 08h
SCRMODE_BITMAP:                 EQU 02h
SCRMODE_BITMAP_TEXT:            EQU 12h
SCRMODE_BITMAP_MULTICOLOR:      EQU 0ah
SCRMODE_BITMAP_TEXT_MULTICOLOR: EQU 1ah

; TMS99xxA colours
COLOR_TRANSPARENT:          EQU 00h
COLOR_BLACK:                EQU 01h
COLOR_GREEN:                EQU 02h
COLOR_LIGHT_GREEN:          EQU 03h
COLOR_BLUE:                 EQU 04h
COLOR_LIGHT_BLUE:           EQU 05h
COLOR_DARK_RED:             EQU 06h
COLOR_CYAN:                 EQU 07h
COLOR_RED:                  EQU 08h
COLOR_LIGHT_RED:            EQU 09h
COLOR_YELLOW:               EQU 0ah
COLOR_LIGHT_YELLOW:         EQU 0bh
COLOR_DARK_GREEN:           EQU 0ch
COLOR_MAGENTA:              EQU 0dh
COLOR_GRAY:                 EQU 0eh
COLOR_WHITE:                EQU 0fh

; VRAM DEFAULT TABLES
VRAM_PATTERN:       EQU $0000
VRAM_NAME:          EQU $1800
VRAM_SPRATTR:       EQU $1B00
VRAM_COLOR:         EQU $2000
VRAM_SPRGEN:        EQU $3800

; PSG Access Standard Value
; -------------------------

; PSG Ports
PSG_LATCH: EQU 0A0h   ; 0A0h
PSG_WRITE: EQU 0A1h   ; 0A1h
PSG_READ:  EQU 0A2h   ; 0A2h

PSG_PORTB: EQU 15

; PPI Access Standard Value
; -------------------------

PPI:       EQU 0A8h   ; 0A8h
PPI_PORTA: EQU 0A8h   ; 0A8h
PPI_PORTB: EQU 0A9h   ; 0A9h
PPI_PORTC: EQU 0AAh   ; 0AAh
PPI_MODE:  EQU 0ABh   ; 0ABh

H.KEYI:	EQU	0FD9Ah		; interrupt hook
EXPTBL:	EQU	0FCC1h		; slots expanded or not
PSLTRG:	EQU	0A8h		; I/O port address of primary slot register
TIME:	EQU 0FCA2h
RG1SAV:	EQU 0F3E0h
BAKCLR:	EQU 0F3EAh
BANKCL:	EQU 0001Ch
