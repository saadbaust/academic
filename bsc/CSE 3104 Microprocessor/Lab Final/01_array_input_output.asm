.MODEL SMALL
.STACK 100H
.DATA
.CODE
MAIN PROC
    
    MOV CX,5
    
    STACKIN:
    MOV AH,1
    INT 21H
    MOV BL,AL
    
    PUSH BX
    LOOP STACKIN
    
    NEXT:
    MOV CX,5
    
    STACKOUT:
    POP BX
    
    MOV AH,2
    MOV DX,BX
    INT 21H
    LOOP STACKOUT
    
    
    END:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN