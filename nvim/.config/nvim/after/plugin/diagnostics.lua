-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

local function fmt(diagnostic)
    if diagnostic.code then
        return ("[%s] %s"):format(diagnostic.code, diagnostic.message)
    end
    return diagnostic.message
end

vim.diagnostic.config({
    virtual_text = {
        source = "always", -- Or "if_many"
        prefix = "●", -- Could be '■', '▎', 'x'
        format = fmt,
    },
    severity_sort = true,
    float = {
        source = "always", -- Or "if_many"
        format = fmt,
    },
})
