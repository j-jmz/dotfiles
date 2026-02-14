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
				css = { "prettierd", "prettier", stop_after_first = true },
				erb = { "htmlbeautifier" },
				graphql = { "prettierd", "prettier", stop_after_first = true },
				html = { "htmlbeautifier" },
				java = { "google-java-format" },
				javascript = { "prettierd", "prettier", stop_after_first = true },
				javascriptreact = { "prettierd", "prettier", stop_after_first = true },
				json = { "prettierd", "prettier", stop_after_first = true },
				kotlin = { "ktlint" },
				lua = { "stylua" },
				markdown = { "prettierd", "prettier", stop_after_first = true },
				proto = { "buf" },
				python = { "isort", "black" },
				rust = { "rustfmt" },
				scss = { "prettierd", "prettier", stop_after_first = true },
				svelte = { "prettierd", "prettier", stop_after_first = true },
				toml = { "taplo" },
				typescript = { "prettierd", "prettier", stop_after_first = true },
				typescriptreact = { "prettierd", "prettier", stop_after_first = true },
				yaml = { "yamlfix" },
			},
		},
	},
}
-- vim: ts=2 sts=2 sw=2 et
