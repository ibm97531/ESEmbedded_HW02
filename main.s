.syntax unified

.global _start

.type _start, %function


	.word 0x20000100
	.word _start

_start:
	@
	@mov # to reg
	@
	movs	r0, #100
	movs.w	r1, #0x11000000
	mov.w		r2, #102
	movw	r3, #103

	@
	@mov reg to reg
	@
	movs	r4, r0
	mov		r5, r1

	@
	@add
	@
	adds	r4, r1, #1
	add		r5, r4, #5

	@
	@push
	@
	push	{r0}
	push	{r2, r4, r1, r3}


	@
	@pop
	@
	pop     {r6,r4,r7,r5}
	pop     {r3}
 

	@
	@ldr
	@
	movs	r0, #0x0
	ldr		r1, [r0]
	ldr		r2, [r0, #4]

	@
	@str
	@
	movs	r0, #0x20000000
	str		r1, [r0]
	str		r2, [r0, #4]

	@
	@b bl
	@
	bl	lable01
	nop

sleep:
	b sleep



lable01:
	nop
	nop
	@bx	lr
	blx	sleep
