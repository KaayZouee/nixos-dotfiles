# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source /nix/store/5j5k4rbqr0mnh7zzj0b4iimibsf9k3n2-powerlevel10k-1.20.14/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob nomatch notify
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/kay/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
alias cnixconfiguration='sudo nano /etc/nixos/configuration.nix'
alias chyprland='nano ~/.config/hypr/hyprland.conf'
alias cwaybar='nano ~/.config/waybar/config.jsonc'
alias chyprpaper='nano ~/.config/hyprpaper/hyprpaper.conf'
alias czshrc='nano ~/.zshrc'
alias sober='flatpak run org.vinegarhq.Sober'
export XCURSOR_THEME=Fuchsia
export XCURSOR_SIZE=24
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
