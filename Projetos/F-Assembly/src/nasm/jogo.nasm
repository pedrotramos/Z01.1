; Arquivo: jogo.nasm
; Curso: Elementos de Sistemas
; Criado por: Rafael Corsi
; Data: 28/3/2018
;
; Faça um jogo com o Z01.1

LED:
  leaw $21185, %A
  movw (%A), %D 
  leaw $21845, %A
  addw %A, %D, %D
  leaw $64, %A
  addw %A, %D, %D
  leaw $21184, %A
  movw %D, (%A)
  leaw $LED, %A
  jmp
  nop

 