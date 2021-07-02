require('nvim-web-devicons').setup {}

local I = require('modules.theme.icons')
local apply_globals = require('utils').apply_globals

vim.cmd [[packadd nvim-tree.lua]]

-- Set some variables

local settings = {
    nvim_tree_add_trailing = 0, -- 0 by default, append a trailing slash to folder names,
    nvim_tree_auto_close = 1, -- 0 by default, closes the tree when it's the last window,
    nvim_tree_auto_ignore_ft = {'startify', 'dashboard'}, -- empty by default, don't auto open tree on specific filetypes.,
    nvim_tree_auto_open = 0, -- 0 by default, opens the tree when typing `vim $DIR` or `vim`,
    nvim_tree_disable_netrw = 1, -- 1 by default, disables netrw,
    nvim_tree_follow = 1, -- 0 by default, this option allows the cursor to be updated when entering a buffer,
    nvim_tree_git_hl = 1, -- 0 by default, will enable file highlight for git attributes (can be used without the icons).,
    nvim_tree_gitignore = 1, -- 0 by default,
    nvim_tree_group_empty = 1, -- 0 by default, compact folders that only contain a single folder into one node in the file tree,
    nvim_tree_hide_dotfiles = 1, -- 0 by default, this option hides files and folders starting with a dot `.`,
    nvim_tree_hijack_netrw = 1, -- 1 by default, prevents netrw from automatically opening when opening directories (but lets you keep its other utilities),
    nvim_tree_ignore = {
        ".cache", ".env", ".git", ".routify", ".vscode", "__pycache__/", "dist",
        "node_modules", "target"
    },
    nvim_tree_indent_markers = 1, -- 0 by default, this option shows indent markers when folders are open,
    nvim_tree_lsp_diagnostics = 1, -- 0 by default, will show lsp diagnostics in the signcolumn. See :help nvim_tree_lsp_diagnostics,
    nvim_tree_quit_on_open = 1, -- 0 by default, closes the tree when you open a file,
    nvim_tree_root_folder_modifier = ':~', -- This is the default. See :help filename-modifiers for more options,
    nvim_tree_show_icons = {git = 0, folders = 1, files = 1},
    nvim_tree_side = "left",
    nvim_tree_special_files = {'README.md', 'Makefile', 'MAKEFILE'}, -- List of filenames that gets highlighted with NvimTreeSpecialFile,
    nvim_tree_tab_open = 1, -- 0 by default, will open the tree when entering a new tab and the tree was previously open,
    nvim_tree_width = 30,
    nvim_tree_width_allow_resize = 1 -- 0 by default, will not resize the tree when opening a file,
}

apply_globals(settings)

-- Mappings for nvimtree
local tree_cb = require'nvim-tree.config'.nvim_tree_callback
vim.g.nvim_tree_bindings = {
    {key = "-", cb = tree_cb("preview")},
    {key = "<BS>", cb = tree_cb("close_node")},
    {key = "<C-]>", cb = tree_cb("cd")},
    {key = "<C-r>", cb = tree_cb("full_rename")},
    {key = "<C-t>", cb = tree_cb("tabnew")},
    {key = "<C-v>", cb = tree_cb("vsplit")},
    {key = "<C-x>", cb = tree_cb("split")},
    {key = "<CR>", cb = tree_cb("edit")},
    {key = "<S-CR>", cb = tree_cb("close_node")},
    {key = "<S-Tab>", cb = tree_cb("dir_up")},
    {key = "<Tab>", cb = tree_cb("cd")},
    {key = "H", cb = tree_cb("toggle_dotfiles")},
    {key = "I", cb = tree_cb("toggle_ignored")},
    {key = "R", cb = tree_cb("refresh")},
    {key = "[c", cb = tree_cb("prev_git_item")},
    {key = "]c", cb = tree_cb("next_git_item")},
    {key = "a", cb = tree_cb("create")}, {key = "c", cb = tree_cb("copy")},
    {key = "d", cb = tree_cb("remove")}, {key = "o", cb = tree_cb("edit")},
    {key = "p", cb = tree_cb("paste")}, {key = "q", cb = tree_cb("close")},
    {key = "r", cb = tree_cb("rename")}, {key = "x", cb = tree_cb("cut")}
}

-- default will show icon by default if no icon is provided
-- default shows no icon by default
vim.g.nvim_tree_icons = {
    default = I.files.default .. ' ',
    symlink = I.files.symlink .. ' ',
    git = {
        deleted = I.git.delete,
        staged = I.git.change,
        ignored = I.git.ignored,
        renamed = I.git.renamed,
        unmerged = I.git.unmerged,
        unstaged = I.git.unstaged,
        untracked = I.git.untracked
    },
    folder = {
        default = I.tree.default,
        open = I.tree.open,
        empty = I.tree.empty,
        empty_open = I.tree.empty_open,
        symlink = I.tree.symlink,
        symlink_open = I.tree.symlink_open
    },
    lsp = {
        hint = I.diagnostics.hint,
        info = I.diagnostics.info,
        warning = I.diagnostics.warning,
        error = I.diagnostics.error
    }
}

