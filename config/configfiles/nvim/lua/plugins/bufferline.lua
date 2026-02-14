-- lua/plugins/bufferline.lua
return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  keys = {
    { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle Pin" },
    { "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete Non-Pinned Buffers" },
    { "<leader>br", "<Cmd>BufferLineCloseRight<CR>", desc = "Delete Buffers to the Right" },
    { "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>", desc = "Delete Buffers to the Left" },
    { "<S-h>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev Buffer" },
    { "<S-l>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next Buffer" },
    { "[b", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev Buffer" },
    { "]b", "<Cmd>BufferLineCycleNext<CR>", desc = "Next Buffer" },
    { "[B", "<Cmd>BufferLineMovePrev<CR>", desc = "Move buffer prev" },
    { "]B", "<Cmd>BufferLineMoveNext<CR>", desc = "Move buffer next" },
  },
  opts = {
    options = {
      close_command = "bdelete! %d",       -- simple buffer delete
      right_mouse_command = "bdelete! %d", -- same
      diagnostics = "nvim_lsp",
      always_show_bufferline = false,
      diagnostics_indicator = function(_, _, diag)
        local icons = { Error = "", Warn = "" } -- simple icons
        local ret = (diag.error and icons.Error .. diag.error .. " " or "")
          .. (diag.warning and icons.Warn .. diag.warning or "")
        return vim.trim(ret)
      end,
      offsets = {
        {
          filetype = "neo-tree",
          text = "Neo-tree",
          highlight = "Directory",
          text_align = "left",
        },
        {
          filetype = "snacks_layout_box",
        },
      },
      get_element_icon = function(opts)
        local icons = {
          lua = "",
          python = "",
          -- add more if needed
        }
        return icons[opts.filetype] or ""
      end,
    },
  },
  config = function(_, opts)
    require("bufferline").setup(opts)
  end,
}

