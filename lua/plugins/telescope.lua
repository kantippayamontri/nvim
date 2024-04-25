return
  {
      {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.6', -- telescope
        dependencies = {'nvim-lua/plenary.nvim'},
        config = function()
          --[[Telescope]] --
          local builtin = require("telescope.builtin")
          vim.keymap.set('n', '<C-p>', builtin.find_files, {}) -- find the name of the files 
          vim.keymap.set('n', '<leader>fj', builtin.live_grep, {}) -- find the file that have the world
        end
      },
      {
        'nvim-telescope/telescope-ui-select.nvim',
        config = function()
            require("telescope").setup {
              extensions = {
                ["ui-select"] = {
                  require("telescope.themes").get_dropdown {
                    -- even more opts
                  }

                }
              }
            }
            require("telescope").load_extension("ui-select")
        end
      }
  }
