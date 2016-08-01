C=gcc
CXX=g++ -std=c++11
CFLAGS=-I./include
LDFLAGS=-Wl,--no-as-needed -ldl -pthread
LINK=g++

SRC=./src
INCLUDE=./include
BUILD=./build
TOOL_SRC=./tool

.PHONY: all
all: $(BUILD)/main

$(BUILD)/main: $(BUILD)/main.o $(BUILD)/combinition.o $(BUILD)/libClassifier.o $(BUILD)/sqlite3.o $(BUILD)/TC_process.o
	$(LINK) $(LDFLAGS) $^ -o $@

$(BUILD)/combinition.o: $(SRC)/combinition.cpp
	mkdir -p $(BUILD)
	$(CXX) $^ $(CFLAGS) -c -o $@

$(BUILD)/libClassifier.o: $(SRC)/libClassifier.cpp
	$(CXX) $^ $(CFLAGS) -c -o $@

$(BUILD)/sqlite3.o: $(SRC)/sqlite3.c
	$(C) $^ $(CFLAGS) -c -o $@

$(BUILD)/TC_process.o: $(SRC)/TC_process.cpp
	$(CXX) $^ $(CFLAGS) -c -o $@

$(BUILD)/main.o: $(TOOL_SRC)/main.cpp
	$(CXX) $^ $(CFLAGS) -c -o $@

clean:
	rm build/*.o
	rm -f build/main
