return {
  {
    -- Add the Laravel.nvim plugin which gives the ability to run Artisan commands
    -- from Neovim.
    "adalessa/laravel.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "tpope/vim-dotenv",
      "MunifTanjim/nui.nvim",
      "nvimtools/none-ls.nvim",
    },
    cmd = { "Sail", "Artisan", "Composer", "Npm", "Yarn", "Laravel" },
    keys = {
      { "<leader>la", ":Laravel artisan<cr>" },
      { "<leader>lr", ":Laravel routes<cr>" },
      { "<leader>lm", ":Laravel related<cr>" },
    },
    event = { "VeryLazy" },
    -- config = true,
    opts = {
      lsp_server = "intelephense",
      features = {
        null_ls = { enable = false },
        route_info = {
          enable = true, --- to enable the laravel.nvim virtual text
          position = "right", --- where to show the info (available options 'right', 'top')
          middlewares = true, --- wheather to show the middlewares section in the info
          method = true, --- wheather to show the method section in the info
          uri = true, --- wheather to show the uri section in the info
        },
      },
    },
  },
  {
    "ricardoramirezr/blade-nav.nvim",
    dependencies = { -- totally optional
      "hrsh7th/nvim-cmp", -- if using nvim-cmp
    },
    ft = { "blade", "php" }, -- optional, improves startup time
    opts = {
      close_tag_on_complete = true, -- default: true
    },
  },
  -- Add neotest-pest plugin for running PHP tests.
  -- A package is also available for PHPUnit if needed.
  {
    "nvim-neotest/neotest",
    lazy = true,
    dependencies = {
      "V13Axel/neotest-pest",
      "olimorris/neotest-phpunit",
    },
    config = function()
      local dap = require("dap")
      require("neotest").setup({
        adapters = {
          require("neotest-pest"),
        },
      })
      require("neotest-phpunit")({
        env = {
          XDEBUG_CONFIG = "idekey=neotest",
        },

        dap = dap.configurations.php[1],
      })
    end,
  },
}
