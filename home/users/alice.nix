{
  config,
  pkgs,
  inputs,
  ...
}:
{
  home.username = "alice";
  home.homeDirectory = "/home/alice";
  home.stateVersion = "25.11";

  home.sessionVariables = {
    XCURSOR_SIZE = 12;
  };

  home.packages = with pkgs; [
    # file managers
    nnn

    # archiving
    zip
    xz
    unzip
    p7zip

    # utils
    ripgrep
    eza
    fzf
    
    # misc
    file
    which
    tree

    # fonts
    nerd-fonts.jetbrains-mono
  ];

  gtk = {
    enable = true;

    theme = {
      name = "adw-gtk3";
      package = pkgs.adw-gtk3;
    };
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      cursor-size = 12;
    };
  };

  # TODO: FINISH THIS FINISH THIS FINISH THIS FINISH THIS OR ELSE YOU DIE
  imports = [];
}
