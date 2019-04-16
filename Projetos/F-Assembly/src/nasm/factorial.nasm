; Arquivo: Factorial.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; Calcula o fatorial do número em (R0) e armazena o valor em (R1).

leaw $0, %A
movw (%A), %D
movw (%A), %S
leaw $ZERO, %A
je %D
nop

leaw $2, %A
movw %D, (%A)

PRELOOP:
decw %S

LOOP:
decw %S
leaw $NEW, %A
jle %S
nop
leaw $2, %A
addw %D, (%A), %D
leaw $LOOP, %A
jmp
nop

NEW:
leaw $2, %A
movw %D, (%A)
leaw $0, %A
movw (%A), %S
decw %S
movw %S, (%A)
leaw $PRELOOP, %A
jg %S
nop
leaw $END, %A
jle %S
nop

ZERO:
leaw $1, %A
movw %A, %D
leaw $END, %A
jmp
nop

END:
leaw $1, %A
movw %D, (%A)