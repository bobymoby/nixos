{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode.fhsWithPackages (ps: with ps; [
      zlib
      openssl.dev
      pkg-config
    ]);
  };

  home.file.".config/code-flags.conf".source = ./code-flags.conf;
}
