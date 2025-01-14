GAME_VERSION       ?= HEARTGOLD
GAME_REMASTER      ?= 0
GAME_LANGUAGE      ?= ENGLISH

ifeq ($(GAME_VERSION),HEARTGOLD)
buildname     := heartgold
TITLE_NAME    := POKEMON HG
GAME_CODE     := IPK
else
ifeq ($(GAME_VERSION),SOULSILVER)
buildname := soulsilver
TITLE_NAME    := POKEMON SS
GAME_CODE     := IPG
else
$(error Unrecognized game version: $(GAME_VERSION))
endif
endif

ifneq ($(GAME_REMASTER),0)
buildname := $(buildname).rev$(GAME_REMASTER)
endif

ifeq ($(GAME_LANGUAGE),ENGLISH)
buildname := $(buildname).us
GAME_CODE := $(GAME_CODE)E
else
$(error Unsupported game language: $(GAME_LANGUAGE))
endif

BUILD_DIR         := build/$(buildname)
NEFNAME           := main

DEFINES := -D$(GAME_VERSION) -DGAME_VERSION=$(GAME_VERSION) -DGAME_REMASTER=$(GAME_REMASTER) -D$(GAME_LANGUAGE) -DGAME_LANGUAGE=$(GAME_LANGUAGE) -DSDK_ARM9

# Secure CRC
ifeq ($(buildname),heartgold.us)
SECURE_CRC := 0xA0FF
endif
ifeq ($(buildname),soulsilver.us)
SECURE_CRC := 0x86A5
endif

ifndef SECURE_CRC
$(error Unsupported ROM: $(GAME_VERSION) $(GAME_LANGUAGE))
endif

# At present this repository only supports the 1.0 US ROMs
SUPPORTED_ROMS   := heartgold.us soulsilver.us
ifneq ($(filter $(buildname),$(SUPPORTED_ROMS)),$(buildname))
$(error $(buildname) is not supported, choose from: $(SUPPORTED_ROMS))
endif
