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
        "$username"
        "$hostname"
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
      };

      hostname = {
        ssh_only = false;
      };

      
    };
  };
}
