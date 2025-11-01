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
      numlockOnStartup = "on";
    };
    touchpads = [
      {
        name = "DELL0A71:00 04F3:317E Touchpad";
        productId = "317e";
        vendorId = "04f3";

        naturalScroll = true;
      }
    ];
    mice = [
      {
        name = "Logitech G502 HERO Gaming Mouse";
        productId = "046d";
        vendorId = "c08b";

        accelerationProfile = "none";
      }
    ];
  };
}
