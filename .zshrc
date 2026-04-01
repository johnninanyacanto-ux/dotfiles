# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source /home/two5/powerlevel10k/powerlevel10k.zsh-theme

# 1. Tema Powerlevel10k
source /home/two5/powerlevel10k/powerlevel10k.zsh-theme

# 2. Plugin zsh-autosuggestions
#if [ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then  
#  source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 
#fi 

# 3. Plugin zsh-sudo (Asegúrate de que la ruta sea correcta)
# zsh-sudo Plugin (Instalado globalmente)
if [ -f /usr/share/zsh-sudo/sudo.plugin.zsh ]; then 
  source /usr/share/zsh-sudo/sudo.plugin.zsh
fi 

#zsh-autosuggestions plugin 
#if [ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
 # source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 
#fi 


# 4. Plugin zsh-syntax-highlighting (SIEMPRE debe ir al final)
if [ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then 
  source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 
fi 



    # Use modern completion system
    autoload -Uz compinit
    compinit
     
    zstyle ':completion:*' auto-description 'specify: %d'
    zstyle ':completion:*' completer _expand _complete _correct _approximate
    zstyle ':completion:*' format 'Completing %d'
    zstyle ':completion:*' group-name ''
    zstyle ':completion:*' menu select=2
    eval "$(dircolors -b)"
    zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
    zstyle ':completion:*' list-colors ''
    zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
    zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
    zstyle ':completion:*' menu select=long
    zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
    zstyle ':completion:*' use-compctl false
    zstyle ':completion:*' verbose true
     
    zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
    zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'




    # Custom Aliases
    # -----------------------------------------------
    # bat
    alias cat='bat'
    alias catn='bat --style=plain'
    alias catnp='bat --style=plain --paging=never'
     
    # ls
    alias ll='lsd -lh --group-dirs=first'
    alias la='lsd -a --group-dirs=first'
    alias l='lsd --group-dirs=first'
    alias lla='lsd -lha --group-dirs=first'
    alias ls='lsd --group-dirs=first'


#Archivo donde se guarda el historial 
HISTFILE="$HOME/.zsh_history"


# Tamaño del historial en memoria y en archivo
HISTSIZE=1000000
SAVEHIST=1000000

# Opciones para un historial de "hacker"
setopt EXTENDED_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS

# ---------------------------------------------------------
# PENTESTING TARGETING FUNCTIONS
# ---------------------------------------------------------

# Función para fijar el objetivo (Target)

function settarget(){
    mkdir -p ~/.config/bin
    if [ -z "$1" ]; then
        echo "Uso: settarget <IP> <Nombre>"
        return 1
    fi

    echo "$1 $2" > ~/.config/bin/target
    echo -n "$1" | wl-copy
    
    # --- AÑADE ESTO PARA ACTUALIZAR WAYBAR AL INSTANTE ---
    pkill -RTMIN+1 waybar 
    # ----------------------------------------------------

    echo -e " Objetivo fijado: $1 ($2)"
    echo " IP copiada al portapapeles."
}

# Función para limpiar el objetivo
function cleartarget(){
    # Limpia el archivo de target
    echo '' > ~/.config/bin/target
    
    # Limpia el portapapeles para evitar confusiones
    echo -n "" | wl-copy
    
    echo "✅ Objetivo y portapapeles eliminados."
}

# Alias cortos para mayor velocidad
alias st='settarget'
alias ct='cleartarget'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
alias phoneinfoga='/usr/bin/phoneinfoga-bin'


#PATH
export PATH="$PATH:$(ruby -e 'print Gem.user_dir')/bin"
