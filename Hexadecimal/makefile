
all:	x bonux

x:	main.o hex_str.o
	gcc -o x main.o hex_str.o

bonux:	main.o hex_str_bonus.o
	gcc -o bonux main.o hex_str_bonus.o

main.o:	main.s
	gcc -c main.s

hex_str.o:	hex_str.s
	gcc -g -c hex_str.s

hex_str_bonus.o:	hex_str_bonus.s
	gcc -g -c hex_str_bonus.s

main.s:	main.c
	gcc -O2 -S main.c

clean:	
	rm -f x bonux *.o main.s
