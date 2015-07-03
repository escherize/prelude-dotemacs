(fset 'add-prelude-package-installation
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([67108896 5 23 67108911 1 40 97 100 100 45 116 111 45 108 105 115 116 32 67108905 39 112 114 101 108 117 100 101 45 company-dummy-event 112 97 99 107 97 103 101 115 32 6 39 2 backspace 5 14 1] 0 "%d")) arg)))

(fset 'hi
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ("hello." 0 "%d")) arg)))

(fset 'kill-tabs-cleanup
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([134217788 67108896 134217790 134217848 114 101 112 108 97 down return tab return 32 32 return 134217788 24 19 134217848 99 108 101 97 110 117 112 32 98 117 102 102 down up backspace backspace backspace backspace backspace M-backspace 119 104 105 116 101 115 112 97 99 101 32 99 down down return] 0 "%d")) arg)))
