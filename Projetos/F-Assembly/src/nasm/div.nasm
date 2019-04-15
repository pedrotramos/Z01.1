; Arquivo: Div.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; Divide R0 por R1 e armazena o resultado em R2.
; (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
; divisao para numeros inteiros positivos

leaw $1, %A
movw (%A), %D
leaw $0, %A
movw %A, %S

DIVISAO:   
leaw $0, %A 
subw %D, (%A), %D
leaw $END, %A
jle %D
nop
leaw $DIVISAO, %A
incw %S
jg %D
nop

END:
leaw $2, %A
movw %S, (%A)