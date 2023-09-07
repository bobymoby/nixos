{ pkgs, ... }:

{
  services.picom = {
    enable = true;
    package = pkgs.picom.overrideAttrs (o: {
      src = pkgs.fetchFromGitHub {
        repo = "picom";
        owner = "ibhagwan";
        rev = "44b4970f70d6b23759a61a2b94d9bfb4351b41b1";
        sha256 = "0iff4bwpc00xbjad0m000midslgx12aihs33mdvfckr75r114ylh";
      };
    });

    activeOpacity = 1;
    inactiveOpacity = 0.8;

    fade = true;
    fadeDelta = 5;
    vSync = true;
    opacityRules = [
      "100:class_g   *?= 'Chromium-browser'"
      "100:class_g   *?= 'Firefox'"
      "100:class_g   *?= 'gitkraken'"
      "100:class_g   *?= 'emacs'"
      "100:class_g   ~=  'jetbrains'"
      "100:class_g   *?= 'slack'"
      "100:class_g *?= 'Rofi'"
    ];

    # settings = ''
    #   corner-radius = 10;
    #   blur-method = "dual_kawase";
    #   blur-strength = "10";
    #   xinerama-shadow-crop = true;
    # '';
  };
}
