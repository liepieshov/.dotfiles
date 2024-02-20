-- You dont need to set any of these options. These are the default ones. Only
-- the loading is important
local telescope = require("telescope")
-- local fb_actions = telescope.extensions.file_browser.actions
local builtin = require("telescope.builtin")
telescope.setup({
    pickers = {
        find_files = { hidden = true },
        live_grep = {
            additional_args = function(opts)
                return { "--hidden" }
            end,
        },
    },
    extensions = {
        fzf = {
            fuzzy = true,          -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case", -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
        },
        -- fzf_writer = {
        --     minimum_grep_characters = 2,
        --     minimum_files_characters = 2,

        -- Disabled by default.
        -- Will probably slow down some aspects of the sorter, but can make color highlights.
        -- I will work on this more later.
        -- use_highlighter = true,
        -- },
        -- file_browser = {
        --     theme = "ivy",
        --     -- disables netrw and use telescope-file-browser in its place
        --     hijack_netrw = false,
        --     git_status = true,
        --     hidden = true,
        --     mappings = {
        --         ["n"] = {
        --             ["-"] = fb_actions.goto_parent_dir,
        --             f = false,
        --         },
        --     },
        -- },
    },
    defaults = {
        mappings = {
            i = {
                ["<C-u>"] = false,
                ["<C-d>"] = false,
            },
        },
    },
})
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
telescope.load_extension("fzf")
-- telescope.load_extension("fzf-writer")

builtin = require("telescope.builtin")
-- See `:help telescope.builtin`
vim.keymap.set("n", "<leader>?", builtin.oldfiles, { desc = "[?] Find recently opened files" })
vim.keymap.set("n", "<leader><space>", builtin.buffers, { desc = "[ ] Find existing buffers" })
vim.keymap.set("n", "<leader>/", function()
    -- You can pass additional configuration to telescope to change theme, layout, etc.
    builtin.current_buffer_fuzzy_find()
    -- (require('telescope.themes').get_dropdown {
    --   winblend = 10,
    --   previewer = false,
    -- })
end, { desc = "[/] Fuzzily search in current buffer" })

function vim.getVisualSelection()
    vim.cmd('noau normal! "vy"')
    local text = vim.fn.getreg("v")
    vim.fn.setreg("v", {})

    text = string.gsub(text, "\n", "")
    if #text > 0 then
        return text
    else
        return ""
    end
end

local tb = require("telescope.builtin")
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>gf", builtin.git_files, { desc = "[G]it [F]iles" })
vim.keymap.set("n", "<leader>sf", require("telescope.builtin").find_files, { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
vim.keymap.set("n", "<leader>sg", require("telescope.builtin").live_grep, { desc = "[S]earch by [G]rep" })
-- vim.keymap.set("n", "<leader>sg", require("telescope.builtin").live_grep, { desc = "[S]earch by [G]rep" })
vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
vim.keymap.set("v", "<leader>/", function()
    local text = vim.getVisualSelection()
    tb.current_buffer_fuzzy_find({ default_text = text })
end, opts)
vim.keymap.set("v", "<leader>sg", function()
    local text = vim.getVisualSelection()
    tb.live_grep({ default_text = text })
end, opts)

-- To get telescope-file-browser loaded and working with telescope,
-- you need to call load_extension, somewhere after setup function:
-- require("telescope").load_extension("file_browser")
