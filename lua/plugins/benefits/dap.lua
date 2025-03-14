return {
  {
    "williamboman/mason.nvim",
    "mfussenegger/nvim-dap",
    "jay-babu/mason-nvim-dap.nvim",
    config = function()
      require("mason").setup()
      require("mason-nvim-dap").setup({
        -- Makes a best effort to setup the various debuggers with
        -- reasonable debug configurations
        automatic_setup = true,
        automatic_installation = true,

        -- You can provide additional configuration to the handlers,
        -- see mason-nvim-dap README for more information
        handlers = {},

        -- You'll need to check that you have the required things installed
        -- online, please don't ask me how to install them :)
        ensure_installed = {
          -- Update this to ensure that you have the debuggers for the langs you want
          -- 'delve',
          -- Add your own debuggers here
          "debugpy",
        },
      })
    end,
  },
  {
    "https://github.com/mfussenegger/nvim-dap",
    dependencies = {
      -- Creates a beautiful debugger UI
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
      "theHamsta/nvim-dap-virtual-text",
      -- Installs the debug adapters for you
      "williamboman/mason.nvim",
      "jay-babu/mason-nvim-dap.nvim",
      "mfussenegger/nvim-dap-python",
    },
    enable = true,
    keys = {
      {
        "<leader>db",
        function()
          require("dap").toggle_breakpoint()
        end,
        desc = "Toggle Breakpoint",
      },
      {
        "<leader>dc",
        function()
          require("dap").continue()
        end,
        desc = "Run/Continue",
      },
      {
        "<leader>do", -- do the method in one stop
        function()
          require("dap").step_over()
        end,
        desc = "Step Over",
      },
      {
        "<leader>di", -- step into the funtion call
        function()
          require("dap").step_into()
        end,
        desc = "Step Into",
      },
      {
        "<leader>dO",
        function()
          require("dap").step_out()
        end,
        desc = "Step Out",
      },
      {
        "<leader>dq",
        function()
          require("dap").terminate()
        end,
        desc = "Terminate",
      },
      {
        "<leader>dC",
        function()
          require("dap").run_to_cursor()
        end,
        desc = "Run to Cursor",
      },
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      local dap_python = require("dap-python")

      require("dapui").setup({})
      require("nvim-dap-virtual-text").setup({
        commented = true, -- Show virtual text alongside comment
      })

      -- In installed in a virtual environment
      -- require("dap-python").setup("/path/to/venv/bin/python")

      -- If installed globally
      -- require("dap-python").setup("python")

      -- if using uv
      -- require("dap-python").setup("uv")
      dap_python.setup("uv")

      -- dap_python.setup("python3")

      vim.fn.sign_define("DapBreakpoint", {
        text = "",
        texthl = "DiagnosticSignError",
        linehl = "",
        numhl = "",
      })

      vim.fn.sign_define("DapBreakpointRejected", {
        text = "", -- or "❌"
        texthl = "DiagnosticSignError",
        linehl = "",
        numhl = "",
      })

      vim.fn.sign_define("DapStopped", {
        text = "", -- or "→"
        texthl = "DiagnosticSignWarn",
        linehl = "Visual",
        numhl = "DiagnosticSignWarn",
      })

      -- Automatically open/close DAP UI
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end

      local opts = { noremap = true, silent = true }

      -- -- Toggle breakpoint
      -- vim.keymap.set("n", "<leader>db", function()
      --   dap.toggle_breakpoint()
      -- end, opts)
      --
      -- -- Continue / Start
      -- vim.keymap.set("n", "<leader>dc", function()
      --   dap.continue()
      -- end, opts)
      --
      -- -- Step Over
      -- vim.keymap.set("n", "<leader>do", function()
      --   dap.step_over()
      -- end, opts)
      --
      -- -- Step Into
      -- vim.keymap.set("n", "<leader>di", function()
      --   dap.step_into()
      -- end, opts)
      --
      -- -- Step Out
      -- vim.keymap.set("n", "<leader>dO", function()
      --   dap.step_out()
      -- end, opts)
      --
      -- -- Keymap to terminate debugging
      -- vim.keymap.set("n", "<leader>dq", function()
      --   require("dap").terminate()
      -- end, opts)

      -- Toggle DAP UI
      vim.keymap.set("n", "<leader>du", function()
        dapui.toggle()
      end, opts)
    end,
  },
}
