return {
  "lazyvim.plugins.extras.lang.rust",
  opts = function(_, opts)
    opts.settings = {
      ["rust-analyzer"] = {
        diagnostics = {
          disabled = { "unresolved-proc-macro" },
        },
      },
    }
  end,
}
