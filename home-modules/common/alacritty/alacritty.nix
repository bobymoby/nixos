{ ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      font.size = 16;
    };
  };

  dconf.settings."org/gnome/desktop/default-applications".terminal = "exec alacritty";
  dconf.settings."org/cinnamon/desktop/default-applications".terminal = "exec alacritty";
}
