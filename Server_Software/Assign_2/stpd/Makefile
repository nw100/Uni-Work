all: proxy

utils.o:utils.c
	gcc -c -Wall utils.c

proxy.o:proxy.c
	gcc -c -Wall proxy.c

proxy: proxy.o utils.o
	gcc -o stpd proxy.o utils.o -lnsl -lpthread
