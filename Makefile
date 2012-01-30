# You can put your build options here
-include config.mk

all: libjsmn.a 

demo: libjsmn.a demo.o
	$(CC) $(LDFLAGS) demo.o -L. -ljsmn -o $@

libjsmn.a: jsmn.o
	$(AR) rc $@ $^

%.o: %.c jsmn.h
	$(CC) -c $(CFLAGS) $< -o $@

test: all demo
	sh test.sh

clean:
	rm -f jsmn.o demo.o
	rm -f libjsmn.a
	rm -f demo

.PHONY: all clean test demo

