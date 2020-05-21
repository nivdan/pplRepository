section .rodata
    format_int: db "%d", 10, 0	; format string
     format_string: db "%s", 10, 0	; format string

section .bss
    stack: resb 4
    result: resb 4

section .text
  align 16
  global main
  global convertToInt
  extern printf
  extern fprintf 
  extern fflush
  extern malloc 
  extern calloc 
  extern free
  extern getchar 
  extern fgets


main:
    push ebp
    mov ebp, esp
    pushad

    push dword 48
    push dword for
    call printf
    add esp,8

    jmp endMain
    mov eax, dword [ebp+8] ;eax = &argv
    mov eax, dword [eax] ; eax = &argv[1][0]
    push dword eax
    call convertToInt
    mov dword[result], eax
    add esp,4
    push dword[result]
    push format_string
    call printf
    push dword[result]
    call malloc
    mov dword [stack], eax
    add esp,4
    call myCalc

    endMain:
    mov esp, ebp
    pop ebp
    ret
    mov ebx,0 ; exit system call
    mov eax,1
    int 0x80



convertToInt:
    push ebp
    mov ebp, esp
    pushad
    mov eax, dword[ebp+8]
    mov ecx,0
    mov ebx,0
    mov cl, byte[eax]
    mov bl, '9'
    .startIf:
        cmp cl,bl
        jl .else
        mov bl, 55
        jmp .end
    .else: 
        mov bl, '0'
    .end:
    sub cl, bl
    inc eax

    convertToInt.while:
        mov ebx,0
        cmp byte [eax], 10
        je convertToInt.endWhile
        convertToInt.firstIf:
            cmp byte[eax], '9'
            jg convertToInt.elseTwo
            mov ebx, 55
            jmp convertToInt.endIf
            convertToInt.elseTwo:
                mov ebx, '0'
        convertToInt.endIf:
        shl ecx,4
        add ecx,ebx
        inc eax
        jmp convertToInt.while
    convertToInt.endWhile:
    mov dword[result],eax
    popad
    mov eax, dword [result]
    mov esp, ebp
    pop ebp
    ret
    
convertToIntEnd:

        



        

myCalc: 

