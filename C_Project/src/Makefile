CC = sdcc
CFLAGS = -mz80 -c "-I../Vendor/libcv-0.24-2/include/" --std-c99
CFLAGS-SMS = $(CFLAGS) -DCV_SMS
LIB = ../Vendor/libcv-0.24-2/bin/
PNG2CVS = png2cvs # Change to ../../../png2cvs/png2cvs or whatever if not installed.

.PHONY: all clean

all: Test.rom

Test.rom: main.rel Test.png.sprite.rel Wall.png.sprite.rel
	$(CC) -mz80 --no-std-crt0 --code-loc 0x8100 --data-loc 0x7000 $(LIB)libcvu.lib $(LIB)libcv.lib $(LIB)crt0.rel main.rel Wall.png.sprite.rel Test.png.sprite.rel -o Test.ihx ; objcopy --input-target=ihex --output-target=binary Test.ihx Test.rom

Test.png.sprite.rel: Test.png.sprite.c
	$(CC) $(CFLAGS) Test.png.sprite.c
Test.png.sprite.c: Test.png
	$(PNG2CVS) --big --outfile Test.png.sprite.c Test.png
	
Wall.png.sprite.rel: Wall.png.sprite.c
	$(CC) $(CFLAGS) Wall.png.sprite.c
Wall.png.sprite.c: Wall.png
	$(PNG2CVS) --big --outfile Wall.png.sprite.c Wall.png

main.rel: main.c
	$(CC) $(CFLAGS) main.c

clean:
	rm -f *.rel *.map *.lst *.lnk *.sym *.asm *~ *.rel *.noi *.ihx *.sprite.* *.lk