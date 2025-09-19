return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        htmldjango = { "prettier" },
        html = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
      },
      formatters = {
        prettier = {
          prepend_args = function()
            local bufnr = vim.api.nvim_get_current_buf()
            local filetype = vim.api.nvim_buf_get_option(bufnr, "filetype")

            if  filetype == "html" then
              return { "--parser", "html" }
            end
            if filetype == "htmldjango" then
              return { "--parser", "jinja-template" }
            end
            return {}
          end,
        },
      },
    },
  },
}

