-- General settings.
-- Yank to system clipboard.
vim.opt.clipboard = "unnamedplus"

-- Set English and Portuguese as the languages for spell checking.
vim.opt.spelllang = {"en", "pt"} 

-- Enable per-project settings via `exrc`.
vim.opt.exrc = true

-- Makes the left/right arrows and the `h` and `l` keys move across lines.
-- `<` and `>` control the arrow keys in normal mode and `[` and `]` control the
-- same arrow keys but in insert mode.
vim.opt.whichwrap:append("<,>,[,],h,l")

