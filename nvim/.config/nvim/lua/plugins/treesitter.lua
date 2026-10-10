return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		lazy = false, -- does not support lazy-loading
		build = ":TSUpdate",
		dependencies = {
			-- puts mason's tree-sitter-cli on PATH, needed to build parsers
			"mason-org/mason.nvim",
			"nvim-treesitter/nvim-treesitter-context",
			{
				"nvim-treesitter/nvim-treesitter-textobjects", -- queries used by mini.ai
				branch = "main",
			},
			{
				"windwp/nvim-ts-autotag",
				event = "VeryLazy",
				opts = {},
			},
		},
		config = function()
			require("nvim-treesitter").install({
				"bash",
				"c",
				"diff",
				"git_config",
				"gitcommit",
				"git_rebase",
				"gitignore",
				"gitattributes",
				"html",
				"javascript",
				"jsdoc",
				"json",
				"lua",
				"luadoc",
				"luap",
				"markdown",
				"markdown_inline",
				"printf",
				"python",
				"query",
				"regex",
				"toml",
				"tsx",
				"typescript",
				"vim",
				"vimdoc",
				"xml",
				"yaml",
			})

			vim.api.nvim_create_autocmd("FileType", {
				desc = "Enable treesitter highlighting and indentation",
				callback = function(args)
					if pcall(vim.treesitter.start, args.buf) then
						vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
					end
				end,
			})
		end,
	},
}
