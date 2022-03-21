# clash proxy
$Env:http_proxy = "http://127.0.0.1:7890"; $Env:https_proxy = "http://127.0.0.1:7890"

# import module
# posh-git
Import-Module posh-git
# PSReadLine
Import-Module PSReadLine
# Icons
Import-Module -Name Terminal-Icons
# psreadline theme
Import-Module PSConsoleTheme
Set-ConsoleTheme 'Nord'

# Alias
Set-Alias vim nvim
Set-Alias ll ls
Set-Alias g git
Set-Alias grep findstr
# Set-Alias tig 'C:\Program Files\Git\usr\bin\tig.exe'
Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'

# PSReadLine
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadlineOption -EditMode Vi
Set-PSReadLineOption -BellStyle None
Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteCHar
# 设置 Tab 键补全
Set-PSReadLineKeyHandler -Key Tab -Function Complete
# 设置 Tab 为菜单补全和 Intellisense
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete
# 设置 Ctrl+q 为退出 PowerShell
Set-PSReadLineKeyHandler -Key "Ctrl+q" -Function ViExit
# 设置 Ctrl+z 为撤销
Set-PSReadLineKeyHandler -Key "Ctrl+z" -Function Undo
# 设置向上键为后向搜索历史记录
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
# 设置向下键为前向搜索历史纪录
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward

# Fzf
Import-Module PsFzf
# replace 'Ctrl+t' and 'Ctrl+r' with your preferred bindings:
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'
#------------------------------- Import Modules END   -------------------------------

# starship 改变标题
function Invoke-Starship-PreCommand {
    $host.ui.Write("`e]0;🚀 haohao`: $pwd `a")
    #   $host.ui.Write("🚀")'
}

# starship 主题
$ENV:STARSHIP_CONFIG = "$HOME\.config\starship.toml"
Invoke-Expression (&starship init powershell)


#-------------------------------    Functions BEGIN   -------------------------------
# Python 直接执行
# $env:PATHEXT += ";.py"

# 更新 pip 的方法
# function Update-Packages {
#     # update pip
#     Write-Host "Step 1: 更新 pip" -ForegroundColor Magenta -BackgroundColor Cyan
#     $a = pip list --outdated
#     $num_package = $a.Length - 2
#     for ($i = 0; $i -lt $num_package; $i++) {
#         $tmp = ($a[2 + $i].Split(" "))[0]
#         pip install -U $tmp
#     }
# }
#-------------------------------    Functions END     -------------------------------





#-------------------------------   Set Alias Begin    -------------------------------

# 2. 更新系统 os-update
# Set-Alias -Name os-update -Value Update-Packages

# 3. 查看目录 ls & ll
# function ListDirectory {
#     (Get-ChildItem).Name
#     Write-Host("")
# }
# Set-Alias -Name ls -Value ListDirectory
# Set-Alias -Name ll -Value Get-ChildItem
#-------------------------------    Set Alias END     -------------------------------
