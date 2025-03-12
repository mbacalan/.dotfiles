return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      bigfile = { enabled = true },
      indent = { enabled = true },
      input = { enabled = true },
      picker = { enabled = true },
      scope = { enabled = true },
      words = { enabled = true },
      rename = { enabled = true },
      -- explorer = { enabled = true },
      -- notifier = { enabled = true },
      -- quickfile = { enabled = true },
      -- scroll = { enabled = true },
      -- statuscolumn = { enabled = true },
    },
    keys = {
      -- snacks.picker
      { "<leader><space>", function() Snacks.picker.smart() end,            desc = "Smart Find Files" },
      { "<leader>fs",      function() Snacks.picker.grep() end,             desc = "Grep" },
      { "<leader>ff",      function() Snacks.picker.files() end,            desc = "Find Files" },
      { "<leader>fg",      function() Snacks.picker.git_files() end,        desc = "Find Git Files" },
      { "<leader>fe",      function() Snacks.explorer() end,                desc = "File Explorer" },
      -- { "<leader>,",       function() Snacks.picker.buffers() end,         desc = "Buffers" },
      -- { "<leader>:",       function() Snacks.picker.command_history() end, desc = "Command History" },
      -- { "<leader>n",       function() Snacks.picker.notifications() end,   desc = "Notification History" },
      -- snacks.words
      { "]]",              function() Snacks.words.jump(vim.v.count1) end,  desc = "Next Reference",  mode = { "n", "t" } },
      { "[[",              function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference",  mode = { "n", "t" } },
    }
  }
}
