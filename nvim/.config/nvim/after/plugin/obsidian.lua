require("obsidian").setup({
  dir = "~/obsidian_vaults/default/default",
  completion = {
    nvim_cmp = true, -- if using nvim-cmp, otherwise set to false
  }
})
vim.keymap.set(
  "n",
  "gf",
  function()
    if require('obsidian').util.cursor_on_markdown_link() then
      return "<cmd>ObsidianFollowLink<CR>"
    else
      return "gf"
    end
  end,
  { noremap = false, expr = true, desc="Obsidian follow or fallback"}
)
