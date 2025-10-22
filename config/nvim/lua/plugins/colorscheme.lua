return {
  {
    "webhooked/kanso.nvim",
    opts = {
      foreground = "saturated",
      background = {
        dark = "ink",
        light = "pearl",
      },
    },
  },

  -- configure lazyvim to load colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kanso",
    },
  },
}
