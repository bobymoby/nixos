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

  #WIP test
  services.pipewire.wireplumber.configPackages = with pkgs; [
    (writeTextDir "share/wireplumber/main.lua.d/51-disable-suspension.lua" ''
      table.insert (alsa_monitor.rules, {
        matches = {
          {
            { "node.name", "matches", "alsa_input."},
          },
          {
            { "node.name", "matches", "alsa_output."},
          },
        },
        apply_properties = {
          ["session.suspend-timeout-seconds"] = 0,
        },
      })
    '')
  ];
}

