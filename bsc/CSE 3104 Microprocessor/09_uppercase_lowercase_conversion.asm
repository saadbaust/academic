.MODEL SMALL
.STACK 100H
.DATA
.CODE
MAIN PROC 
    
    ;INPUT
    MOV AH,1
    INT 21H
    MOV BL,AL
    
    ;COMPARE UPPERCASE 
    UPPERCASE:
    CMP BL,'A'
    JGE F1
    JMP LOWERCASE
    
    F1:
    CMP BL,'Z' 
    JLE PRINTUP
    
    LOWERCASE:
    CMP BL,'a'
    JGE F2
    JMP END
    
    F2:
    CMP BL,'z'
    JLE PRINTLOW
    JMP END
    
    PRINTUP:
    ADD BL,20H
    MOV AH,2
    MOV DL,BL
    INT 21H
    JMP END
    
    PRINTLOW:
    SUB BL,20H
    MOV AH,2
    MOV DL,BL
    INT 21H 
    JMP END 
    
    ;END
    END:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN