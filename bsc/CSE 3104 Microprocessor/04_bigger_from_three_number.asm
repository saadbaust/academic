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
    
    ;INPUT 3
    MOV AH,1
    INT 21H
    MOV CH,AL
    
    ;COMPARE BL AND CL
    CMP BL,CL
    JGE F1
    JMP F2
    
    ;COMPARE BL AND CH
    F1:
    CMP BL,CH
    JGE PRINTBL
    JMP PRINTCH
    
    ;COMPARE CL AND CH
    F2:
    CMP CL,CH
    JGE PRINTCL
    JMP PRINTCH
    
    ;PRINT BL
    PRINTBL:
    MOV AH,2
    MOV DL,BL
    INT 21H
    JMP END
    
    ;PRINT CL 
    PRINTCL:
    MOV AH,2
    MOV DL,CL
    INT 21H
    JMP END 
    
    ;PRINT CH 
    PRINTCH:
    MOV AH,2
    MOV DL,CH
    INT 21H
    JMP END
    
    ;END
    END:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN