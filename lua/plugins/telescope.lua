return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim","nvim-telescope/telescope-live-grep-args.nvim",
      version = "^1.0.0"
    },
		config = function()
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, {}) 
			vim.keymap.set("n", "<C-p>", builtin.find_files, {})
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
