let
  inherit (builtins) map filter;
in
# pkgs: list: map (name: pkgs.${name}) (filter (name: name != "enable") list)
pkgs: list: list |> filter (name: name != "enable") |> map (name: pkgs.${name})
