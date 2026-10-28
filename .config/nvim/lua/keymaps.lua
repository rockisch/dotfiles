--- BUFFER HANDLING
vim.keymap.set("n", "<leader>bd", function()
    require("mini.bufremove").delete()
end, { desc = "Delete buffer, keep window" })

---- FZF SETUP
local fzf = require("fzf-lua")

-- Files and buffers
vim.keymap.set("n", "<C-p>",      fzf.files,    { desc = "Find files" })
vim.keymap.set("n", "<leader>ff", fzf.files,    { desc = "Find files" })
vim.keymap.set("n", "<leader>fF", function ()
    fzf.files({
        cwd = "/",
        hidden = true,
        prompt = "Files (/)> "
    })
end, {
    desc = "Find files (entire filesystem)",
})
vim.keymap.set("n", "<leader>fb", fzf.buffers,  { desc = "Find buffers" })
vim.keymap.set("n", "<leader>fr", fzf.oldfiles, { desc = "Recent files" })

-- Searching
vim.keymap.set("n", "<leader>fg", function()
    fzf.live_grep({
        rg_opts = [[--column --line-number --no-heading --color=always --smart-case --max-columns=4096 --fixed-strings -e]]
    })
end, {
    desc = "Live grep",
})
vim.keymap.set("n", "<leader>fG", fzf.live_grep,  { desc = "Live grep (Regex)" })
vim.keymap.set("n", "<leader>fw", fzf.grep_cword, { desc = "Search current word" })
vim.keymap.set("x", "<leader>fw", fzf.grep_visual, { desc = "Search selection" })
vim.keymap.set("n", "<leader>f/", fzf.blines,     { desc = "Search current buffer" })

-- Miscellaneous
vim.keymap.set("n", "<leader>fh", fzf.helptags, { desc = "Search help" })
vim.keymap.set("n", "<leader>fk", fzf.keymaps,  { desc = "Search keymaps" })
vim.keymap.set("n", "<leader>fR", fzf.resume,   { desc = "Resume last picker" })
vim.keymap.set("n", "<leader>fa", fzf.builtin,  { desc = "All fzf-lua pickers" })

