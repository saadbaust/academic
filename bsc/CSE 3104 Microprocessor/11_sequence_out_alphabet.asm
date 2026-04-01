.MODEL SMALL
.STACK 100H 
.DATA
MAIN PROC
     
    ;INPUT
    MOV AH,1
    INT 21H
    MOV BL,AL
    
    ;INPUT
    MOV AH,1
    INT 21H
    MOV CL,AL 
    
    CMP BL,CL
    JLE PRINTBL
    JMP PRINTCL
    
    PRINTBL:
    MOV AH,2
    MOV DL,BL 
    INT 21H
    JMP END
    
    PRINTCL:
    MOV AH,2 
    MOV DL,CL
    INT 21H
    JMP END
    
    END:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN
    
    