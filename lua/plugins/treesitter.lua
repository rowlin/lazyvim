-- add more treesitter parsers
return {
  {
    -- Add a Treesitter parser for Laravel Blade to provide Blade syntax highlighting.
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "php",
        "phpdoc",
        "html",
        "lua",
        "vue",
        "bash",
        "javascript",
        "json",
        "sql",
        "css",
        "scss",
      },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    },
    dependencies = {
      -- https://github.com/windwp/nvim-ts-autotag
      {
        "windwp/nvim-ts-autotag",
        opts = {
          enable_close_on_slash = false, -- disable case: `<div /` become `<div /div>`
          filetypes = {
            "html",
            "javascript",
            "typescript",
            "vue",
            "bash",
          },
        },
      },
    },
  },
}
