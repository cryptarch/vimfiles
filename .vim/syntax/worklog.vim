syntax match    ShellCommand +^\$ .*+
syntax match    Comment      +^### .*+
syntax region   MiscBlock    start=/^\~\~\~$/   end=/^\~\~\~$/

highlight link ShellCommand fgStagnantPond
highlight link MiscBlock    fgStorm
