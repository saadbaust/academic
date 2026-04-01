.MODEL SMALL
.STACK 100H
.DATA 
.CODE
MAIN PROC 
    
    ;INPUT 1
    MOV AH,1
    INT 21H
    MOV BL,AL
    
    ;INPUT 2
    MOV AH,1
    INT 21H
    MOV CL,AL
    
    ;COMPARE
    CMP BL,CL
    JGE PRINTBL
    JMP PRINTCL
    
    ;PRINT BL
    PRINTBL:
    MOV AH,9
    MOV DL,BL
    INT 21H
    JMP END
    
    ;PRINT CL 
    PRINTCL:
    MOV AH,2
    MOV DL,CL
    INT 21H
    JMP END
    
    ;END
    END:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN