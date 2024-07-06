{ pkgs, ... }:

{
  # sound.enable = true;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
    pulse.enable = true;
    wireplumber.enable = true;
    # jack.enable = true; #for JACK applications
  };

  hardware.pulseaudio = {
    enable = false;
    package = pkgs.pulseaudioFull;
  };
}



