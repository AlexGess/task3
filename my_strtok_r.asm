global my_strtok_r

section .text
; DWORD my_strtok_r(DWORD str, DWORD delim, DWORD saveptr)
my_strtok_r:
    push ebp
    mov ebp, esp

    cmp DWORD [ebp+8], 0x0
    jne .str_is_not_null
    mov edx, [ebp+16]
    mov eax, [edx]
    mov [ebp+8], eax

.str_is_not_null

    mov esi, [ebp+8]
    lodsb
    cmp al, 0x0
    je .empty_str
    dec esi

    sub esp, 4
    mov DWORD [ebp-4], 0
.lp1:
    lodsb
    cmp al, 0x0
    je .found1
    cmp al, 0x20
    je .pre_found1
    inc DWORD [ebp-4]
.again
    loop .lp1

.pre_found1
    cmp DWORD [ebp-4], 0
    je .again

.found1
    dec esi
    mov edi, esi
    mov al, 0x0
    stosb
    inc esi

.lp2:
    lodsb
    cmp al, 0x0
    je .found2
    cmp al, 0x20
    jne .found2
    loop .lp2


.found2
    mov edx, [ebp+16]
    dec esi
    mov DWORD [edx], esi

    mov eax, [ebp+8]

    add esp, 4

    mov esp, ebp
    pop ebp
    ret

.empty_str

    mov eax, 0

    mov esp, ebp
    pop ebp
    ret
