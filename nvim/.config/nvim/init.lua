-- Install packer
local install_path = vim.fn.stdpath('data') ..
  '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.system {'git', 'clone', 'https://github.com/wbthomason/packer.nvim',
    install_path}
  vim.api.nvim_command 'packadd packer.nvim'
  vim.api.nvim_command 'au VimEnter * PackerSync'
end


require('packer').startup(function(use)
  -- Packer manages itself
  use 'wbthomason/packer.nvim'

  -- Color scheme
  use {
    'ChristianChiarulli/nvcode-color-schemes.vim',
    config = function()
      vim.api.nvim_command('colorscheme lunar')
    end
  }

  use {
    'glepnir/galaxyline.nvim', branch = 'main',
    requires = {'kyazdani42/nvim-web-devicons'},
    config = function()
      require('galaxyline-config')
    end
  }

  -- Editorconfig support
  use 'editorconfig/editorconfig-vim'

  -- Syntax/filetype specific
  --Plug 'hynek/vim-python-pep8-indent'
  use 'hashivim/vim-terraform'
  use 'sirtaj/vim-openscad'
  use 'ledger/vim-ledger'
  use {'plasticboy/vim-markdown', requires = {'godlygeek/tabular'}}
  use 'vito-c/jq.vim'
  use 'LokiChaos/vim-tintin'
  use 'davidoc/taskpaper.vim'
  use 'pearofducks/ansible-vim'
  use 'bakpakin/fennel.vim'
  use 'fatih/vim-go'
  -- LSP/Autocompletion
  use 'neovim/nvim-lspconfig'
  use {
    'hrsh7th/nvim-compe',
    config = function() require('compe-config') end
  }
  use 'ray-x/lsp_signature.nvim'
  
  --- LSP Configuration
  local nvim_lsp = require('lspconfig')
  
  -- On Attach Function to map keys after LSP attaches
  local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
  
    -- Enable omnifunc completion
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings
    local opts = { noremap=true, silent=true }

    -- See `:help vim.lsp.*` for documentation on the below
    buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
    buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

  end

  -- Loop to call 'setup' on multiple servers and
  -- map buffer keybindings when attached
  local servers = { 'bashls', 'cssls', 'dockerls', 'efm', 'gopls', 'html', 'tsserver', 'jsonls', 'pylsp', 'solargraph', 'terraformls', 'yamlls' }
  for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
      on_attach = on_attach,
      flags = {
        debounce_text_changes = 150,
      }
    }
  end
  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function() require('treesitter-config') end
  }

  -- Snippets
  use 'rafamadriz/friendly-snippets'
  use 'hrsh7th/vim-vsnip'

  -- Needed by a bunch of things (gitsigns, telescope)
  use 'nvim-lua/plenary.nvim'
  use 'nvim-lua/popup.nvim'

  -- Inline git blame
  use {
    'lewis6991/gitsigns.nvim',
    config = function() require('gitsigns-config') end
  }

  -- Camelcase motion (\w, \b)
  use 'bkad/CamelCaseMotion'

  -- Telescope
  use 'nvim-telescope/telescope.nvim'

  -- Undotree
  use 'mbbill/undotree'

  -- Better gx
  use {
    'tyru/open-browser.vim',
    config = function() require('openbrowser-config') end
  }

  -- My Plugins
  use 'mivok/vim-minotl'

  -- Debugging LSP
  vim.lsp.set_log_level("debug")
end)
