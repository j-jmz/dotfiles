return {
	{ -- Autoformat
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			notify_on_error = false,
			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
			},
			formatters_by_ft = {
				bash = { "beautysh" },
				cpp = { "clang-format" },
				css = { { "prettierd", "prettier" } },
				erb = { "htmlbeautifier" },
				graphql = { { "prettierd", "prettier" } },
				html = { "htmlbeautifier" },
				java = { "google-java-format" },
				javascript = { { "prettierd", "prettier" } },
				javascriptreact = { { "prettierd", "prettier" } },
				json = { { "prettierd", "prettier" } },
				kotlin = { "ktlint" },
				lua = { "stylua" },
				markdown = { { "prettierd", "prettier" } },
				proto = { "buf" },
				python = { "isort", "black" },
				rust = { "rustfmt" },
				scss = { { "prettierd", "prettier" } },
				svelte = { { "prettierd", "prettier" } },
				toml = { "taplo" },
				typescript = { { "prettierd", "prettier" } },
				typescriptreact = { { "prettierd", "prettier" } },
				yaml = { "yamlfix" },
				-- Conform can also run multiple formatters sequentially
				-- python = { "isort", "black" },
				--
				-- You can use a sub-list to tell conform to run *until* a formatter
				-- is found.
				-- javascript = { { "prettierd", "prettier" } },
			},
		},
	},
}
-- vim: ts=2 sts=2 sw=2 et
