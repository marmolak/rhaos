all:
	nasm  -o rhaos-boot rhaos-boot.asm
	gcc -Wall -Wextra -o boot-c-env -Xlinker --oformat=binary -nostdlib boot-c-env.c
	cat rhaos-boot boot-c-env > boot

mac:
	nasm  -o rhaos-boot rhaos-boot.asm
	clang -nostartfiles -c boot-c-env.c -o boot-c-env.o -m16 -Wall -Wextra
	gobjcopy -O binary boot-c-env.o boot-c-env
	cat rhaos-boot boot-c-env > boot

run:
	qemu-system-x86_64 -s -S -hda ./boot
