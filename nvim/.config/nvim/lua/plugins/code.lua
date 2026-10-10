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
				mode = { "n", "x" },
			},
			{
				"<leader>rp",
				function()
					require("refactoring.debug").print_loc()
				end,
			},
			{
				"<leader>rv",
				function()
					require("refactoring.debug").print_var()
				end,
				mode = { "x", "n" },
			},
			{
				"<leader>rc",
				function()
					require("refactoring.debug").cleanup()
				end,
			},
		},
	},
	{
		"folke/ts-comments.nvim",
		event = "VeryLazy",
		opts = {},
	},
}
