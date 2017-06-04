;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;;company-mode
(add-hook 'after-init-hook 'global-company-mode)

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


;;(ac-set-trigger-key "TAB")
;;(ac-set-trigger-key "<tab>")

;; Se usa la tecla Conrol con las teclas de cursor, xq otras combinaciones
;; como C-S-<down>, no funciona en Org-mode
(global-set-key (kbd "C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "C-<down>") 'enlarge-window)
(global-set-key (kbd "C-<up>") 'shrink-window)

(global-set-key (kbd "C-S-<down>") 'forward-paragraph)
(global-set-key (kbd "C-S-<up>") 'backward-paragraph)


(global-set-key (kbd "<f5>") 'other-window)
(global-set-key (kbd "<f6>") 'previous-buffer)
(global-set-key (kbd "<f7>") 'next-buffer)

;;(define-key global-map (kbd "C-c ;") 'iedit-mode)
(define-key global-map (kbd "C-;") 'iedit-mode)
(define-key global-map (kbd "C-c ke") 'TeX-next-error) ;; para visualizar el error generado al compilar el documento

;;-----------------------------------------------------------------------------------------------------------------------
;; predictive-mode
;;(add-to-list 'load-path "D:/home/.emacs.d/predictive")
;;(add-to-list 'load-path "D:/home/.emacs.d/predictive/html")
;;(add-to-list 'load-path "D:/home/.emacs.d/predictive/latex")
;;(add-to-list 'load-path "D:/home/.emacs.d/predictive/misc")
;;(add-to-list 'load-path "D:/home/.emacs.d/predictive/texinfo")
;;(require 'predictive)
(add-to-list 'load-path "D:/home/.emacs.d/predictive")
;;(add-to-list 'load-path "D:/home/.emacs.d/predictive/bits-and-pieces"                                           )
;;(add-to-list 'load-path "D:/home/.emacs.d/predictive/c")
;;(add-to-list 'load-path "D:/home/.emacs.d/predictive/elisp")
(add-to-list 'load-path "D:/home/.emacs.d/predictive/english")
;;(add-to-list 'load-path "D:/home/.emacs.d/predictive/f90")
(add-to-list 'load-path "D:/home/.emacs.d/predictive/html")
;;(add-to-list 'load-path "D:/home/.emacs.d/predictive/java")
(add-to-list 'load-path "D:/home/.emacs.d/predictive/latex")
;;(add-to-list 'load-path "D:/home/.emacs.d/predictive/papers")
(add-to-list 'load-path "D:/home/.emacs.d/predictive/texinfo")
(require 'predictive)


;; Encoding
(prefer-coding-system 'utf-8)

(defun duplicate-previous-line()
  (interactive)
  (insert "temp")  
  (move-beginning-of-line 1)
  (kill-line)
  (previous-line)
  (kill-line)
  (yank)
  ;;(open-line 1)
  (next-line 1)
  (move-beginning-of-line 1)
  (yank)
  )

(defun duplicate-line()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (open-line 1)
  (next-line 1)
  (yank)
  )

(defun get-current-word()
  (interactive)
  (setq v0001 (current-word))
  (insert (concat " " v0001))
  )

(defun get-current-thing()
  (interactive)
  (setq x0001 (thing-at-point 'word))
  (insert (concat " " x0001))
  )

(defun opcion-test()
  ;;(interactive)
  (setq car01 (interactive "c(C)hoose (A)n (O)ption"))
  ;;(read-char "(C)hoose (A)n (O)ption")
  )

(global-set-key (kbd "C-c p") 'duplicate-previous-line)
(global-set-key (kbd "C-c d") 'duplicate-line)
(global-set-key (kbd "C-c w") 'get-current-word)
(global-set-key (kbd "C-c t") 'get-current-word)
(global-set-key (kbd "C-c c") 'opcion-test)

;; Test
;; ---

;; para copiar archivos con dos ventanas dired y como destino de las
;; copia la otra ventana
(setq dired-dwim-target t)

;; Desactivar la creación de copias de respaldo de archivos
(setq make-backup-files nil)

;; activar column-number-mode
(column-number-mode)

;; Not break long lines
;;(set-default 'truncate-lines t)

;; --- Before install sr-speedbar.
;; sr-speedbar
(setq sr-speedbar-width 25) ; ancho
(setq sr-speedbar-right-side nil) ; put on left side
;; end sr-speedbar
;; -----------------------------------------------------------------

;; Para el preview
(setq preview-gs-command "c:/ProgramsFiles/gs/gs9.21/bin/gswin64c.exe")

;; Find
(setq find-program "\"C:/GnuWin32/bin/find.exe\"")
(setq grep-program "\"C:/GnuWin32/bin/grep.exe\"")

;; ack
(defvar ack-history nil
  "History for the `ack' command.")

(defun ack (command-args)
  (interactive
   (let ((ack-command "ack --nofilter --nogroup --with-filename "))
     (list (read-shell-command "Run ack (like this): "
                               ack-command
                               'ack-history))))
  (let ((compilation-disable-input t))
    (compilation-start (concat command-args " < " null-device)
                       'grep-mode)))

;; Alternatively, one can use M-x rgrep with ack thusly:
;;(grep-apply-setting 'grep-command "ack --with-filename --nofilter --nogroup ")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(ansi-term-color-vector
   [unspecified "#002b36" "#dc322f" "#859900" "#b58900" "#268bd2" "#6c71c4" "#268bd2" "#93a1a1"] t)
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#839496")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-enabled-themes (quote (deep-blue)))
 '(custom-safe-themes
   (quote
    ("6c0d748fb584ec4c8a0a1c05ce1ae8cde46faff5587e6de1cc59d3fc6618e164" "3ed2e1653742e5059e3d77af013ee90c1c1b776d83ec33e1a9ead556c19c694b" "8e7044bfad5a2e70dfc4671337a4f772ee1b41c5677b8318f17f046faa42b16b" "fe349b21bb978bb1f1f2db05bc87b2c6d02f1a7fe3f27584cd7b6fbf8e53391a" "a11043406c7c4233bfd66498e83600f4109c83420714a2bd0cd131f81cbbacea" "57d7e8b7b7e0a22dc07357f0c30d18b33ffcbb7bcd9013ab2c9f70748cfa4838" "05d009b7979e3887c917ef6796978d1c3bbe617e6aa791db38f05be713da0ba0" "b8c5adfc0230bd8e8d73450c2cd4044ad7ba1d24458e37b6dec65607fc392980" "ec0c9d1715065a594af90e19e596e737c7b2cdaa18eb1b71baf7ef696adbefb0" "2047464bf6781156ebdac9e38a17b97bd2594b39cfeaab561afffcbbe19314e2" "ed92c27d2d086496b232617213a4e4a28110bdc0730a9457edf74f81b782c5cf" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "72c530c9c8f3561b5ab3bf5cda948cd917de23f48d9825b7a781fe1c0d737f2f" "fb09acc5f09e521581487697c75b71414830b1b0a2405c16a9ece41b2ae64222" "d9e811d5a12dec79289c5bacaecd8ae393d168e9a92a659542c2a9bab6102041" "595099e6f4a036d71de7e1512656e9375dd72cf60ff69a5f6d14f0171f1de9c1" "11e5e95bd3964c7eda94d141e85ad08776fbdac15c99094f14a0531f31a156da" "9a3c51c59edfefd53e5de64c9da248c24b628d4e78cc808611abd15b3e58858f" "b4fd44f653c69fb95d3f34f071b223ae705bb691fb9abaf2ffca3351e92aa374" "a455366c5cdacebd8adaa99d50e37430b0170326e7640a688e9d9ad406e2edfd" "1a094b79734450a146b0c43afb6c669045d7a8a5c28bc0210aba28d36f85d86f" "4c8372c68b3eab14516b6ab8233de2f9e0ecac01aaa859e547f902d27310c0c3" "cb39485fd94dabefc5f2b729b963cbd0bac9461000c57eae454131ed4954a8ac" "011d4421eedbf1a871d1a1b3a4d61f4d0a2be516d4c94e111dfbdc121da0b043" "7bef2d39bac784626f1635bd83693fae091f04ccac6b362e0405abf16a32230c" "84fa3d838aec400453d086913cd373ce84c8b85623451331ec4cf5f68ed878c7" "8543b328ed10bc7c16a8a35c523699befac0de00753824d7e90148bca583f986" "d9dab332207600e49400d798ed05f38372ec32132b3f7d2ba697e59088021555" "5a7830712d709a4fc128a7998b7fa963f37e960fd2e8aa75c76f692b36e6cf3c" "0c3b1358ea01895e56d1c0193f72559449462e5952bded28c81a8e09b53f103f" "986e7e8e428decd5df9e8548a3f3b42afc8176ce6171e69658ae083f3c06211c" "f869a5d068a371532c82027cdf1feefdc5768757c78c48a7e0177e90651503ad" "4bf5c18667c48f2979ead0f0bdaaa12c2b52014a6abaa38558a207a65caeb8ad" "df21cdadd3f0648e3106338649d9fea510121807c907e2fd15565dde6409d6e9" "cbd8e65d2452dfaed789f79c92d230aa8bdf413601b261dbb1291fb88605110c" "5b8eccff13d79fc9b26c544ee20e1b0c499587d6c4bfc38cabe34beaf2c2fc77" "250268d5c0b4877cc2b7c439687f8145a2c85a48981f7070a72c7f47a2d2dc13" "722e1cd0dad601ec6567c32520126e42a8031cd72e05d2221ff511b58545b108" "cea3ec09c821b7eaf235882e6555c3ffa2fd23de92459751e18f26ad035d2142" "aded4ec996e438a5e002439d58f09610b330bbc18f580c83ebaba026bbef6c82" "87d46d0ad89557c616d04bef34afd191234992c4eb955ff3c60c6aa3afc2e5cc" "527df6ab42b54d2e5f4eec8b091bd79b2fa9a1da38f5addd297d1c91aa19b616" "2a998a3b66a0a6068bcb8b53cd3b519d230dd1527b07232e54c8b9d84061d48d" "4a91a64af7ff1182ed04f7453bb5a4b0c3d82148d27db699df89a5f1d449e2a4" "3f67aee8f8d8eedad7f547a346803be4cc47c420602e19d88bdcccc66dba033b" "93268bf5365f22c685550a3cbb8c687a1211e827edc76ce7be3c4bd764054bad" "73ad471d5ae9355a7fa28675014ae45a0589c14492f52c32a4e9b393fcc333fd" "9be1d34d961a40d94ef94d0d08a364c3d27201f3c98c9d38e36f10588469ea57" "dd4628d6c2d1f84ad7908c859797b24cc6239dfe7d71b3363ccdd2b88963f336" "9c4acf7b5801f25501f0db26ac3eee3dc263ed51afd01f9dcfda706a15234733" "85d609b07346d3220e7da1e0b87f66d11b2eeddad945cac775e80d2c1adb0066" "5a39d2a29906ab273f7900a2ae843e9aa29ed5d205873e1199af4c9ec921aaab" "a62f0662e6aa7b05d0b4493a8e245ab31492765561b08192df61c9d1c7e1ddee" "04790c9929eacf32d508b84d34e80ad2ee233f13f17767190531b8b350b9ef22" "f5f3a6fb685fe5e1587bafd07db3bf25a0655f3ddc579ed9d331b6b19827ea46" "542e6fee85eea8e47243a5647358c344111aa9c04510394720a3108803c8ddd1" "ffac21ab88a0f4603969a24b96993bd73a13fe0989db7ed76d94c305891fad64" "45a8b89e995faa5c69aa79920acff5d7cb14978fbf140cdd53621b09d782edcf" "41eb3fe4c6b80c7ad156a8c52e9dd6093e8856c7bbf2b92cc3a4108ceb385087" "3e34e9bf818cf6301fcabae2005bba8e61b1caba97d95509c8da78cff5f2ec8e" "ccde32eaf485eb7579412cd756d10b0f20f89bff07696972d7ee46cb2e10b89d" "cabc32838ccceea97404f6fcb7ce791c6e38491fd19baa0fcfb336dcc5f6e23c" "1d079355c721b517fdc9891f0fda927fe3f87288f2e6cc3b8566655a64ca5453" "760ce657e710a77bcf6df51d97e51aae2ee7db1fba21bbad07aab0fa0f42f834" "34ed3e2fa4a1cb2ce7400c7f1a6c8f12931d8021435bad841fdc1192bd1cc7da" "b3bcf1b12ef2a7606c7697d71b934ca0bdd495d52f901e73ce008c4c9825a3aa" "596a1db81357b93bd1ae17bed428d0021d12f30cda7bbb31ac44e115039171ae" "840db7f67ce92c39deb38f38fbc5a990b8f89b0f47b77b96d98e4bf400ee590a" "159aab698b9d3fb03b495ce3af2d298f4c6dfdf21b53c27cd7f472ee5a1a1de3" "92192ea8f0bf04421f5b245d906701abaa7bb3b0d2b3b14fca2ee5ebb1da38d8" "25c242b3c808f38b0389879b9cba325fb1fa81a0a5e61ac7cae8da9a32e2811b" "ad16a1bf1fd86bfbedae4b32c269b19f8d20d416bd52a87cd50e355bf13c2f23" "d83e34e28680f2ed99fe50fea79f441ca3fddd90167a72b796455e791c90dc49" "100eeb65d336e3d8f419c0f09170f9fd30f688849c5e60a801a1e6addd8216cb" "fee4e306d9070a55dce4d8e9d92d28bd9efe92625d2ba9d4d654fc9cd8113b7f" "50d07ab55e2b5322b2a8b13bc15ddf76d7f5985268833762c500a90e2a09e7aa" "8be07a2c1b3a7300860c7a65c0ad148be6d127671be04d3d2120f1ac541ac103" "3de3f36a398d2c8a4796360bfce1fa515292e9f76b655bb9a377289a6a80a132" "3380a2766cf0590d50d6366c5a91e976bdc3c413df963a0ab9952314b4577299" "6145e62774a589c074a31a05dfa5efdf8789cf869104e905956f0cbd7eda9d0e" "6271fc9740379f8e2722f1510d481c1df1fcc43e48fa6641a5c19e954c21cc8f" "4feee83c4fbbe8b827650d0f9af4ba7da903a5d117d849a3ccee88262805f40d" "6daa09c8c2c68de3ff1b83694115231faa7e650fdbb668bc76275f0f2ce2a437" "12670281275ea7c1b42d0a548a584e23b9c4e1d2dabb747fd5e2d692bcd0d39b" "36746ad57649893434c443567cb3831828df33232a7790d232df6f5908263692" "b8929cff63ffc759e436b0f0575d15a8ad7658932f4b2c99415f3dde09b32e97" "aea30125ef2e48831f46695418677b9d676c3babf43959c8e978c0ad672a7329" "ffe80c88e3129b2cddadaaf78263a7f896d833a77c96349052ad5b7753c0c5a5" "d96587ec2c7bf278269b8ec2b800c7d9af9e22d816827639b332b0e613314dfd" "52741e091463c2217af9327e2b2d74d0df861ecc3ad6131b6cbcb8d76b7a4d3d" "fc7fd2530b82a722ceb5b211f9e732d15ad41d5306c011253a0ba43aaf93dccc" "1263771faf6967879c3ab8b577c6c31020222ac6d3bac31f331a74275385a452" "e1498b2416922aa561076edc5c9b0ad7b34d8ff849f335c13364c8f4276904f0" "78c1c89192e172436dbf892bd90562bc89e2cc3811b5f9506226e735a953a9c6" "50b64810ed1c36dfb72d74a61ae08e5869edc554102f20e078b21f84209c08d1" "16dd114a84d0aeccc5ad6fd64752a11ea2e841e3853234f19dc02a7b91f5d661" "eae831de756bb480240479794e85f1da0789c6f2f7746e5cc999370bbc8d9c8a" "c968804189e0fc963c641f5c9ad64bca431d41af2fb7e1d01a2a6666376f819c" "85e6bb2425cbfeed2f2b367246ad11a62fb0f6d525c157038a0d0eaaabc1bfee" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "ef04dd1e33f7cbd5aa3187981b18652b8d5ac9e680997b45dc5d00443e6a46e3" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "f5b591870422cd28da334552aae915cdcae3edfcfedb6653a9f42ed84bbec69f" default)))
 '(fci-rule-color "#3C3D37")
 '(highlight-changes-colors (quote ("#FD5FF0" "#AE81FF")))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#002b36" 0.25)
    (quote
     ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#93a1a1")
 '(highlight-tail-colors
   (quote
    (("#3C3D37" . 0)
     ("#679A01" . 20)
     ("#4BBEAE" . 30)
     ("#1DB4D0" . 50)
     ("#9A8F21" . 60)
     ("#A75B00" . 70)
     ("#F309DF" . 85)
     ("#3C3D37" . 100))))
 '(hl-bg-colors
   (quote
    ("#7B6000" "#8B2C02" "#990A1B" "#93115C" "#3F4D91" "#00629D" "#00736F" "#546E00")))
 '(hl-fg-colors
   (quote
    ("#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36")))
 '(ido-enable-flex-matching t)
 '(ido-mode (quote both) nil (ido))
 '(inhibit-startup-screen nil)
 '(magit-diff-use-overlays nil)
 '(menu-bar-mode t)
 '(package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("melpa" . "http://stable.melpa.org/packages/"))))
 '(package-selected-packages
   (quote
    (multi-term auctex color-theme-modern color-theme-sanityinc-solarized color-theme-sanityinc-tomorrow company-quickhelp company-shell company-web yasnippet company sr-speedbar darktooth-theme base16-theme birds-of-paradise-plus-theme monokai-theme solarized-theme)))
 '(pos-tip-background-color "#A6E22E" t)
 '(pos-tip-foreground-color "#272822" t)
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#073642" 0.2))
 '(term-default-bg-color "#002b36")
 '(term-default-fg-color "#839496")
 '(tool-bar-mode nil)
 '(uniquify-buffer-name-style (quote post-forward) nil (uniquify))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#F92672")
     (40 . "#CF4F1F")
     (60 . "#C26C0F")
     (80 . "#E6DB74")
     (100 . "#AB8C00")
     (120 . "#A18F00")
     (140 . "#989200")
     (160 . "#8E9500")
     (180 . "#A6E22E")
     (200 . "#729A1E")
     (220 . "#609C3C")
     (240 . "#4E9D5B")
     (260 . "#3C9F79")
     (280 . "#A1EFE4")
     (300 . "#299BA6")
     (320 . "#2896B5")
     (340 . "#2790C3")
     (360 . "#66D9EF"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (unspecified "#272822" "#3C3D37" "#F70057" "#F92672" "#86C30D" "#A6E22E" "#BEB244" "#E6DB74" "#40CAE4" "#66D9EF" "#FB35EA" "#FD5FF0" "#74DBCD" "#A1EFE4" "#F8F8F2" "#F8F8F0")))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 118 :width normal :foundry "outline" :family "Lucida Console")))))
