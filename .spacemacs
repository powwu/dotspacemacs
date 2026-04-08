;; -*- mode: emacs-lisp; lexical-binding: t -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs

   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused

   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t

   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. "~/.mycontribs/")
   dotspacemacs-configuration-layer-path '()

   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(rust
     html octave php go windows-scripts markdown csv typescript
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press `SPC f e R' (Vim style) or
     ;; `M-m f e R' (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     ;; auto-completion
     ;; better-defaults
     emacs-lisp
     ;; git
     helm
     ;; lsp
     markdown multiple-cursors
     ;; org
     ;; (shell :variables
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)
     ;; spell-checking
     syntax-checking
     ;; version-control
     treemacs)


   ;; List of additional packages that will be installed without being wrapped
   ;; in a layer (generally the packages are installed only and should still be
   ;; loaded using load/require/use-package in the user-config section below in
   ;; this file). If you need some configuration for these packages, then
   ;; consider creating a layer. You can also put the configuration in
   ;; `dotspacemacs/user-config'. To use a local version of a package, use the
   ;; `:location' property: '(your-package :location "~/path/to/your-package/")
   ;; Also include the dependencies as they will not be resolved automatically.
   dotspacemacs-additional-packages
   '(ewal-spacemacs-themes
     ewal
     nix-mode
     nix-buffer
     nix-sandbox
     scad-mode
     mistty
     helm
     v-mode
     kotlin-mode
     quelpa
     quelpa-use-package)

   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(ewal-spacemacs-modern-theme phpcbf)

   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil then enable support for the portable dumper. You'll need to
   ;; compile Emacs 27 from source following the instructions in file
   ;; EXPERIMENTAL.org at to root of the git repository.
   ;;
   ;; WARNING: pdumper does not work with Native Compilation, so it's disabled
   ;; regardless of the following setting when native compilation is in effect.
   ;;
   ;; (default nil)
   dotspacemacs-enable-emacs-pdumper nil

   ;; Name of executable file pointing to emacs 27+. This executable must be
   ;; in your PATH.
   ;; (default "emacs")
   dotspacemacs-emacs-pdumper-executable-file "emacs"

   ;; Name of the Spacemacs dump file. This is the file will be created by the
   ;; portable dumper in the cache directory under dumps sub-directory.
   ;; To load it when starting Emacs add the parameter `--dump-file'
   ;; when invoking Emacs 27.1 executable on the command line, for instance:
   ;;   ./emacs --dump-file=$HOME/.emacs.d/.cache/dumps/spacemacs-27.1.pdmp
   ;; (default (format "spacemacs-%s.pdmp" emacs-version))
   dotspacemacs-emacs-dumper-dump-file (format "spacemacs-%s.pdmp" emacs-version)

   ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t

   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; (default 5)
   dotspacemacs-elpa-timeout 5

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ;; Set `read-process-output-max' when startup finishes.
   ;; This defines how much data is read from a foreign process.
   ;; Setting this >= 1 MB should increase performance for lsp servers
   ;; in emacs 27.
   ;; (default (* 1024 1024))
   dotspacemacs-read-process-output-max (* 1024 1024)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. Spacelpa is currently in
   ;; experimental state please use only for testing purposes.
   ;; (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default t)
   dotspacemacs-verify-spacelpa-archives t

   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil

   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default 'emacs-version)
   dotspacemacs-elpa-subdirectory 'emacs-version

   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim

   ;; If non-nil show the version string in the Spacemacs buffer. It will
   ;; appear as (spacemacs version)@(emacs version)
   ;; (default t)
   dotspacemacs-startup-buffer-show-version t

   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official

   ;; Scale factor controls the scaling (size) of the startup banner. Default
   ;; value is `auto' for scaling the logo automatically to fit all buffer
   ;; contents, to a maximum of the full image height and a minimum of 3 line
   ;; heights. If set to a number (int or float) it is used as a constant
   ;; scaling factor for the default logo size.
   dotspacemacs-startup-banner-scale 'auto

   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `recents-by-project' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   ;; The exceptional case is `recents-by-project', where list-type must be a
   ;; pair of numbers, e.g. `(recents-by-project . (7 .  5))', where the first
   ;; number is the project limit and the second the limit on the recent files
   ;; within a project.
   dotspacemacs-startup-lists '((recents . 5) (projects . 7))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Show numbers before the startup list lines. (default t)
   dotspacemacs-show-startup-list-numbers t

   ;; The minimum delay in seconds between number key presses. (default 0.4)
   dotspacemacs-startup-buffer-multi-digit-delay 0.4

   ;; If non-nil, show file icons for entries and headings on Spacemacs home buffer.
   ;; This has no effect in terminal or if "all-the-icons" package or the font
   ;; is not installed. (default nil)
   dotspacemacs-startup-buffer-show-icons nil

   ;; Default major mode for a new empty buffer. Possible values are mode
   ;; names such as `text-mode'; and `nil' to use Fundamental mode.
   ;; (default `text-mode')
   dotspacemacs-new-empty-buffer-major-mode 'text-mode

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ;; If non-nil, *scratch* buffer will be persistent. Things you write down in
   ;; *scratch* buffer will be saved and restored automatically.
   dotspacemacs-scratch-buffer-persistent nil

   ;; If non-nil, `kill-buffer' on *scratch* buffer
   ;; will bury it instead of killing.
   dotspacemacs-scratch-buffer-unkillable nil

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(ewal-spacemacs-modern spacemacs-dark spacemacs-light)

   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
   ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
   ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
   ;; refer to the DOCUMENTATION.org for more info on how to create your own
   ;; spaceline theme. Value can be a symbol or list with additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(spacemacs :separator wave :separator-scale 1.5)

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font or prioritized list of fonts. The `:size' can be specified as
   ;; a non-negative integer (pixel size), or a floating-point (point size).
   ;; Point size is recommended, because it's device independent. (default 10.0)
   dotspacemacs-default-font '("Victor Mono" :size 12.0 :weight normal :width normal)

   ;; The leader key (default "SPC")
   dotspacemacs-leader-key "SPC"

   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"


   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"

   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"

   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","

   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m" for terminal mode, "<M-return>" for GUI mode).
   ;; Thus M-RET should work as leader key in both GUI and terminal modes.
   ;; C-M-m also should work in terminal mode, but not in GUI mode.
   dotspacemacs-major-mode-emacs-leader-key
   (if window-system
       "<M-return>"
     "C-M-m")

   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil

   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"

   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil

   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil

   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil

   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1

   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache

   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5

   ;; If non-nil, the paste transient-state is enabled. While enabled, after you
   ;; paste something, pressing `C-j' and `C-k' several times cycles through the
   ;; elements in the `kill-ring'. (default nil)
   dotspacemacs-enable-paste-transient-state nil

   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4

   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom

   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose t

   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t

   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil

   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil

   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default t) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup t

   ;; If non-nil the frame is undecorated when Emacs starts up. Combine this
   ;; variable with `dotspacemacs-maximized-at-startup' to obtain fullscreen
   ;; without external boxes. Also disables the internal border. (default nil)
   dotspacemacs-undecorated-at-startup t

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes the
   ;; transparency level of a frame background when it's active or selected. Transparency
   ;; can be toggled through `toggle-background-transparency'. (default 90)
   dotspacemacs-background-transparency 90

   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t

   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t

   ;; If non-nil unicode symbols are displayed in the mode line.
   ;; If you use Emacs as a daemon and wants unicode characters only in GUI set
   ;; the value to quoted `display-graphic-p'. (default t)
   dotspacemacs-mode-line-unicode-symbols t

   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t

   ;; Show the scroll bar while scrolling. The auto hide time can be configured
   ;; by setting this variable to a number. (default t) := <=
   dotspacemacs-scroll-bar-while-scrolling nil

   ;; Control line numbers activation.
   ;; If set to `t', `relative' or `visual' then line numbers are enabled in all
   ;; `prog-mode' and `text-mode' derivatives. If set to `relative', line
   ;; numbers are relative. If set to `visual', line numbers are also relative,
   ;; but only visual lines are counted. For example, folded lines will not be
   ;; counted and wrapped lines are counted as multiple lines.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :visual nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; When used in a plist, `visual' takes precedence over `relative'.
   ;; (default nil)
   dotspacemacs-line-numbers nil

   ;; Code folding method. Possible values are `evil', `origami' and `vimish'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil

   ;; If non-nil and `dotspacemacs-activate-smartparens-mode' is also non-nil,
   ;; `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil

   ;; If non-nil smartparens-mode will be enabled in programming modes.
   ;; (default t)
   dotspacemacs-activate-smartparens-mode t

   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc...
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil

   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all

   ;; If non-nil, start an Emacs server if one is not already running.
   ;; (default nil)
   dotspacemacs-enable-server nil

   ;; Set the emacs server socket location.
   ;; If nil, uses whatever the Emacs default is, otherwise a directory path
   ;; like \"~/.emacs.d/server\". It has no effect if
   ;; `dotspacemacs-enable-server' is nil.
   ;; (default nil)
   dotspacemacs-server-socket-dir nil

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")

   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; If nil then Spacemacs uses default `frame-title-format' to avoid
   ;; performance issues, instead of calculating the frame title by
   ;; `spacemacs/title-prepare' all the time.
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%I@%S"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Color highlight trailing whitespace in all prog-mode and text-mode derived
   ;; modes such as c++-mode, python-mode, emacs-lisp, html-mode, rst-mode etc.
   ;; (default t)
   dotspacemacs-show-trailing-whitespace t

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil

   ;; If non-nil activate `clean-aindent-mode' which tries to correct
   ;; virtual indentation of simple modes. This can interfere with mode specific
   ;; indent handling like has been reported for `go-mode'.
   ;; If it does deactivate it here.
   ;; (default t)
   dotspacemacs-use-clean-aindent-mode t

   ;; Accept SPC as y for prompts if non-nil. (default nil)
   dotspacemacs-use-SPC-as-y nil

   ;; If non-nil shift your number row to match the entered keyboard layout
   ;; (only in insert state). Currently supported keyboard layouts are:
   ;; `qwerty-us', `qwertz-de' and `querty-ca-fr'.
   ;; New layouts can be added in `spacemacs-editing' layer.
   ;; (default nil)
   dotspacemacs-swap-number-row nil

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil

   ;; If nil the home buffer shows the full path of agenda items
   ;; and todos. If non-nil only the file name is shown.
   dotspacemacs-home-shorten-agenda-source nil

   ;; If non-nil then byte-compile some of Spacemacs files.
   dotspacemacs-byte-compile nil))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env))

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."
  ;; (setq ewm-output-config
  ;;       '(("HDMI-A-1" :width 1920 :height 1080 :scale 1.0 :refresh 144)
  ;;         ("DP-3" :width 1920 :height 1080 :scale 1.4)))

  ;; add window transparency
  (add-to-list 'default-frame-alist '(alpha-background . 80))


  (use-package
    ewm
    :custom
    (ewm-output-config
     '(("HDMI-A-1" :width 1920 :height 1080 :scale 1.0 :refresh 144 :x 0 :y 0)
       ("DP-3" :width 1920 :height 1080 :scale 1.4 :x 1920 :y 0)))
    :bind
    (:map
     ewm-mode-map
     ;; Layers (Spacemacs workspaces)
     ("s-1" . spacemacs/persp-switch-to-1)
     ("s-2" . spacemacs/persp-switch-to-2)
     ("s-3" . spacemacs/persp-switch-to-3)
     ("s-4" . spacemacs/persp-switch-to-4)
     ("s-5" . spacemacs/persp-switch-to-5)
     ("s-6" . spacemacs/persp-switch-to-6)
     ("s-7" . spacemacs/persp-switch-to-7)
     ("s-8" . spacemacs/persp-switch-to-8)
     ("s-9" . spacemacs/persp-switch-to-9)
     ("s-0" . spacemacs/persp-switch-to-0)
     ("M-s-<return>" .
      (lambda ()
        (interactive)
        (persp-switch "Mail")))

     ;; Applications
     ("<PowerOff>" .
      (lambda ()
        (interactive)
        (runcmd "archlinux-logout")))
     ("s-\\" .
      (lambda ()
        (interactive)
        (runcmd "firefox")))
     ("s-|" .
      (lambda ()
        (interactive)
        (runcmd "vesktop & Telegram")))
     ("s-W" .
      (lambda ()
        (interactive)
        (runcmd "~/Wallpapers/bin/wallpaper ~/Wallpapers/wallpapers/favorites")))
     ("s-<tab>" .
      (lambda ()
        (interactive)
        (runcmd "hyprshot -m region -o /home/james/Screenshots/ ; sleep 2")))
     ("<Print>" .
      (lambda ()
        (interactive)
        (runcmd "hyprshot -m region -o /home/james/Screenshots/ ; sleep 2")))
     ("s-SPC" . spacemacs-cmds)
     ("s-x" . closeapp)
     ("s-<return>" . terminal)))




  (add-to-list 'ewm-intercept-prefixes '("s-1" :fullscreen))
  (add-to-list 'ewm-intercept-prefixes '("s-2" :fullscreen))
  (add-to-list 'ewm-intercept-prefixes '("s-3" :fullscreen))
  (add-to-list 'ewm-intercept-prefixes '("s-4" :fullscreen))
  (add-to-list 'ewm-intercept-prefixes '("s-5" :fullscreen))
  (add-to-list 'ewm-intercept-prefixes '("s-6" :fullscreen))
  (add-to-list 'ewm-intercept-prefixes '("s-7" :fullscreen))
  (add-to-list 'ewm-intercept-prefixes '("s-8" :fullscreen))
  (add-to-list 'ewm-intercept-prefixes '("s-9" :fullscreen))
  (add-to-list 'ewm-intercept-prefixes '("s-0" :fullscreen))
  (add-to-list 'ewm-intercept-prefixes '("M-s-<return>" :fullscreen))

  (add-to-list 'ewm-intercept-prefixes '("s-x" :fullscreen))
  (add-to-list 'ewm-intercept-prefixes '("<PowerOff>" :fullscreen))
  (add-to-list 'ewm-intercept-prefixes '("<Print>" :fullscreen))
  (add-to-list 'ewm-intercept-prefixes '("s-<tab>" :fullscreen))
  )


