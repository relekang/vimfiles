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
    -- Git branch selection
    {
      "<leader>gb",
      function()
        telescope_builtin.git_branches({
          attach_mappings = function(_, map)
            map("i", "<CR>", function(prompt_bufnr)
              local selection = require("telescope.actions.state").get_selected_entry()
              require("telescope.actions").close(prompt_bufnr)
              vim.cmd("Git checkout " .. selection.value)
            end)
            return true
          end,
        })
      end,
      desc = "Git branches",
    },
    -- Git status
    {
      "<leader>gs",
      function()
        telescope_builtin.git_status()
      end,
      desc = "Git status",
    },
    -- Git commits
    {
      "<leader>gc",
      function()
        telescope_builtin.git_commits()
      end,
      desc = "Git commits",
    },
  },
}
