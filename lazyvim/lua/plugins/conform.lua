return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        html = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        python = { "ruff_format", "ruff_organize_imports" },
      },
      formatters = {
        prettier = {
          prepend_args = function()
            local bufnr = vim.api.nvim_get_current_buf()
            local filetype = vim.api.nvim_buf_get_option(bufnr, "filetype")

            if filetype == "html" then
              return { "--parser", "html" }
            end
            return {}
          end,
        },
      },
    },
  },
}

