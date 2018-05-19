;; Quiz on correct strategy for blackjack

;; (S)tand
;; (H)it
;; (D)ouble
;; S(P)lit

(setq bj-blackjack-hands-and-strategy
        ;; DLR      23456789TA
      '(("17+"     "SSSSSSSSSS")
        ("16"      "SSSSSHHHHH")
        ("15"      "SSSSSHHHHH")
        ("14"      "SSSSSHHHHH")
        ("13"      "SSSSSHHHHH")
        ("12"      "HHSSSHHHHH")
        ("11"      "DDDDDDDDDH")
        ("10"      "DDDDDDDDHH")
        ("9"       "HDDDDHHHHH")
        ("8"       "HHHHHHHHHH")
        ("7"       "HHHHHHHHHH")
        ("6"       "HHHHHHHHHH")
        ("5"       "HHHHHHHHHH")
        ("Soft 20" "SSSSSSSSSS")
        ("Soft 19" "SSSSSSSSSS")
        ("Soft 18" "SDDDDSSHHH")
        ("Soft 17" "HDDDDHHHHH")
        ("Soft 16" "HHDDDHHHHH")
        ("Soft 15" "HHDDDHHHHH")
        ("Soft 14" "HHHDDHHHHH")
        ("Soft 13" "HHHDDHHHHH")
        ("Pair A"  "PPPPPPPPPP")
        ("Pair T"  "SSSSSSSSSS")
        ("Pair 9"  "PPPPPSPPSS")
        ("Pair 8"  "PPPPPPPPPP")
        ("Pair 7"  "PPPPPPHHHH")
        ("Pair 6"  "PPPPPHHHHH")
        ("Pair 5"  "DDDDDDDDHH")
        ("Pair 4"  "HHHPPHHHHH")
        ("Pair 3"  "PPPPPPHHHH")
        ("Pair 2"  "PPPPPPHHHH")))

(setq bj-card-values '(2 3 4 5 6 7 8 9 10 A))

(setq bj-completing-read '(("Hit" "H") ("Stand" "S") ("Double" "D") ("Split" "P")))

(defun bj-get-hand-and-strategy ()
  (nth (random (length bj-blackjack-hands-and-strategy)) bj-blackjack-hands-and-strategy))


(defun bj-get-dealer-card ()
  (nth (random 10) bj-card-values) )

(defun bj-guess-index-to-guess (n) (nth n '("H" "S" "D" "P")))

(defun bj-pick-random-element (lst)
  (nth (random (length lst)) lst))

(defun bj-get-scenario ()
  (let* ((hand-and-rules (bj-pick-random-element bj-blackjack-hands-and-strategy))
         (dealers-hand-index (random 10)))
    (list hand-and-rules dealers-hand-index)))

(defun bj-get-my-hand (scenario)
  (car (car scenario)))

(defun bj-get-rules (scenario)
  (car (cdr (car scenario))))

(defun bj-get-dealer-idx (scenario)
  (car (cdr scenario)))

(defun bj-get-dealer-hand (scenario)
  (nth (bj-get-dealer-idx scenario) bj-card-values))

(defun bj-get-correct-play (scenario)
  (let ((idx (bj-get-dealer-idx scenario)))
    (substring (bj-get-rules scenario) idx (+ 1 idx))))

(defun bj-is-guess-correct (guess scenario)
  (equal guess (bj-get-correct-play scenario)))

(defun bj-convert-guess (guess)
  (car (cdr (assoc guess bj-completing-read))))

(defun bj-make-guess (scenario)
  (bj-convert-guess (completing-read
                     (format "You have %s, dealer shows %s: "
                             (bj-get-my-hand scenario)
                             (bj-get-dealer-hand scenario)) bj-completing-read)))

(defun bj-quiz ()
  (let* ((scenario (bj-get-scenario))
         (my-guess (bj-make-guess scenario))
         (result-string (format "If you have %s and the dealer has %s you should %s"
                                (bj-get-my-hand scenario)
                                (bj-get-dealer-hand scenario)
                                (bj-get-correct-play scenario)))
         )
    (if (bj-is-guess-correct my-guess scenario)
        (message (concat "Correct. " result-string))
      (message (concat "Incorrect. " result-string)))))

