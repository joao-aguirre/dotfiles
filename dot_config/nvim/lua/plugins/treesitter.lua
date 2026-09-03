return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter").setup({
            install_dir = vim.fn.stdpath("data") .. "/site",
        })
        require("nvim-treesitter").install({
            "bash",
            "bibtex",
            "c",
            "cmake",
            "cpp",
            "cuda",
            "dockerfile",
            "doxygen",
            "latex",
            "lua",
            "markdown",
            "markdown_inline",
            "python",
            "rst"
        })
    end,
}
