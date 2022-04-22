(defun iwb ()
  "indent whole buffer"
  (interactive)
  (delete-trailing-whitespace)
  (indent-region (point-min) (point-max) nil)
  (untabify (point-min) (point-max)))

(defun ict ()
  "insert current time"
  (interactive)
  (insert (format-time-string "%Y/%m/%d %H:%M:%S" (current-time))))

(defun icd ()
  "insert current date and weekday"
  (interactive)
  (insert (format-time-string "<%Y-%m-%d %a>" (current-time))))

(defun insert-mail ()
  (interactive)
  (insert user-mail-address))

(defun insert-header ()
  (interactive)
  (insert
   "File Name: "
   (buffer-name)
   "\n"
   "Created at "
   (format-time-string "%m-%d-%Y %A" (current-time))
   "\nby "
   user-mail-address
   "\n\n")
(comment-region (point-min) (point-max)))

(defun insert-file-name ()
  (interactive)
  (insert "File: " (buffer-name) "\n"))
