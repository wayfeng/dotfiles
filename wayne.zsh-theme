# vim:ft=zsh ts=2 sw=2 sts=2
# customized oh-my-zsh theme by wayne
# put in ~/.oh-my-zsh/themes/

# Must use Powerline font, for \uE0A0 to render.
ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg[magenta]%}\uE0A0 "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}?"
ZSH_THEME_GIT_PROMPT_CLEAN=""

# Virtualenv info
ZSH_THEME_VIRTUALENV_PROMPT_PREFIX=" %{$fg[green]%}«"
ZSH_THEME_VIRTUALENV_PROMPT_SUFFIX="» %{$reset_color%}%"
virtenv_prompt() {
	[[ -n "${VIRTUAL_ENV:-}" ]] || return
	echo "${ZSH_THEME_VIRTUALENV_PROMPT_PREFIX}${VIRTUAL_ENV:t}${ZSH_THEME_VIRTUALENV_PROMPT_SUFFIX}"
}

PROMPT='
╭─ %{$fg_bold[green]%}%~%{$reset_color%}$(git_prompt_info)$(virtenv_prompt) %{$fg_bold[purple]%}[%*]%{$reset_color%}
╰─ λ '

