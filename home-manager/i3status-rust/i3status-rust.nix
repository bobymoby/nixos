{ ... }:

{
  programs.i3status-rust.enable = true;
  home.file.".config/i3status-rust/config.toml".source = ./config.toml;
}
