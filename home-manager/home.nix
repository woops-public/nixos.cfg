{ config, pkgs, ... }:

{
  home.username = "w0op5";
  home.homeDirectory = "/home/w0op5";

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    nnn

    zip
    xz
    unzip
    p7zip

    # nix related
    #
    # it provides the command `nom` works just like `nix`
    # with more details log output
    nix-output-monitor

    brave
    discord
    steam
  ];

  programs.helix = {
   enable = true;
   settings = {
     theme = "dracula";
     editor = {
       line-number = "relative";
       lsp.display-messages = true;
     };
   };
 };

 programs.foot = {
   enable = true;
   settings = {
     main = {
       font = "FiraCode Nerd Font:size=14";
    };
   };
  };

  programs.git = {
    enable = true;
    settings.user.name = "woops-public";
    settings.user.email = "woops-public@posteo.me";
  };

  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      aws.disabled = true;
      gcloud.disabled = true;
      line_break.disabled = true;
    };
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
    bashrcExtra = ''
      export PATH="$PATH:$HOME/bin"
    '';
    shellAliases = {
      g = "git";
      fr = "sudo nixos-rebuild switch --flake .#nixos";
      warp-up = "warp-cli connect";
      warp-down = "warp-cli disconnect";
    };
  };

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "25.11";
}
