return {
	{
		"mason-org/mason.nvim",
		opts = {},
	},
	-- Autocompletion
	{
		"saghen/blink.cmp",
		event = "InsertEnter",
		version = "1.*",
		dependencies = {
			{ "rafamadriz/friendly-snippets" },
		},
		opts = {
			keymap = {
				preset = "default",
				["<CR>"] = { "accept", "fallback" },
				["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
				["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
			},
			appearance = {
				nerd_font_variant = "mono",
			},
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},
		},
	},
	-- Formatting
	{
		"stevearc/conform.nvim",
		event = "BufWritePre",
		opts = function()
			local web = { "biome", "prettierd", "prettier", stop_after_first = true }

			return {
				formatters_by_ft = {
					javascript = web,
					typescript = web,
					javascriptreact = web,
					typescriptreact = web,
					json = web,
					css = web,
					svelte = { "prettierd", "prettier", stop_after_first = true },
					go = { "goimports", "gofmt", stop_after_first = true },
				},
				format_on_save = {
					timeout_ms = 2000,
					lsp_format = "fallback",
				},
			}
		end,
	},
	-- LSP
	{
		"neovim/nvim-lspconfig",
		cmd = { "LspInfo", "LspStart" },
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{ "saghen/blink.cmp" },
			{ "mason-org/mason.nvim" },
			{ "mason-org/mason-lspconfig.nvim" },
		},
		config = function()
			vim.api.nvim_create_autocmd("LspAttach", {
				desc = "LSP actions",
				callback = function(event)
					local opts = { buffer = event.buf }

					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, opts)
					vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, opts)
					vim.keymap.set("n", "<F4>", vim.lsp.buf.code_action, opts)
					vim.keymap.set({ "n", "x" }, "<F3>", function()
						require("conform").format({ async = false, timeout_ms = 10000 })
					end, opts)
				end,
			})

			vim.lsp.config("html", { filetypes = { "html", "templ" } })

			-- Installed servers are enabled automatically (automatic_enable)
			require("mason-lspconfig").setup({
				ensure_installed = {
					-- 'clangd',
					"cssls",
					-- 'eslint',
					"html",
					"jsonls",
					"ts_ls",
					"lua_ls",
					-- 'rust_analyzer',
					-- 'gopls'
				},
			})
		end,
	},
}
