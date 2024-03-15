SRC = src/hxluasimdjson.cpp src/simdjson.cpp
INCLUDE = -I$(LUA_INCDIR)
LIBS_PATH = -L$(LUA_LIBDIR)
LIBS = -lpthread -llua
FLAGS = -std=c++11 -Wall $(LIBFLAG) $(CFLAGS)

all: hxsimdjson.so

hxsimdjson.so:
	$(CXX) $(SRC) $(FLAGS) $(INCLUDE) $(LIBS_PATH) $(LIBS) -o $@

clean:
	rm *.so

install: hxsimdjson.so
	cp hxsimdjson.so $(INST_LIBDIR)
