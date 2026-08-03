return {
    "Mofiqul/vscode.nvim",
    name = "vscode",
    priority = 1000,
    config = function()
        local colors = require("vscode.colors").get_colors()

        require("vscode").setup({
            transparent = false,
            italic_comments = true,
            italic_inlayhints = true,
            underline_links = true,
            disable_nvimtree_bg = true,
            terminal_colors = true,
            group_overrides = {
                Cursor = {
                    fg = colors.vscDarkBlue,
                    bg = colors.vscLightGreen,
                    bold = true,
                },
            },
        })

        vim.cmd.colorscheme("vscode")
    end,
}
