# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  nix = {
    package = pkgs.nixVersions.stable; # optional, but includes latest nix features
    extraOptions = ''
      experimental-features = nix-command
    '';
  };

  programs.hyprland = {
    enable = true;
    xwayland.enable = true; # For X11 apps
};

  hardware.graphics.enable = true;


  networking.nameservers = [ "1.1.1.1" "8.8.8.8" ];

  services.power-profiles-daemon.enable = true;

i18n.inputMethod = {
  type = "ibus";
  enable = true;
  ibus.engines = with pkgs.ibus-engines; [
    bamboo
  ];
};


  programs.zsh.enable = true;
  programs.zsh.ohMyZsh.enable = true; # Oh My Zsh support

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
#  boot.loader.grub.enable = true;
#  boot.loader.grub.version = 2;
#  boot.loader.grub.version = true;
#  boot.loader.grub.device = "nodev";
#  boot.loader.grub.useOSProber = true;
  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Ho_Chi_Minh";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "vi_VN";
    LC_IDENTIFICATION = "vi_VN";
    LC_MEASUREMENT = "vi_VN";
    LC_MONETARY = "vi_VN";
    LC_NAME = "vi_VN";
    LC_NUMERIC = "vi_VN";
    LC_PAPER = "vi_VN";
    LC_TELEPHONE = "vi_VN";
    LC_TIME = "vi_VN";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the XFCE Desktop Environment.
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.desktopManager.xfce.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.kay = {
    isNormalUser = true;
    description = "kay";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;    
    packages = with pkgs; [
    #  thunderbird
    ];
  };

#fonts.packages = with pkgs; [
#  nerd-fonts.meslo-lg
#];


fonts = {
  fontconfig.enable = true;
  packages = with pkgs; [
    nerd-fonts.meslo-lg
    noto-fonts
    noto-fonts-emoji
  ];
};


services.flatpak.enable = true;


  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    neovim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    cargo
    rustup
    go
    fd
    ripgrep
    sqlite
    gcc
    xclip
    wl-clipboard
    nodejs
    fd
    wget
    stow
    git
    pkgs.fastfetch
    btop
    waybar
    hyprland
    hyprpaper
    hyprlock
    wofi
    mako
    grim slurp
    wl-clipboard
    xdg-desktop-portal-hyprland
    kitty
    networkmanagerapplet
    brightnessctl
    pipewire
    pavucontrol
    noto-fonts noto-fonts-emoji
    fontconfig
    spotify
    spicetify-cli
    wordpress
    unzip
    adwaita-icon-theme
    fuchsia-cursor
    wine
    flatpak
    zsh
    zsh-powerlevel10k
    ibus-engines.bamboo
    ibus
  ];

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
   networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

}
