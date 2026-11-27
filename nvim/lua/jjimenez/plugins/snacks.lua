return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		---@type snacks.Config
		opts = {
			-- Replaces famiu/bufdelete.nvim
			bufdelete = { enabled = true },
			-- Replaces lukas-reineke/indent-blankline.nvim
			indent = {
				enabled = true,
				indent = { char = "┊" },
			},
			-- Replaces kdheepak/lazygit.nvim
			lazygit = { enabled = true },
		},
		keys = {
			{
				"<leader>c",
				function()
					Snacks.bufdelete()
				end,
				desc = "[C]lose buffer",
			},
			{
				"<leader>gg",
				function()
					Snacks.lazygit()
				end,
				desc = "Open LazyGit",
			},
		},
	},
}
-- vim: ts=2 sts=2 sw=2 et
