	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start sub_020290B4
sub_020290B4: ; 0x020290B4
	mov r0, #0x20
	bx lr
	thumb_func_end sub_020290B4

	thumb_func_start sub_020290B8
sub_020290B8: ; 0x020290B8
	mov r0, #0x20
	bx lr
	thumb_func_end sub_020290B8

	thumb_func_start sub_020290BC
sub_020290BC: ; 0x020290BC
	ldr r3, _020290C4 ; =MIi_CpuCopy8
	mov r2, #0x20
	bx r3
	nop
_020290C4: .word MIi_CpuCopy8
	thumb_func_end sub_020290BC

	thumb_func_start sub_020290C8
sub_020290C8: ; 0x020290C8
	ldr r3, _020290D0 ; =memset
	mov r1, #0
	mov r2, #0x20
	bx r3
	.balign 4, 0
_020290D0: .word memset
	thumb_func_end sub_020290C8

	thumb_func_start sub_020290D4
sub_020290D4: ; 0x020290D4
	ldr r3, _020290E0 ; =CopyU16ArrayToStringN
	add r2, r0, #0
	add r0, r1, #0
	add r1, r2, #0
	mov r2, #0xc
	bx r3
	.balign 4, 0
_020290E0: .word CopyU16ArrayToStringN
	thumb_func_end sub_020290D4

	thumb_func_start sub_020290E4
sub_020290E4: ; 0x020290E4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x18
	bl String_ctor
	add r1, r5, #0
	add r4, r0, #0
	bl CopyU16ArrayToString
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_020290E4

	thumb_func_start sub_020290FC
sub_020290FC: ; 0x020290FC
	mov r2, #0
	cmp r1, #0xd
	bhi _0202919A
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0202910E: ; jump table
	.short _0202919A - _0202910E - 2 ; case 0
	.short _0202912A - _0202910E - 2 ; case 1
	.short _0202912E - _0202910E - 2 ; case 2
	.short _02029132 - _0202910E - 2 ; case 3
	.short _0202913C - _0202910E - 2 ; case 4
	.short _02029144 - _0202910E - 2 ; case 5
	.short _0202914A - _0202910E - 2 ; case 6
	.short _0202915E - _0202910E - 2 ; case 7
	.short _02029164 - _0202910E - 2 ; case 8
	.short _02029178 - _0202910E - 2 ; case 9
	.short _02029180 - _0202910E - 2 ; case 10
	.short _02029188 - _0202910E - 2 ; case 11
	.short _02029190 - _0202910E - 2 ; case 12
	.short _02029198 - _0202910E - 2 ; case 13
