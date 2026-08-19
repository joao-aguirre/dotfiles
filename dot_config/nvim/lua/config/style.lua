-- Global indentation settings.
vim.opt.expandtab = true  -- Convert tabs to spaces
vim.opt.shiftwidth = 4  -- Number of spaces for each step of indent
vim.opt.tabstop = 4  -- Number of spaces that a <Tab> counts for
vim.opt.softtabstop = 4  -- Number of spaces that a <Tab> counts for while editing
vim.opt.textwidth = 80  -- Number of columns in a line of text.
-- Appearance elements.
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.cursorlineopt = { "line", "number" }

-- Show selected non-printable characters.
vim.opt.list = true
vim.opt.listchars = {
    space = "·",
    lead = "·",
    trail = "·",
    tab = "󰘠 ",
    nbsp = "␣",
    eol = "↲",
    extends = "»",
    precedes = "«",
}

-- Diagnostic symbols
vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN]  = "",
      [vim.diagnostic.severity.INFO]  = "",
      [vim.diagnostic.severity.HINT]  = "",
    },
  },
})
-- Keep the sign column in insert mode.
vim.opt.signcolumn = "yes"

-- Set colors for whitespace (tabs, spaces, trailing)
vim.api.nvim_set_hl(0, "Whitespace", { fg = "#323232", bg = "NONE" })
-- Set colors for NonText (eob, wrapped lines)
vim.api.nvim_set_hl(0, "NonText", { fg = "#323232", bg = "NONE" })

-- Show the ruler lines at columns 81 and 101.
vim.opt.colorcolumn = "81,101"
vim.api.nvim_set_hl(0, "ColorColumn", {bg = "#323232"}) 
