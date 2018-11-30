
all:	x

x:	main.o age.o
	gcc -o x age.o main.o

main.o:	main.s
	gcc -c main.s

age.o:	age.s
	gcc -g -c age.s

main.s:	main.c
	gcc -O2 -S main.c

clean:	
	rm -f x *.o main.s
