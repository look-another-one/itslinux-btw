-- lua/plugins/snacks.lua
return {
  "folke/snacks.nvim",
  event = "VeryLazy",
  enabled = true,
  opts = {
    indent = { enabled = true },
    input = { enabled = true },
    notifier = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = false }, -- you can enable in options.lua if needed
    toggle = { map = function(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, { desc = desc })
    end },
    words = { enabled = true },
    dashboard = {
      preset = {
        header = [[
       ██████╗ ██████╗ ██╗███╗   ██╗██████╗ ██╗███╗   ██╗ ██████╗ 
      ██╔════╝ ██╔══██╗██║████╗  ██║██╔══██╗██║████╗  ██║██╔════╝ 
      ██║  ███╗██████╔╝██║██╔██╗ ██║██║  ██║██║██╔██╗ ██║██║  ███╗
      ██║   ██║██╔══██╗██║██║╚██╗██║██║  ██║██║██║╚██╗██║██║   ██║
      ╚██████╔╝██║  ██║██║██║ ╚████║██████╔╝██║██║ ╚████║╚██████╔╝
       ╚═════╝ ╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝╚═════╝ ╚═╝╚═╝  ╚═══╝ ╚═════╝ 
        ]],
        keys = {
          { icon = " ", key = "f", desc = "Find File", action = ":lua require('snacks.dashboard').pick('files')" },
          { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          { icon = " ", key = "g", desc = "Find Text", action = ":lua require('snacks.dashboard').pick('live_grep')" },
          { icon = " ", key = "r", desc = "Recent Files", action = ":lua require('snacks.dashboard').pick('oldfiles')" },
          { icon = " ", key = "c", desc = "Config", action = ":lua require('snacks.dashboard').pick('files', {cwd = vim.fn.stdpath('config')})" },
          { icon = " ", key = "s", desc = "Restore Session", section = "session" },
          { icon = " ", key = "x", desc = "Lazy Extras", action = ":LazyExtras" },
          { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
      },
    },
  },
  keys = {
    {
      "<leader>n",
      function()
        local snacks = require("snacks")
        if snacks.config.picker and snacks.config.picker.enabled then
          snacks.picker.notifications()
        else
          snacks.notifier.show_history()
        end
      end,
      desc = "Notification History",
    },
    {
      "<leader>un",
      function()
        require("snacks").notifier.hide()
      end,
      desc = "Dismiss All Notifications",
    },
  },
  config = function(_, opts)
    require("snacks").setup(opts)
  end,
}

