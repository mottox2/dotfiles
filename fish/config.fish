# require peco
# require hub
# require ctags

#= alias
alias be='bundle exec'
alias sshconf="vim ~/.ssh/config"
alias s="grep -w Host ~/.ssh/config | peco | awk '{print \$2}' | xargs -o -n 1 ssh"
#alias t="tree -l 2 -f |peco |sed -e 's/.*─ //g' |xargs -o vim"

alias ls="ls -gG"
alias ll="ls -lha"
alias vi="vim"
alias rtags="ctags --langmap=ruby:.rb"

# alias for git
alias g="git"
alias gs="git status"
alias ga="gs |peco |awk '{print $nf}' |xargs git add "
alias gd="gs |peco |awk '{print $nf}' |xargs git diff "
alias gc="gs |peco |awk '{print $nf}' |xargs git checkout "
alias delete-merged-branches="git branch --merged | grep -v \\* | xargs -I % git branch -d %"
alias gb="git branch | peco |xargs git checkout"
alias master="git checkout master"
alias github="hub browse"

# alias for this config file
alias config="vim ~/.config/fish/config.fish"
alias reload="source ~/.config/fish/config.fish"

#= envs

# fisherman
set fisher_home ~/.local/share/fisherman
set fisher_config ~/.config/fisherman
source $fisher_home/config.fish

# key bindings
function fish_user_key_bindings
  # $ fisher install yoshiori/fish-peco_select_ghq_repository
  # https://github.com/yoshiori/fish-peco_select_ghq_repository
  bind \c] peco_select_ghq_repository

  # TODO: bash like history using peco
  #bind \cr peco_select_history
end