(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump.")


(defun dotspacemacs/user-config ()
  "Configuration for user code:
This function is called at the very end of Spacemacs startup, after layer
configuration.
Put your configuration code here, except for variables that should be set
before packages are loaded."
  ;; (require 'exwm)
  ;; (require 'exwm-config)
  ;; (exwm-config-example)
  ;; (add-hook 'prog-mode-hook)

  ;; Split horizontally always
  (setq split-height-threshold nil)
  (setq split-width-threshold 0)

  ;; focus follows mouse
  (ewm-set-focus-follows-mouse t)
  ;; (setq mouse-autoselect-window)
  ;; (setq focus-follows-mouse t)
  ;; (setq ewm-focus-follows-mouse t)

  ;; make spacemacs-buffer-mode use normal-state for custom keybinds
  (add-hook
   'spacemacs-buffer-mode-hook
   (lambda () (run-with-timer 0.1 nil (lambda () (evil-normal-state)))))

  ;; make dired-mode use normal-state for custom keybinds
  (add-hook
   'dired-mode-hook
   (lambda () (run-with-timer 0.1 nil (lambda () (evil-normal-state)))))

  (defun closeapp ()
    (interactive)
    (let* ((persp (get-current-persp))
           (frame (selected-frame))
           (win (frame-selected-window frame))
           (buf (and win (window-buffer win))))

      (when (and persp win buf)
        (let* ((wins-in-persp
                (cl-remove-if-not
                 (lambda (w)
                   (memq (window-buffer w) (persp-buffers persp)))
                 (get-buffer-window-list buf nil t)))

               (in-other-persps
                (persp-buffer-in-other-p buf persp)))

          (cond
           (in-other-persps
            (persp-remove-buffer buf persp)
            (delete-window win))

           ((= (length wins-in-persp) 1)
            (kill-buffer buf))

           (t
            (delete-window win)))))))

  (defun trellostart ()
    (interactive)
    (run-with-timer
     4 nil
     (lambda ()
       (other-frame 1)
       (spacemacs/window-split-double-columns)
       (runcmd
        "alacritty -e sh -c 'until ping -c1 9.9.9.9 &>/dev/null; do sleep 0.1; done && echo -e \"board select 6847593d5d7da7825d8f8cb6\nlist cards $(echo -e \"board select 6847593d5d7da7825d8f8cb6\nlist list\" | 3llo 2> /dev/null | grep \"#1\" | head -n 1 | sed \"s/\x1b\\[[0-9;]*m//g\" | cut -c 2-25)\" | 3llo 2> /dev/null | grep -E \"#[0-9]+\"; cat'")
       (run-with-timer
        1 nil
        (lambda ()
          (other-window 1)
          (runcmd
           "alacritty -e sh -c 'until ping -c1 9.9.9.9 &>/dev/null; do sleep 0.1; done && echo -e \"board select 65fe4fa2af0a6ba78be2966b\nlist cards 65fe4fa2af0a6ba78be29672\nlist cards 65fe4fa2af0a6ba78be29673\" | 3llo 2> /dev/null | grep -E \"#[0-9]+\"; cat'"))))))


  (defun terminal ()
    (interactive)
    ;; (split-window-sensibly)
    (runcmd "alacritty"))

  (defun runcmd (cmd)
    (interactive)
    (start-process-shell-command cmd nil cmd))

  (defun firefox ()
    (lambda ()
      (interactive)
      (runcmd "firefox")))

  ;; Run on startup
  (defun runstartup ()
    (interactive)

    ;; Email
    (runcmd "thunderbird")

    ;; Notification daemon
    (runcmd "mako")

    ;; Auth agent
    (runcmd "lxpolkit")

    ;; Bottom bar
    (runcmd "waybar")

    ;; Sunshine
    (runcmd "systemctl --user start sunshine")

    ;; Trello
    (trellostart)

    ;; Wallpaper
    (runcmd "swww-daemon")
    (runcmd "~/Wallpapers/bin/wallpaper ~/Wallpapers/wallpapers/favorites"))

  (runstartup)

  ;; moverule
  (defvar-local persp-moved nil)
  (defun moverule (frame regex persp-name switch)
    ;; Set vars
    (let* ((persp
            (or (persp-get-by-name persp-name)
                (persp-add-new persp-name)))
           (current (get-current-persp)) ;; <-- capture BEFORE switching
           (win (frame-selected-window frame))
           (buf (and win (window-buffer win)))
           (name (and buf (buffer-name buf))))
      (when
          (and
           name
           (not (buffer-local-value 'persp-moved buf)) ;; flag to prevent aggressive re-moving
           (string-match-p regex name))
        (message "Moving %S to perspective %S" name persp-name)
        (with-current-buffer buf
          (setq persp-moved t))
        (persp-add-buffer buf persp)
        (persp-switch persp-name)
        (spacemacs/goto-buffer-workspace buf) ;; focus newly added buffer
        (spacemacs/jump-to-last-layout)
        (cond
         ((eq current nil) ;; if originally in layout 1 (perspectiveless)
          (previous-buffer))
         ((not (eq current persp)) ;; if in perspective that isn't destination
          (persp-remove-buffer buf current)))
        (cond
         ((eq switch t)
          (persp-switch persp-name))))))

  (defun ensure-persp-buffers-visible ()
    (let ((persp (get-current-persp)))
      (when persp ;; skip default (nil)
        (let* ((scratch-name (format "*scratch-%s*" (persp-name persp)))
               (scratch (get-buffer scratch-name))
               (buffers (persp-buffers persp)))

          (if (null buffers)
              ;; --- EMPTY PERSPECTIVE → FORCE SCRATCH ---
              (let ((scratch (get-buffer-create scratch-name)))
                (with-current-buffer scratch
                  (unless (eq major-mode 'lisp-interaction-mode)
                    (lisp-interaction-mode)))

                (dolist (win (window-list))
                  (set-window-buffer win scratch))

                (persp-add-buffer scratch persp))

            ;; --- NON-EMPTY → NORMAL LOGIC ---

            ;; --- REMOVE SCRATCH IF REAL BUFFERS EXIST ---
            (when (and scratch
                       (> (length buffers) 1)) ;; something else exists
              (setq buffers (delq scratch buffers)))

            ;; --- NORMAL LOGIC ---
            (let* ((wins (window-list))
                   (visible-bufs (mapcar #'window-buffer wins)))

              ;; REMOVE ONLY WINDOWS THAT ARE NOW INVALID
              (dolist (win wins)
                (let ((buf (window-buffer win)))
                  (unless (or
                           (memq buf buffers)
                           (window-minibuffer-p win)
                           (string-prefix-p "*helm" (buffer-name buf)))
                    (if buffers
                        (delete-window win)))))

              ;; recompute
              (setq wins (window-list))
              (setq visible-bufs (mapcar #'window-buffer wins))

              ;; ADD MISSING BUFFERS
              (dolist (buf buffers)
                (unless (memq buf visible-bufs)
                  (let ((new-win (split-window-sensibly)))
                    (when new-win
                      (set-window-buffer new-win buf)
                      (set-window-parameter new-win 'managed-split t)
                      (push buf visible-bufs)))))))))))
  (add-hook
   'window-buffer-change-functions
   (lambda (&rest _) (ensure-persp-buffers-visible)))

  (add-hook 'window-configuration-change-hook #'ensure-persp-buffers-visible)

  (add-hook 'persp-switch-hook #'ensure-persp-buffers-visible)

  (add-hook 'kill-buffer-hook #'ensure-persp-buffers-visible)

  ;; Initialize layouts
  (with-eval-after-load 'persp-mode
    (run-with-idle-timer
     0 nil
     (lambda ()
       (dolist (name
                '("Web"
                  "Chat"
                  "Tech"
                  "Music"
                  "Game"
                  "Seven"
                  "Eight"
                  "Nine"
                  "Zero"
                  "Mail"))
         (persp-switch name))

       ;; Default to layout 1 (perspectiveless)
       (spacemacs/persp-switch-to-1)
       ;; (spacemacs/new-empty-buffer)
       )))


  ;; Window rules
  (defun windowrules (frame)
    (moverule frame "Firefox" "Web" t)
    (moverule frame "Telegram" "Chat" t)
    (moverule frame "Discord" "Chat" t)
    (moverule frame "Spotify" "Music" t)
    (moverule frame "Lutris" "Game" t)
    (moverule frame "Thunderbird" "Mail" nil))

  (defvar-local buffer-split nil)
  (defvar my-buffer-creation-times (make-hash-table :test 'eq))
  ;; Track buffer creation time
  (defun track-buffer-creation ()
    (message "tracking works")
    (puthash (current-buffer) (float-time) my-buffer-creation-times))
  ;; (add-hook 'after-change-major-mode-hook #'track-buffer-creation)
  (defun splitnewbuffers (frame)
    (message "split called")
    (let* ((win (frame-selected-window frame))
           (buf (and win (window-buffer win)))
           (name (and buf (buffer-name buf)))
           (created (gethash buf my-buffer-creation-times)))

      (when (and win
                 buf

                 ;; only EWM windows (adjust this predicate if needed)
                 (string-match-p "ewm" name)

                 ;; prevent re-splitting
                 (not (buffer-local-value 'buffer-split buf))

                 ;; only if created within last 1 second
                 created (< (- (float-time) created) 1.0))

        (with-current-buffer buf
          (setq buffer-split t))

        ;; store old buffer BEFORE splitting
        (let ((old-buf (window-buffer win)))
          (let ((new-win (split-window-sensibly win)))
            (when new-win
              ;; restore old buffer in original window
              (set-window-buffer win old-buf)
              (message "split work")
              (previous-buffer)
              ;; show new buffer in new window
              (set-window-buffer new-win buf)))))))

  ;; Run window rules on buffer change
  (add-hook 'window-buffer-change-functions #'windowrules)
  ;; (add-hook 'window-buffer-change-functions #'splitnewbuffers) ;; temporarily disabled while I figure out what kind of logic I want

  ;; scad-mode fixes
  (require 'scad-mode)
  (add-hook
   'scad-preview-mode-hook
   (lambda () (evil-make-intercept-map scad-preview-mode-map)))


  ;; format go code on save
  (use-package
    go-mode
    :config
    (when (executable-find "gofmt")
      (setq gofmt-command "gofmt"))
    (defun powwu/go-mode-hook ()
      (add-hook 'before-save-hook #'gofmt-before-save nil 'local))
    (add-hook 'go-mode-hook #'powwu/go-mode-hook))

  (defun insert-snippet ()
    "Insert snippet interactively from ~/.snippets" ; Doc string.
    (interactive)

    (cond
     ((eq major-mode 'go-mode)
      (setq filename
            (completing-read "Snippet: " (f-files "~/.snippets/go/" nil t))))

     ((eq major-mode 'elisp-lisp-mode)
      (setq filename
            (completing-read "Snippet: " (f-files "~/.snippets/elisp/" nil t))))

     ((eq major-mode 'c-mode)
      (setq filename
            (completing-read
             "Snippet: " (f-files "~/.snippets/clike/c/" nil t))))

     ((eq major-mode 'c++-mode)
      (setq filename
            (completing-read "Snippet: " (f-files "~/.snippets/clike/" nil t))))

     ((eq major-mode 'nix-mode)
      (setq filename
            (completing-read "Snippet: " (f-files "~/.snippets/nix/" nil t))))

     ((eq major-mode 'v-mode)
      (setq filename
            (completing-read "Snippet: " (f-files "~/.snippets/nix/" nil t))))


     (t ; Default condition
      (setq filename
            (completing-read "Snippet: " (f-files "~/.snippets/" nil t)))))
    (insert-file-contents filename))


  (defun find-home-manager ()
    "Edit the home-manager dotfile, in the current window." ; Doc string.
    (interactive)
    (find-file-existing "/sudo::/etc/nixos/home-manager/"))

  (defun find-nixos-extra ()
    "Edit the nixos flake dotfile, in the current window." ; Doc string.
    (interactive)
    (find-file-existing "/sudo::/etc/nixos/extra/"))

  (defun find-nixos-config ()
    "Edit the nixos config dotfile, in the current window." ; Doc string.
    (interactive)
    (find-file-existing "/sudo::/etc/nixos/nixos/configuration.nix"))

  (defun find-nixos-flake ()
    "Edit the nixos flake dotfile, in the current window." ; Doc string.
    (interactive)
    (if (eq system-type 'darwin)
        (find-file-existing "/etc/nix-darwin/flake.nix")
      (find-file-existing "/sudo::/etc/nixos/flake.nix")))

  (defun spacemacsbind (combo function)
    (define-key evil-normal-state-map (kbd combo) function)
    (define-key evil-visual-state-map (kbd combo) function)
    ;; (define-key evil-evilified-state-map (kbd combo) function)
    ;; (define-key evil-motion-state-map (kbd combo) function)
    )

  (define-key evil-normal-state-map (kbd "SPC i s") #'insert-snippet)
  (spacemacsbind "SPC f e n h" #'find-home-manager)
  (spacemacsbind "SPC f e n n" #'find-nixos-config)
  (spacemacsbind "SPC f e n f" #'find-nixos-flake)
  (spacemacsbind "SPC f e n x" #'find-nixos-extra)

  ;; (treemacs :variables treemacs-use-git-mode 'deferred)
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
  (custom-set-variables
   ;; custom-set-variables was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   '(auth-source-save-behavior nil)
   '(custom-safe-themes
     '("e28d05d3fdc7839815df9f4e6cebceb4a0ca4ed2371bee6d4b513beabee3feb7"
       "bbb13492a15c3258f29c21d251da1e62f1abb8bbd492386a673dcfab474186af"
       "edf5e3ea8b3bbb4602feef2dfac8a6d5dae316fb78e84f360d55dfda0d37fa09"
       "41098e2f8fa67dc51bbe89cce4fb7109f53a164e3a92356964c72f76d068587e"
       "ba72dfc6bb260a9d8609136b9166e04ad0292b9760a3e2431cf0cd0679f83c3a"
       default))
   '(package-selected-packages
     '(ace-jump-helm-line
       ace-link
       add-node-modules-path
       aggressive-indent
       all-the-icons
       auto-compile
       auto-highlight-symbol
       bui
       centered-cursor-mode
       clean-aindent-mode
       column-enforce-mode
       company
       company-emoji
       company-go
       counsel
       counsel-gtags
       csv-mode
       dap-mode
       define-word
       devdocs
       diminish
       dired-quick-sort
       dotenv-mode
       drag-stuff
       dumb-jump
       editorconfig
       elisp-autofmt
       elisp-def
       elisp-slime-nav
       emmet-mode
       emoji-cheat-sheet-plus
       emr
       eval-sexp-fu
       evil-anzu
       evil-args
       evil-cleverparens
       evil-collection
       evil-easymotion
       evil-escape
       evil-evilified-state
       evil-exchange
       evil-goggles
       evil-iedit-state
       evil-indent-plus
       evil-lion
       evil-lisp-state
       evil-matchit
       evil-mc
       evil-nerd-commenter
       evil-numbers
       evil-surround
       evil-textobj-line
       evil-tutor
       evil-unimpaired
       evil-visual-mark-mode
       evil-visualstar
       ewal-spacemacs-themes
       expand-region
       exwm
       eyebrowse
       fancy-battery
       fira-code-mode
       flx-ido
       flycheck-elsa
       flycheck-golangci-lint
       flycheck-package
       flycheck-pos-tip
       ggtags
       gh-md
       go-eldoc
       go-fill-struct
       go-gen-test
       go-guru
       go-impl
       go-mode
       go-rename
       go-tag
       godoctor
       golden-ratio
       google-translate
       gpt
       grizzl
       hasklig-mode
       helm-ag
       helm-company
       helm-dash
       helm-descbinds
       helm-helm-commands
       helm-make
       helm-mode-manager
       helm-org
       helm-projectile
       helm-purpose
       helm-selector
       helm-swoop
       helm-themes
       helm-xref
       helm-z
       help-fns+
       hide-comnt
       highlight-indentation
       highlight-numbers
       highlight-parentheses
       hl-todo
       holy-mode
       hungry-delete
       hybrid-mode
       import-js
       indent-guide
       info+
       inspector
       ivy
       key-intercept
       ligature
       link-hint
       lorem-ipsum
       lsp-docker
       lsp-mode
       lsp-treemacs
       macrostep
       markdown-mode
       markdown-toc
       mmm-mode
       multi-line
       nameless
       nix-buffer
       nix-mode
       nix-sandbox
       open-junk-file
       org-superstar
       overseer
       package-build
       paradox
       password-generator
       pcre2el
       popwin
       pos-tip
       quelpa
       quickrun
       rainbow-delimiters
       request
       restart-emacs
       ron-mode
       rust-mode
       rustic
       spaceline
       spacemacs-purpose-popwin
       spacemacs-whitespace-cleanup
       string-edit-at-point
       string-inflection
       swiper
       symbol-overlay
       symon
       term+
       term-cursor
       tern
       tide
       toc-org
       treemacs-evil
       treemacs-icons-dired
       treemacs-persp
       treemacs-projectile
       typescript-mode
       undo-tree
       use-package
       uuidgen
       v-mode
       valign
       vi-tilde-fringe
       vim-powerline
       vmd-mode
       volatile-highlights
       vterm
       w3m
       web-mode
       which-key
       winum
       writeroom-mode
       ws-butler
       xterm-color
       yaml
       yasnippet)))
  (custom-set-faces
   ;; custom-set-faces was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   ))
