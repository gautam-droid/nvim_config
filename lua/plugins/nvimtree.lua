return {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
        'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    config = function()
        local nvimtree = require("nvim-tree")

        -- recommended settings from nvim-tree documentation
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        -- set keymaps
        local keymap = vim.keymap -- for conciseness
        keymap.set("n", "<C-b>", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
        keymap.set("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "Focus on file explorer" })

        vim.g.nvim_tree_auto_open = false
        -- configure nvim-tree
        nvimtree.setup({
            sort_by = "case_sensitive",
            view = {
                width = 35,
                relativenumber = true,
                side = "left",
                preserve_window_proportions = true,
            },
            renderer = {
                group_empty = true,
                highlight_git = true,
                full_name = true,
            },
            filters = {
                dotfiles = false,
                custom = { ".git", "node_modules", ".cache" },
            },
            git = {
                enable = true,
                ignore = false,
                timeout = 400,
            },
            update_focused_file = {
                enable = true,
                update_root = false,
            },
            actions = {
                open_file = {
                    quit_on_open = false,
                    resize_window = true,
                },
            },
            diagnostics = {
                enable = true,
                show_on_dirs = true,
                show_on_open_dirs = true,
            },
        })
    end,
}
