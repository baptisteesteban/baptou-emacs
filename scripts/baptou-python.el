(use-package company-jedi)
(jedi:install-server)

(eval-after-load 'company
  '(add-to-list 'company-backends '(company-jedi)))


(provide 'baptou-python)
