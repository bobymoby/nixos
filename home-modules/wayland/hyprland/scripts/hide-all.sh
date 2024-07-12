IS_SHOWN=$(hyprctl getoption decoration:active_opacity | awk 'NR==1{print $2}')
if [ "$IS_SHOWN" = 1.000000 ] ; then
    hyprctl --batch "\
        keyword decoration:active_opacity 0;\
        keyword decoration:inactive_opacity 0"
    exit
fi
hyprctl reload