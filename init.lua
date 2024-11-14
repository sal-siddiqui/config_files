local keymap = vim.keymap.set

-- remap Esc key
keymap({"n", "v", "i"}, "<C-j>", '<Esc>')

-- skip folds
vim.cmd('nmap k gk')
vim.cmd('nmap j gj')

-- paste without overwriting
keymap("v", "p", 'P', opts)

-- sync system clipboard
vim.opt.clipboard = 'unnamedplus'

-- redo
keymap('n', 'U', '<C-r>')

-- better indent handling
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- move text up and down
keymap("v", "J", ":m .+1<CR>==", opts)
keymap("v", "K", ":m .-2<CR>==", opts)
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)

-- remap leader key
vim.g.mapleader = " "

-- call vscode commands from neovim
keymap({"n", "v"}, "<leader>t", "<cmd>lua require('vscode').action('workbench.action.terminal.toggleTerminal')<CR>") --[[ toggle terminal ]]
keymap({"n", "v"}, "<leader>e", "<cmd>lua require('vscode').action('workbench.view.explorer')<CR>") --[[ toggle explorer ]]
keymap({"n", "v"}, "<leader>f", "<cmd>lua require('vscode').action('workbench.action.quickOpen')<CR>") --[[ opens file navigation ]]
keymap({"n", "v"}, "<leader>p", "<cmd>lua require('vscode').action('workbench.action.showCommands')<CR>") --[[ opens command palette ]]
keymap({"n", "v"}, "<leader>r", "<cmd>lua require('vscode').action('code-runner.run')<CR>") --[[ run code runner ]]
keymap({"n"}, "<leader>s", "<cmd>lua require('vscode').action('workbench.action.files.saveAll')<CR>") --[[ run code runner ]]


 