{
  lib,
  config,
  pkgs,
  ...
}:

let
  toLua = str: "lua << EOF\n${str}\nEOF\n";
  # toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
  #   toLuaFile = file: toLua (builtins.readFile file);
  toLuaFile = file: file |> builtins.readFile |> toLua;
in
{
  options.bobymoby.dev.neovim.enable = lib.mkEnableOption "Enable Neovim";

  config = lib.mkIf config.bobymoby.dev.neovim.enable {
    programs.neovim = {
      enable = true;

      # extraConfig = ''
      #   set number relativenumber
      # '';

      # extraConfig = lib.fileContents ./init.vim;
      # extraLuaConfig = lib.fileContents ./init.lua;

      extraLuaConfig = ''
        ${builtins.readFile ./options.lua}
      '';

      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;

      withNodeJs = true;
      withPython3 = true;

      # coc.enable = true;

      # plugins = with pkgs.vimPlugins; [
      #   lualine-nvim
      #   dracula-nvim
      #   nerdtree
      #   telescope-nvim
      #   nvim-treesitter.withAllGrammars
      # ];

      plugins = with pkgs.vimPlugins; [
        {
          plugin = dracula-nvim;
          config = "colorscheme dracula";
        }
        lualine-nvim
        nvim-web-devicons
        {
          plugin = nvim-treesitter.withAllGrammars;
          config = toLuaFile ./plugin/treesitter.lua;
        }
        vim-nix
        {
          plugin = telescope-nvim;
          config = toLuaFile ./plugin/telescope.lua;
        }
        {
          plugin = comment-nvim;
          config = toLua "require(\"Comment\").setup()";
        }

        telescope-fzf-native-nvim
      ];
    };
  };
}
