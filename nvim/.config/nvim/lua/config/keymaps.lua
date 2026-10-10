-- Center cursor while going up and down
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll Down (centered)" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll Up (centered)" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Next Match (centered)" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Prev Match (centered)" })
