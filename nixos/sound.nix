{ ... }:

{
  # sound.enable = true;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # jack.enable = true; #for JACK applications
  };

  # environment.etc."wireplumber/main.lua.d/90-suspend-timeout.lua" = {
  #   text = ''
  #     ["session.suspend-timeout-seconds"] = 0
  #   '';
  # };

  # hardware.pulseaudio.extraConfig = ''
  #   .nofail
  #   unload-module module-suspend-on-idle
  #   .fail
  # '';
}
