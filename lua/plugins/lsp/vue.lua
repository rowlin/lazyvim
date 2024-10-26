return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      setup = {
        volar = {
          init_options = {
            vue = {
              hybridMode = true,
            },
          },
        },
        vtsls = {},
      },
    },
  },
}
