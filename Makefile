CFLAGS=-Wall -std=c89 -g

OBJS=jsmn.o demo.o

all: jsmn_demo

jsmn_demo: $(OBJS)
	$(CC) $(LDFLAGS) $(OBJS) -o $@

%.o: %.c jsmn.h
	$(CC) -c $(CFLAGS) $< -o $@

clean:
	rm -f $(OBJS)
	rm -f jsmn_demo

.PHONY: clean all
