{
  pkgs,
  lib,
  config,
  ...
}:
{
  #TODO: Nix colors when I get there 
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    enableNushellIntegration = true;

    # prompt plan 
    # 2 Line, 1 only meant for git branch data 
    # Rest is for regular information

    settings = {

      add_newline = true;
      format = lib.concatStrings [
        "$os"
        "$username"
        "$hostname"
        "[](bg:color_yellow fg:color_orange)"
        "$directory"
        "[](fg:color_yellow bg:color_aqua)"
        "$git_branch"
        "$git_status"
        "[](fg:color_aqua bg:color_purple)"
        "$shell"
        "[](fg:color_purple) "
        "$aws"
        "$conda"
        "$dart"
        "$elixir"
        "$elm"
        "$go"
        "$java"
        "$nix_shell"
        "$nodejs"
        "$php"
        "$python"
        "$ruby"
        "$rust"
        "$line_break"
        "$character"
      ];
      right_format = lib.concatStrings [
        "$status"
        "$cmd_duration"
        "$time"
      ];

      palette = "gruvbox_dark";

      palettes = {
        gruvbox_dark = {
          color_fg0 = "#fbf1c7";
          color_bg1 = "#3c3836";
          color_bg3 = "#665c54";
          color_blue = "#458588";
          color_aqua = "#689d6a";
          color_green = "#98971a";
          color_orange = "#d65d0e";
          color_purple = "#b16286";
          color_red = "#cc241d";
          color_yellow = "#d79921";
        };
      };
      fill = {
        disabled = false;
        symbol = ".";
      };
      shell = {
        disabled = false;
        style = "bg:color_purple fg:color_fg0";
        format = "[  $indicator]($style)";
      };

      time = {
        disabled = false;
      };

      os = {
        style = "bg:color_orange fg:color_fg0";
        disabled = false;

        symbols = {
          NixOS = "";
          Windows = "󰍲";
          Ubuntu = "󰕈";
          SUSE = "";
          Raspbian = "󰐿";
          Mint = "󰣭";
          Macos = "󰀵";
          Manjaro = "";
          Linux = "󰌽";
          Gentoo = "󰣨";
          Fedora = "󰣛";
          Alpine = "";
          Amazon = "";
          Android = "";
          Arch = "󰣇";
          Artix = "󰣇";
          CentOS = "";
          Debian = "󰣚";
          Redhat = "󱄛";
          RedHatEnterprise = "󱄛";
        };
      };

      status = {
        disabled = false;
      };

      cmd_duration = {
        disabled = false;
        min_time = 0;
        min_time_to_notify = 6000;
        show_notifications = true;
      };

      username = {
        show_always = true;
        style_user = "bg:color_orange fg:color_fg0";
        style_root = "bg:color_orange fg:color_fg0";
        format = "[ $user@]($style)";
      };

      hostname = {
        ssh_only = false;
        style = "bg:color_orange fg:color_fg0";
        format = "[$ssh_symbol$hostname ]($style)";
      };

      directory = {
        style = "fg:color_fg0 bg:color_yellow";
        format = "[ $path ]($style)";
        truncation_length = 3;
        truncation_symbol = "…/";
        substitutions = {
          "Documents" = "󰈙 ";
          "Downloads" = " ";
          "Music" = "󰝚 ";
          "Pictures" = " ";
          "Developer" = "󰲋 ";
        };
      };

      git_branch = {
        symbol = "";
        style = "bg:color_aqua";
        format = "[[ $symbol $branch ](fg:color_fg0 bg:color_aqua)]($style)";
      };

      git_status = {
        style = "bg:color_aqua";
        format = "[[($all_status$ahead_behind )](fg:color_fg0 bg:color_aqua)]($style)";
      };

      character = {
        disabled = false;
        success_symbol = "[](bold fg:color_green)";
        error_symbol = "[](bold fg:color_red)";
        vimcmd_symbol = "[](bold fg:color_green)";
        vimcmd_replace_one_symbol = "[](bold fg:color_purple)";
        vimcmd_replace_symbol = "[](bold fg:color_purple)";
        vimcmd_visual_symbol = "[](bold fg:color_yellow)";
      };

      # memory_usage = {
      #   disabled = false;
      #   threshold = -1;
      #   symbol = "";
      #   #format = "$symbol [${ram}( | ${swap})]($style)";
      # };

      aws = {
        symbol = " ";
      };

      conda = {
        symbol = " ";
      };

      dart = {
        symbol = " ";
      };

      elixir = {
        symbol = " ";
      };

      elm = {
        symbol = " ";
      };

      golang = {
        symbol = " ";
      };

      java = {
        symbol = " ";
      };

      nix_shell = {
        symbol = " ";
      };

      nodejs = {
        symbol = "󰎙";
      };

      php = {
        symbol = " ";
      };

      python = {
        symbol = " ";
      };

      ruby = {
        symbol = " ";
      };

      rust = {
        symbol = " ";
      };
    };
  };
}
