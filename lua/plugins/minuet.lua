return {
  {
    "milanglacier/minuet-ai.nvim",
    config = function()
      require("minuet").setup({
        provider_options = {
          openai = {
            model = "gpt-4o-mini",
            system = system,
            few_shots = default_few_shots,
            stream = true,
            optional = {
              -- pass any additional parameters you want to send to OpenAI request,
              -- e.g.
              -- stop = { 'end' },
              max_tokens = 256,
              -- top_p = 0.9,
            },
          },
        },
        -- Your configuration options here
      })
    end,
  },
  { "nvim-lua/plenary.nvim" },
  {
    "nvim-cmp",
    opts = function(_, opts)
      -- if you wish to use autocomplete
      table.insert(opts.sources, 1, {
        name = "minuet",
        group_index = 1,
        priority = 100,
      })

      opts.performance = {
        -- It is recommended to increase the timeout duration due to
        -- the typically slower response speed of LLMs compared to
        -- other completion sources. This is not needed when you only
        -- need manual completion.
        fetching_timeout = 2000,
      }

      opts.mapping = vim.tbl_deep_extend("force", opts.mapping or {}, {
        -- if you wish to use manual complete
        ["<A-y>"] = require("minuet").make_cmp_map(),
        -- You don't need to worry about <CR> delay because lazyvim handles this situation for you.
        ["<CR>"] = nil,
      })
    end,
  },
}
