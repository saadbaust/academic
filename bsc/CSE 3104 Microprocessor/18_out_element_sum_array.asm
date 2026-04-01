.MODEL SMALL
.STACK 100H
.DATA
    A1 DB 5,2,1,1
.CODE
MAIN PROC
    
    MOV AX, @DATA
    MOV DS,AX 
       
    MOV SI,0
    MOV CL,0
    
    OUTPUT:
    CMP SI,4
    JGE OUTPUTSUM
    
    MOV AH,2
    ADD CL,A1[SI]
    ADD A1[SI],30H
    MOV DL,A1[SI]
    INT 21H
    
    ADD SI,1  
    JMP OUTPUT 
    
    OUTPUTSUM:
    MOV AH,2 
    ADD CL,30H
    MOV DL,CL
    INT 21H
    
    
    END:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN