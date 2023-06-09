TARGET := install

INCLUDE_DIR := include
SOURCE_DIR := src
FILE_EXTENSION := cpp

SOURCE_FILES := $(wildcard $(SOURCE_DIR)/*.$(FILE_EXTENSION))
OBJECT_FILES := $(SOURCE_FILES:%.$(FILE_EXTENSION)=%.o)

CFLAGS := -Wall -Wextra -pedantic -I$(INCLUDE_DIR) -O3 -DNDEBUG -s
LDLINKS := 
COMPILER := g++
REMOVE := rm

%.o: %.$(FILE_EXTENSION)
	$(COMPILER) -c -o $@ $(CFLAGS) $<
$(TARGET): $(OBJECT_FILES)
	$(COMPILER) -o $@ $^ $(LDLINKS) $(CFLAGS)

all: $(OBJECT_FILES) $(TARGET)

.PHONY: clean
clean:
	$(REMOVE) $(OBJECT_FILES) $(TARGET)
