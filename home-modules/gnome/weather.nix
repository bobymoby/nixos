{ lib, ... }:
let
  inherit (lib.hm.gvariant)
    mkVariant
    mkTuple
    mkUint32
    mkEmptyArray
    type
    ;
  ddTupleType = type.tupleOf [
    type.double
    type.double
  ];
  #   weather-locations = "[<(uint32 2, <('Sofia Observatory', 'LBSF', false, [(0.74438292597558142, 0.40811615094024323)], @a(dd) [])>)>]";
  weather-locations = [
    (mkVariant (mkTuple [
      (mkUint32 2)
      (mkVariant (mkTuple [
        "Sofia Observatory"
        "LBSF"
        false
        [
          (mkTuple [
            0.74438292597558142
            0.40811615094024323
          ])
        ]
        (mkEmptyArray ddTupleType)
      ]))
    ]))
  ];
in
{
  "org/gnome/Weather".locations = weather-locations;
  "org/gnome/shell/weather".locations = weather-locations;
  "org/gnome/GWeather4".temperature-unit = "centigrade";
}
