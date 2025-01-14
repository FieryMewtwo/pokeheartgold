	.include "asm/macros.inc"
	.include "global.inc"

	.bss

_021D1584:
	.space 0x1C

	.text

	thumb_func_start InitHeapSystem
InitHeapSystem: ; 0x0201A7BC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	str r0, [sp, #4]
	add r0, #0x18
	add r6, r2, #0
	str r0, [sp, #4]
	cmp r6, r0
	bhs _0201A7D4
	add r6, r0, #0
_0201A7D4:
	cmp r3, #0
	beq _0201A7F2
	mov r0, #3
	tst r0, r3
	beq _0201A7E8
	mov r0, #3
_0201A7E0:
	add r3, r3, #1
	add r1, r3, #0
	tst r1, r0
	bne _0201A7E0
_0201A7E8:
	mov r0, #0
	add r1, r3, #0
	mov r2, #4
	bl OS_AllocFromArenaLo
_0201A7F2:
	ldr r1, [sp, #4]
	lsl r7, r6, #1
	lsl r2, r1, #1
	add r1, r1, r2
	add r1, r1, #1
	lsl r1, r1, #2
	add r1, r7, r1
	mov r0, #0
	add r1, r6, r1
	mov r2, #4
	bl OS_AllocFromArenaLo
	ldr r1, _0201A8E4 ; =_021D1584
	str r0, [r1]
	ldr r1, [sp, #4]
	add r1, r1, #1
	lsl r1, r1, #2
	add r1, r0, r1
	ldr r0, _0201A8E4 ; =_021D1584
	str r1, [r0, #4]
	ldr r0, [sp, #4]
	lsl r0, r0, #2
	add r2, r1, r0
	ldr r1, _0201A8E4 ; =_021D1584
	str r2, [r1, #8]
	add r1, r2, r0
	ldr r0, _0201A8E4 ; =_021D1584
	str r1, [r0, #0xc]
	add r1, r1, r7
	str r1, [r0, #0x10]
	strh r6, [r0, #0x14]
	strh r4, [r0, #0x16]
	ldr r0, [sp, #4]
	mov r7, #0
	lsl r0, r0, #0x10
	lsr r1, r0, #0x10
	ldr r0, _0201A8E4 ; =_021D1584
	cmp r4, #0
	strh r1, [r0, #0x1a]
	strh r1, [r0, #0x18]
	bls _0201A894
	str r7, [sp]
_0201A846:
	ldr r0, [r5, #4]
	cmp r0, #0
	beq _0201A850
	cmp r0, #2
	beq _0201A85C
_0201A850:
	ldr r1, [r5]
	mov r0, #0
	mov r2, #4
	bl OS_AllocFromArenaLo
	b _0201A866
_0201A85C:
	ldr r1, [r5]
	mov r0, #2
	mov r2, #4
	bl OS_AllocFromArenaHi
_0201A866:
	cmp r0, #0
	beq _0201A882
	ldr r1, [r5]
	mov r2, #0
	bl NNS_FndCreateExpHeapEx
	ldr r1, _0201A8E4 ; =_021D1584
	ldr r2, [r1]
	ldr r1, [sp]
	str r0, [r2, r1]
	ldr r0, _0201A8E4 ; =_021D1584
	ldr r0, [r0, #0x10]
	strb r7, [r0, r7]
	b _0201A886
_0201A882:
	bl GF_AssertFail
_0201A886:
	ldr r0, [sp]
	add r7, r7, #1
	add r0, r0, #4
	add r5, #8
	str r0, [sp]
	cmp r7, r4
	blo _0201A846
_0201A894:
	ldr r0, [sp, #4]
	add r1, r0, #1
	cmp r4, r1
	bhs _0201A8B4
	ldr r3, _0201A8E4 ; =_021D1584
	lsl r2, r4, #2
	mov r0, #0
_0201A8A2:
	ldr r5, [r3]
	str r0, [r5, r2]
	ldrh r7, [r3, #0x1a]
	ldr r5, [r3, #0x10]
	add r2, r2, #4
	strb r7, [r5, r4]
	add r4, r4, #1
	cmp r4, r1
	blo _0201A8A2
_0201A8B4:
	cmp r4, r6
	bhs _0201A8C6
	ldr r0, _0201A8E4 ; =_021D1584
_0201A8BA:
	ldrh r2, [r0, #0x1a]
	ldr r1, [r0, #0x10]
	strb r2, [r1, r4]
	add r4, r4, #1
	cmp r4, r6
	blo _0201A8BA
_0201A8C6:
	mov r4, #0
	cmp r6, #0
	bls _0201A8DE
	ldr r0, _0201A8E4 ; =_021D1584
	add r3, r4, #0
	add r2, r4, #0
_0201A8D2:
	ldr r1, [r0, #0xc]
	add r4, r4, #1
	strh r2, [r1, r3]
	add r3, r3, #2
	cmp r4, r6
	blo _0201A8D2
_0201A8DE:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0201A8E4: .word _021D1584
	thumb_func_end InitHeapSystem

	thumb_func_start FindFirstAvailableHeapHandle
FindFirstAvailableHeapHandle: ; 0x0201A8E8
	ldr r1, _0201A90C ; =_021D1584
	ldrh r0, [r1, #0x16]
	ldrh r3, [r1, #0x18]
	cmp r0, r3
	bge _0201A906
	ldr r2, [r1]
	lsl r1, r0, #2
	add r2, r2, r1
_0201A8F8:
	ldr r1, [r2]
	cmp r1, #0
	beq _0201A90A
	add r0, r0, #1
	add r2, r2, #4
	cmp r0, r3
	blt _0201A8F8
_0201A906:
	mov r0, #0
	mvn r0, r0
_0201A90A:
	bx lr
	.balign 4, 0
_0201A90C: .word _021D1584
	thumb_func_end FindFirstAvailableHeapHandle

	thumb_func_start CreateHeap
CreateHeap: ; 0x0201A910
	push {r3, lr}
	mov r3, #4
	bl CreateHeapInternal
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end CreateHeap

	thumb_func_start CreateHeapAtEnd
CreateHeapAtEnd: ; 0x0201A91C
	push {r3, lr}
	mov r3, #3
	mvn r3, r3
	bl CreateHeapInternal
	pop {r3, pc}
	thumb_func_end CreateHeapAtEnd

	thumb_func_start CreateHeapInternal
CreateHeapInternal: ; 0x0201A928
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r4, r0, #0
	add r5, r1, #0
	str r2, [sp]
	add r7, r3, #0
	bl OS_GetProcMode
	cmp r0, #0x12
	bne _0201A940
	bl GF_AssertFail
_0201A940:
	ldr r1, _0201A9C0 ; =_021D1584
	ldr r0, [r1, #0x10]
	ldrh r3, [r1, #0x1a]
	ldrb r2, [r0, r5]
	cmp r3, r2
	bne _0201A9B6
	ldrb r0, [r0, r4]
	ldr r1, [r1]
	lsl r0, r0, #2
	ldr r6, [r1, r0]
	cmp r6, #0
	beq _0201A9B0
	ldr r1, [sp]
	add r0, r6, #0
	add r2, r7, #0
	bl NNS_FndAllocFromExpHeapEx
	str r0, [sp, #4]
	cmp r0, #0
	beq _0201A9AA
	bl FindFirstAvailableHeapHandle
	add r7, r0, #0
	bmi _0201A9A4
	ldr r0, [sp, #4]
	ldr r1, [sp]
	mov r2, #0
	lsl r4, r7, #2
	bl NNS_FndCreateExpHeapEx
	ldr r1, _0201A9C0 ; =_021D1584
	ldr r2, [r1]
	str r0, [r2, r4]
	ldr r0, [r1]
	ldr r0, [r0, r4]
	cmp r0, #0
	beq _0201A99E
	ldr r0, [r1, #4]
	str r6, [r0, r4]
	ldr r0, [sp, #4]
	ldr r2, [r1, #8]
	add sp, #8
	str r0, [r2, r4]
	ldr r0, [r1, #0x10]
	strb r7, [r0, r5]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0201A99E:
	bl GF_AssertFail
	b _0201A9BA
_0201A9A4:
	bl GF_AssertFail
	b _0201A9BA
_0201A9AA:
	bl GF_AssertFail
	b _0201A9BA
_0201A9B0:
	bl GF_AssertFail
	b _0201A9BA
_0201A9B6:
	bl GF_AssertFail
_0201A9BA:
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0201A9C0: .word _021D1584
	thumb_func_end CreateHeapInternal

	thumb_func_start DestroyHeap
DestroyHeap: ; 0x0201A9C4
	push {r4, lr}
	add r4, r0, #0
	bl OS_GetProcMode
	cmp r0, #0x12
	bne _0201A9D4
	bl GF_AssertFail
_0201A9D4:
	ldr r0, _0201AA34 ; =_021D1584
	ldr r1, [r0]
	ldr r0, [r0, #0x10]
	ldrb r0, [r0, r4]
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _0201AA32
	bl NNS_FndDestroyExpHeap
	ldr r1, _0201AA34 ; =_021D1584
	ldr r0, [r1, #0x10]
	ldrb r0, [r0, r4]
	lsl r2, r0, #2
	ldr r0, [r1, #4]
	ldr r1, [r1, #8]
	ldr r0, [r0, r2]
	ldr r1, [r1, r2]
	cmp r0, #0
	beq _0201AA06
	cmp r1, #0
	beq _0201AA06
	bl NNS_FndFreeToExpHeap
	b _0201AA0A
_0201AA06:
	bl GF_AssertFail
_0201AA0A:
	ldr r1, _0201AA34 ; =_021D1584
	mov r0, #0
	ldr r2, [r1, #0x10]
	ldr r3, [r1]
	ldrb r2, [r2, r4]
	lsl r2, r2, #2
	str r0, [r3, r2]
	ldr r2, [r1, #0x10]
	ldr r3, [r1, #4]
	ldrb r2, [r2, r4]
	lsl r2, r2, #2
	str r0, [r3, r2]
	ldr r2, [r1, #0x10]
	ldr r3, [r1, #8]
	ldrb r2, [r2, r4]
	lsl r2, r2, #2
	str r0, [r3, r2]
	ldrh r2, [r1, #0x1a]
	ldr r0, [r1, #0x10]
	strb r2, [r0, r4]
_0201AA32:
	pop {r4, pc}
	.balign 4, 0
_0201AA34: .word _021D1584
	thumb_func_end DestroyHeap

	thumb_func_start AllocFromHeapInternal
AllocFromHeapInternal: ; 0x0201AA38
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r7, r2, #0
	add r6, r3, #0
	cmp r5, #0
	bne _0201AA4A
	bl GF_AssertFail
_0201AA4A:
	bl OS_DisableInterrupts
	add r4, #0x10
	str r0, [sp]
	add r0, r5, #0
	add r1, r4, #0
	add r2, r7, #0
	bl NNS_FndAllocFromExpHeapEx
	add r4, r0, #0
	ldr r0, [sp]
	bl OS_RestoreInterrupts
	cmp r4, #0
	beq _0201AA78
	ldr r1, [r4, #0xc]
	mov r0, #0xff
	bic r1, r0
	lsl r0, r6, #0x18
	lsr r0, r0, #0x18
	orr r0, r1
	str r0, [r4, #0xc]
	add r4, #0x10
_0201AA78:
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end AllocFromHeapInternal

	thumb_func_start AllocFail
AllocFail: ; 0x0201AA7C
	push {r3, lr}
	bl sub_02037D78
	cmp r0, #0
	beq _0201AA8A
	bl PrintErrorMessageAndReset
_0201AA8A:
	pop {r3, pc}
	thumb_func_end AllocFail

	thumb_func_start AllocFromHeap
AllocFromHeap: ; 0x0201AA8C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _0201AAC8 ; =_021D1584
	mov r4, #0
	ldrh r2, [r0, #0x14]
	cmp r5, r2
	bhs _0201AAAE
	ldr r2, [r0]
	ldr r0, [r0, #0x10]
	add r3, r5, #0
	ldrb r0, [r0, r5]
	lsl r0, r0, #2
	ldr r0, [r2, r0]
	mov r2, #4
	bl AllocFromHeapInternal
	add r4, r0, #0
_0201AAAE:
	cmp r4, #0
	beq _0201AAC0
	ldr r0, _0201AAC8 ; =_021D1584
	lsl r1, r5, #1
	ldr r2, [r0, #0xc]
	ldrh r0, [r2, r1]
	add r0, r0, #1
	strh r0, [r2, r1]
	b _0201AAC4
_0201AAC0:
	bl AllocFail
_0201AAC4:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0201AAC8: .word _021D1584
	thumb_func_end AllocFromHeap

	thumb_func_start AllocFromHeapAtEnd
AllocFromHeapAtEnd: ; 0x0201AACC
	push {r3, r4, r5, lr}
	ldr r2, _0201AB08 ; =_021D1584
	add r5, r0, #0
	ldrh r0, [r2, #0x14]
	mov r4, #0
	cmp r5, r0
	bhs _0201AAEE
	ldr r0, [r2]
	ldr r2, [r2, #0x10]
	add r3, r5, #0
	ldrb r2, [r2, r5]
	lsl r2, r2, #2
	ldr r0, [r0, r2]
	sub r2, r4, #4
	bl AllocFromHeapInternal
	add r4, r0, #0
_0201AAEE:
	cmp r4, #0
	beq _0201AB00
	ldr r0, _0201AB08 ; =_021D1584
	lsl r1, r5, #1
	ldr r2, [r0, #0xc]
	ldrh r0, [r2, r1]
	add r0, r0, #1
	strh r0, [r2, r1]
	b _0201AB04
_0201AB00:
	bl AllocFail
_0201AB04:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0201AB08: .word _021D1584
	thumb_func_end AllocFromHeapAtEnd

	thumb_func_start FreeToHeap
FreeToHeap: ; 0x0201AB0C
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	sub r0, r6, #4
	ldr r0, [r0]
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	ldr r0, _0201AB7C ; =_021D1584
	ldrh r1, [r0, #0x14]
	cmp r4, r1
	bhs _0201AB74
	ldr r1, [r0]
	ldr r0, [r0, #0x10]
	ldrb r0, [r0, r4]
	lsl r0, r0, #2
	ldr r7, [r1, r0]
	cmp r7, #0
	bne _0201AB32
	bl GF_AssertFail
_0201AB32:
	ldr r0, _0201AB7C ; =_021D1584
	lsl r5, r4, #1
	ldr r0, [r0, #0xc]
	ldrh r0, [r0, r5]
	cmp r0, #0
	bne _0201AB44
	add r0, r4, #0
	bl GF_heap_c_dummy_return_true
_0201AB44:
	ldr r0, _0201AB7C ; =_021D1584
	ldr r0, [r0, #0xc]
	ldrh r0, [r0, r5]
	cmp r0, #0
	bne _0201AB52
	bl GF_AssertFail
_0201AB52:
	ldr r0, _0201AB7C ; =_021D1584
	ldr r1, [r0, #0xc]
	ldrh r0, [r1, r5]
	sub r0, r0, #1
	strh r0, [r1, r5]
	bl OS_DisableInterrupts
	sub r6, #0x10
	add r4, r0, #0
	add r0, r7, #0
	add r1, r6, #0
	bl NNS_FndFreeToExpHeap
	add r0, r4, #0
	bl OS_RestoreInterrupts
	pop {r3, r4, r5, r6, r7, pc}
_0201AB74:
	bl GF_AssertFail
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0201AB7C: .word _021D1584
	thumb_func_end FreeToHeap

	thumb_func_start FreeToHeapExplicit
FreeToHeapExplicit: ; 0x0201AB80
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl OS_GetProcMode
	cmp r0, #0x12
	bne _0201AB92
	bl GF_AssertFail
_0201AB92:
	ldr r0, _0201ABE8 ; =_021D1584
	ldrh r1, [r0, #0x14]
	cmp r5, r1
	bhs _0201ABE2
	ldr r1, [r0]
	ldr r0, [r0, #0x10]
	ldrb r0, [r0, r5]
	lsl r0, r0, #2
	ldr r6, [r1, r0]
	cmp r6, #0
	bne _0201ABAC
	bl GF_AssertFail
_0201ABAC:
	sub r0, r4, #4
	ldr r0, [r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, r5
	beq _0201ABBC
	bl GF_AssertFail
_0201ABBC:
	sub r4, #0x10
	add r0, r6, #0
	add r1, r4, #0
	bl NNS_FndFreeToExpHeap
	ldr r0, _0201ABE8 ; =_021D1584
	lsl r4, r5, #1
	ldr r0, [r0, #0xc]
	ldrh r0, [r0, r4]
	cmp r0, #0
	bne _0201ABD6
	bl GF_AssertFail
_0201ABD6:
	ldr r0, _0201ABE8 ; =_021D1584
	ldr r1, [r0, #0xc]
	ldrh r0, [r1, r4]
	sub r0, r0, #1
	strh r0, [r1, r4]
	pop {r4, r5, r6, pc}
_0201ABE2:
	bl GF_AssertFail
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0201ABE8: .word _021D1584
	thumb_func_end FreeToHeapExplicit

	thumb_func_start GF_ExpHeap_FndGetTotalFreeSize
GF_ExpHeap_FndGetTotalFreeSize: ; 0x0201ABEC
	push {r3, lr}
	ldr r1, _0201AC10 ; =_021D1584
	ldrh r2, [r1, #0x14]
	cmp r0, r2
	bhs _0201AC06
	ldr r2, [r1]
	ldr r1, [r1, #0x10]
	ldrb r0, [r1, r0]
	lsl r0, r0, #2
	ldr r0, [r2, r0]
	bl NNS_FndGetTotalFreeSizeForExpHeap
	pop {r3, pc}
_0201AC06:
	bl GF_AssertFail
	mov r0, #0
	pop {r3, pc}
	nop
_0201AC10: .word _021D1584
	thumb_func_end GF_ExpHeap_FndGetTotalFreeSize

	thumb_func_start GF_ExpHeap_FndInitAllocator
GF_ExpHeap_FndInitAllocator: ; 0x0201AC14
	push {r4, lr}
	ldr r4, _0201AC34 ; =_021D1584
	ldrh r3, [r4, #0x14]
	cmp r1, r3
	bhs _0201AC2E
	ldr r3, [r4]
	ldr r4, [r4, #0x10]
	ldrb r1, [r4, r1]
	lsl r1, r1, #2
	ldr r1, [r3, r1]
	bl NNS_FndInitAllocatorForExpHeap
	pop {r4, pc}
_0201AC2E:
	bl GF_AssertFail
	pop {r4, pc}
	.balign 4, 0
_0201AC34: .word _021D1584
	thumb_func_end GF_ExpHeap_FndInitAllocator

	thumb_func_start ReallocFromHeap
ReallocFromHeap: ; 0x0201AC38
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl OS_GetProcMode
	cmp r0, #0x12
	bne _0201AC4A
	bl GF_AssertFail
_0201AC4A:
	add r0, r5, #0
	sub r0, #0x10
	bl NNS_FndGetSizeForMBlockExpHeap
	add r4, #0x10
	cmp r0, r4
	blo _0201AC78
	sub r2, r5, #4
	ldr r0, _0201AC80 ; =_021D1584
	ldr r2, [r2]
	ldr r1, [r0]
	lsl r2, r2, #0x18
	ldr r0, [r0, #0x10]
	lsr r2, r2, #0x18
	ldrb r0, [r0, r2]
	sub r5, #0x10
	add r2, r4, #0
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	add r1, r5, #0
	bl NNS_FndResizeForMBlockExpHeap
	pop {r3, r4, r5, pc}
_0201AC78:
	bl GF_AssertFail
	pop {r3, r4, r5, pc}
	nop
_0201AC80: .word _021D1584
	thumb_func_end ReallocFromHeap

	thumb_func_start GF_heap_c_dummy_return_true
GF_heap_c_dummy_return_true: ; 0x0201AC84
	mov r0, #1
	bx lr
	thumb_func_end GF_heap_c_dummy_return_true
