{ lib, config, ... }:

{
  config.programs.plasma.input = lib.mkIf config.bobymoby.kde.enable {
    keyboard = {
      layouts = [
        {
          layout = "us";
          # variant = "intl";
        }
        {
          layout = "bg";
          variant = "phonetic";
        }
      ];
      numlockOnStartup = "off";
    };
    touchpads = [
      {
        name = "DELL0A71:00 04F3:317E Touchpad";
        naturalScroll = true;
        productId = "317e";
        vendorId = "04f3";
      }
    ];
  };
}
