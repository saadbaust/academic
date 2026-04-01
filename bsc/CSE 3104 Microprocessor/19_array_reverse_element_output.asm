.MODEL SMALL
.STACK 100H
.DATA
A1 DB 1,2,3,4,5
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS,AX
    
    MOV SI,4 
    
    OUTPUT:
    CMP SI,0
    JL END
    
    MOV AH,2 
    ADD A1[SI],30H
    MOV DL,A1[SI]
    INT 21H
    
    DEC SI
    JMP OUTPUT   
    
    END:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN