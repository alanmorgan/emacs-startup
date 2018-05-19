
(random t)

;; Note, I should be able to generate days-of-week-completion from days-of-week
(setq days-of-week            '("Sunday" "Monday" "Tuesday" "Wednesday" "Thursday" "Friday" "Saturday"))
(setq days-of-week-completion '(("Sunday" 0) ("Monday" 1) ("Tuesday" 2) ("Wednesday" 3) ("Thursday" 4) ("Friday" 5) ("Saturday" 6)))

(setq leap-days-in-month      '(31 29 31 30 31 30 31 31 30 31 30 31))
(setq non-leap-days-in-month  '(31 29 31 30 31 30 31 31 30 31 30 31))

;; Any doomsday works. Doesn't have to be the first
(setq non-leap-doomsday '(3 28 14 4 9 6 11 8 5 10 7 12))
(setq leap-doomsday     '(4 29 14 4 9 6 11 8 5 10 7 12))


(defun is-divisible (x y)
  (eq (mod x y) 0))

(defun is-leap-year (year)
  (and (is-divisible year 4)
       (or (not (is-divisible year 100))
           (is-divisible year 400))))

(defun random-month () 
  (+ (mod (random) 12) 1))

(defun random-day (month year)
  (+ (mod (random) (nth (- month 1) (if (is-leap-year year) leap-days-in-month non-leap-days-in-month))) 1))

(defun random-year ()
  (+ (mod (random) 200) 1900))

(defun compute-doomsday (year)
  (let* ((root-century (if (< year 2000) 1900 2000))
         (root-day (if (equal root-century 1900) 3 2))
         (number-of-twelves (/ (- year root-century) 12))
         (remainder (mod (- year root-century) 12))
         (number-of-leap-years (/ remainder 4)))
    (mod (+ root-day number-of-twelves remainder number-of-leap-years) 7)))

(defun get-guess (tag month day year)
  (let ((prompt  (format "%s What day is %d/%d/%d? " tag month day year)))
    (completing-read prompt days-of-week-completion)))

(defun get-doomsday-guess (year)
  (let ((prompt (format "What is the doomsday for %d? " year)))
    (completing-read prompt days-of-week-completion)))

(defun calculate-day-of-week (month day year)
  (let ((doomsday (compute-doomsday year))
        (month-doom (nth (- month 1) (if (is-leap-year year) leap-doomsday non-leap-doomsday))))
    (mod (+ doomsday (- day month-doom)) 7)))
        

(defun get-month-day-year ()
  (let* ((month (random-month))
         (year (random-year))
         (day (random-day month year)))
    (list month day year)))

(defun single-date-test (tag)
  (let* ((month (random-month))
         (year  (random-year))
         (day   (random-day month year))
         (guess (get-guess tag month day year))
         (correct-answer (nth (calculate-day-of-week month day year) days-of-week)))
    (if (not (equal guess correct-answer))
        (mini-log guess correct-answer month day year))
    (equal guess correct-answer)))

(defun mini-log (guess correct-answer month day year)
  (write-region (format "%d/%d/%d was on a %s, not %s" month day year correct-answer guess) nil "~/doomsday.mistakes" t 1))
  

(defun doomsday ()
  (interactive)
  (let* ((year (random-year))
         (guess (get-doomsday-guess year))
         (doomsday (nth (compute-doomsday year) days-of-week)))
    (if (equal guess doomsday)
        (message "Correct!")
      (message (concat "Wrong. The doomsday for " (format "%d" year) " was a " doomsday)))))

(defun log-result (time num-guesses)
  (let* ((cur-time (decode-time (current-time)))
         (month (nth 4 cur-time))
         (day (nth 3 cur-time))
         (year (nth 5 cur-time)))
    (message (format "That took you %0.2f seconds (%d guesses)" time num-guesses))
    (write-region (format "%0.2f seconds\t%d/%d/%d\t(%d guesses)" time month day year num-guesses) nil "~/doomsday.results" t 1)))

;; Time how long it takes me to come up with five correct answers
(defun doom-test ()
  (interactive)
  (setq start-time (float-time (current-time)))
  (setq num-correct 0)
  (setq num-guesses 0)
  (while (< num-correct 5)
    (setq num-guesses (1+ num-guesses))
    (if (single-date-test (format "(%d right)" num-correct))
        (progn
          (setq num-correct (1+ num-correct)))))
  (setq elapsed-time (- (float-time (current-time)) start-time))
  (log-result elapsed-time num-guesses))
    
      



