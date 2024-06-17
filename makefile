BUILD_DIR = build
VERSION   := debug
TARGET := NAYE


ASM_DIRS  = asm asm/widget asm/combat asm/N64Borg asm/other asm/data asm/gameclasses asm/maps asm/menus
BIN_DIRS  = bin bin/db bin/String bin/RAM bin/ultra bin/borg
SRC_DIRS  = src
LIBULTRA_DIRS := audio gu io n_audio os sched ai gbpak motor host debug rsp thread time cache libc
BASEROM := baserom.$(VERSION).z64
BUILD_ROOT := build
ROM_SIZE := 0x2000000

RFILTER_OUT = $(foreach v,$(2),$(if $(findstring $(1),$(v)),,$(v)))
BUILD_DIR := $(BUILD_ROOT)/$(VERSION)
SRC_DIR := src
ASM_DIR := asm
BIN_DIR := bin
GAME_SRC_DIRS   := $(shell find $(SRC_DIR)/ -type d)
LIBULTRA_SRC_DIRS := $(addprefix ultra/src/,$(LIBULTRA_DIRS))
SRC_DIRS := $(GAME_SRC_DIRS) $(LIBULTRA_SRC_DIRS)
ASM_DIRS := $(call RFILTER_OUT,nonmatching,$(shell find $(ASM_DIR)/ -type d))
SRC_BUILD_DIRS := $(addprefix $(BUILD_DIR)/,$(SRC_DIRS)) # Don't search libultra dirs, but generate them for manual specifying of libultra asm files
ASM_BUILD_DIRS := $(addprefix $(BUILD_DIR)/,$(ASM_DIRS))
BIN_BUILD_DIR := $(BUILD_DIR)/$(BIN_DIR)
KMCGCCDIR := tools/kmc/gcc

