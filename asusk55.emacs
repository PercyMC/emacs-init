;; .emacs for AsusK55v
;; initialize package.el
(package-initialize)

;; start auto-complete with emacs
(require 'auto-complete)

;; custom dictionary directories
;;(add-to-list 'ac-dictionary-directories "~/.emacs.d/dict")

;; do default config for auto-complete
(require 'auto-complete-config)
(ac-config-default)

;; start yasnippet with emacs
(require 'yasnippet)
;;(setq yas-snippet-dirs '("~/.emacs.d/snippets"))
(yas-global-mode 1)

;;-----------------------------------------------------------------------------------------------------------------------
;; Remove Yasnippet's default tab key binding
(define-key yas-minor-mode-map (kbd "<tab>") nil)
(define-key yas-minor-mode-map (kbd "TAB") nil)
;; Set Yasnippet's key binding to shift+tab
(define-key yas-minor-mode-map (kbd "<backtab>") 'yas-expand)
;; Alternatively use Control-c + tab
(define-key yas-minor-mode-map (kbd "\C-c j") 'yas-expand)

(require 'auto-complete-config)
;;(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict") ;; confirmar si es necesario
(ac-config-default)
(global-auto-complete-mode t)
(ac-set-trigger-key "TAB")
(ac-set-trigger-key "<tab>")

;;-------------------------------------------------------------------------------------------------------------------------

;; let's define a function which initializes auto-complete-c-headers and gets called for c/c++ hooks
(defun my:ac-c-header-init ()
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers)
;;  (add-to-list 'achead:include-directories '"C:/Program Files (x86)/CodeBlocks/MinGW/include")
  (add-to-list 'achead:include-directories '"C:/Program Files (x86)/CodeBlocks/MinGW/lib/gcc/mingw32/4.7.1/include/c++")  
)

;; now let's call this function from c/c++ hooks
(add-hook 'c++-mode-hook 'my:ac-c-header-init)
(add-hook 'c-mode-hook 'my:ac-c-header-init)


;; SEMANTIC
;; Turn On semantic
(semantic-mode 1)

;; let's define a function which adds semantic as a suggestion backend to
;; auto complete and hook this function to c-mode-common-hook
(defun my:add-semantic-to-autocomplete()
  (add-to-list 'ac-sources 'ac-source-semantic)
  )

(add-hook 'c-mode-common-hook 'my:add-semantic-to-autocomplete)
(add-hook 'makefile-mode-hook 'my:add-semantic-to-autocomplete)


;; turn on ede mode
(global-ede-mode 1)

;; create a project for our program
;; D:/home/TresEnLinea/
;; ~/
(ede-cpp-root-project "my project" :file "h:/Users/Percy/Documents/Datcori5/Cpp-Ps/CPCPPsp6e/TresEnLinea/main.cpp"
		      ;;		      :include-path '("/../my_inc")
		      ;; system-include-path '("C:/Program Files (x86)/CodeBlocks/MinGW/include"
					     ;; "C:/Program Files (x86)/CodeBlocks/MinGW/lib/gcc/mingw32/4.7.1/includee/c++"
			;;		     )
		      )

;; turn on automatic reparsing of open buffers in semantic
(global-semantic-idle-scheduler-mode 1)

;; ********************

;; you can use system-include-path for setting up the system header file locations.

;; Semantic
;;(global-semantic-idle-completions-mode t)
;;(global-semantic-decoration-mode t)
;;(global-semantic-highlight-func-mode t)
;;(global-semantic-show-unmatched-syntax-mode t)

;;-------------------------------------------------------------------------------------------------------------------------
;; Predictive-mode (Su funcionamiento no convence)
;;  (add-to-list 'load-path "D:/home/.emacs.d/predictive")
;;  (add-to-list 'load-path "D:/home/.emacs.d/predictive/dict")
;;  (add-to-list 'load-path "D:/home/.emacs.d/predictive/dict/html")
;;  (add-to-list 'load-path "D:/home/.emacs.d/predictive/dict/latex")
;;  (add-to-list 'load-path "D:/home/.emacs.d/predictive/dict/texinfo")
;;  (require 'predictive)

;;-------------------------------------------------------------------------------------------------------------------------
;; mi personalización
(load-file "mcmacros.el")
;; para redimensionamiento de la ventana actual
(global-set-key (kbd "<C-up>") 'shrink-window)
(global-set-key (kbd "<C-down>") 'enlarge-window)
(global-set-key (kbd "<C-left>") 'shrink-window-horizontally)
(global-set-key (kbd "<C-right>") 'enlarge-window-horizontally)
 
(global-set-key (kbd "<f5>") 'other-window)
(global-set-key (kbd "<f6>") 'previous-buffer)
(global-set-key (kbd "<f7>") 'next-buffer)

;; cambiar la combinación de teclas para copiar y cortar regiones
;;(global-set-key (kbd "C-w") 'kill-ring-save)
;;(global-set-key (kbd "M-w") 'kill-region)

;;(define-key global-map (kbd "C-c ;") 'iedit-mode)
(define-key global-map (kbd "C-;") 'iedit-mode)
(define-key global-map (kbd "C-c ke") 'TeX-next-error) ;; para visualizar el error generado al compilar el documento

;; C++ indentation
(setq-default c-basic-offset 3)

;; para copiar archivos con dos ventanas dired y como destino de las
;; copia la otra ventana
(setq dired-dwim-target t)

;; Desactivar la creación de copias de respaldo de archivos
(setq make-backup-files nil)

;; activar column-number-mode
(column-number-mode)

;;------------------------------------------------------------------------------------------------------
;; AUC TeX
;;(load "preview-latex.el" nil t t)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex) ; Activar reftex con AucTeX
(setq reftex-plug-into-AUCTeX t) ; Conectar a AUC TeX con RefTeX
;;(setq TeX-default-mode '"LaTeX-mode") ; Modo ordinario para ficheros .tex
;;(setq TeX-force-default-mode t) ; Activar siempre dicho modo.

(set-default 'preview-default-document-pt 12)
(set-default 'preview-scale-function 1.9) ; controla exactamente el tamaño del preview

; yasnippet conflict fix (temporary hack)
;;(require 'auto-complete-yasnippet)
;;(setq ac-trigger-key "TAB")       ; set TAB back to auto-complete

;;(ac-set-trigger-key "TAB")
;;(setq ac-auto-start nil)


(require 'auto-complete-auctex)

;;Finally, to get AUCTeX to parse opened files (and the files they include/use) for macros, add this
;;las siguientes 5 líneas (relacionados con parse) podría enlentecer emacs...
(setq-default TeX-master nil)
(setq TeX-parse-self t)             ; parse on load for macros
(setq TeX-auto-save t)              ; parse on save for macros
(setq TeX-auto-parse-length 999999) ; parse long files
(setq TeX-auto-regexp-list 'TeX-auto-full-regexp-list)  ; parse all

;; sr-speedbar
;;(require 'sr-speedbar)
(setq sr-speedbar-width 25) ; ancho
(setq sr-speedbar-right-side nil) ; put on left side
;;------------------------------------------------------------------------------------------------------
;; Configuración del diccionario aspell
(require 'ispell)
;;(setq-default ispell-program-name "C:/Program Files (x86)/Aspell/bin/aspell.exe")
(setq-default ispell-program-name "aspell")
(setq ispell-dictionary "castellano")
;;(setq flyspell-default-dictionary "castellano")

;; reduce flyspell lag
(require 'flyspell-lazy)
(flyspell-lazy-mode 1)

;; enable on-the-fly spell checking/highlighting
:; enable flyspell for latex
(add-hook 'LaTeX-mode-hook 'flyspell-mode)

;; enable flyspell programming mode
;;(mapcar (lambda (mode-to-hook) (add-hook mode-to-hook 'flyspell-prog-mode))
;;	'(c-mode-common-hook emacs-lisp-mode-hook ))

;;------------------------------------------------------------------------------------------------------
;;outline
(defun turn-on-outline-minor-mode ()
(outline-minor-mode 1))

(add-hook 'LaTeX-mode-hook 'turn-on-outline-minor-mode)
(add-hook 'latex-mode-hook 'turn-on-outline-minor-mode)
(setq outline-minor-mode-prefix "\C-ck") ; Or something else

;;end outline
;;------------------------------------------------------------------------------------------------------

;; Org. The following lines are always needed. Choose your own keys.
;;(global-set-key "\C-cl" 'org-store-link)
;;(global-set-key "\C-ca" 'org-agenda)
;;(global-set-key "\C-cc" 'org-capture)
;;(global-set-key "\C-cb" 'org-iswitchb)


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "outline" :family "Liberation Mono")))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#839496")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-enabled-themes (quote (solarized-dark)))
 '(custom-safe-themes
   (quote
    ("f04122bbc305a202967fa1838e20ff741455307c2ae80a26035fbf5d637e325f" "3632cf223c62cb7da121be0ed641a2243f7ec0130178722554e613c9ab3131de" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(fci-rule-color "#073642")
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#002b36" 0.25)
    (quote
     ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#93a1a1")
 '(highlight-tail-colors
   (quote
    (("#073642" . 0)
     ("#546E00" . 20)
     ("#00736F" . 30)
     ("#00629D" . 50)
     ("#7B6000" . 60)
     ("#8B2C02" . 70)
     ("#93115C" . 85)
     ("#073642" . 100))))
 '(hl-bg-colors
   (quote
    ("#7B6000" "#8B2C02" "#990A1B" "#93115C" "#3F4D91" "#00629D" "#00736F" "#546E00")))
 '(hl-fg-colors
   (quote
    ("#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36")))
 '(inhibit-startup-screen t)
 '(magit-diff-use-overlays nil)
 '(nrepl-message-colors
   (quote
    ("#dc322f" "#cb4b16" "#b58900" "#546E00" "#B4C342" "#00629D" "#2aa198" "#d33682" "#6c71c4")))
 '(package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("melpa" . "http://melpa.org/packages/"))))
 '(package-selected-packages
   (quote
    (zonokai-theme sr-speedbar solarized-theme nyan-mode iedit flyspell-lazy auto-complete-c-headers auto-complete-auctex auctex)))
 '(pos-tip-background-color "#073642")
 '(pos-tip-foreground-color "#93a1a1")
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#073642" 0.2))
 '(speedbar-default-position (quote left))
 '(term-default-bg-color "#002b36")
 '(term-default-fg-color "#839496")
 '(tool-bar-mode nil)
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#dc322f")
     (40 . "#c85d17")
     (60 . "#be730b")
     (80 . "#b58900")
     (100 . "#a58e00")
     (120 . "#9d9100")
     (140 . "#959300")
     (160 . "#8d9600")
     (180 . "#859900")
     (200 . "#669b32")
     (220 . "#579d4c")
     (240 . "#489e65")
     (260 . "#399f7e")
     (280 . "#2aa198")
     (300 . "#2898af")
     (320 . "#2793ba")
     (340 . "#268fc6")
     (360 . "#268bd2"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (quote
    (unspecified "#002b36" "#073642" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#839496" "#657b83")))
 '(xterm-color-names
   ["#073642" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#eee8d5"])
 '(xterm-color-names-bright
   ["#002b36" "#cb4b16" "#586e75" "#657b83" "#839496" "#6c71c4" "#93a1a1" "#fdf6e3"]))
