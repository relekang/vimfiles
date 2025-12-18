return {
  "nvim-telescope/telescope.nvim",
  keys = {
    {
      "<leader><space>",
      function()
        require("telescope.builtin").find_files({ cwd = false })
      end,
      desc = "Find Files (cwd)",
    },
    {
      "<leader>gx",
      function()
        require("telescope.builtin").grep_string({ search = "<<<" })
      end,
      desc = "Grep <<< string",
    },
    -- Git branch selection
    {
      "<leader>gb",
      function()
        require("telescope.builtin").git_branches({
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
        require("telescope.builtin").git_status()
      end,
      desc = "Git status",
    },
    -- Git commits
    {
      "<leader>gc",
      function()
        require("telescope.builtin").git_commits()
      end,
      desc = "Git commits",
    },
  },
}
