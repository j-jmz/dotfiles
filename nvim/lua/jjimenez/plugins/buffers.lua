return {
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("bufferline").setup({})
			vim.keymap.set("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Previous buffer tab" })
			vim.keymap.set("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer tab" })
			vim.keymap.set("n", ">b", "<cmd>BufferLineMoveNext<cr>", { desc = "Move buffer tab right" })
			vim.keymap.set("n", "<b", "<cmd>BufferLineMovePrev<cr>", { desc = "Move buffer tab left" })
		end,
	},
	-- NOTE: buffer close (<leader>c) moved to snacks.lua (Snacks.bufdelete),
	-- replacing famiu/bufdelete.nvim
}

