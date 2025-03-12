return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      bigfile = { enabled = true },
      indent = { enabled = true },
      picker = { enabled = true },
      scope = { enabled = true },
      words = { enabled = true },
      rename = { enabled = true },
      statuscolumn = { enabled = true }
    },
    keys = {
      -- snacks.picker
      { "<leader><space>", function() Snacks.picker.smart() end,                desc = "Smart Find Files" },
      { "<leader>fs",      function() Snacks.picker.grep() end,                 desc = "Grep" },
      { "<leader>ff",      function() Snacks.picker.files() end,                desc = "Find Files" },
      { "<leader>fg",      function() Snacks.picker.git_files() end,            desc = "Find Git Files" },
      { "<leader>fe",      function() Snacks.explorer() end,                    desc = "File Explorer" },
      { "<leader>ss",      function() Snacks.picker.lsp_symbols() end,          desc = "LSP Symbols" },
      -- snacks.words
      { "]]",              function() Snacks.words.jump(vim.v.count1) end,      desc = "Next Reference",        mode = { "n", "t" } },
      { "[[",              function() Snacks.words.jump(-vim.v.count1) end,     desc = "Prev Reference",        mode = { "n", "t" } },
      -- lsp
      { "gd",              function() Snacks.picker.lsp_definitions() end,      desc = "Goto Definition" },
      { "gD",              function() Snacks.picker.lsp_declarations() end,     desc = "Goto Declaration" },
      { "gr",              function() Snacks.picker.lsp_references() end,       nowait = true,                  desc = "References" },
      { "gi",              function() Snacks.picker.lsp_implementations() end,  desc = "Goto Implementation" },
      { "gy",              function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },
    }
  }
}
