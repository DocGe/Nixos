
WALLPAPER_DIR="/etc/nixos/modules/wallp/"
CURRENT_WALL=$(hyprctl hyprpaper listloaded)

# Get a random wallpaper that is not the current one
WALLPAPER=$(find $WALLPAPER_DIR -type f ! -wholename $CURRENT_WALL | shuf -n 1)

# Apply the selected wallpaper
hyprctl hyprpaper reload ,$WALLPAPER
