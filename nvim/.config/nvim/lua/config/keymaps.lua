-- use "jj" as escape key
vim.api.nvim_set_keymap("i", "jj", "<Esc>", { noremap = false })

-- Select all
-- vim.keymap.set("n", "<M-a>", "ggVG", { desc = "Select All" })
vim.keymap.set("n", "<M-a>", function()
  vim.g.snacks_animate = false
  vim.schedule(function()
    vim.cmd("normal! ggVG")
    vim.g.snacks_animate = true
  end)
end, { desc = "Select All" })

-- Notify on save
vim.keymap.set({ "i", "x", "n", "s" }, "<C-s>", function()
  vim.cmd("w")
  Snacks.notify.info("File saved!")
end, { desc = "Save file" })
