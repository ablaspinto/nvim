return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim", -- none-ls depends on plenary
  },
  config = function()
    local null_ls = require("null-ls")
    local diagnostics = null_ls.builtins.diagnostics
    local formatting = null_ls.builtins.formatting
    local completion = null_ls.builtins.completion
    
    -- Helper function to check if command exists
    local function command_exists(command)
      local handle = io.popen("command -v " .. command .. " > /dev/null 2>&1 && echo 'true' || echo 'false'")
      local result = handle:read("*a")
      handle:close()
      return result:match("true") ~= nil
    end
    
    -- Collect sources based on available tools
    local sources = {}
    
    -- Lua formatting
    if command_exists("stylua") then
      table.insert(sources, formatting.stylua)
    end
    
    -- Python formatting and linting
    if command_exists("black") then
      table.insert(sources, formatting.black)
    end
    
    if command_exists("pylint") then
      table.insert(sources, diagnostics.pylint.with({
        diagnostics_postprocess = function(diagnostic)
          diagnostic.severity = diagnostic.message:find("^E") and 1 or 
                               diagnostic.message:find("^W") and 2 or 
                               diagnostic.message:find("^C") and 3 or 
                               diagnostic.severity
        end,
      }))
    end
    
    -- Spell checking completion
    table.insert(sources, completion.spell)
    
    null_ls.setup({
      sources = sources,
      debug = true,
    })
    
    -- Format on save keybinding
    vim.keymap.set('n', "<leader>ds", vim.lsp.buf.format, { desc = "Format document" })
  end,
}
