return {
  { -- This plugin
    "Zeioth/makeit.nvim",
    cmd = { "MakeitOpen", "MakeitToggleResults", "MakeitRedo" },
    dependencies = { "stevearc/overseer.nvim" },
    opts = {},
    keys = {
      { "<leader>Mm", ":MakeitOpen<cr>", desc = "MakeitOpen" },
      { "<leader>Mr", ":MakeitRedo<cr>", desc = "MakeitRedo"},
      { "<leader>Mt", ":MakeitToggleResults<cr>", desc = "MakeitToggleResults" },
    },
  },
  { -- The task runner we use
    "stevearc/overseer.nvim",
    commit = "400e762648b70397d0d315e5acaf0ff3597f2d8b",
    cmd = { "MakeitOpen", "MakeitToggleResults", "MakeitRedo" },
    opts = {
      task_list = {
        direction = "bottom",
        min_height = 25,
        max_height = 25,
        default_detail = 1,
      },
    },
  },
}
