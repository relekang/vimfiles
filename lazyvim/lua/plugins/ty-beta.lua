return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.servers = opts.servers or {}

      -- 1) basedpyright: keep diagnostics, disable ALL language features
      opts.servers.basedpyright = vim.tbl_deep_extend("force", opts.servers.basedpyright or {}, {
        settings = {
          basedpyright = {
            disableLanguageServices = true,
          },
        },
      })

      -- 2) ty: use for all language features
      opts.servers.ty = vim.tbl_deep_extend("force", opts.servers.ty or {}, {
        settings = {
          ty = {},
        },
      })

      -- 3) Rewrite ty diagnostics: treat all ty errors as warnings
      local orig = vim.lsp.handlers["textDocument/publishDiagnostics"]
      vim.lsp.handlers["textDocument/publishDiagnostics"] = function(err, result, ctx, config)
        local client = vim.lsp.get_client_by_id(ctx.client_id)
        if client and client.name == "ty" and result and result.diagnostics then
          for _, d in ipairs(result.diagnostics) do
            -- LSP DiagnosticSeverity: 1=Error, 2=Warning, 3=Information, 4=Hint
            if d.severity == 1 then
              d.severity = 2
            end
          end
        end
        return orig(err, result, ctx, config)
      end
    end,
  },
}
