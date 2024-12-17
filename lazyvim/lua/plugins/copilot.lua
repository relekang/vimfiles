return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  build = ":Copilot auth",
  event = "InsertEnter",
  config = function()
    require("copilot").setup({
      filetypes = {
        ["*"] = false,
      },
    })
  end,
  opts = {
    suggestion = {
      enabled = true,
      auto_trigger = true,
      keymap = {
        accept = "<C-g>",
      },
    },
    panel = {
      enabled = true,
      keymap = {
        open = "<C-p>",
      },
    },
    filetypes = {
      gitcommit = true,
      markdown = false,
      help = false,
    },
  },
}
