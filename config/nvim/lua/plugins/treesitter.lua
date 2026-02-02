return {
  -- Core Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    version = false,
    build = ":TSUpdate",
    lazy = true,
    event = { "BufReadPost", "BufNewFile", "VeryLazy" },
    cmd = { "TSUpdate", "TSInstall", "TSLog", "TSUninstall" },
    opts = {
      ensure_installed = {
        "bash", "c", "cpp", "diff", "html", "javascript", "jsdoc",
        "json", "jsonc", "lua", "luadoc", "luap", "markdown",
        "markdown_inline", "printf", "python", "query", "regex",
        "toml", "tsx", "typescript", "vim", "vimdoc", "xml", "yaml"
      },
      highlight = { enable = true },
      indent = { enable = true },
      fold = { enable = true },
    },
    config = function(_, opts)
      local ok, configs = pcall(require, "nvim-treesitter.configs")
      if not ok then
        vim.notify("[LazyVim] nvim-treesitter not installed yet!", vim.log.levels.WARN)
        return
      end

      configs.setup(opts)

      -- Auto-install missing parsers
      local ts_install = require("nvim-treesitter.install")
      local installed = require("nvim-treesitter.parsers").get_parser_configs()
      for _, lang in ipairs(opts.ensure_installed) do
        if not installed[lang] then
          ts_install.install(lang)
        end
      end
    end,
  },

  -- Treesitter Textobjects
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    lazy = true,
    event = "VeryLazy",
    opts = {
      move = {
        enable = true,
        set_jumps = true,
        keys = {
          goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer", ["]a"] = "@parameter.inner" },
          goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer", ["]A"] = "@parameter.inner" },
          goto_previous_start = { ["[f"] = "@function.outer", ["[c"] = "@class.outer", ["[a"] = "@parameter.inner" },
          goto_previous_end = { ["[F"] = "@function.outer", ["[C"] = "@class.outer", ["[A"] = "@parameter.inner" },
        },
      },
    },
    config = function(_, opts)
      local tsobjects = require("nvim-treesitter-textobjects")
      if not tsobjects.setup then
        vim.notify("[LazyVim] nvim-treesitter-textobjects not installed yet!", vim.log.levels.WARN)
        return
      end
      tsobjects.setup(opts)

      local function attach(buf)
        local ft = vim.bo[buf].filetype
        if not (opts.move and opts.move.enable) then return end
        local moves = opts.move.keys or {}

        for method, keymaps in pairs(moves) do
          for key, query in pairs(keymaps) do
            local queries = type(query) == "table" and query or { query }
            local parts = {}
            for _, q in ipairs(queries) do
              local part = q:gsub("@", ""):gsub("%..*", "")
              part = part:sub(1,1):upper() .. part:sub(2)
              table.insert(parts, part)
            end
            local desc = table.concat(parts, " or ")
            desc = (key:sub(1,1) == "[" and "Prev " or "Next ") .. desc
            desc = desc .. (key:sub(2,2):upper() == key:sub(2,2) and " End" or " Start")
            if not (vim.wo.diff and key:find("[cC]")) then
              vim.keymap.set({ "n","x","o" }, key, function()
                require("nvim-treesitter-textobjects.move")[method](query, "textobjects")
              end, { buffer=buf, desc=desc, silent=true })
            end
          end
        end
      end

      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("lazyvim_treesitter_textobjects", { clear=true }),
        callback = function(ev) attach(ev.buf) end,
      })
      vim.tbl_map(attach, vim.api.nvim_list_bufs())
    end,
  },

  -- Auto close tags
  {
    "windwp/nvim-ts-autotag",
    event = "VeryLazy",
    opts = {},
  },
}

