default:

	avr-gcc -g -Os -DF_CPU=16000000UL -mmcu=atmega328p -c -o led.o led.c
	avr-gcc -o led.bin led.o
	avr-objcopy -O ihex -R .eeprom led.bin led.hex
	#-P /dev/tty.usbmodem14201  is the port name
	sudo avrdude -F -V -c arduino -p ATMEGA328P -P /dev/tty.usbmodem14201 -b 115200 -U flash:w:led.hex