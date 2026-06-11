return {
  {
    "webhooked/kanso.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      foreground = "saturated",
      minimal = true,
    },
  },
  -- Configure LazyVim to load the colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kanso",
    },
  },
}
