{ ... }:

{
  home.file.".config/wireplumber/wireplumber.conf.d" = {
    source = ./config;
    recursive = true;
  };
}
