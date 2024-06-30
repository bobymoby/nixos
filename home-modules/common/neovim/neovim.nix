{ lib, pkgs, ... }:
{
  programs.neovim = {
    enable = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    withNodeJs = true;
    withPython3 = true;

    extraConfig = lib.fileContents ./init.vim;
    extraLuaConfig = lib.fileContents ./init.lua;

    coc.enable = true;
    plugins = with pkgs.vimPlugins; [
      lualine-nvim
      nerdtree
      nerdtree-git-plugin
      telescope-nvim
    ];
  };
}
