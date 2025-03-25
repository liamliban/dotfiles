export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
zstyle ':omz:update' mode auto      # update automatically without asking
COMPLETION_WAITING_DOTS="true"

plugins=(git direnv)

source $ZSH/oh-my-zsh.sh


python_venv() {

 MY_VENV=./venv

 if [[ -z "$VIRTUAL_ENV" ]]; then

   if [[ -d $MY_VENV ]]; then

# source ${MY_VENV}/bin/activate  # commented out by conda initialize

   fi

 else

   parentdir="$(dirname "$VIRTUAL_ENV")"

   if [[ "$PWD"/ != ${parentdir}/* ]]; then

     deactivate

   fi

 fi

}

autoload -U add-zsh-hook

add-zsh-hook chpwd python_venv

python_venv

. /opt/homebrew/opt/asdf/libexec/asdf.sh

alias python3.8="/opt/homebrew/opt/python@3.8"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init --path)"
  eval "$(pyenv init -)"
fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/liam.liban/Developer/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/liam.liban/Developer/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/liam.liban/Developer/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/liam.liban/Developer/google-cloud-sdk/completion.zsh.inc'; fi

PATH="$PATH:/Users/liam.liban/kafka_2.13-3.9.0/bin"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

alias airflow="gcloud compute ssh airflow@airflow --ssh-flag='-L 8080:localhost:8080' --project=fgi-data-warehouse --zone=asia-southeast1-a --tunnel-through-iap"

auto_activate_venv() {
    if [ -z "$VIRTUAL_ENV" ] && [ -d ".venv" ]; then
        source .venv/bin/activate
        echo "Activated virtual environment: $(basename $(pwd))"
    fi
}

autoload -U add-zsh-hook
add-zsh-hook chpwd auto_activate_venv
auto_activate_venv

cd() {
    builtin cd "$@" && eza --icons
}

# zsh autosuggestion
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# zsh autohighlight
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

alias x='exit'
alias c='clear'

# TMUX ALIASES
alias ta='tmux attach'
alias td='tmux detach'
alias t='tmux'

alias ls='eza --icons'

eval "$(zoxide init zsh)"
alias cd='z'

# Startship setup
eval "$(starship init zsh)"
