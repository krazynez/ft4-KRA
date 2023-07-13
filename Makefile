TARGET = ft4-kra
OBJS   = src/main.o src/ftpsp.o src/psp_functions.o \
         src/utils.o  src/mutex-imports.o

INCDIR   = ./inc
CFLAGS   = -G0 -Wall -O2 -Wno-unused-function
CXXFLAGS = $(CFLAGS) -fno-exceptions -fno-rtti
ASFLAGS  = $(CFLAGS)
LIBDIR = ./libs
LIBS     = -lpspsystemctrl_user -lpspgu -lpspnet -lpspdisplay \
           -lpspgum -lz -lm

BUILD_PRX       = 1 
PSP_FW_VERSION  = 660
EXTRA_TARGETS   = EBOOT.PBP
PSP_EBOOT_TITLE = FT4-KRA
PSP_EBOOT_ICON  = ICON0.PNG



PSPSDK = $(shell psp-config --pspsdk-path)
include $(PSPSDK)/lib/build.mak

pkg: package

clean: rm_xz

rm_xz:
	@rm *.xz 2>/dev/null && echo Removed old xz file || true


all:
	@rm -f *.xz

package:
	$(MAKE) clean
	@tar cJf $(TARGET).xz *
	@echo "xz file created: $(TARGET).xz"

#copy: EBOOT.PBP
#	mkdir -p "/media/$(USER)/disk/PSP/GAME/$(notdir $(CURDIR))"
#	cp EBOOT.PBP "/media/$(USER)/disk/PSP/GAME/$(notdir $(CURDIR))"
#	sync
