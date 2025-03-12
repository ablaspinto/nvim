return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { 
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-live-grep-args.nvim",
            version = "^1.0.0"
        },
		config = function()
			local builtin = require("telescope.builtin")
            local telescope = require("telescope")
            local lga_actions = require("telescope-live-grep-args.actions")
            
			-- Setup telescope with extensions
            telescope.setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({}),
                    },
                    live_grep_args = {
                        auto_quoting = true, -- enable/disable auto-quoting
                        -- mappings
                        mappings = {
                            i = {
                                ["<C-k>"] = lga_actions.quote_prompt(),
                                ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
                            },
                        },
                    },
                },
            })

            -- Load extensions
            telescope.load_extension("live_grep_args")
            
			-- Keymaps
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, {}) 
			vim.keymap.set("n", "<C-p>", builtin.find_files, {})
            -- Optional: Add a keymap for live_grep_args if you want to use it
            -- vim.keymap.set("n", "<leader>fG", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", {})
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
            require("telescope").load_extension("ui-select")
		end,
	},
}
