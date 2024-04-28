# simple-fzf.kak

A single file implementation of basic fuzzy find editor features using fzf.

- simple
- easy to hack

## quick start

clone plugin

```bash
$ cd ~/.config/kak/
$ git clone https://github.com/Thomashrb/simple-fzf.kak.git
```

source plugin and map `:sfzf-mode`

```kakoune-script
source "simple-fzf.kak/simple-fzf.kak"
map global user p %{:enter-user-mode sfzf<ret>} -docstring "enter sfzf-mode"
```

## depencendies

- `fzf`
- `tmux`
- `ripgrep`

## commands

- `fzf-grep`
- `fzf-git`
- `fzf-file`
