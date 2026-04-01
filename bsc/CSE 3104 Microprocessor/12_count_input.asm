.MODEL SMALL
.STACK 100H 
.DATA
MAIN PROC
    
    MOV BL,'0'
    
    INPUT:
    MOV AH,1
    INT 21H
    
    CMP AL,0DH
    JE LINEBREAK
    
    INC BL
    JMP INPUT
    
    LINEBREAK:
    MOV AH,2
    MOV DL,0DH ;ENTER
    INT 21H
    MOV AH,2
    MOV DL,0AH ;LINE FIRST
    INT 21H
    
    
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
    
    