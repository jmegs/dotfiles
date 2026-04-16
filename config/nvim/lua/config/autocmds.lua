-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Disable diagnostics by default in markdown files (<leader>ud to toggle back on)
-- Disable autocomplete in markdown files
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown" },
  callback = function(ev)
    vim.diagnostic.enable(false, { bufnr = ev.buf })
    vim.b[ev.buf].completion = false
  end,
})
