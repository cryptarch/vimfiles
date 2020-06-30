syntax      match   ShellCommand    +^\$ .*+
syntax      match   Comment         +^### .*+
syntax      region  MiscBlock       start=/^\~\~\~$/    end=/^\~\~\~$/
syntax      region  MiscBlock       start=/^```$/    end=/^```$/

highlight   link    ShellCommand    Function
highlight   link    MiscBlock       Ignore
highlight   link    Table           Statement
