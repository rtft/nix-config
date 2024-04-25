{pkgs, lib, config, ...}:
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
        "[](bg:#DA627D fg:#9A348E)"
        "$username"
        "$hostname"
        "[](fg:#9A348E)"
        "$shell"
      ];
      right_format = lib.concatStrings [
        "$status"
        "$cmd_duration"
        "$time"
      ];

      shell = {
        disabled = false; 
      };

      time = {
        disabled = false;
      };

      os = {
        disabled = false;
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
        style_user = "bg:#9A348E";
        style_root = "bg:#9A348E";
        format = "[$user@]($style)";
      };

      hostname = {
        ssh_only = false;
        style = "bg:#9A348E";
        format = "[$ssh_symbol$hostname]($style)";
      };

      # memory_usage = {
      #   disabled = false;
      #   threshold = -1;
      #   symbol = "";
      #   #format = "$symbol [${ram}( | ${swap})]($style)";
      # };

      
    };
  };
}
