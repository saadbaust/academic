.MODEL SMALL
.STACK 100H
.DATA
MSG DB 'SuMaIa!!' ;Does not work in DW
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS,AX
    
    MOV SI,0 
    
    OUTPUT:
    CMP SI,9
    JGE END
    
    CHECK1:
    CMP MSG[SI],'a'
    JL PRINT
    
    CMP MSG[SI],'z'
    JG PRINT 
    
    OP:
    MOV MSG[SI],'*'
    ;ADD MSG[SI],30H
    
    PRINT:
    MOV AH,2
    MOV DL,MSG[SI]
    INT 21H
    
    LE:
    ADD SI,1
    JMP OUTPUT   
    
    END:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN