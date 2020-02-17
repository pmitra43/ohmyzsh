get_space () {
  local STR=$1$2
  local zero='%([BSUbfksu]|([FB]|){*})'
  local LENGTH=${#${(S%%)STR//$~zero/}}
  local SPACES=""
  (( LENGTH = ${COLUMNS} - $LENGTH - 2))

  for i in {0..$LENGTH}
    do
      SPACES="$SPACES "
    done

  echo $SPACES
}


PROMPT_LEFT="%(?:%{$fg_bold[green]%}:%{$fg_bold[red]%})%n% : %{$fg[cyan]%}%~%{$reset_color%} $(kube_ps1)"
PROMPT_RIGHT="%(?:%{$fg_bold[green]%}[%*] :%{$fg_bold[red]%}[%*] )"

PROMPT='%(?:%{$fg_bold[green]%}:%{$fg_bold[red]%})%n% : %{$fg[cyan]%}%~%{$reset_color%} $(kube_ps1)$(get_space "%(?:%{$fg_bold[green]%}:%{$fg_bold[red]%})%n% : %{$fg[cyan]%}%~%{$reset_color%} $(kube_ps1)" "%(?:%{$fg_bold[green]%}[%*] :%{$fg_bold[red]%}[%*] )")%(?:%{$fg_bold[green]%}[%*] :%{$fg_bold[red]%}[%*] )
%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )%{$reset_color%}$(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[blue]%}) %{$fg[yellow]%}+"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
