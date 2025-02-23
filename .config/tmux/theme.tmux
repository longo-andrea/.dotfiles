run ~/.config/tmux/plugins/catppuccin/catppuccin.tmux

set -g status "on"
set -g status-justify "left"

set -g status-left-style NONE
set -g status-left-length "100"
set -g status-left "#[fg=#11111b,bg=#cba6f7,bold] SESSION: [#S] "

set -g status-right-style NONE
set -g status-right-length "100"
set -g status-right "#[fg=#11111b,bg=#cba6f7,bold] EXEC: [#W] "

setw -g window-status-separator ""

setw -g window-status-activity-style "underscore,fg=#a9b1d6,bg=#16161e"

setw -g window-status-format "#[fg=#11111b,bg=#cdd6f4] [#I] #{b:pane_current_path} #F "
setw -g window-status-current-format "#[fg=#11111b,bg=#89b4fa,bold] [#I] #{b:pane_current_path} #F "
