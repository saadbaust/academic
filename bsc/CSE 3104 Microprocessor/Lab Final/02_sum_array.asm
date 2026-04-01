.MODEL SMALL
.STACK 100H
.DATA
    FINAL DB 2,1,2,3
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX 
    
    MOV SI,0
    MOV BL,0
    
    ARRAYOUT:
    CMP SI,3
    JG NEXT
    
    MOV AH,2
    ADD BL,FINAL[SI]
    ADD FINAL[SI],48

    MOV DL,FINAL[SI]
    INT 21H
    
    INC SI
    JMP ARRAYOUT
    
    NEXT:
    
    SUM:
    MOV AH,2
    ADD BL,48
    MOV DL,BL
    INT 21H
    
    END:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN