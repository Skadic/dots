;$DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Etienne Palanga"
      user-mail-address "e.palanga@disroot.org")

(setq doom-font (font-spec :family "FiraCode Nerd Font Mono" :size 14 :weight 'normal)
      doom-variable-pitch-font (font-spec :family "Noto Sans" :size 14))

(setq doom-theme 'doom-dracula)

(setq display-line-numbers-type t)

(setq org-directory "~/MEGAsync/org/")

(setq calendar-week-start-day 1
          calendar-day-name-array ["日 " "月 " "火 " "水 "
                                   "木 " "金 " "土 "]
          calendar-month-name-array ["1月" "2月" "3月" "4月"
                                     "5月" "6月" "7月" "8月"
                                     "9月" "10月" "11月" "12月"])

(after! lsp-rust
  (setq lsp-rust-server 'rust-analyzer)
  (setq lsp-rust-analyzer-server-display-inlay-hints t))

(load! "config/docstr.el")

(after! eglot
  :config
  (add-to-list 'eglot-server-programs '(haxe-mode . ("node" "~/Stuff/haxe-language-server/bin/server.js")))
  (add-hook 'haxe-mode-hook 'eglot-ensure)
  (set-eglot-client! 'haxe-mode' '("node" "~/Stuff/haxe-language-server/bin/server.js")))

(after! projectile
  (setq projectile-project-search-path '("~/Programming/Rust" "~/Documents/Uni/Arbeit")))
