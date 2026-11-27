-- dap.lua
--
-- Debug Adapter Protocol setup, merged from the former dap.lua (Python/Rust/C++)
-- and debug.lua (Go, via mason-nvim-dap) into one config with no colliding keymaps.

return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"theHamsta/nvim-dap-virtual-text",
			"nvim-neotest/nvim-nio",
			"williamboman/mason.nvim",
			"jay-babu/mason-nvim-dap.nvim",
			"mfussenegger/nvim-dap-python",
			"leoluz/nvim-dap-go",
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			local dap_python = require("dap-python")

			-- Go: install `delve` and auto-configure it via mason-nvim-dap
			require("mason-nvim-dap").setup({
				automatic_setup = true,
				handlers = {},
				ensure_installed = {
					"delve",
				},
			})
			require("dap-go").setup()

			-- Python
			dap_python.setup("python3")

			-- C++ and Rust
			dap.adapters.lldb = {
				type = "executable",
				command = "/usr/bin/codelldb", --vim.fn.exepath("rust-lldb"), -- adjust as needed
				name = "lldb",
			}

			dap.configurations.rust = {
				{
					name = "Launch file",
					type = "lldb", -- matches the adapter
					request = "launch", -- could also attach to a currently running process
					program = function()
						return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
					end,
					cwd = "${workspaceFolder}",
					stopOnEntry = false,
					initCommands = function()
						-- Find out where to look for the pretty printer Python module
						local rustc_sysroot = vim.fn.trim(vim.fn.system("rustc --print sysroot"))

						local script_import = 'command script import "'
							.. rustc_sysroot
							.. '/lib/rustlib/etc/lldb_lookup.py"'
						local commands_file = rustc_sysroot .. "/lib/rustlib/etc/lldb_commands"

						local commands = {}
						local file = io.open(commands_file, "r")
						if file then
							for line in file:lines() do
								table.insert(commands, line)
							end
							file:close()
						end
						table.insert(commands, 1, script_import)

						return commands
					end,
				},
			}

			-- Signs
			vim.fn.sign_define("DapBreakpoint", {
				text = "",
				texthl = "DiagnosticSignError",
				linehl = "",
				numhl = "",
			})

			vim.fn.sign_define("DapBreakpointRejected", {
				text = "", -- or "❌"
				texthl = "DiagnosticSignError",
				linehl = "",
				numhl = "",
			})

			vim.fn.sign_define("DapStopped", {
				text = "", -- or "→"
				texthl = "DiagnosticSignWarn",
				linehl = "Visual",
				numhl = "DiagnosticSignWarn",
			})

			-- Dap UI
			dapui.setup({
				icons = { expanded = "▾", collapsed = "▸", current_frame = "*" },
				controls = {
					icons = {
						pause = "⏸",
						play = "▶",
						step_into = "⏎",
						step_over = "⏭",
						step_out = "⏮",
						step_back = "b",
						run_last = "▶▶",
						terminate = "⏹",
						disconnect = "⏏",
					},
				},
			})

			require("nvim-dap-virtual-text").setup({
				commented = true, -- Show virtual text alongside comment
			})

			-- Keymaps: one definitive set, no collisions
			vim.keymap.set("n", "<F5>", dap.continue, { desc = "Debug: Start/Continue" })
			vim.keymap.set("n", "<F1>", dap.step_into, { desc = "Debug: Step Into" })
			vim.keymap.set("n", "<F2>", dap.step_over, { desc = "Debug: Step Over" })
			vim.keymap.set("n", "<F3>", dap.step_out, { desc = "Debug: Step Out" })
			vim.keymap.set("n", "<F4>", dap.step_back, { desc = "Debug: Step Back" })
			vim.keymap.set("n", "<F7>", dapui.toggle, { desc = "Debug: See last session result" })
			vim.keymap.set("n", "<F13>", dap.restart, { desc = "Debug: Restart" })

			vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
			vim.keymap.set("n", "<leader>B", function()
				dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
			end, { desc = "Debug: Set Breakpoint" })
			vim.keymap.set("n", "<leader>gb", dap.run_to_cursor, { desc = "Debug: Run to Cursor" })
			vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Debug: Continue" })

			vim.keymap.set("n", "<leader>?", function()
				dapui.eval(nil, { enter = true })
			end, { desc = "Debug: Eval under cursor" })

			-- Auto-open/close dapui
			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end
			dap.listeners.after.event_initialized.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end
		end,
	},
}
-- vim: ts=2 sts=2 sw=2 et
