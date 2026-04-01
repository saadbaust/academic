.MODEL SMALL
.STACK 100H
.DATA
.CODE
MAIN PROC
    MOV AH,1
    INT 21H
    MOV BL,AL
    
    TEST BL,1
    JZ F1
    JMP F2
    
    
    F2:
    MOV AH,2
    MOV DL,'O'
    INT 21H
    JMP END
    
    F1: 
    MOV AH,2
    MOV DL,'E'
    INT 21H
    
    END:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN