return {
  {
    'folke/trouble.nvim',
    opts = {
      focus = true,
      win = {
        position = "bottom"
      }
    },
    cmd = "Trouble",
    specs = {
      "folke/snacks.nvim",
      opts = function(_, opts)
        return vim.tbl_deep_extend("force", opts or {}, {
          picker = {
            actions = require("trouble.sources.snacks").actions,
            win = {
              input = {
                keys = {
                  ["<c-t>"] = {
                    "trouble_open",
                    mode = { "n", "i" },
                  },
                },
              },
            },
          },
        })
      end,
    },
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle focus=true win.position=bottom<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle focus=true filter.buf=0 win.position=bottom<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=true win.position=bottom<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=true win.position=bottom<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle focus=true win.position=bottom<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle focus=true win.position=bottom<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
  }
}
