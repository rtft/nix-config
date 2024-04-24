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
        min_time = 1;
        #min_time_to_notify = 1000;
      };

      username = {
        show_always = true;
      };

      
    };
  };
}
