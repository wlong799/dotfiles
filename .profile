# Basic variables
export PATH="${PATH}:$HOME/.scripts"
export XDG_CONFIG_HOME="$HOME/.config"

# Prevent conflicts between intellij and bspwm
export _JAVA_AWT_WM_NONREPARENTING=1

# Variables related to top panel on desktop
PANEL_FIFO=/tmp/panel-fifo
PANEL_HEIGHT=60
PANEL_FONT="xft:Source Code Pro"
PANEL_WM_NAME=bspwm_panel
export PANEL_FIFO PANEL_HEIGHT PANEL_FONT PANEL_WM_NAME

