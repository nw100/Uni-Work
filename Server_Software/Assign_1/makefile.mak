CFLAGS =  -pthread -Wall -pedantic
TARGET = demo
SOURCES =  $(TARGET).c
CC = gcc


all: $(TARGET)

$(TARGET): $(SOURCES)
	$(CC)  $(CFLAGS) $(SOURCES) -o $(TARGET) 

clean:
	rm -f $(TARGET)

run: all
	$(TARGET)