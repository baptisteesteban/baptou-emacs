;; For CMake
(use-package cmake-mode)

(setq c-default-style "linux"
      c-basic-offset 4)

(use-package company-irony)
(use-package company-irony-c-headers)
(eval-after-load 'company
  '(add-to-list 'company-backends '(company-irony company-irony-c-headers)))

(provide 'baptou-cpp)
