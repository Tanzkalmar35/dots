return {
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"rouge8/neotest-java",
			"nvim-neotest/nvim-nio",
			"mfussenegger/nvim-jdtls",
		},
		config = function()
			local neotest_java = require("neotest-java")

			-- Then setup neotest with the adapter
			require("neotest").setup({
				adapters = {
					neotest_java({
						runner = "gradle", -- or "mvn"
						-- Enable for JUnit 5 (default)
						jupiter = true,
					}),
				},
				status = { virtual_text = true },
				output = { open_on_run = true },
				-- summary = {
				-- 	open = "botright vsplit | vertical resize 50",
				-- 	mappings = {
				-- 		expand = { "<CR>", "<2-LeftMouse>" },
				-- 		run = "r",
				-- 		stop = "s",
				-- 		attach = "a",
				-- 		jumpto = "<C-o>",
				-- 	},
				-- },
			})

			local neotest = require("neotest")

			-- Core Testing Keybindings
			vim.keymap.set("n", "<leader>tt", function()
				neotest.run.run()
			end, { desc = "Run nearest test" })
			vim.keymap.set("n", "<leader>tT", function()
				neotest.run.run(vim.fn.getcwd())
			end, { desc = "Run all tests" })
			vim.keymap.set("n", "<leader>tf", function()
				neotest.run.run(vim.fn.expand("%"))
			end, { desc = "Run current file" })
			vim.keymap.set("n", "<leader>ts", function()
				neotest.run.run({ suite = true })
			end, { desc = "Run test suite" })
			vim.keymap.set("n", "<leader>tr", function()
				neotest.run.run_last()
			end, { desc = "Rerun last test" })
			vim.keymap.set("n", "<leader>td", function()
				neotest.run.run({ strategy = "dap" })
			end, { desc = "Debug test" })

			-- Summary Window Keybindings
			vim.keymap.set("n", "<leader>tS", function()
				neotest.summary.toggle()
			end, { desc = "Toggle test summary" })
			vim.keymap.set("n", "<leader>tO", function()
				neotest.output.open({ enter = true })
			end, { desc = "Show test output" })
			vim.keymap.set("n", "<leader>tC", function()
				neotest.output_panel.clear()
			end, { desc = "Clear test output" })
		end,
	},
}
