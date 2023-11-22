assume cs:code, ds:data, ss:stack

stack segment
   dw 16 dup (0) 
stack ends

data segment
    db 'word', 0
    db 'unix', 0
    db 'wind', 0
    db 'good', 0
data ends

code segment
start: 
    mov ax, data
    mov ds, ax
    mov ax, stack
    mov ss, ax
    mov sp, 10H

    mov bx, 0
    mov cx, 4

s:  mov si, bx
    call capital
    add bx, 5
    loop s
    mov ax, 4c00H
    int 21H    

capital: push cx
         push si
change : mov cl, [si]
         mov ch, 0
         jcxz ok
         and byte ptr [si], 11011111b
         inc si
         jmp short change
ok     : pop si
         pop cx
         ret

code ends

end start
 