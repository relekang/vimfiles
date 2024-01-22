local Util = require("lazyvim.util")

return {
  "nvim-telescope/telescope.nvim",
  keys = {
    { "<leader><space>", Util.telescope("files", { cwd = false }), desc = "Find Files (cwd)" },
    { "<leader>gx", "<cmd>Telescope grep_string search=<<<< <CR>" },
  },
}
