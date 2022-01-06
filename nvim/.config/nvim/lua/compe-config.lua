vim.o.completeopt = "menuone,noselect"

require'compe'.setup {
  source = {
    path = true,
    buffer = true,
    calc = true,
    tags = true,
    nvim_lsp = true,
    nvim_lua = true,
    vsnip = true,
    snippets_nvim = true,
    treesitter = true
  }
}

-- The following functions and bindings set Tab and Shift-Tab to either move
-- to the next/previous completion item on the list, or move to the
-- next/previous snippet placeholder in vsnip, as appropriate. It's taken from
-- https://github.com/hrsh7th/nvim-compe#how-to-use-tab-to-navigate-completion-menu
local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
  local col = vim.fn.col('.') - 1
  if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
    return true
  else
    return false
  end
end

_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif vim.fn.call("vsnip#available", {1}) == 1 then
    return t "<Plug>(vsni-expand-por-jump)"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end

_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
    return t "<Plug>(vsnip-jump-prev)"
  else
    return t "<S-Tab>"
  end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

-- This is needed to expand snippets, <CR> accepts the completion
vim.api.nvim_set_keymap("i", "<CR>", "compe#confirm('<CR>')",
                        {silent = true, expr = true, noremap = true})
