(defun c:matchro ()
  (setq ref-obj (car (entsel "\nSelect the reference object: ")))   ; Select reference object
  (setq target-obj (car (entsel "\nSelect the target object: ")))   ; Select target object
  (if (and ref-obj target-obj)
    (progn
      (setq ref-rotation (cdr (assoc 50 (entget ref-obj)))) ; Get rotation angle of reference
      (setq target-center (cdr (assoc 10 (entget target-obj)))) ; Get insertion point of target
      
      ;; Set rotation to match reference rotation
      (entmod (subst (cons 50 ref-rotation) (assoc 50 (entget target-obj)) (entget target-obj)))
      (entupd target-obj) ; Update the target entity to apply changes

      (princ "\nRotation matched successfully.")
    )
    (princ "\nSelection canceled or invalid objects.")      ; If selection canceled
  )
  (princ) ; Exit quietly
)