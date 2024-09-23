return { -- change some telescope options and a keymap to browse plugin files
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope-live-grep-args.nvim",
      },
    },
    config = function()
      local telescope = require("telescope")
      -- first setup telescope
      telescope.setup({
        -- your config
        defaults = {
          file_ignore_patterns = {
            "%.gitignore",
            "yarn%.lock",
            "node_modules/",
            "dist/",
            "%.next",
            "%.git/",
            "%.gitlab/",
            "build/",
            "target/",
            "package%-lock%.json",
          },
          layout_strategy = "horizontal",
          layout_config = { prompt_position = "top" },
          sorting_strategy = "ascending",
          winblend = 0,
        },
      })

      -- then load the extension
      -- telescope.load_extension("live_grep_args")
    end,
  },

  -- add telescope-fzf-native
  -- {
  --   "telescope.nvim",
  --   dependencies = {
  --     "nvim-telescope/telescope-fzf-native.nvim",
  --     build = "make",
  --     config = function()
  --       require("telescope").load_extension("fzf")
  --       -- require("telescope").load_extension("laravel").routes
  --     end,
  --   },
  -- },
  -- add tsserver and setup with typescript.nvim instead of lspconfig
}
