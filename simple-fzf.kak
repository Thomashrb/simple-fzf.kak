# Mode
try %{ declare-user-mode sfzf }
define-command -docstring "Enter sfzf-mode" \
sfzf-mode %{ require-module sfzf; evaluate-commands 'enter-user-mode sfzf' }

# Commands
define-command -hidden sfzf-grep %{ nop %sh{
  tmux popup -E -h 95% -w 95% -e kak_command_fifo=$kak_command_fifo -d "$(tmux display-message -pF '#{pane_current_path}')" -- '
    RESULT="$(rg --line-number --color never ".*" | fzf +i)"
    FILE="$(echo "$RESULT" | cut -d: -f1)"
    LINE="$(echo "$RESULT" | cut -d: -f2)"
    echo "edit $FILE $LINE" > $kak_command_fifo
  '
}}

define-command -hidden sfzf-git %{ nop %sh{
  tmux popup -E -h 95% -w 95% -e kak_command_fifo=$kak_command_fifo -d "$(tmux display-message -pF '#{pane_current_path}')" -- '
    FILE="$(git ls-tree --full-tree --name-only -r HEAD | fzf +i)"
    echo "edit $FILE" > $kak_command_fifo
  '
}}

define-command -hidden sfzf-file %{ nop %sh{
  tmux popup -E -h 95% -w 95% -e kak_command_fifo=$kak_command_fifo -d "$(tmux display-message -pF '#{pane_current_path}')" -- '
    FILE="$(rg -L --hidden --files | fzf +i)"
    echo "edit $FILE" > $kak_command_fifo
  '
}}

# Bindings
map global sfzf g ':sfzf-grep<ret>' -docstring 'grep file contents recursively'
map global sfzf p ':sfzf-git<ret>' -docstring 'find file in git project'
map global sfzf f ':sfzf-file<ret>' -docstring 'find file'
