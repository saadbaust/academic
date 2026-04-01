.MODEL SMALL
.STACK 100H
.DATA
.CODE
MAIN PROC
    MOV CX,0 
    
    INPUT:
    MOV AH,1
    INT 21H
    
    CMP AL,0DH
    JE OUTPUT
    
    PUSH AX
    
    INC CX
    JMP INPUT
    
    
    OUTPUT:
    POP BX
    MOV AH,2
    MOV DX,BX
    INT 21H
    LOOP OUTPUT
    
    END:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN