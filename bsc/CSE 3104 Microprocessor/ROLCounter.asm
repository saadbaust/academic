.MODEL SMALL
.STACK 100H
.DATA
.CODE
MAIN PROC     
    
    MOV AH,1
    INT 21H
    MOV BL,AL
    
    SUB BL,30H
    
    MOV DH,0
    MOV CX,8
    
    TOP:
    ROL BL,1
    JNC NEXT
    INC DH
    
    NEXT:
    LOOP TOP
    
    ADD DH,30H
    
    PRINT:
    MOV AH,2
    MOV DL,DH
    INT 21H
    
    
    END:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN