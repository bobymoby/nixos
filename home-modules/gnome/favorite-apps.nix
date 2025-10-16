let
  favorite-apps-list = [
    "kitty"
    "google-chrome"
    "spotify"
    "webcord"
    "code"
    "idea-ultimate"
    "nemo"
  ];
in
{
  "org/gnome/shell".favorite-apps = map (
    app: "${app}.desktop"
  ) favorite-apps-list;
}
