-- Tree-sitter language features that should apply to a whole buffer.
-- Keep this in one place so the filetypes match Neovim's detector.
-- This configuration is for LaTeX rather than plain TeX, so make Neovim's
-- TeX detection prefer its LaTeX mode for `.tex` files.
vim.g.tex_flavor = "latex"

local tree_sitter_fold_filetypes = {
  bash = true,
  bib = true,
  bibtex = true,
  c = true,
  cmake = true,
  cpp = true,
  cuda = true,
  dockerfile = true,
  doxygen = true,
  latex = true,
  lua = true,
  markdown = true,
  python = true,
  rst = true,
  sh = true,
  tex = true,
}

-- Only use Tree-sitter indentation where its parser ships an indent query.
-- Native indentation remains more useful for the other filetypes.
local tree_sitter_indent_filetypes = {
  bash = true,
  bib = true,
  bibtex = true,
  c = true,
  cmake = true,
  cpp = true,
  cuda = true,
  doxygen = true,
  lua = true,
  markdown = true,
  python = true,
  sh = true,
}

local tree_sitter_foldexpr = "v:lua.vim.treesitter.foldexpr()"
local tree_sitter_indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

local group = vim.api.nvim_create_augroup("tree_sitter_language_features", { clear = true })

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  group = group,
  pattern = { "*.dox", "*.doxygen" },
  callback = function(args)
    vim.bo[args.buf].filetype = "doxygen"
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = group,
  callback = function(args)
    local filetype = vim.bo[args.buf].filetype

    if tree_sitter_indent_filetypes[filetype] then
      vim.bo[args.buf].indentexpr = tree_sitter_indentexpr
    elseif vim.bo[args.buf].indentexpr == tree_sitter_indentexpr then
      vim.bo[args.buf].indentexpr = ""
    end
  end,
})

vim.api.nvim_create_autocmd({ "BufEnter", "FileType" }, {
  group = group,
  callback = function(args)
    local filetype = vim.bo[args.buf].filetype

    if tree_sitter_fold_filetypes[filetype]
      and pcall(vim.treesitter.start, args.buf) then
      vim.wo.foldexpr = tree_sitter_foldexpr
      vim.wo.foldmethod = "expr"
    elseif vim.wo.foldexpr == tree_sitter_foldexpr then
      vim.wo.foldmethod = "manual"
      vim.wo.foldexpr = "0"
    end
  end,
})
