; Arquivo: Mod.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017
;
; Encontra o resto da divisão entre RAM[2] e RAM[1] e o salva em RAM[0].

leaw $2, %A
movw (%A), %D

DIVISAO:   ; loop por subtracao de inteiros
leaw $1, %A ; atualizar sempre com o novo resultado
subw %D, (%A), %D ; subtrai o divisor do dividendo ou resultado da subtracao anterior
leaw $END, %A ; vai para parte que retorna resultado caso seja igual ou menor a 0
jle %D 
nop
leaw $DIVISAO, %A ; repete o procedimento de subtracao
movw %D, %S
jg %D
nop

END:
leaw $0, %A
movw %S, (%A) ; salva o resultado 