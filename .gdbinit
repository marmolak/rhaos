target remote localhost:1234
set architecture i8086
hbreak *0x7c00
continue
