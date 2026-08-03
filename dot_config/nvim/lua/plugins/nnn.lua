return {
    "luukvbaal/nnn.nvim",
    config = function()
        require("nnn").setup({
            explorer = {
                cmd = "nnn",
                width = 36,
                side = "topleft",
                session = "",
                tabs = true,
                fullscreen = true,
            },
            picker = {
                cmd = "nnn",
                style = {
                    width = 0.9,
                    height = 0.8,
                    xoffset = 0.5,
                    yoffset = 0.5,
                    border = "single",
                },
                session = "",
                tabs = true,
                fullscreen = true,
            },
            auto_open = {
                setup = nil,
                tabpage = nil,
                empty = false,
                ft_ignore = { "gitcommit" },
            },
            auto_close = false,
            replace_netrw = nil,
            mappings = {},
            windownav = {
                left = "<C-w>h",
                right = "<C-w>l",
                next = "<C-w>w",
                prev = "<C-w>W",
            },
            buflisted = false,
            quitcd = nil,
            offset = false,
        })
    end,
}
