# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

let
  home-manager = builtins.fetchTarball https://github.com/nix-community/home-manager/archive/release-25.05.tar.gz;
  catppuccin = builtins.fetchTarball https://github.com/catppuccin/nix/archive/release-25.05.tar.gz;
in
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      (import "${home-manager}/nixos")
      ./modules/printer.nix
      (import "${catppuccin}/modules/nixos")  
    ];

  # Bootloader.
  #boot.loader.systemd-boot.enable = true;
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
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

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
  # Automounting files systems
  services.udisks2.enable = true;
  services.gvfs.enable = true;
  
  # Configure console keymap
  console.keyMap = "fr";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.user = {
    isNormalUser = true;
    shell = pkgs.zsh;
    description = "user";
    extraGroups = [ "networkmanager" "wheel" ];
  };
  
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
      #./modules/qt.nix
   ];
    
    home.stateVersion = "25.05";
    home.packages = [];
    gtk.enable = true;
    services.playerctld.enable = true;
  };
 
  programs.hyprland.enable = true;
  programs.zsh = {
    enable = true;
    #promptInit = ''
    #  export PS1='\[\033[38;2;166;227;161m\]\u\[\033[0m\]@\[\033[38;2;137;180;250m\]\h\[\033[0m\]:\[\033[38;2;237;51;59m\]\w\[\033[0m\]\[\033[3>
    #'';
  };  
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
   brightnessctl
   nemo
   rose-pine-hyprcursor
  ];

  # Fonts
  fonts.packages = with pkgs; [ nerd-fonts.jetbrains-mono ];
  
  # Audio
  # services.pipewire = {
    # enable = true;
    #audio.enable = true;
    #pulse.enable = true;
    #alsa.enable = true;
    #jack.enable = true;
  #};
  
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

}
