return {
    'ccaglak/phptools.nvim',
    keys = {
        { "<leader>lpm", "<cmd>PhpMethod<cr>"},
        { "<leader>lpc", "<cmd>PhpClass<cr>"},
        { "<leader>lps", "<cmd>PhpScripts<cr>"},
        { "<leader>lpn", "<cmd>PhpNamespace<cr>"},
        { "<leader>lpg", "<cmd>PhpGetSet<cr>"},
        { "<leader>lpf", "<cmd>PhpCreate<cr>"},
    },
    dependencies = {
        "nvim-lua/plenary.nvim"
    },
    config = function()
      require('phptools').setup({
        custom_toggles = {
        -- { "foo", "bar", "baz" },
        -- Add more custom toggle groups here
        },
        ui = false, -- Set to true if not using a UI enhancement plugin
      })
      vim.keymap.set('v', '<leader>cpr', function()
            require("phptools.refactor").refactor()
        end, { desc = 'PhpRefactor' })
    end
}
