; Arquivo: LCDQuadrado.nasm
; Curso: Elementos de Sistemas
; Criado por: Rafael Corsi
; Data: 28/3/2018
;
; Desenhe um quadro no LCD
;  - Valide no hardawre
;  - Bata uma foto!

; quadrado

; carrega x"FF" em S (todos pxs em '1')
  leaw $0, %A
  movw %A, %S
  notw %S

  ; linha 1
  leaw $18855, %A
  movw %S, (%A)

  ; linha 1
  leaw $18875, %A
  movw %S, (%A)

      ; linha 1
  leaw $18895, %A
  movw %S, (%A)

      ; linha 1
  leaw $18915, %A
  movw %S, (%A)

      ; linha 1
  leaw $18935, %A
  movw %S, (%A)

    ; linha 1
  leaw $18955, %A
  movw %S, (%A)

    ; linha 1
  leaw $18975, %A
  movw %S, (%A)

      ; linha 1
  leaw $18995, %A
  movw %S, (%A)

	; linha 1
  leaw $19015, %A
  movw %S, (%A)

  ; linha 1
  leaw $19035, %A
  movw %S, (%A)

  ; linha 1
  leaw $19055, %A
  movw %S, (%A)

  ; linha 1
  leaw $19075, %A
  movw %S, (%A)

; linha 1
  leaw $19095, %A
  movw %S, (%A)

  ; linha 1
  leaw $19115, %A
  movw %S, (%A)

    ; linha 1
  leaw $19135, %A
  movw %S, (%A)

    ; linha 1
  leaw $19155, %A
  movw %S, (%A)

    ; linha 1
  leaw $19175, %A
  movw %S, (%A)
