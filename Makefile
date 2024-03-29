ASM=nasm

SRC_DIR=src
BUILD_DIR=build

$(BUILD_DIR)/main_floppy.img: $(BUILD_DIR)/main.bin
	cp $(BUILD_DIR)/main.bin $(BUILD_DIR)/main_floppy.img
	truncate -s 1440k $(BUILD_DIR)/main_floppy.img
	
$(BUILD_DIR)/main.bin: $(SRC_DIR)/main.s
	$(ASM) $(SRC_DIR)/main.s -f bin -o $(BUILD_DIR)/main.bin

clean:
	rm $(BUILD_DIR)/*

run: $(BUILD_DIR)/main_floppy.img
	qemu-system-x86_64 -fda $(BUILD_DIR)/main_floppy.img

