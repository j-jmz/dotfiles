return {
	{
		"mrjones2014/smart-splits.nvim",
		config = function()
			vim.keymap.set("n", "<C-h>", function()
				require("smart-splits").move_cursor_left()
			end)
			vim.keymap.set("n", "<C-j>", function()
				require("smart-splits").move_cursor_down()
			end)
			vim.keymap.set("n", "<C-k>", function()
				require("smart-splits").move_cursor_up()
			end)
			vim.keymap.set("n", "<C-l>", function()
				require("smart-splits").move_cursor_right()
			end)
		end,
	},
}
