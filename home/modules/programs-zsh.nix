{ pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "sudo" "dirhistory" ];
      theme = "robbyrussell";
    };
    initContent = ''
      # Fastfetch on startup for interactive shells
      if [[ -o interactive ]] && [[ $TERM != dumb ]]; then
        fastfetch
      fi
    '';
  };
}
