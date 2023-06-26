vim.keymap.set("n", "<leader>pv", "<cmd>Ex<CR>")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])
-- quick fix list binds
vim.keymap.set("n", "]q", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "[q", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "]Q", "<cmd>cfirst<CR>zz")
vim.keymap.set("n", "[Q", "<cmd>clast<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lprev<CR>zz")

-- chmod my man
vim.keymap.set(
    "n",
    "<leader>x",
    "<cmd>!chmod +x %<CR>",
    { silent = true, noremap = true, desc = "make a file executable" }
)

-- format that file
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { noremap = true, desc = "format buffer" })

vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set(
    "n",
    "<C-f>",
    "<cmd>silent !tmux neww tmux-sessionizer<CR>",
    { noremap = true, silent = true, desc = "tmux-sessionizer open new project" }
)
vim.keymap.set("n", "<M-Left>", "<cmd>bp<CR>", { noremap = true, silent = true, desc = "remap left" })
vim.keymap.set("n", "<M-Right>", "<cmd>bn<CR>", { noremap = true, silent = true, desc = "remap right" })
