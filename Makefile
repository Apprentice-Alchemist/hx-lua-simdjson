SRC = src/hxluasimdjson.cpp src/simdjson.cpp
INCLUDE = -I$(LUA_INCDIR) 
FLAGS = -pthread -shared -fPIC -std=c++11 -Wall $(LIBFLAG) $(CFLAGS)

ifeq ($(OS),Windows_NT)
	TARGET = hxsimdjson.dll
else
	UNAME := $(shell uname -s)
	ifeq ($(findstring MINGW,$(UNAME)),MINGW)
		TARGET = hxsimdjson.dll
	else ifeq ($(findstring CYGWIN,$(UNAME)),CYGWIN)
		TARGET = hxsimdjson.dll
	else
		TARGET = hxsimdjson.so
	endif
endif

print-%: ; @echo $* = $($*) # https://stackoverflow.com/a/25817631/5116073

all: print-OS print-TARGET $(TARGET)

$(TARGET):
	$(CXX) $(SRC) $(FLAGS) $(INCLUDE) -o $@

clean:
	rm *.so *.dll

install: $(TARGET)
	cp $(TARGET) $(INST_LIBDIR)
