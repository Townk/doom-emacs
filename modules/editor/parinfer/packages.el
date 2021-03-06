;; -*- no-byte-compile: t; -*-
;;; editor/parinfer/packages.el

(when (featurep! :editor evil)
  ;; Parinfer uses `evil-define-key' without loading evil, so if evil is
  ;; installed *after* parinfer, parinfer will throw up void-function errors.
  ;; because evil-define-key (a macro) wasn't expanded at compile-time. So we
  ;; make sure evil is installed before parinfer...
  (package! evil)
  ;; ...and that it can see `evil-define-key' if evil was installed in a
  ;; separate session:
  (autoload 'evil-define-key "evil-core" nil nil 'macro))

(package! parinfer :pin "91856b9c5817ead97aa034fe108c4a6e884802b2")
