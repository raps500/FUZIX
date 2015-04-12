		.module crt0

		.globl _main
		.globl _exit
		.globl _environ
		.globl ___argv

		.area .text

start:		jmp start2
		.db 'F'
		.db 'Z'
		.db 'X'
		.db '1'

;
;	FIXME: we need to automate the load page setting
;
		.db 0x01		; page to load at
		.dw 0			; chmem ("0 - 'all'")
		.dw __sectionlen_.text	; gives us code size info
		.dw __sectionlen_.data	; gives us data size info
		.dw __sectionlen_.bss	; bss size info
		.dw 0			; spare

start2:
		; FIXME clear BSS

		; FIXME get environ, argc and argv

		ldx #_exit		; return vector
		pshs x
		jmp _main		; go

_environ:	.dw 0