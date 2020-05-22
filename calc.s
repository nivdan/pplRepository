section .rodata
    format_int: db "%d", 10, 0	; format int
    format_string: db "%s", 0	; format string
    format_char: db "%c", 0	; format char
    format_zabi: db "success", 10, 0
section .bss
    stack: resb 4
    result: resb 256
    bufferIn: resb 256
    bufferOut: resb 256
    return: resb 4

section .text
  align 16
  global main
  extern printf
  extern fprintf 
  extern fflush
  extern malloc 
  extern calloc 
  extern free
  extern getchar 
  extern fgets

;Main
main:
    push ebp
    mov ebp, esp
    pushad

    ;mov eax, [ebp+12]
    ;mov eax , [eax+4]



    mainLoop:
        call readSysCall
        ;mov byte[bufferIn+eax-1], 0

        cmp eax, 2
        je notInsertCommand
        ;//TODO
        call pushToStack
        jmp mainLoop

        notInsertCommand:

        cmp byte[bufferIn], 'q'
        jne notQuitCommand
        ;//TODO
        call quit
        jmp endOfMainLoop

        notQuitCommand:

            cmp byte[bufferIn], '+'
            jne notPlusCommand
            ;//TODO
            call plus
            jmp mainLoop

        notPlusCommand:

            cmp byte[bufferIn], 'p'
            jne notPopAndPrintCommand
            ;//TODO
            call popAndPrint
            jmp mainLoop

        notPopAndPrintCommand:
        
            cmp byte[bufferIn], 'd'
            jne notDuplicateCommand
            ;//TODO
            call duplicate
            jmp mainLoop

        notDuplicateCommand:
        
            cmp byte[bufferIn], '&'
            jne notBitwiseAndCommand
            ;//TODO
            call bitwiseAnd
            jmp mainLoop

        notBitwiseAndCommand:
        
            cmp byte[bufferIn], '|'
            jne notBitwiseOrCommand
            ;//TODO
            call bitwiseOr
            jmp mainLoop

        notBitwiseOrCommand:
        
            cmp byte[bufferIn], 'n'
            jne notNumHexaCommand
            ;//TODO
            call numberOfHexCommand
            jmp mainLoop
        
        notNumHexaCommand:

            jmp mainLoop

    endOfMainLoop:


    popad
    mov esp, ebp
    pop ebp
    
    mov ebx,0
    mov eax,1
    int 0x80


pushToStack:
    push ebp
    mov ebp,esp
    pushad

    call writeSysCall

    popad
    mov esp, ebp
    pop ebp
    ret

endPushToStack:

;Reading from the user input
;returning the num of bytes that has been read to eax
readSysCall:
    push ebp
    mov ebp, esp
    pushad

    mov eax, 3
    mov ebx, 0
    mov ecx, bufferIn
    mov edx, 256

    int 0x80

    mov dword[return], eax
    popad
    mov eax, dword[return]
    mov esp, ebp
    pop ebp
    ret
endReadSysCall:

;Write from bufferOut //TODO can change to recieve address of string or char by char
writeSysCall:
    push ebp
    mov ebp, esp
    pushad

    mov eax, 4
    mov ebx, 1
    mov ecx, format_zabi
    mov edx, 8

    int 0x80



    popad
    mov esp, ebp
    pop ebp
    ret

endWriteSysCall:

;Converts string to hexa
;recieves &string and return
convertStringToHexa:
    push ebp
    mov ebp,esp
    pushad

    call writeSysCall

    popad
    mov esp, ebp
    pop ebp
    ret
endConvertStringToHexa:

;coverts char to hexa
;recieves char and return hexa
convertCharToHexa:
    push ebp
    mov ebp, esp
    pushad

converHexaTochar:

addToLinkedList:

freeLink:

free:

quit:
    push ebp
    mov ebp,esp
    pushad

    call writeSysCall

    popad
    mov esp, ebp
    pop ebp
    ret
endQuit:

plus:
    push ebp
    mov ebp,esp
    pushad

    call writeSysCall

    popad
    mov esp, ebp
    pop ebp
    ret
endPlus:

popAndPrint:
    push ebp
    mov ebp,esp
    pushad

    call writeSysCall

    popad
    mov esp, ebp
    pop ebp
    ret
endPopAndPrint:

duplicate:
    push ebp
    mov ebp,esp
    pushad

    call writeSysCall

    popad
    mov esp, ebp
    pop ebp
    ret
endDuplicate:

bitwiseAnd:
    push ebp
    mov ebp,esp
    pushad

    call writeSysCall

    popad
    mov esp, ebp
    pop ebp
    ret
endBitwiseAnd:

bitwiseOr:
    push ebp
    mov ebp,esp
    pushad

    call writeSysCall

    popad
    mov esp, ebp
    pop ebp
    ret
endBitwiseOr:

numberOfHexCommand:
    push ebp
    mov ebp,esp
    pushad

    call writeSysCall

    popad
    mov esp, ebp
    pop ebp
    ret
endNumberOfHexCommand: