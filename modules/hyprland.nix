{ config, pkgs, ... }:

{
    # Hyprland
    wayland.windowManager.hyprland = {
      enable = true;
      xwayland.enable = true;
      settings = {
        decoration = {
          rounding = 10;
          rounding_power = 2;
          # Change transparency of focused and unfocused windows
          active_opacity = 1.0;
          inactive_opacity = 0.6;
        };
        general = {
          gaps_in = 5;
          gaps_out = 10;
          border_size = 2;
        };

        "$browser" = "firefox";
	"$terminal" = "kitty";
	"$filemanager" = "nemo";
   
        exec-once = [
        "waybar"
        "hyprpaper"
        ];
        # Electron_app (VSCode, Obsidian)
        "env" = "ELECTRON_OZONE_PLATFORM_HINT,auto";
        
        dwindle = {
          pseudotile = true;
          preserve_split = true;
        };

        input = {
          kb_layout = "fr";
          numlock_by_default = " true";
        };
        
        "$mod" = "SUPER";

        bind = [
          "$mod, T, exec, $terminal"
          "$mod, B, exec, $browser"
	  "$mod, E, exec, $filemanager"
	  "$mod, F, exec, freetube"
	  "$mod, K, exec, [workspace 1] keepassxc"
          "$mod, Q, killactive"
          "$mod, J, togglesplit"
          "$mod, up, movefocus, u"
          "$mod, down, movefocus, d"
          "$mod, left, movefocus, l"
          "$mod, right, movefocus, r"
        ];
	bindm = [
	  "$mod, mouse:272, movewindow"  
	];
	

	bindel = [
	  ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
	  ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
	  ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
	  ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
	  ",XF86MonBrightnessUp, exec, brightnessctl -e4 -n2 set 5%+"
	  ",XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 5%-"
	];
	
	bindl = [
	  ", XF86AudioPause, exec, playerctl play-pause"
	  ", XF86AudioPlay, exec, playerctl play-pause"
	];


 
	windowrulev2 = "opacity 0.90 0.90,class:^(kitty)$";
	misc = {
	  force_default_wallpaper = 0;
	  disable_hyprland_logo = true;
	};
      };

    };
}
