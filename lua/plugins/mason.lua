return {
  "williamboman/mason.nvim",
  opts = {
    ui = {
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗",
      },
    },
    ensure_installed = {
      "bash-language-server",
      "blade-formatter",
      "docker-compose-language-service",
      "dockerfile-language-server",
      "vue-language-server",
      "dot-language-server",
      "js-debug-adapter",
      "html-lsp",
      "vetur-vls",
      "php-debug-adapter",
      "shellcheck",
      "phpactor",
      "shfmt",
      -- "intelephense",
      "php-cs-fixer",
    },
    automatic_installation = true,
  },
}
