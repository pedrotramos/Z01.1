; Arquivo: Pow.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; Eleva ao quadrado o valor da RAM[1] e armazena o resultado na RAM[0].
; Só funciona com números positivos

leaw $1, %A
movw (%A), %D
movw (%A), %S
decw %S

POW:
leaw $1, %A
addw %D, (%A), %D ; adiciona o numero a ele mesmo n vezes
leaw $END, %A ; vai para parte que retorna resultado caso seja igual a 0, indicando que somou o valor n, n vezes
je %S 
nop
leaw $POW, %A ; repete o procedimento de adicao
decw %S
jg %S
nop

END:
leaw $0, %A
movw %D, (%A) ; salva o resultado 