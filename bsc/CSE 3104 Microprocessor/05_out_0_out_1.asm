.MODEL SMALL
.STACK 100H
.DATA 
.CODE
MAIN PROC 
    
    ;INPUT
    MOV AH,1
    INT 21H
    MOV BL,AL 
    
    ;COMPARE
    CMP BL,'0'
    JE PRINT0
    JMP PRINT1
    
    PRINT0:
    MOV AH,2
    MOV DL,BL
    INT 21H 
    JMP END
    
    PRINT1:
    MOV AH,2
    MOV DL,'1' 
    INT 21H
    JMP END
        
    
    ;END
    END:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN