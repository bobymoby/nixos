{
  services.xserver = {
    libinput = {
      enable = true;
      touchpad = {
        naturalScrolling = true;
        accelProfile = "flat";
      };
      mouse = {
        accelProfile = "flat";
      };
    };
    xkb = {
      layout = "us,bg";
      variant = "altgr-intl,phonetic";
      options = "grp:alt_shift_toggle";
    };
  };
}
