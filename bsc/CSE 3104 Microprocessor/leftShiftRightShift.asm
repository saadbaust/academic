.MODEL SMALL
.STACK 100H
.DATA
.CODE
MAIN PROC
    
    MOV AH,1
    INT 21H
    MOV BL,AL
    SUB BL,48
    
    
    SHR BL,2
    ADD BL,48
    
    MOV AH,2
    MOV DL,BL
    INT 21H
    
    
    
    END:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN