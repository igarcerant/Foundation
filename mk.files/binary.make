
TARGET_ARCH!=arch
TARGET!=basename `pwd` | sed -n 's/^src\.//; s/$$/.$(TARGET_ARCH)/p'
SOURCES!=ls *.c
OBJECTS=$(SOURCES:.c=.o)

CC=gcc
LINK=$(CC)

CFLAGS+=-Wall -O2 -I.
LFLAGS+=

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

all: $(TARGET)

$(TARGET): $(OBJECTS)
	$(LINK) -o $@ $(OBJECTS) $(LFLAGS)

clean:
	$(RM) $(OBJECTS)
	$(RM) $(TARGET)

rebuild: clean all
