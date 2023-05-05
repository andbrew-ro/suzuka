export BASH_SILENCE_DEPRECATION_WARNING=1
export HOMEBREW_NO_ENV_HINTS=1
export COLOR_PROMPT=yes

function conda_env () {
	if [ ! -z "$CONDA_DEFAULT_ENV" ]; then
		if [ "$COLOR_PROMPT" = yes ]; then
			echo "<"$CONDA_DEFAULT_ENV">"
		else
			echo "("$CONDA_DEFAULT_ENV") "
		fi
	fi
}

if [ "$COLOR_PROMPT" = yes ]; then
	prompt_color='\[\033[;32m\]'
	info_color='\[\033[1;34m\]'
	prompt_symbol=@
	if [ "$EUID" -eq 0 ]; then
		prompt_color='\[\033[;34m\]'
		info_color='\[\033[1;31m\]'
	fi
	PS1=$prompt_color'┌─$(conda_env)─('$info_color'\u'$prompt_symbol'\h'$prompt_color')-[\[\033[0;1m\]\w'$prompt_color']\n└─'$info_color'\$\[\033[0m\] '
	PROMPT_COMMAND=echo
	unset prompt_color
	unset info_color
	unset prompt_symbol
else
	PS1='$(conda_env)\h:\W \u\$ '
	PROMPT_COMMAND=
fi
unset color_prompt

alias config='/usr/bin/git --git-dir=$HOME/Documents/GitHub/suzuka --work-tree=$HOME'

