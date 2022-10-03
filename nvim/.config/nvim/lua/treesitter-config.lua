require('nvim-treesitter.configs').setup {
  -- This automatically installs most of the treesitter languages
  ensure_installed = {"c", "lua", "rust", "bash", "cmake", "css", "dart", "dockerfile", "elixir", "gitignore", "go", "gomod", "html", "java", "javascript", "json", "markdown", "python", "v"},
  auto_install = true,
  highlight = {enable = true}
}
