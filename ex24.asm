assume cs:code, ss:stack, ds:data

stack segment
    db 32 dup (0) 
stack ends

data segment
    db "basic", 0
    db "iNfOrMaTiOn", 0
    db "weLcoMe tO cHiNa", 0
data ends


code segment
start:
    mov ax, data
    mov ds, ax
    mov ax, stack
    mov ss, ax
    mov sp, 20H

    mov cx, 3
    mov si, 0
    mov ax, 0
    mov bx, 0

 s: 
    call len
    add bx, ax
    loop s

    mov ax, 4c00H
    int 21H    

len:
    push cx
    push si
    mov  si, 0

len0: mov cl, [bx+si]
      and byte ptr [bx + si], 11011111b
      jcxz ok
      inc si
      jmp short len0
ok:
    inc si
    mov ax, si
    pop si
    pop cx
    ret

code ends

end start
