.MODEL SMALL
.STACK 100H
.DATA
.CODE
MAIN PROC   
    MOV AH,1
    INT 21H
    MOV BL,AL    
    CMP BL,'0'
    JGE F1
    JMP END    
    F1:
    CMP BL,'9'
    JLE PRINT1
    JMP CHECK    
    CHECK:
    CMP BL,'A'
    JGE F2
    JMP END    
    F2:
    CMP BL,'F'
    JLE PRINT2
    JMP END    
    PRINT1:
    MOV AH,2
    MOV DL,BL
    INT 21H
    JMP END     
    PRINT2:
    MOV AH,2 
    MOV DL,'1'
    INT 21H
    SUB BL,17
    MOV AH,2
    MOV DL,BL
    INT 21H
    JMP END    
    END:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN