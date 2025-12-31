{ config, pkgs, ... }:

let
  home-manager = builtins.fetchTarball https://github.com/nix-community/home-manager/archive/release-25.05.tar.gz;
  catppuccin = builtins.fetchTarball https://github.com/catppuccin/nix/archive/release-25.05.tar.gz;
in
{
  imports =
    [ ./hardware-configuration.nix
      (import "${home-manager}/nixos")
      ./modules/printer.nix
      (import "${catppuccin}/modules/nixos")  
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = false;
  boot.loader.grub = {
    enable = true;
    useOSProber = true;
    efiInstallAsRemovable = false;
    efiSupport = true;
    device = "nodev";
    theme = pkgs.catppuccin-grub;
  };
  boot.loader.efi.canTouchEfiVariables = true;
  
  networking.hostName = "nixos"; # Define your hostname.
  networking.firewall.enable = false;
  #networking.dhcpcd.enable = true;
  #networking.dhcpcd.extraConfig = ''
  #'';

  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Enable networking via networkmanager
  networking.networkmanager = {
    enable = true;
    wifi.backend = "iwd";
  };

  # Si besoin NetWork Mananger applet dans waybar
  programs.nm-applet.enable = true; 

  # Set your time zone.
  time.timeZone = "Europe/Paris";

  # Select internationalisation properties.
  i18n.defaultLocale = "fr_FR.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "fr_FR.UTF-8";
    LC_IDENTIFICATION = "fr_FR.UTF-8";
    LC_MEASUREMENT = "fr_FR.UTF-8";
    LC_MONETARY = "fr_FR.UTF-8";
    LC_NAME = "fr_FR.UTF-8";
    LC_NUMERIC = "fr_FR.UTF-8";
    LC_PAPER = "fr_FR.UTF-8";
    LC_TELEPHONE = "fr_FR.UTF-8";
    LC_TIME = "fr_FR.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "fr";
    variant = "";
  };
  # Automounting drives
  services.udisks2.enable = true;
  services.gvfs.enable = true;
  
  
  # Configure console keymap
  console.keyMap = "fr";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.user = {
    isNormalUser = true;
    shell = pkgs.zsh;
    description = "user";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" ];
  };
  # Home
  home-manager.users.user = { pkgs, ... }:{
    imports = [
      ./modules/waybar.nix
      ./modules/keepassxc.nix
      ./modules/firefox.nix
      ./modules/hyprland.nix
      ./modules/hyprpaper.nix
      ./modules/freetube.nix
      ./modules/kitty.nix
      ./modules/zsh.nix
      ./modules/git.nix
      ("${catppuccin}/modules/home-manager")
      ./modules/catppuccin.nix
      ./modules/qt_gtk.nix
      ./modules/vscode.nix
      ./modules/starship.nix
    ];
    nixpkgs.config.allowUnfree = true;
    home.stateVersion = "25.05";
    home.packages = [];
    services.playerctld.enable = true;
  };
  
  programs.hyprland.enable = true;
  programs.zsh.enable = true;  

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    brightnessctl        # Controle luminosité
    nemo	         # Explorateur
    rose-pine-hyprcursor # Curseur
    rofi-wayland	 # Rofi
    obsidian		 # Obsidian
    dunst		 # Notifications
    haruna		 # Lecteur audio/video
    protonvpn-gui        # Proton VPN
    grimblast		 # Capture d'écran
    loupe		 # Images viewer
    anki		 # Anki
    #efibootmgr          # Gestion des entrées du boot
    qbittorrent
    # Libre office et correcteur orthographe
    libreoffice-still
    hunspell
    hunspellDicts.fr-moderne
  ];

  # Nvidia
  hardware.graphics.enable = true;
  hardware.nvidia.open = true;
  services.xserver.videoDrivers = ["nvidia" "amdgpu"];
  hardware.nvidia = {
    modesetting.enable = true;
    prime = {
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };
      amdgpuBusId = "PCI:5:0:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };
 
  services.logind.lidSwitch = "ignore";
  
  
  # Fonts
  fonts.packages = with pkgs; [ nerd-fonts.jetbrains-mono ];
  
  # Virtualisation
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;
  # Audio
  # services.pipewire = {
    # enable = true;
    #audio.enable = true;
    #pulse.enable = true;
    #alsa.enable = true;
    #jack.enable = true;
  #};
  
  #This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

}
