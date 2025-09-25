; ==============================
; Variables borrosas
; ==============================

(deftemplate Hs
   0 10
   (
      (Muy_Seco  (0 1) (0 1) (2 0))          ; triangular (0,0,2)
      (Seco      (1 0) (3 1) (5 0))          ; triangular (1,3,5)
      (Optimo    (4 0) (5.5 1) (6.5 1) (7.5 0)) ; trapezoidal (4,5.5,6.5,7.5)
      (Humedo    (6 0) (8 1) (10 0))         ; triangular (6,8,10)
      (Saturado  (9 0) (10 1) (10 1))        ; trapezoidal (9,10,10,10)
   )
)

(deftemplate Ta
   0 50
   (
      (Muy_Fria     (0 1) (0 1) (10 0))      ; triangular (0,0,10)
      (Fria         (5 0) (15 1) (25 0))     ; triangular (5,15,25)
      (Templada     (20 0) (25 1) (30 1) (35 0)) ; trapezoidal (20,25,30,35)
      (Calurosa     (30 0) (37 1) (44 0))    ; triangular (30,37,44)
      (Muy_Calurosa (40 0) (45 1) (50 1))    ; trapezoidal (40,45,50,50)
   )
)

(deftemplate Ir
   0 10
   (
      (Nula    (0 1) (0 1) (2 0))            ; triangular (0,0,2)
      (Baja    (1 0) (3 1) (5 0))            ; triangular (1,3,5)
      (Media   (4 0) (5 1) (6 0))            ; triangular (4,5,6)
      (Alta    (6 0) (8 1) (9 0))            ; triangular (6,8,9)
      (Maxima  (8 0) (9 1) (10 1))           ; trapezoidal (8,9,10,10)
   )
)

; ==============================
; Reglas borrosas
; ==============================

(defrule R1
   (Hs Seco)
   (Ta Calurosa)
   =>
   (assert (Ir Alta))
)

(defrule R2
   (Hs Optimo)
   (Ta Calurosa)
   =>
   (assert (Ir Media))
)

(defrule R3
   (Hs Optimo)
   (Ta Templada)
   =>
   (assert (Ir Baja))
)

(defrule R4
   (Hs Seco)
   (Ta Fria)
   =>
   (assert (Ir Media))
)

(defrule R5
   (Hs Saturado)
   =>
   (assert (Ir Nula))
)