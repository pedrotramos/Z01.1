; Arquivo: Div.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; Divide R0 por R1 e armazena o resultado em R2.
; (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
; divisao para numeros inteiros positivos

leaw $0, %A
movw (%A), %D
movw %A, %S

DIVISAO:   ; loop por subtracao de inteiros
leaw $1, %A ; atualizar sempre com o novo resultado
subw %D, (%A), %D ; subtrai o divisor do dividendo ou resultado da subtracao anterior
leaw $END, %A ; vai para parte que retorna resultado caso seja igual ou menor a 0
jle %D 
nop
leaw $DIVISAO, %A ; repete o procedimento de subtracao
incw %S
jg %D
nop

END:
incw %S
leaw $2, %A
movw %S, (%A) ; salva o resultado 