return {
  { "github/copilot.vim", enabled = false },
  {
    "luozhiya/fittencode.nvim",
    enabled = true,
    opts = {},
    config = function()
      require("fittencode").setup({
        action = {
          document_code = {
            -- Show "Fitten Code - Document Code" in the editor context menu, when you right-click on the code.
            show_in_editor_context_menu = true,
          },
          edit_code = {
            -- Show "Fitten Code - Edit Code" in the editor context menu, when you right-click on the code.
            show_in_editor_context_menu = true,
          },
          explain_code = {
            -- Show "Fitten Code - Explain Code" in the editor context menu, when you right-click on the code.
            show_in_editor_context_menu = true,
          },
          find_bugs = {
            -- Show "Fitten Code - Find Bugs" in the editor context menu, when you right-click on the code.
            show_in_editor_context_menu = true,
          },
          generate_unit_test = {
            -- Show "Fitten Code - Generate UnitTest" in the editor context menu, when you right-click on the code.
            show_in_editor_context_menu = true,
          },
          start_chat = {
            -- Show "Fitten Code - Start Chat" in the editor context menu, when you right-click on the code.
            show_in_editor_context_menu = true,
          },
          identify_programming_language = {
            -- Identify programming language of the current buffer
            -- * Unnamed buffer
            -- * Buffer without file extension
            -- * Buffer no filetype detected
            identify_buffer = true,
          },
        },
        disable_specific_inline_completion = {
          -- Disable auto-completion for some specific file suffixes by entering them below
          -- For example, `suffixes = {'lua', 'cpp'}`
          suffixes = {},
        },
        inline_completion = {
          -- Enable inline code completion.
          ---@type boolean
          enable = true,
          -- Disable auto completion when the cursor is within the line.
          ---@type boolean
          disable_completion_within_the_line = false,
          -- Disable auto completion when pressing Backspace or Delete.
          ---@type boolean
          disable_completion_when_delete = false,
          -- Auto triggering completion
          ---@type boolean
          auto_triggering_completion = true,
          -- Accept Mode
          -- Available options:
          -- * `commit` (VSCode style accept, also default)
          --   - `Tab` to Accept all suggestions
          --   - `Ctrl+Right` to Accept word
          --   - `Ctrl+Down` to Accept line
          --   - Interrupt
          --      - Enter a different character than suggested
          --      - Exit insert mode
          --      - Move the cursor
          -- * `stage` (Stage style accept)
          --   - `Tab` to Accept all staged characters
          --   - `Ctrl+Right` to Stage word
          --   - `Ctrl+Left` to Revoke word
          --   - `Ctrl+Down` to Stage line
          --   - `Ctrl+Up` to Revoke line
          --   - Interrupt(Same as `commit`, but with the following changes:)
          --      - Characters that have already been staged will be lost.
          accept_mode = "commit",
        },
        delay_completion = {
          -- Delay time for inline completion (in milliseconds).
          ---@type integer
          delaytime = 0,
        },
        prompt = {
          -- Maximum number of characters to prompt for completion/chat.
          max_characters = 1000000,
        },
        chat = {
          -- Highlight the conversation in the chat window at the current cursor position.
          highlight_conversation_at_cursor = false,
          -- Style
          -- Available options:
          -- * `sidebar` (Siderbar style, also default)
          -- * `floating` (Floating style)
          style = "sidebar",
          sidebar = {
            -- Width of the sidebar in characters.
            width = 42,
            -- Position of the sidebar.
            -- Available options:
            -- * `left`
            -- * `right`
            position = "left",
          },
          floating = {
            -- Border style of the floating window.
            -- Same border values as `nvim_open_win`.
            border = "rounded",
            -- Size of the floating window.
            -- <= 1: percentage of the screen size
            -- >  1: number of lines/columns
            size = { width = 0.8, height = 0.8 },
          },
        },
        -- Enable/Disable the default keymaps in inline completion.
        use_default_keymaps = true,
        -- Default keymaps
        keymaps = {
          inline = {
            ["<TAB>"] = "accept_all_suggestions",
            ["<C-Down>"] = "accept_line",
            ["<C-Right>"] = "accept_word",
            ["<C-Up>"] = "revoke_line",
            ["<C-Left>"] = "revoke_word",
            ["<A-\\>"] = "triggering_completion",
          },
          chat = {
            ["q"] = "close",
            ["[c"] = "goto_previous_conversation",
            ["]c"] = "goto_next_conversation",
            ["c"] = "copy_conversation",
            ["C"] = "copy_all_conversations",
            ["d"] = "delete_conversation",
            ["D"] = "delete_all_conversations",
          },
        },
        -- Setting for source completion.
        source_completion = {
          -- Enable source completion.
          enable = true,
          -- engine support nvim-cmp and blink.cmp
          engine = "blink", -- "cmp" | "blink"
          -- trigger characters for source completion.
          -- Available options:
          -- * A  list of characters like {'a', 'b', 'c', ...}
          -- * A function that returns a list of characters like `function() return {'a', 'b', 'c', ...}`
          trigger_chars = {},
        },
        -- Set the mode of the completion.
        -- Available options:
        -- * 'inline' (VSCode style inline completion)
        -- * 'source' (integrates into other completion plugins)
        completion_mode = "inline",
        ---@class LogOptions
        log = {
          -- Log level.
          level = vim.log.levels.WARN,
          -- Max log file size in MB, default is 10MB
          max_size = 10,
        },
      })
    end,
  },
  {
    "saghen/blink.cmp",
    lazy = false, -- lazy loading handled internally
    -- optional: provides snippets for the snippet source
    dependencies = "rafamadriz/friendly-snippets",

    -- use a release tag to download pre-built binaries
    version = "v0.*",
    -- OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
    -- build = 'cargo build --release',
    -- If you use nix, you can build from source using latest nightly rust with:
    -- build = 'nix run .#build-plugin',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      -- 'default' for mappings similar to built-in completion
      -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
      -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
      -- see the "default configuration" section below for full documentation on how to define
      -- your own keymap.
      keymap = {
        preset = "enter",
        ["<C-n>"] = { "select_next", "fallback" },
        ["<C-p"] = { "select_prev", "fallback" },

        ["<C-a"] = { "show", "show_documentation", "hide_documentation" },
        ["<C-e"] = { "hide", "fallback" },
      },

      appearance = {
        -- Sets the fallback highlight groups to nvim-cmp's highlight groups
        -- Useful for when your theme doesn't support blink.cmp
        -- will be removed in a future release
        use_nvim_cmp_as_default = false,
        -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- Adjusts spacing to ensure icons are aligned
        nerd_font_variant = "mono",
      },

      -- default list of enabled providers defined so that you can extend it
      -- elsewhere in your config, without redefining it, via `opts_extend`
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
        -- default = { default = { "luasnip" } },
        -- optionally disable cmdline completions
        -- cmdline = {},
      },
      completion = {
        accept = {
          -- experimental auto-brackets support
          auto_brackets = {
            enabled = true,
          },
        },
        menu = {
          draw = {
            treesitter = { "lsp" },
          },
        },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 200,
        },
        ghost_text = {
          -- enabled = vim.g.ai_cmp,
          enabled = false,
        },
      },

      -- experimental signature help support
      -- signature = { enabled = true }
    },
    -- allows extending the providers array elsewhere in your config
    -- without having to redefine it
    opts_extend = { "sources.default" },
    snippets = {
      expand = function(snippet)
        require("luasnip").lsp_expand(snippet)
      end,
      active = function(filter)
        if filter and filter.direction then
          return require("luasnip").jumpable(filter.direction)
        end
        return require("luasnip").in_snippet()
      end,
      jump = function(direction)
        require("luasnip").jump(direction)
      end,
    },
  },
}
