return {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
      config = function()
            --[[Treesitter]] --
            local configs = require("nvim-treesitter.configs")

            configs.setup({
                --ensure_installed = {"lua", "vim", "javascript", "html", "python", "css"}, -- we install language for highligh and indent
                auto_install=true,
                sync_install = false,
                highlight = {
                    enable = true
                }, -- we want syntax highligh
                indent = {
                    enable = true
                } -- we want indent
            })
      end
  } -- treesitter
