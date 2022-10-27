# vim:ft=zsh ts=2 sw=2 sts=2

# Must use Powerline font, for \uE0A0 to render.
ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[magenta]%}\uE0A0 "
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

# box name
BOX_NAME_PROMPT_PREFIX="%{$fg[magenta]%}"
BOX_NAME_PROMPT_SUFFIX="%{$reset_color%}"
function box_name {
    [[ -n "${SSH_CONNECTION:-}" ]] || return
    local box="${SHORT_HOST:-$HOST}"
	echo "${BOX_NAME_PROMPT_PREFIX}${box:gs/%/%%}${BOX_NAME_PROMPT_SUFFIX} "
}

PROMPT='
╭─ $(box_name)%{$fg_bold[green]%}%~%{$reset_color%}$(git_prompt_info)$(virtenv_prompt) %{$fg_bold[red]%}[%*]%{$reset_color%}
╰─ λ '

