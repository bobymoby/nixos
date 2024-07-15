CURRENT_WORKSPACE_ID=$(hyprctl activewindow -j | jq '.workspace.id')

if [ $CURRENT_WORKSPACE_ID -lt 0 ]; then
    exit
fi

hyprctl dispatch killactive