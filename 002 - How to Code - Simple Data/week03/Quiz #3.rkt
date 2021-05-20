(require 2htdp/image)
(require 2htdp/universe)

;; My world program  (make this more specific)

;; =================
;; Constants:
(define WIDTH 300)
(define HEIGHT 300)
(define CTR-Y (/ HEIGHT 2))
(define CTR-X (/ WIDTH 2))
(define MTS (empty-scene WIDTH HEIGHT))
(define ROTATION 300)

(define WINDMILL-IMG (overlay
                        (rotate   90 (triangle 30 "solid" "green"))
                        (rotate  270 (triangle 30 "solid" "blue"))
                        (rotate    0 (triangle 46 "solid" "red"))
                        (rotate  180 (triangle 46 "solid" "yellow"))))


;; =================
;; Data definitions:

;; Windmill is Natural[0, 360)
;; interp. the rotation position of windmill 
(define WM1   0)   ; start
(define WM2 180)   ; middle
(define WM3 360)   ; end
 
#;
(define (fn-for-windmill cd)
  (... cd))

;; Template rules used:
;;  - atomic non-distinct: Natural[0, 360)

;; =================
;; Functions:

;; Windmill -> Windmill
;; start the world with (main 0)
;; 
(define (main wm)
  (big-bang wm                            ; Windmill
            (on-tick   advance-windmill)  ; Windmill -> Windmill
            (to-draw   render)))          ; Windmill -> Image 

;; Windmill -> Windmill
;; produce the next windmill
(check-expect (advance-windmill 0) (+ ROTATION 0))
(check-expect (advance-windmill 360) (+ ROTATION 0))

(define (advance-windmill wm) (modulo (+ ROTATION wm) 360))


;; Windmill -> Image
;; render windmill position 
(check-expect (render 0) (place-image (rotate (advance-windmill 0) WINDMILL-IMG) CTR-X CTR-Y MTS))
(check-expect (render 359) (place-image (rotate (advance-windmill 359) WINDMILL-IMG) CTR-X CTR-Y MTS))
               
(define (render wm)
  (place-image (rotate (advance-windmill wm) WINDMILL-IMG) CTR-X CTR-Y MTS))

