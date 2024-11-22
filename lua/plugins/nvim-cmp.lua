return {
  "nvim-cmp",
  dependencies = {
    -- codeium
    {
      "Exafunction/codeium.nvim",
      cmd = "Codeium",
      build = ":Codeium Auth",
      opts = {},
    },
  },
  opts = function(_, opts)
    table.insert(opts.sources, 1, {
      name = "codeium",
      group_index = 1,
      priority = 100,
    })
    local has_words_before = function()
      unpack = unpack or table.unpack
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end
    -- original LazyVim kind icon formatter
    local format_kinds = opts.formatting.format
    opts.formatting.format = function(entry, item)
      format_kinds(entry, item) -- add icons
      return require("tailwindcss-colorizer-cmp").formatter(entry, item)
    end

    local cmp = require("cmp")

    local function confirmDone(evt)
      local context = evt.entry.context
      if context.filetype ~= "php" then
        return
      end

      if vim.startswith(context.cursor_after_line, "(") then
        return
      end

      local endRange = evt.entry.source_insert_range["end"]
      vim.treesitter.get_parser(context.bufnr):parse({ endRange.line, endRange.line })
      local node = assert(vim.treesitter.get_node({ pos = { endRange.line, endRange.character - 1 } }))

      local parent = node:parent()

      if not parent then
        return
      end

      if not vim.tbl_contains({ "object_creation_expression", "attribute" }, parent:type()) then
        return
      end

      vim.api.nvim_feedkeys("(", "i", false)
    end

    cmp.event:on('confirm_done', confirmDone)

    opts.mapping = vim.tbl_extend("force", opts.mapping, {
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          -- You could replace select_next_item() with confirm({ select = true }) to get VS Code autocompletion behavior
          cmp.select_next_item()
        elseif vim.snippet.active({ direction = 1 }) then
          vim.schedule(function()
            vim.snippet.jump(1)
          end)
        elseif has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif vim.snippet.active({ direction = -1 }) then
          vim.schedule(function()
            vim.snippet.jump(-1)
          end)
        else
          fallback()
        end
      end, { "i", "s" }),
    })
  end,
}
