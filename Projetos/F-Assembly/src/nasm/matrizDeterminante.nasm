; Arquivo: matrizDeterminante.nasm
; Curso: Elementos de Sistemas
; Criado por: Rafael Corsi
; Data: 03/2019
;
; Calcula o determinante de uma matriz 2x2 (RAM[1000]) e
;  salva seu resultado no endereço RAM[0]
;
; Calcula o determinante de uma matriz 2x2 (RAM[1000]) na forma
; [ a0, a1 ]
; [ b0, b1 ]
;
; Salva o resultado no endereço RAM[0]
;
; A matriz é salva na memória da seguinte maneira:
; RAM[1000] = a0
; RAM[1001] = a1
; RAM[1003] = b0
; RAM[1004] = b1

leaw $1000, %A
movw (%A), %S
leaw $1004, %A
movw (%A), %D
decw %D

DPRINC:
leaw $1000, %A
addw %S, (%A), %S
decw %D
leaw $DPRINC, %A
jg %D
nop
leaw $1, %A
movw %S, (%A)

leaw $1001, %A
movw (%A), %S
leaw $1003, %A
movw (%A), %D
decw %D

OUTRAD:
leaw $1001, %A
addw %S, (%A), %S
decw %D
leaw $OUTRAD, %A
jg %D
nop
leaw $2, %A
movw %S, (%A)

leaw $1, %A
movw (%A), %D
leaw $2, %A
movw (%A), %S

subw %D, %S, %S

leaw $0, %A
movw %S, (%A)