# Files
C_SRCS := $(foreach dir,$(SRC_DIRS),$(wildcard $(dir)/*.c))
C_ASMS := $(addprefix $(BUILD_DIR)/, $(C_SRCS:.c=.s))
C_OBJS := $(C_ASMS:.s=.o)
AS_SRCS := $(wildcard $(ASM_DIR)/*.s) $(foreach dir,$(ASM_DIRS),$(wildcard $(dir)/*.s)) $(addprefix ultra/,$(LIBULTRA_ASMS))
AS_OBJS := $(addprefix $(BUILD_DIR)/, $(AS_SRCS:.s=.o))
BINS := $(wildcard $(BIN_DIR)/*.bin)
BIN_OBJS := $(addprefix $(BUILD_DIR)/, $(BINS:.bin=.o))
OBJS := $(C_OBJS) $(AS_OBJS) $(BIN_OBJS)
LD_SCRIPT := AidynDebug.ld
Z64 := $(BUILD_DIR)/$(TARGET).$(VERSION).z64
ELF := $(Z64:.z64=.elf)

LIBULTRA_SRCS := $(foreach dir,$(LIBULTRA_SRC_DIRS),$(wildcard $(dir)/*.c))
SN_SRCS := $(foreach dir,$(shell find $(ASM_DIR)/aidyn/ -type d) $(shell find $(ASM_DIR)/lib/ -type d),$(wildcard $(dir)/*.c))
SN_OBJS := $(addprefix $(BUILD_DIR)/, $(SN_SRCS:.c=.o))

# Tools
ifeq ($(shell type mips-linux-gnu-ld >/dev/null 2>/dev/null; echo $$?), 0)
  CROSS := mips-linux-gnu-
else ifeq ($(shell type mips64-linux-gnu-ld >/dev/null 2>/dev/null; echo $$?), 0)
  CROSS := mips64-linux-gnu-
else
  CROSS := mips64-elf-
endif

CPP     := $(CROSS)cpp
AS      := $(CROSS)gcc
OBJCOPY := $(CROSS)objcopy
LD      := $(CROSS)gcc
STRIP   := $(CROSS)strip
KMC_DIR := tools/gcc-2.7.2
KMC_CC := $(KMC_DIR)/gcc
KMC_AS := $(KMC_DIR)/as
SN_DIR := tools/modern-sn64
SN_CC := $(SN_DIR)/gcc
SN_AS := $(SN_DIR)/modern-asn64.py

export N64ALIGN := ON
export VR4300MUL := ON

# Flags
CPPFLAGS := -Iinclude -Iinclude/2.0I -Iinclude/2.0I/PR -Iultra/src/audio -Iultra/src/n_audio -Iinclude/mus -DF3DEX_GBI_2 -D_FINALROM -DTARGET_N64 -DSUPPORT_NAUDIO -DN_MICRO -D_LANGUAGE_C
CFLAGS := -G0 -mcpu=vr4300 -mips2 -fno-exceptions -funsigned-char -gdwarf \
   -Wa,-G0,-EB,-mips3,-mabi=32,-mgp32,-march=vr4300,-mfp32,-mno-shared
ASN64FLAGS := -q -G0
KMC_CFLAGS := -c -G0  -mgp32 -mfp32 -mips3
WARNFLAGS := -Wall -Werror -Wno-uninitialized
OPTFLAGS := -O2
ASFLAGS := -march=vr4300 -mabi=32 -mgp32 -mfp32 -mips3 -mno-abicalls -G0 -fno-pic -gdwarf -c
LDFLAGS := -march=vr4300 -mabi=32 -mgp32 -mfp32 -mips3 -mno-abicalls -G0 -fno-pic -gdwarf -nostartfiles -Wl,-T,$(LD_SCRIPT) -Wl,-T,undefined_syms_auto.txt -Wl,--build-id=none
BINOFLAGS := -I binary -O elf32-tradbigmips
Z64OFLAGS := -O binary --pad-to=$(ROM_SIZE) --gap-fill=0x00

MKDIR := mkdir -p
RMDIR := rm -rf
DIFF := diff

all: check

$(SRC_BUILD_DIRS) : | $(SRC_DIR)

$(SRC_DIR) : | $(BUILD_DIR)

$(BUILD_DIR) : | $(BUILD_ROOT)

$(BUILD_ROOT) $(BUILD_DIR) $(SRC_DIR) $(ASM_BUILD_DIRS) $(BIN_BUILD_DIR) :
	$(MKDIR) $@

$(BUILD_DIR)/ultra/%.o : ultra/%.c | $(SRC_BUILD_DIRS) $(KMC_CC) $(KMC_AS)
	export COMPILER_PATH=$(KMC_DIR) && $(KMC_CC) -D__FILE__=\"$(notdir $<)\" $(CPPFLAGS) $(KMC_CFLAGS) $(OPTFLAGS) $< -o $@
	@$(STRIP) $@ -N $(<:.i=.c)


# Legacy stuff in case testing with the original toolchain is needed
# PROC_VERSION != uname -a
# IS_WSL := $(findstring microsoft,$(PROC_VERSION)) $(findstring Microsoft,$(PROC_VERSION))

# ifneq ($(strip $(IS_WSL)),)
# CC1N64 := ./sn/cc1n64.exe
# ASN64 := ./sn/asn64.exe
# else
# CC1N64 := wine ./sn/cc1n64.exe
# ASN64 := wine ./sn/asn64.exe
# endif
# CC1N64_CFLAGS := -quiet -G0 -mcpu=vr4300 -mips3 -mhard-float -meb -g

# SN_LNKS := $(addprefix $(BUILD_DIR)/, $(SN_SRCS:.c=.obj))
# $(SN_LNKS) : $(BUILD_DIR)/%.obj : %.c | $(SRC_BUILD_DIRS)
# 	@printf "Compiling $<\r\n"
# 	@$(CPP) $(CPPFLAGS) $< -o $@.i
# 	@$(CC1N64) $(CC1N64_CFLAGS) $(OPTFLAGS) $@.i -o $@.s
# 	@$(ASN64) $(ASN64FLAGS) $@.s -o $@

# $(SN_OBJS) : $(BUILD_DIR)/%.o : $(BUILD_DIR)/%.obj
# 	@printf "Running obj parser on $<\r\n"
# 	@tools/psyq-obj-parser $< -o $@ -b -n > /dev/null

$(SN_OBJS) : $(BUILD_DIR)/%.o : %.c | $(SRC_BUILD_DIRS) $(SN_CC) $(SN_AS)
	@printf "Compiling $<\r\n"
	export COMPILER_PATH=$(SN_DIR) && $(SN_CC) $(CFLAGS) $(OPTFLAGS) $(WARNFLAGS) $(CPPFLAGS) $< -c -o $@

$(BUILD_DIR)/%.o : $(BUILD_DIR)/%.s
	$(AS) $(ASFLAGS) $(CPPFLAGS) $< -o $@

$(BUILD_DIR)/%.o : %.s | $(ASM_BUILD_DIRS) $(SRC_BUILD_DIRS)
	$(AS) $(ASFLAGS) $(CPPFLAGS) $< -o $@

$(BUILD_DIR)/%.o : %.bin | $(BIN_BUILD_DIR)
	$(OBJCOPY) $(BINOFLAGS) $< $@

$(ELF) : $(OBJS)
	$(LD) $(LDFLAGS) -Wl,-Map,$(@:.elf=.map) -o $@

$(Z64) : $(ELF)
	$(OBJCOPY) $(Z64OFLAGS) $< $@
	python3 tools/n64cksum.py $@

$(BUILD_DIR)/ultra/%.o: OPTFLAGS := -O3
$(BUILD_DIR)/src/lib/%.o: WARNFLAGS := 

clean:
	$(RMDIR) $(BUILD_ROOT)

check: $(Z64)
	@$(DIFF) $(BASEROM) $(Z64) && printf "OK\n"

setup:
	rm -rf asm/ data/
	tools/splat/split.py aidyn_chronicles.$(VERSION).yaml --modes=all

$(KMC_CC) $(KMC_AS) $(SN_CC) $(SN_AS) :
	$(MAKE) -C tools/ $(@:tools/%=%)

.SUFFIXES:
MAKEFLAGS += --no-builtin-rules

.PHONY: all clean check setup

print-% : ; $(info $* is a $(flavor $*) variable set to [$($*)]) @true

