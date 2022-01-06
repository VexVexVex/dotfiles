-- brew install efm-langserver
-- or download binary from
-- https://github.com/mattn/efm-langserver/releases/latest
-- EFM is used for formatters/linters
local efm_languages = {
      lua = {{formatCommand = "lua-format -i", formatStdin = true}},
      sh = {
        {
          lintCommand = 'shellcheck -f gcc -x',
          lintSource = 'shellcheck',
          lintFormats = {
            '%f:%l:%c: %trror: %m', '%f:%l:%c: %tarning: %m',
            '%f:%l:%c: %tote: %m'
          }
        }
      },
      ['yaml.ansible'] = {{lintCommand = 'ansible-lint -p --nocolor'}}
    }

require"lspconfig".efm.setup {
  init_options = {documentFormatting = true},
  filetypes = vim.tbl_keys(efm_languages),
  settings = {
    rootMarkers = {".git/"},
    languages = efm_languages
  }
}
