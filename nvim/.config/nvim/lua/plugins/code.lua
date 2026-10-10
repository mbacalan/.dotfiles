return {
	{
		"ThePrimeagen/refactoring.nvim",
		dependencies = { "lewis6991/async.nvim" },
		config = function()
			require("refactoring").setup()

			vim.keymap.set({ "n", "x" }, "<leader>rr", function()
				require("refactoring").select_refactor()
			end)

			vim.keymap.set("n", "<leader>rp", function()
				require("refactoring.debug").print_loc()
			end)

			vim.keymap.set({ "x", "n" }, "<leader>rv", function()
				require("refactoring.debug").print_var()
			end)

			vim.keymap.set("n", "<leader>rc", function()
				require("refactoring.debug").cleanup()
			end)
		end,
	},
	{
		"folke/ts-comments.nvim",
		event = "VeryLazy",
		opts = {},
	},
}
