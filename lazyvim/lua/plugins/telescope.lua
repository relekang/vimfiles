local telescope_builtin = require("telescope.builtin")

return {
  "nvim-telescope/telescope.nvim",
  keys = {
    {
      "<leader><space>",
      function()
        telescope_builtin.find_files({ cwd = false })
      end,
      desc = "Find Files (cwd)",
    },
    {
      "<leader>gx",
      function()
        telescope_builtin.grep_string({ search = "<<<" })
      end,
      desc = "Grep <<< string",
    },
  },
}
