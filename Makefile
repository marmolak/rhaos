all:
	nasm  -o rhaos-boot rhaos-boot.asm
	gcc -Wall -Wextra -o boot-c-env -Xlinker --oformat=binary -nostdlib boot-c-env.c
	cat rhaos-boot boot-c-env > boot

run:
	qemu-kvm -s -S -hda ./boot
