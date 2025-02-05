-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Autocommand to save changes
-- TextChanged
vim.api.nvim_create_autocmd({ "InsertLeave" }, {
  pattern = { "*" },
  command = "silent! wall",
  nested = true,
})

-- Commented
--
local lsp_hacks = vim.api.nvim_create_augroup("LspHacks", { clear = true })

vim.api.nvim_create_autocmd({ "BufNewFile", "BufReadPost" }, {
  group = lsp_hacks,
  pattern = ".env*",
  callback = function(e)
    vim.diagnostic.enable(false, { bufnr = e.buf })
  end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.md" },
  command = "lua vim.diagnostic.disable()",
  nested = false,
})

---------------------------------
-- Floating diagnostics message
---------------------------------
vim.diagnostic.config({
  float = { source = nil, border = "single" },
  virtual_text = false,
  signs = true,
})
--
--------------------------------
-- Auto commands
---------------------------------
vim.api.nvim_create_autocmd({ "CursorHold"}, {
  pattern = {"*"},
  command = "lua vim.diagnostic.open_float(nil, {focus=false})",
})
----
vim.api.nvim_create_autocmd({ "TextChangedI", "TextChangedP" }, {
  callback = function()
    local line = vim.api.nvim_get_current_line()
    local cursor = vim.api.nvim_win_get_cursor(0)[2]

    local current = string.sub(line, cursor, cursor + 1)
    if current == "." or current == "," or current == " " then
      require("cmp").close()
    end

    local before_line = string.sub(line, 1, cursor + 1)
    local after_line = string.sub(line, cursor + 1, -1)
    if not string.match(before_line, "^%s+$") then
      if after_line == "" or string.match(before_line, " $") or string.match(before_line, "%.$") then
        require("cmp").complete()
      end
    end
  end,
  pattern = "*",
})
