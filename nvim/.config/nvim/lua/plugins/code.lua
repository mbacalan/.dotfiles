return {
	{
		"ThePrimeagen/refactoring.nvim",
		dependencies = { "lewis6991/async.nvim" },
		opts = {},
		keys = {
			{
				"<leader>rr",
				function()
					require("refactoring").select_refactor()
				end,
				desc = "Select Refactor",
				mode = { "n", "x" },
			},
			{
				"<leader>rp",
				function()
					require("refactoring.debug").print_loc()
				end,
				desc = "Debug Print Location",
			},
			{
				"<leader>rv",
				function()
					require("refactoring.debug").print_var()
				end,
				desc = "Debug Print Variable",
				mode = { "x", "n" },
			},
			{
				"<leader>rc",
				function()
					require("refactoring.debug").cleanup()
				end,
				desc = "Debug Print Cleanup",
			},
		},
	},
	{
		"folke/ts-comments.nvim",
		event = "VeryLazy",
		opts = {},
	},
}
