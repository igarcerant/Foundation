
TARGET!=basename `pwd` | sed -n 's/^lib\.//; s/^/lib/; s/$$/.a/p'
SOURCES!=ls *.c
OBJECTS=$(SOURCES:.c=.o)

CC=gcc
AR=ar

CFLAGS+=-Wall -O2 -I.
LFLAGS+=

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

all: $(TARGET)

$(TARGET): $(OBJECTS)
	$(RM) $(TARGET)
	$(AR) q $(TARGET) $(OBJECTS)

clean:
	$(RM) $(OBJECTS)
	$(RM) $(TARGET)

rebuild: clean all
