; ####################################################################
; Arquivo: add.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017
;
; Adicione o valor de RAM[1] com RAM[0] gravando em RAM[2].
; ####################################################################

	 leaw $R1,%A
	 movw (%A),%D
	 leaw $R0,%A
	 addw (%A), %D, %S
	 leaw $R2, %A
	 movw %S, (%A)