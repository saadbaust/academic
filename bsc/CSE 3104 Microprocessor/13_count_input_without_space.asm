.MODEL SMALL
.STACK 100H 
.DATA
MAIN PROC
    
    MOV BL,'0'
    
    INPUT:
    MOV AH,1
    INT 21H
    
    CMP AL,0DH
    JE PRINT
    
    CMP AL,32
    JE INPUT
    
    INC BL
    JMP INPUT
    
    
    PRINT:
    MOV AH,2
    MOV DL,BL
    INT 21H
    JMP END
    
    
    END:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN
    
    