_0202912A:
	ldrb r2, [r0, #0x1a]
	b _0202919A
_0202912E:
	ldrb r2, [r0, #0x1b]
	b _0202919A
_02029132:
	ldrh r1, [r0, #0x18]
	ldr r0, _020291A0 ; =0x00000FFF
	add r2, r1, #0
	and r2, r0
	b _0202919A
_0202913C:
	ldrb r0, [r0, #0x1e]
	lsl r0, r0, #0x1f
	lsr r2, r0, #0x1f
	b _0202919A
_02029144:
	mov r1, #0x1c
	ldrsb r2, [r0, r1]
	b _0202919A
_0202914A:
	mov r1, #0x1c
	ldrsb r0, [r0, r1]
	cmp r0, #0
	ble _02029156
	mov r2, #1
	b _0202919A
_02029156:
	bge _0202919A
	add r2, r1, #0
	sub r2, #0x1d
	b _0202919A
_0202915E:
	mov r1, #0x1d
	ldrsb r2, [r0, r1]
	b _0202919A
_02029164:
	mov r1, #0x1d
	ldrsb r0, [r0, r1]
	cmp r0, #0
	ble _02029170
	mov r2, #1
	b _0202919A
_02029170:
	bge _0202919A
	add r2, r1, #0
	sub r2, #0x1e
	b _0202919A
_02029178:
	ldrb r0, [r0, #0x1e]
	lsl r0, r0, #0x1c
	lsr r2, r0, #0x1f
	b _0202919A
_02029180:
	ldrb r0, [r0, #0x1e]
	lsl r0, r0, #0x1d
	lsr r2, r0, #0x1f
	b _0202919A
_02029188:
	ldrb r0, [r0, #0x1e]
	lsl r0, r0, #0x1e
	lsr r2, r0, #0x1f
	b _0202919A
_02029190:
	ldrb r0, [r0, #0x1e]
	lsl r0, r0, #0x1b
	lsr r2, r0, #0x1f
	b _0202919A
_02029198:
	ldrh r2, [r0, #0x18]
_0202919A:
	add r0, r2, #0
	bx lr
	nop
_020291A0: .word 0x00000FFF
	thumb_func_end sub_020290FC

	thumb_func_start sub_020291A4
sub_020291A4: ; 0x020291A4
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r4, r0, #0
	cmp r5, #1
	blt _020291B2
	bl GF_AssertFail
_020291B2:
	add r0, r4, #0
	mov r1, #0xb
	bl SavArray_get
	add r4, r0, #0
	lsl r5, r5, #5
	add r0, r4, r5
	mov r1, #1
	bl sub_020290FC
	cmp r0, #0
	beq _020291CE
	add r0, r4, r5
	pop {r3, r4, r5, pc}
_020291CE:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_020291A4

	thumb_func_start sub_020291D4
sub_020291D4: ; 0x020291D4
	push {r4, lr}
	add r4, r1, #0
	mov r1, #0xb
	bl SavArray_get
	add r1, r0, #0
	add r0, r4, #0
	bl sub_020290BC
	pop {r4, pc}
	thumb_func_end sub_020291D4

	thumb_func_start sub_020291E8
sub_020291E8: ; 0x020291E8
	push {r3, lr}
	cmp r1, #5
	bne _020291F6
	mov r1, #0xb
	bl SavArray_get
	pop {r3, pc}
_020291F6:
	cmp r1, #0xa
	bne _020291FE
	mov r0, #0
	pop {r3, pc}
_020291FE:
	cmp r1, #0xc
	bhs _0202920E
	ldr r0, _02029214 ; =0x0210F6F8
	ldr r2, _02029218 ; =0x0210F724
	ldrb r0, [r0, r1]
	lsl r0, r0, #5
	add r0, r2, r0
	pop {r3, pc}
_0202920E:
	mov r0, #0
	pop {r3, pc}
	nop
_02029214: .word 0x0210F6F8
_02029218: .word 0x0210F724
	thumb_func_end sub_020291E8

	thumb_func_start sub_0202921C
sub_0202921C: ; 0x0202921C
	push {r4, r5, r6, lr}
	add r5, r1, #0
	add r4, r2, #0
	cmp r5, #5
	bne _02029234
	mov r1, #0
	bl sub_020291A4
	add r1, r4, #0
	bl sub_020290D4
	pop {r4, r5, r6, pc}
_02029234:
	cmp r5, #0xc
	bhs _02029256
	mov r0, #0
	mov r1, #0x1b
	mov r2, #0xb6
	bl NewMsgDataFromNarc
	ldr r1, _02029258 ; =0x0210F6F8
	add r6, r0, #0
	ldrb r1, [r1, r5]
	add r2, r4, #0
	add r1, #0x53
	bl ReadMsgDataIntoString
	add r0, r6, #0
	bl DestroyMsgData
_02029256:
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02029258: .word 0x0210F6F8
	thumb_func_end sub_0202921C

	thumb_func_start sub_0202925C
sub_0202925C: ; 0x0202925C
	ldr r0, _02029260 ; =0x0210F704
	bx lr
	.balign 4, 0
_02029260: .word 0x0210F704
	thumb_func_end sub_0202925C

	thumb_func_start sub_02029264
sub_02029264: ; 0x02029264
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	bne _0202926E
	mov r0, #0xff
	pop {r3, r4, r5, r6, r7, pc}
_0202926E:
	ldr r5, _020292A0 ; =0x0210F724
	mov r4, #0
	mov r7, #0x20
_02029274:
	add r0, r6, #0
	add r1, r5, #0
	add r2, r7, #0
	bl memcmp
	cmp r0, #0
	bne _02029294
	ldr r2, _020292A4 ; =0x0210F6F8
	mov r0, #0
_02029286:
	ldrb r1, [r2]
	cmp r4, r1
	beq _0202929E
	add r0, r0, #1
	add r2, r2, #1
	cmp r0, #0xc
	blo _02029286
_02029294:
	add r4, r4, #1
	add r5, #0x20
	cmp r4, #0xa
	blo _02029274
	mov r0, #5
_0202929E:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_020292A0: .word 0x0210F724
_020292A4: .word 0x0210F6F8
	thumb_func_end sub_02029264
