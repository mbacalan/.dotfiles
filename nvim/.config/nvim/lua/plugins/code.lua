return {
	"nvim-lua/plenary.nvim",
	"tpope/vim-fugitive",
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		config = function()
			local harpoon = require("harpoon")
			harpoon:setup()

			vim.keymap.set("n", "<leader>a", function()
				harpoon:list():add()
			end)
			vim.keymap.set("n", "<C-e>", function()
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end)
		end,
	},
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
		"lewis6991/gitsigns.nvim",
		opts = {},
	},
	{
		"folke/ts-comments.nvim",
		event = "VeryLazy",
		opts = {},
	},
}
