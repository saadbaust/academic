.MODEL SMALL
.STACK 100H
.DATA
M DB 'DIGIT$'
M1 DB 'LOWERCASE$'
M2 DB 'UPPERCASE$' 
.CODE
MAIN PROC 
    MOV AX, @DATA
    MOV DS,AX 
    
    ;INPUT
    MOV AH,1
    INT 21H
    MOV BL,AL
    
    DIGIT:
    CMP BL,'0'
    JGE F
    JMP END
    
    F:
    CMP BL,'9'
    JLE PRINT
    JMP UPPERCASE 
    
    ;COMPARE UPPERCASE
    UPPERCASE:
    CMP BL,'A'
    JGE F1
    JMP END 
    
    F1:
    CMP BL,'Z'
    JLE PRINT1
    JMP LOWERCASE
    
    LOWERCASE:
    CMP BL,'a'
    JGE F2
    JMP END
    
    F2: 
    CMP BL,'z'
    JLE PRINT2
    JMP END
    
    PRINT:
    MOV AH,9
    LEA DX,M
    INT 21H
    JMP END
    
    PRINT1:
    MOV AH,9
    LEA DX,M2
    INT 21H
    JMP END
    
    PRINT2:
    MOV AH,9
    LEA DX,M1
    INT 21H
    JMP END    
    
    ;END
    END:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN