return {
  {
    "jwalton512/vim-blade",
  },
  {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = "make install_jsregexp",
  },
  {
    "nativerv/cyrillic.nvim",
    event = { "VeryLazy" },
    config = function()
      require("cyrillic").setup({
        no_cyrillic_abbrev = false, -- default
      })
    end,
  },
}
