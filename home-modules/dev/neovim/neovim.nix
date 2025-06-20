{
  lib,
  config,
  pkgs,
  ...
}:

{
  options.bobymoby.dev.neovim.enable = lib.mkEnableOption "Enable Neovim";

  config = lib.mkIf config.bobymoby.dev.neovim.enable {
    # home = {
    #   file.".config/nvim" = {
    #     source = ./config;
    #     recursive = true;
    #   };

    #   packages = with config.mySpecialArgs.pkgsLatest; [
    #     neovim
    #     # neovim-nightly
    #     # neovim-nightly-bin
    #   ];
    # };
    programs.neovim = {
      enable = true;

      # extraConfig = ''
      #   set number relativenumber
      # '';

      extraConfig = lib.fileContents ./init.vim;
      extraLuaConfig = lib.fileContents ./init.lua;

      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;

      withNodeJs = true;
      withPython3 = true;

      coc.enable = true;

      plugins = with pkgs.vimPlugins; [
        lualine-nvim
        dracula-nvim
        nerdtree
        telescope-nvim
        nvim-treesitter.withAllGrammars
      ];
    };
  };
}
