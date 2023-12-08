vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("i", "jk", "<Esc>")
keymap.set("n", "<leader>sv", "<C-w>v")
keymap.set("n", "<leader>sx", ":close<cr>")

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<cr>")

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>")
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>")
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")
keymap.set("n", "<leader>lds", "<cmd>Telescope lsp_document_symbols<cr>")

