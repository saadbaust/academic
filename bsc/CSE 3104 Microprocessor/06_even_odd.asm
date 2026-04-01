.MODEL SMALL
.STACK 100H
.DATA
M1 DW 'EVEN$'
M2 DW 'ODD$' 
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    ;INPUT
    MOV AH,1
    INT 21H
    MOV BL,AL
    
    TEST BL,1 
    JZ EVEN
    JMP ODD
    
    EVEN:
    MOV AH,9
    LEA DX,M1
    INT 21H
    JMP END
    
    ODD:
    MOV AH,9
    LEA DX,M2
    INT 21H
    JMP END
    
    ;END
    END:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN