return {
	dir = vim.fn.expand("~/Desktop/git/nvim/nv-snippets.nvim"),
	-- Explicitly disable GitHub lookup
	-- name = "nv-snippets.nvim", -- Must match directory name
	dev = true, -- Force treat as local plugin
	config = function()
		require("nv-snippets").setup({ keymaps = {
			greet = "<leader>cg",
		} })
	end,
}
