.MODEL SMALL 
.STACK 100H
.DATA
.CODE
MAIN PROC
    ;INPUT CHARACTER 
    MOV AH,1
    INT 21H
    
    ;STORE
    MOV BL,AL  
    
    ;INPUT CHARACTER 
    MOV AH,1
    INT 21H
              
    ;STORE
    MOV CL,AL
    
    ADD BL,CL
    SUB BL,30H ;Takes input as ASCII value and add ACII value. Convert ASCII value to normal during outpu
    
    ;LINE BREAK
    MOV AH,2
    MOV DL,0DH ;ENTER
    INT 21H
    MOV AH,2
    MOV DL,0AH ;LINE FIRST
    INT 21H
    
    ;PRINT
    MOV AH,2
    MOV DL,BL
    INT 21H
    
    ;END PROGRAM
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN