TARGET=helloworld

SRC_DIR=./src
OBJ_DIR=./obj
BIN_DIR=./bin

CC        = gcc
CXX       = g++
CFLAGS    = -std=c11 -g -O0
CPPFLAGS  = -std=c++17 -g -O0
CXXFLAGS  = 
LDFLAGS   = 
LOADLIBES = 
#LDLIBS    = -static -lstdc++ -lgcc -lwinpthread
LDLIBS    = -static -lstdc++ -lgcc -pthread
#LDLIBS    =  -static -lgcc -pthread

EXTENSION:=.cpp
#EXTENSION:=.c
SRC:=$(wildcard  $(SRC_DIR)/**/*$(EXTENSION)) $(wildcard $(SRC_DIR)/*$(EXTENSION))
SRC_WITHOUT_PREFIX:=$(patsubst $(SRC_DIR)%,%,$(SRC))
OBJ:=$(addprefix $(OBJ_DIR),$(SRC_WITHOUT_PREFIX:$(EXTENSION)=.o))

$(BIN_DIR)/$(TARGET) : $(OBJ)
	@if [ ! -d $(BIN_DIR) ]; then mkdir $(BIN_DIR); fi
	$(CC) $(LDFLAGS) $^ $(LOADLIBES) $(LDLIBS) -o $@

$(OBJ_DIR)/%.o : $(SRC_DIR)/%$(EXTENSION)
	@if [ ! -d $(OBJ_DIR) ]; then mkdir $(OBJ_DIR); fi
	$(CXX) $(CXXFLAGS) $(CPPFLAGS) -c -o $@ $<
#	$(CC) $(CFLAGS) -c -o $@ $<

$(OBJ_DIR)/%.o : makefile

all: $(BIN_DIR)/$(TARGET)

clean:
	@if [ -d $(OBJ_DIR) ]; then rm -fr $(OBJ_DIR); fi
	@if [ -d $(BIN_DIR) ]; then rm -fr $(BIN_DIR); fi
