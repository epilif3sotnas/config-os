local keymap = vim.keymap.set
local opts = {
	noremap = true,
	silent = true,
}

-- remap leader key
keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.clipboard = "unnamedplus"

-- keymaps
keymap("n", "<leader><S-h>", "<cmd>lua require('vscode').action('workbench.action.splitEditorLeft')<CR>")
keymap("n", "<leader><S-j>", "<cmd>lua require('vscode').action('workbench.action.splitEditorUp')<CR>")
keymap("n", "<leader><S-k>", "<cmd>lua require('vscode').action('workbench.action.splitEditorDown')<CR>")
keymap("n", "<leader><S-l>", "<cmd>lua require('vscode').action('workbench.action.splitEditorRight')<CR>")

keymap("n", "<leader>zs", "<cmd>lua require('vscode').action('workbench.action.openSettingsJson')<CR>")
keymap("n", "<leader>zk", "<cmd>lua require('vscode').action('workbench.action.openGlobalKeybindingsFile')<CR>")
keymap("n", "<leader>ze", "<cmd>lua require('vscode').action('workbench.view.extensions')<CR>")
keymap("n", "<leader>znt", "<cmd>lua require('vscode').action('notifications.showList')<CR>")
keymap("n", "<leader>znc", "<cmd>lua require('vscode').action('notifications.clearAll')<CR>")

keymap("n", "<leader>po", "<cmd>lua require('vscode').action('workbench.action.files.openFolder')<CR>")
keymap("n", "<leader>pw", "<cmd>lua require('vscode').action('workbench.action.newWindow')<CR>")
keymap("n", "<leader>pc", "<cmd>lua require('vscode').action('workbench.action.closeWindow')<CR>")
keymap("n", "<leader>pr", "<cmd>lua require('vscode').action('workbench.action.openRecent')<CR>")

keymap("n", "<leader>ff", "<cmd>lua require('vscode').action('workbench.action.quickOpen')<CR>")
keymap("n", "<leader>fG", "<cmd>lua require('vscode').action('workbench.action.findInFiles')<CR>")
keymap("n", "<leader>znc", "<cmd>lua require('vscode').action('notifications.clearAll')<CR>")

keymap("n", "<leader>pf", "<cmd>lua require('vscode').action('workbench.files.action.focusFilesExplorer')<CR>")
keymap("n", "<leader>pt", "<cmd>lua require('vscode').action('workbench.action.terminal.toggleTerminal')<CR>")

keymap("n", "<leader>c", "<cmd>lua require('vscode').action('workbench.action.closeActiveEditor')<CR>")
keymap("n", "<leader>bl", "<cmd>lua require('vscode').action('workbench.action.closeEditorsToTheLeft')<CR>")
keymap("n", "<leader>br", "<cmd>lua require('vscode').action('workbench.action.closeEditorsToTheRight')<CR>")
keymap("n", "<leader>bb", "<cmd>lua require('vscode').action('workbench.action.previousEditor')<CR>")
keymap("n", "<leader>bn", "<cmd>lua require('vscode').action('workbench.action.nextEditor')<CR>")
keymap("n", "<leader>ba", "<cmd>lua require('vscode').action('workbench.action.closeAllEditors')<CR>")

keymap("n", "<leader>/", "<cmd>lua require('vscode').action('editor.action.commentLine')<CR>")

keymap("n", "<leader>la", "<cmd>lua require('vscode').action('editor.action.sourceAction')<CR>")
keymap("n", "<leader>lf", "<cmd>lua require('vscode').action('editor.action.format')<CR>")
keymap("n", "<leader>lj", "<cmd>lua require('vscode').action('editor.action.marker.next')<CR>")
keymap("n", "<leader>lk", "<cmd>lua require('vscode').action('editor.action.marker.prev')<CR>")

keymap("n", "<leader>j", "<cmd>lua require('vscode').action('editor.action.insertCursorBelow')<CR>")
keymap("n", "<leader>k", "<cmd>lua require('vscode').action('editor.action.insertCursorAbove')<CR>")

keymap("n", "gI", "<cmd>lua require('vscode').action('editor.action.goToImplementation')<CR>")

keymap("n", "gA", "<cmd>lua require('vscode').action('selectAllSearchEditorMatches')<CR>")
keymap("n", "gl", "<cmd>lua require('vscode').action('editor.action.addSelectionToNextFindMatch')<CR>")
keymap("n", "gL", "<cmd>lua require('vscode').action('editor.action.addSelectionToPreviousFindMatch')<CR>")

keymap('n', 'za', "<cmd>lua require('vscode').action('editor.toggleFold')<CR>")
keymap('n', 'zO', "<cmd>lua require('vscode').action('editor.unfoldRecursively')<CR>")
keymap('n', 'zC', "<cmd>lua require('vscode').action('editor.foldRecursively')<CR>")
keymap('n', 'zR', "<cmd>lua require('vscode').action('editor.unfoldAll')<CR>")
keymap('n', 'zM', "<cmd>lua require('vscode').action('editor.foldAll')<CR>")

keymap("n", "<leader>db", "<cmd>lua require('vscode').action('editor.debug.action.toggleBreakpoint')<CR>")
keymap("n", "<leader>dc", "<cmd>lua require('vscode').action('workbench.action.debug.continue')<CR>")
keymap("n", "<leader>dq", "<cmd>lua require('vscode').action('workbench.action.debug.stop')<CR>")
keymap("n", "<leader>dr", "<cmd>lua require('vscode').action('workbench.action.debug.restart')<CR>")
keymap("n", "<leader>di", "<cmd>lua require('vscode').action('workbench.action.debug.stepInto')<CR>")
keymap("n", "<leader>do", "<cmd>lua require('vscode').action('workbench.action.debug.stepOver')<CR>")
keymap("n", "<leader>dO", "<cmd>lua require('vscode').action('workbench.action.debug.stepOut')<CR>")