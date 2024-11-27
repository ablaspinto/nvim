return {
    "zenbones-theme/zenbones.nvim",
    -- Optionally install Lush. Allows for more configuration or extending the colorscheme
    -- If you don't want to install lush, make sure to set g:zenbones_compat = 1
    -- In Vim, compat mode is turned on as Lush only works in Neovim.
    dependencies = "rktjmp/lush.nvim",
    lazy = false,
    priority = 1000,
    -- you can set set configuration options here
    config = function()
         vim.g.zenbones_darken_comments = 45
         vim.cmd.colorscheme('seoulbones')
          --zenwritten 	Zero hue and saturation version
          -- neobones 	Inspired by neovim.io
          --vimbones 	Inspired by vim.org
          --rosebones 	Inspired by Rosé Pine
          --forestbones 	Inspired by Everforest
          --nordbones 	Inspired by Nord
          --tokyobones 	Inspired by Tokyo Night
          --seoulbones 	Inspired by Seoul256
          --duckbones 	Inspired by Spaceduck
          --zenburned 	Inspired by Zenburn
          --kanagawabones 	Inspired by Kanagawa
          --randombones 	Randomly pick from the collection.
    end
}
