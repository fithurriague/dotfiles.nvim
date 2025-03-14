-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

---@type LazySpec
return {
  -- SYNTAX HIGHLIGHTING
  -- ====================
  {
    "fladson/vim-kitty",
    lazy = true,
  },

  -- COLORSCHEMES
  -- ====================
  -- {
  --   "catppuccin/nvim",
  --   name = "catppuccin",
  --   lazy = true,
  -- },
  -- {
  --   'Mofiqul/dracula.nvim',
  --   lazy = true,
  -- },
  --
  -- {
  --   "rjshkhr/shadow.nvim",
  -- },
  -- {
  --   "zenbones-theme/zenbones.nvim",
  --   dependencies = "rktjmp/lush.nvim",
  --   -- lazy = true,
  -- },
  {
    "jwalton512/vim-blade",
    event = "User AstroFile",
  },

  -- RAINBOW DELIMITERS
  -- ====================
  {
    "HiPhish/rainbow-delimiters.nvim",
    lazy = true,
    event = "BufEnter",
  },

  -- DOCUMENTATION
  -- ====================
  {
    "danymat/neogen",
    lazy = true,
    cmd = "Neogen",
    config = true,
    -- Uncomment next line if you want to follow only stable versions
    -- version = "*"
  },

  -- HTTP
  -- ====================
  {
    "mistweaverco/kulala.nvim",
    lazy = true,
    config = function()
      -- Setup is required, even if you don't pass any options
      require("kulala").setup {
        -- default_view, body or headers
        default_view = "body",
        -- dev, test, prod, can be anything
        -- see: https://learn.microsoft.com/en-us/aspnet/core/test/http-files?view=aspnetcore-8.0#environment-files
        default_env = "dev",
        -- enable/disable debug mode
        debug = false,
      }
    end,
  },

  -- MARKDOWN
  -- ====================
  {
    "toppair/peek.nvim",
    event = { "VeryLazy" },
    build = "deno task --quiet build:fast",
    config = function()
      require("peek").setup()
      vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
      vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
    end,
  },

  -- SCREENSHOTS
  {
    "mistricky/codesnap.nvim",
    build = "make",
    lazy = true,
    cmd = { "CodeSnap", "CodeSnapSave" },
    opts = {
      save_path = "~/Pictures",
      has_breadcrumbs = true,
      has_line_number = true,
      bg_theme = "grape",
    },
  },
  -- ====================

  -- == Examples of Overriding Plugins ==

  -- customize alpha options
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      -- customize the dashboard header
      opts.section.header.val = {
        " █████  ███████ ████████ ██████   ██████",
        "██   ██ ██         ██    ██   ██ ██    ██",
        "███████ ███████    ██    ██████  ██    ██",
        "██   ██      ██    ██    ██   ██ ██    ██",
        "██   ██ ███████    ██    ██   ██  ██████",
        " ",
        "    ███    ██ ██    ██ ██ ███    ███",
        "    ████   ██ ██    ██ ██ ████  ████",
        "    ██ ██  ██ ██    ██ ██ ██ ████ ██",
        "    ██  ██ ██  ██  ██  ██ ██  ██  ██",
        "    ██   ████   ████   ██ ██      ██",
      }
      return opts
    end,
  },

  -- You can disable default plugins as follows:
  { "max397574/better-escape.nvim", enabled = false },

  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom luasnip configuration such as filetype extend or custom snippets
      local luasnip = require "luasnip"
      luasnip.filetype_extend("javascript", { "javascriptreact" })
    end,
  },

  {
    "windwp/nvim-autopairs",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom autopairs configuration such as custom rules
      local npairs = require "nvim-autopairs"
      local Rule = require "nvim-autopairs.rule"
      local cond = require "nvim-autopairs.conds"
      npairs.add_rules(
        {
          Rule("$", "$", { "tex", "latex" })
            -- don't add a pair if the next character is %
            :with_pair(cond.not_after_regex "%%")
            -- don't add a pair if  the previous character is xxx
            :with_pair(
              cond.not_before_regex("xxx", 3)
            )
            -- don't move right when repeat character
            :with_move(cond.none())
            -- don't delete if the next character is xx
            :with_del(cond.not_after_regex "xx")
            -- disable adding a newline when you press <cr>
            :with_cr(cond.none()),
        },
        -- disable for .vim files, but it work for another filetypes
        Rule("a", "a", "-vim")
      )
    end,
  },
}
