
	thumb_func_start MOD108_021E5900
MOD108_021E5900: @ 0x021E5900
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	bl FUN_020072A4
	movs r2, #5
	adds r5, r0, #0
	movs r0, #3
	movs r1, #0x5f
	lsls r2, r2, #0x10
	bl FUN_0201A910
	ldr r1, _021E5944 @ =0x000184EC
	adds r0, r4, #0
	movs r2, #0x5f
	bl FUN_02007280
	ldr r2, _021E5944 @ =0x000184EC
	movs r1, #0
	adds r4, r0, #0
	blx FUN_020D4994
	movs r0, #0x5f
	str r0, [r4]
	adds r0, r4, #0
	adds r1, r5, #0
	bl FUN_021E59E4
	movs r1, #0
	movs r0, #0x43
	adds r2, r1, #0
	bl FUN_02004EC4
	movs r0, #1
	pop {r3, r4, r5, pc}
	.align 2, 0
_021E5944: .4byte 0x000184EC
	thumb_func_end MOD108_021E5900
_021E5948:
	.byte 0x70, 0xB5, 0x05, 0x1C, 0x21, 0xF6, 0xA0, 0xFC
	.byte 0x06, 0x1C, 0x00, 0xF0, 0x79, 0xF8, 0x07, 0x4A, 0x34, 0x68, 0x30, 0x1C, 0x00, 0x21, 0xEF, 0xF6
	.byte 0x1A, 0xE8, 0x28, 0x1C, 0x21, 0xF6, 0x96, 0xFC, 0x20, 0x1C, 0x35, 0xF6, 0x2B, 0xF8, 0x01, 0x20
	.byte 0x70, 0xBD, 0xC0, 0x46, 0xEC, 0x84, 0x01, 0x00, 0x10, 0xB5, 0x0C, 0x1C, 0x21, 0xF6, 0x88, 0xFC
	.byte 0x21, 0x68, 0x07, 0x29, 0x2B, 0xD8, 0x49, 0x18, 0x79, 0x44, 0xC9, 0x88, 0x09, 0x04, 0x09, 0x14
	.byte 0x8F, 0x44, 0x0E, 0x00, 0x16, 0x00, 0x1E, 0x00, 0x26, 0x00, 0x2E, 0x00, 0x36, 0x00, 0x3E, 0x00
	.byte 0x46, 0x00, 0x00, 0xF0, 0x69, 0xF8, 0x20, 0x60, 0x19, 0xE0, 0x00, 0xF0, 0x6F, 0xF8, 0x20, 0x60
	.byte 0x15, 0xE0, 0x00, 0xF0, 0x75, 0xF8, 0x20, 0x60, 0x11, 0xE0, 0x00, 0xF0, 0x99, 0xF8, 0x20, 0x60
	.byte 0x0D, 0xE0, 0x00, 0xF0, 0xC1, 0xF8, 0x20, 0x60, 0x09, 0xE0, 0x00, 0xF0, 0xE5, 0xF8, 0x20, 0x60
	.byte 0x05, 0xE0, 0x00, 0xF0, 0x13, 0xF9, 0x20, 0x60, 0x01, 0xE0, 0x01, 0x20, 0x10, 0xBD, 0x00, 0x20
	.byte 0x10, 0xBD, 0x00, 0x00

	thumb_func_start FUN_021E59E4
FUN_021E59E4: @ 0x021E59E4
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	ldr r0, [r4]
	bl FUN_0202F57C
	adds r2, r5, #0
	str r0, [r5, #0x18]
	movs r1, #0
	adds r2, #0x1c
	bl FUN_0202F658
	ldr r0, [r4]
	bl FUN_02028EA8
	adds r6, r0, #0
	bl FUN_0202AD20
	ldr r1, _021E5A38 @ =0x000184DC
	strb r0, [r5, r1]
	adds r0, r6, #0
	bl FUN_0202ADCC
	ldr r1, _021E5A3C @ =0x000184DD
	strb r0, [r5, r1]
	ldr r0, [r4, #4]
	bl FUN_020183F0
	str r0, [r5, #0x10]
	ldr r0, _021E5A40 @ =0x000184E8
	movs r1, #0
	str r1, [r5, r0]
	str r4, [r5, #0x14]
	ldr r0, [r5, #0x18]
	bl FUN_0202F720
	cmp r0, #0
	beq _021E5A36
	ldr r0, _021E5A44 @ =0x000184E3
	movs r1, #1
	strb r1, [r5, r0]
_021E5A36:
	pop {r4, r5, r6, pc}
	.align 2, 0
_021E5A38: .4byte 0x000184DC
_021E5A3C: .4byte 0x000184DD
_021E5A40: .4byte 0x000184E8
_021E5A44: .4byte 0x000184E3
	thumb_func_end FUN_021E59E4