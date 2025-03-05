-- use "jj" as escape key
vim.api.nvim_set_keymap("i", "jj", "<Esc>", { noremap = false })

-- Select all
vim.api.nvim_set_keymap("n", "<M-a>", "ggVG", { desc = "Select all" })

-- Notify on save
vim.keymap.set({ "i", "x", "n", "s" }, "<C-s>", function()
  vim.cmd("w")
  Snacks.notify.info("File saved!")
end, { desc = "Save file" })
