return {
  "neovim/nvim-lspconfig",
  event = "VeryLazy",
  config = function()
    if vim.loop.os_uname().sysname ~= "Darwin" then
      return
    end

    local uv = vim.loop
    local current_branch = nil
    local git_head = ".git/HEAD"

    if vim.fn.isdirectory(".git") == 0 or vim.fn.filereadable(git_head) == 0 then
      return
    end

    local function get_git_branch()
      local handle = io.popen("git symbolic-ref --short HEAD 2>/dev/null")
      if handle then
        local branch = handle:read("*l")
        handle:close()
        return branch
      end
      return nil
    end

    local function restart_lsp_if_branch_changed()
      local new_branch = get_git_branch()
      if new_branch and new_branch ~= current_branch then
        current_branch = new_branch
        vim.schedule(function()
          vim.cmd("LspRestart")
          vim.notify("Git branch changed to '" .. new_branch .. "'. LSP restarted.", vim.log.levels.INFO)
        end)
      end
    end

    local function start_fswatch()
      local handle
      handle = vim.fn.jobstart({ "fswatch", "-0", git_head }, {
        stdout_buffered = false,
        on_stdout = function(_, data)
          if data then
            restart_lsp_if_branch_changed()
          end
        end,
        on_exit = function()
          vim.notify("fswatch stopped for .git/HEAD", vim.log.levels.WARN)
        end,
      })

      if handle <= 0 then
        vim.notify("Failed to start fswatch for Git HEAD", vim.log.levels.ERROR)
      end
    end

    current_branch = get_git_branch()
    start_fswatch()
  end,
}
