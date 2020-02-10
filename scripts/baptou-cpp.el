;; For CMake
(use-package cmake-mode)

(use-package company-irony)
(use-package company-irony-c-headers)
(eval-after-load 'company
  '(add-to-list 'company-backends '(company-irony company-irony-c-headers)))

(provide 'baptou-cpp)
