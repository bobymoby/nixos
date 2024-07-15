CURRENT_WINDOW_DATA=$(hyprctl activewindow -j)
CURRENT_WORKSPACE_ID=$(echo $CURRENT_WINDOW_DATA | jq '.workspace.id')

TARGET_WORKSPACE=$1

if [ $CURRENT_WORKSPACE_ID -lt 0 ]; then
    CURRENT_WORKSPACE_NAME=$(echo $CURRENT_WINDOW_DATA | jq '.workspace.name')
    if [ $CURRENT_WORKSPACE_NAME != "\"special:magic\"" ]; then
        exit
    fi
fi

hyprctl dispatch movetoworkspace $TARGET_WORKSPACE