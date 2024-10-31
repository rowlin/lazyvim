return {
  "Exafunction/codeium.nvim",
  config = function()
    require("codeium").setup({
      enable_chat = true,
    })
  end,
  cmd = "Codeium",
  build = ":Codeium Auth",
  opts = {},
}
