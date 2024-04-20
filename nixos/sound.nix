{ ... }:

{
  # sound.enable = true;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber.enable = true;
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
  # environment.etc."wireplumber/main.lua.d/51-disable-suspension.lua" = {
  #   text = ''
  #     table.insert (alsa_monitor.rules, {
  #       matches = {
  #         {
  #           { "node.name", "matches", "alsa_input."},
  #         },
  #         {
  #           { "node.name", "matches", "alsa_output."},
  #         },
  #       },
  #       apply_properties = {
  #         ["session.suspend-timeout-seconds"] = 0,
  #       },
  #     })
  #   '';
  # };
}
