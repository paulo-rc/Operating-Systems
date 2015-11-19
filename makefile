FILE_NAME		:= 	code.cpp
ARDUINO_PATH	:=	/opt/arduino-1.6.5-r5
PORT			:=	/dev/ttyUSB0
DEVICE 			:= 	atmega328p
DEVICE_FLAGS 	:= 	-mmcu=$(DEVICE) -DF_CPU=16000000L -DARDUINO=10605 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR
GPP_FLAGS 		:= 	-c -g -Os -w -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -MMD $(DEVICE_FLAGS) 
GCC_FLAGS 		:= 	-c -g -Os -w -ffunction-sections -fdata-sections -MMD $(DEVICE_FLAGS)

CURRENT_DIR		= 	$(shell pwd)

default: prepare compile upload

prepare:
	rm -fdR $(CURRENT_DIR)/temp
	mkdir $(CURRENT_DIR)/temp

compile:
	avr-g++ $(GPP_FLAGS) -I$(ARDUINO_PATH)/hardware/arduino/avr/cores/arduino -I$(ARDUINO_PATH)/hardware/arduino/avr/variants/standard $(CURRENT_DIR)/$(FILE_NAME) -o $(CURRENT_DIR)/temp/$(FILE_NAME).o 

	avr-gcc -c -g -x assembler-with-cpp $(DEVICE_FLAGS) -I$(ARDUINO_PATH)/hardware/arduino/avr/cores/arduino -I$(ARDUINO_PATH)/hardware/arduino/avr/variants/standard $(ARDUINO_PATH)/hardware/arduino/avr/cores/arduino/wiring_pulse.S -o $(CURRENT_DIR)/temp/wiring_pulse.S.o
	avr-gcc $(GCC_FLAGS) -I$(ARDUINO_PATH)/hardware/arduino/avr/cores/arduino -I$(ARDUINO_PATH)/hardware/arduino/avr/variants/standard $(ARDUINO_PATH)/hardware/arduino/avr/cores/arduino/hooks.c -o $(CURRENT_DIR)/temp/hooks.c.o 
	avr-gcc $(GCC_FLAGS) -I$(ARDUINO_PATH)/hardware/arduino/avr/cores/arduino -I$(ARDUINO_PATH)/hardware/arduino/avr/variants/standard $(ARDUINO_PATH)/hardware/arduino/avr/cores/arduino/wiring_digital.c -o $(CURRENT_DIR)/temp/wiring_digital.c.o 
	avr-gcc $(GCC_FLAGS) -I$(ARDUINO_PATH)/hardware/arduino/avr/cores/arduino -I$(ARDUINO_PATH)/hardware/arduino/avr/variants/standard $(ARDUINO_PATH)/hardware/arduino/avr/cores/arduino/wiring.c -o $(CURRENT_DIR)/temp/wiring.c.o 
	avr-gcc $(GCC_FLAGS) -I$(ARDUINO_PATH)/hardware/arduino/avr/cores/arduino -I$(ARDUINO_PATH)/hardware/arduino/avr/variants/standard $(ARDUINO_PATH)/hardware/arduino/avr/cores/arduino/wiring_analog.c -o $(CURRENT_DIR)/temp/wiring_analog.c.o 
	avr-gcc $(GCC_FLAGS) -I$(ARDUINO_PATH)/hardware/arduino/avr/cores/arduino -I$(ARDUINO_PATH)/hardware/arduino/avr/variants/standard $(ARDUINO_PATH)/hardware/arduino/avr/cores/arduino/WInterrupts.c -o $(CURRENT_DIR)/temp/WInterrupts.c.o 
	avr-gcc $(GCC_FLAGS) -I$(ARDUINO_PATH)/hardware/arduino/avr/cores/arduino -I$(ARDUINO_PATH)/hardware/arduino/avr/variants/standard $(ARDUINO_PATH)/hardware/arduino/avr/cores/arduino/wiring_shift.c -o $(CURRENT_DIR)/temp/wiring_shift.c.o 
	avr-gcc $(GCC_FLAGS) -I$(ARDUINO_PATH)/hardware/arduino/avr/cores/arduino -I$(ARDUINO_PATH)/hardware/arduino/avr/variants/standard $(ARDUINO_PATH)/hardware/arduino/avr/cores/arduino/wiring_pulse.c -o $(CURRENT_DIR)/temp/wiring_pulse.c.o 

	avr-g++ $(GPP_FLAGS) -I$(ARDUINO_PATH)/hardware/arduino/avr/cores/arduino -I$(ARDUINO_PATH)/hardware/arduino/avr/variants/standard $(ARDUINO_PATH)/hardware/arduino/avr/cores/arduino/HID.cpp -o $(CURRENT_DIR)/temp/HID.cpp.o 
	avr-g++ $(GPP_FLAGS) -I$(ARDUINO_PATH)/hardware/arduino/avr/cores/arduino -I$(ARDUINO_PATH)/hardware/arduino/avr/variants/standard $(ARDUINO_PATH)/hardware/arduino/avr/cores/arduino/Tone.cpp -o $(CURRENT_DIR)/temp/Tone.cpp.o 
	avr-g++ $(GPP_FLAGS) -I$(ARDUINO_PATH)/hardware/arduino/avr/cores/arduino -I$(ARDUINO_PATH)/hardware/arduino/avr/variants/standard $(ARDUINO_PATH)/hardware/arduino/avr/cores/arduino/WString.cpp -o $(CURRENT_DIR)/temp/WString.cpp.o 
	avr-g++ $(GPP_FLAGS) -I$(ARDUINO_PATH)/hardware/arduino/avr/cores/arduino -I$(ARDUINO_PATH)/hardware/arduino/avr/variants/standard $(ARDUINO_PATH)/hardware/arduino/avr/cores/arduino/HardwareSerial1.cpp -o $(CURRENT_DIR)/temp/HardwareSerial1.cpp.o 
	avr-g++ $(GPP_FLAGS) -I$(ARDUINO_PATH)/hardware/arduino/avr/cores/arduino -I$(ARDUINO_PATH)/hardware/arduino/avr/variants/standard $(ARDUINO_PATH)/hardware/arduino/avr/cores/arduino/HardwareSerial2.cpp -o $(CURRENT_DIR)/temp/HardwareSerial2.cpp.o 
	avr-g++ $(GPP_FLAGS) -I$(ARDUINO_PATH)/hardware/arduino/avr/cores/arduino -I$(ARDUINO_PATH)/hardware/arduino/avr/variants/standard $(ARDUINO_PATH)/hardware/arduino/avr/cores/arduino/WMath.cpp -o $(CURRENT_DIR)/temp/WMath.cpp.o
	avr-g++ $(GPP_FLAGS) -I$(ARDUINO_PATH)/hardware/arduino/avr/cores/arduino -I$(ARDUINO_PATH)/hardware/arduino/avr/variants/standard $(ARDUINO_PATH)/hardware/arduino/avr/cores/arduino/main.cpp -o $(CURRENT_DIR)/temp/main.cpp.o 
	avr-g++ $(GPP_FLAGS) -I$(ARDUINO_PATH)/hardware/arduino/avr/cores/arduino -I$(ARDUINO_PATH)/hardware/arduino/avr/variants/standard $(ARDUINO_PATH)/hardware/arduino/avr/cores/arduino/IPAddress.cpp -o $(CURRENT_DIR)/temp/IPAddress.cpp.o 
	avr-g++ $(GPP_FLAGS) -I$(ARDUINO_PATH)/hardware/arduino/avr/cores/arduino -I$(ARDUINO_PATH)/hardware/arduino/avr/variants/standard $(ARDUINO_PATH)/hardware/arduino/avr/cores/arduino/Stream.cpp -o $(CURRENT_DIR)/temp/Stream.cpp.o
	avr-g++ $(GPP_FLAGS) -I$(ARDUINO_PATH)/hardware/arduino/avr/cores/arduino -I$(ARDUINO_PATH)/hardware/arduino/avr/variants/standard $(ARDUINO_PATH)/hardware/arduino/avr/cores/arduino/CDC.cpp -o $(CURRENT_DIR)/temp/CDC.cpp.o 
	avr-g++ $(GPP_FLAGS) -I$(ARDUINO_PATH)/hardware/arduino/avr/cores/arduino -I$(ARDUINO_PATH)/hardware/arduino/avr/variants/standard $(ARDUINO_PATH)/hardware/arduino/avr/cores/arduino/USBCore.cpp -o $(CURRENT_DIR)/temp/USBCore.cpp.o 
	avr-g++ $(GPP_FLAGS) -I$(ARDUINO_PATH)/hardware/arduino/avr/cores/arduino -I$(ARDUINO_PATH)/hardware/arduino/avr/variants/standard $(ARDUINO_PATH)/hardware/arduino/avr/cores/arduino/abi.cpp -o $(CURRENT_DIR)/temp/abi.cpp.o 
	avr-g++ $(GPP_FLAGS) -I$(ARDUINO_PATH)/hardware/arduino/avr/cores/arduino -I$(ARDUINO_PATH)/hardware/arduino/avr/variants/standard $(ARDUINO_PATH)/hardware/arduino/avr/cores/arduino/HardwareSerial3.cpp -o $(CURRENT_DIR)/temp/HardwareSerial3.cpp.o 
	avr-g++ $(GPP_FLAGS) -I$(ARDUINO_PATH)/hardware/arduino/avr/cores/arduino -I$(ARDUINO_PATH)/hardware/arduino/avr/variants/standard $(ARDUINO_PATH)/hardware/arduino/avr/cores/arduino/HardwareSerial0.cpp -o $(CURRENT_DIR)/temp/HardwareSerial0.cpp.o 
	avr-g++ $(GPP_FLAGS) -I$(ARDUINO_PATH)/hardware/arduino/avr/cores/arduino -I$(ARDUINO_PATH)/hardware/arduino/avr/variants/standard $(ARDUINO_PATH)/hardware/arduino/avr/cores/arduino/Print.cpp -o $(CURRENT_DIR)/temp/Print.cpp.o 
	avr-g++ $(GPP_FLAGS) -I$(ARDUINO_PATH)/hardware/arduino/avr/cores/arduino -I$(ARDUINO_PATH)/hardware/arduino/avr/variants/standard $(ARDUINO_PATH)/hardware/arduino/avr/cores/arduino/new.cpp -o $(CURRENT_DIR)/temp/new.cpp.o 
	avr-g++ $(GPP_FLAGS) -I$(ARDUINO_PATH)/hardware/arduino/avr/cores/arduino -I$(ARDUINO_PATH)/hardware/arduino/avr/variants/standard $(ARDUINO_PATH)/hardware/arduino/avr/cores/arduino/HardwareSerial.cpp -o $(CURRENT_DIR)/temp/HardwareSerial.cpp.o 

	avr-ar rcs $(CURRENT_DIR)/temp/core.a $(CURRENT_DIR)/temp/wiring_pulse.S.o 
	avr-ar rcs $(CURRENT_DIR)/temp/core.a $(CURRENT_DIR)/temp/hooks.c.o 
	avr-ar rcs $(CURRENT_DIR)/temp/core.a $(CURRENT_DIR)/temp/wiring_digital.c.o 
	avr-ar rcs $(CURRENT_DIR)/temp/core.a $(CURRENT_DIR)/temp/wiring.c.o 
	avr-ar rcs $(CURRENT_DIR)/temp/core.a $(CURRENT_DIR)/temp/wiring_analog.c.o 
	avr-ar rcs $(CURRENT_DIR)/temp/core.a $(CURRENT_DIR)/temp/WInterrupts.c.o 
	avr-ar rcs $(CURRENT_DIR)/temp/core.a $(CURRENT_DIR)/temp/wiring_shift.c.o 
	avr-ar rcs $(CURRENT_DIR)/temp/core.a $(CURRENT_DIR)/temp/wiring_pulse.c.o 
	avr-ar rcs $(CURRENT_DIR)/temp/core.a $(CURRENT_DIR)/temp/HID.cpp.o 
	avr-ar rcs $(CURRENT_DIR)/temp/core.a $(CURRENT_DIR)/temp/Tone.cpp.o 
	avr-ar rcs $(CURRENT_DIR)/temp/core.a $(CURRENT_DIR)/temp/WString.cpp.o 
	avr-ar rcs $(CURRENT_DIR)/temp/core.a $(CURRENT_DIR)/temp/HardwareSerial1.cpp.o 
	avr-ar rcs $(CURRENT_DIR)/temp/core.a $(CURRENT_DIR)/temp/HardwareSerial2.cpp.o 
	avr-ar rcs $(CURRENT_DIR)/temp/core.a $(CURRENT_DIR)/temp/WMath.cpp.o 
	avr-ar rcs $(CURRENT_DIR)/temp/core.a $(CURRENT_DIR)/temp/main.cpp.o 
	avr-ar rcs $(CURRENT_DIR)/temp/core.a $(CURRENT_DIR)/temp/IPAddress.cpp.o 
	avr-ar rcs $(CURRENT_DIR)/temp/core.a $(CURRENT_DIR)/temp/Stream.cpp.o 
	avr-ar rcs $(CURRENT_DIR)/temp/core.a $(CURRENT_DIR)/temp/CDC.cpp.o 
	avr-ar rcs $(CURRENT_DIR)/temp/core.a $(CURRENT_DIR)/temp/USBCore.cpp.o 
	avr-ar rcs $(CURRENT_DIR)/temp/core.a $(CURRENT_DIR)/temp/abi.cpp.o 
	avr-ar rcs $(CURRENT_DIR)/temp/core.a $(CURRENT_DIR)/temp/HardwareSerial3.cpp.o 
	avr-ar rcs $(CURRENT_DIR)/temp/core.a $(CURRENT_DIR)/temp/HardwareSerial0.cpp.o 
	avr-ar rcs $(CURRENT_DIR)/temp/core.a $(CURRENT_DIR)/temp/Print.cpp.o 
	avr-ar rcs $(CURRENT_DIR)/temp/core.a $(CURRENT_DIR)/temp/new.cpp.o 
	avr-ar rcs $(CURRENT_DIR)/temp/core.a $(CURRENT_DIR)/temp/HardwareSerial.cpp.o 

	avr-gcc -w -Os -Wl,--gc-sections -mmcu=$(DEVICE) -o $(CURRENT_DIR)/temp/$(FILE_NAME).elf $(CURRENT_DIR)/temp/$(FILE_NAME).o $(CURRENT_DIR)/temp/core.a -L$(CURRENT_DIR)/temp/ -lm 

	avr-objcopy -O ihex -j .eeprom --set-section-flags=.eeprom=alloc,load --no-change-warnings --change-section-lma .eeprom=0 $(CURRENT_DIR)/temp/$(FILE_NAME).elf $(CURRENT_DIR)/temp/$(FILE_NAME).eep 
	avr-objcopy -O ihex -R .eeprom $(CURRENT_DIR)/temp/$(FILE_NAME).elf $(CURRENT_DIR)/temp/$(FILE_NAME).hex 

upload: 
	avrdude -C$(ARDUINO_PATH)/hardware/tools/avr/etc/avrdude.conf -v -p$(DEVICE) -carduino -P$(PORT) -b115200 -D -Uflash:w:$(CURRENT_DIR)/temp/$(FILE_NAME).hex:i 

clean:
	rm -fdR $(CURRENT_DIR)/temp
