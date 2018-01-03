obj-m = kernel_src.o
KVERSION = $(shell uname -r)
all:
	gcc -o userspace_src userspace_src.c
	make -C /lib/modules/$(KVERSION)/build M=$(PWD) modules
clean:
	make -C /lib/modules/$(KVERSION)/build M=$(PWD) clean
	rm userspace_src
