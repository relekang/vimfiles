return {
  {
    "mason-org/mason.nvim",
    version = "2.0.0",
    opts = {
      ensure_installed = {
        "basedpyright",
        "json-lsp",
        "lua-language-server",
        "prettier",
        "ruff",
        "rust-analyzer",
        "typescript-language-server",
        "ty",
      },
    },
  },
  { "mason-org/mason-lspconfig.nvim" },
}
