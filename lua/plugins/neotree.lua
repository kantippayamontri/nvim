return {
      "nvim-neo-tree/neo-tree.nvim", -- neo-tree
      branch = "v3.x",
      dependencies = {"nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", "MunifTanjim/nui.nvim"},
      config = function()
              window = {
                  mappings = {
                      ["P"] = {
                          "toggle_preview",
                          config = {
                              use_float = false,
                              use_image_nvim = true
                          }
                      } -- nvim will show preview without change focus
                  }
              }

              filesystem = {
                  follow_current_file = true,
                  filtered_items = {
                      visible = true,
                      show_hidden_count = true,
                      hide_dotfiles = false,
                      hide_gitignored = false
                  }
              }

              vim.keymap.set('n', '<C-n>', ':Neotree filesystem reveal left<Cr>', {}) -- show tab filesystem in left side
              -- vim.keymap.set('n', '<C-S-n>', ':Neotree toggle<Cr>', {}) -- toggle file system bar
      end
  }
