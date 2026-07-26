-- [[ Formatting ]]
local gh = require('custom.util').gh

vim.pack.add { gh 'stevearc/conform.nvim' }

-- `prettierd` is a daemon that keeps prettier warm between saves, so formatting
-- doesn't pay Node's startup cost every time. It resolves the project's own
-- prettier and config, so a repo pinning a prettier version still wins. Plain
-- `prettier` is the fallback for when the daemon isn't installed.
local prettier = { 'prettierd', 'prettier', stop_after_first = true }

-- Declared up here because `format_on_save` below reuses it as its allowlist:
-- a filetype formats on save exactly when it has a formatter configured.
local formatters_by_ft = {
  -- lua_ls has formatting disabled in `custom/plugins/lsp.lua`, deferring to this.
  lua = { 'stylua' },

  javascript = prettier,
  javascriptreact = prettier,
  typescript = prettier,
  typescriptreact = prettier,
  json = prettier,
  jsonc = prettier,
  css = prettier,
  scss = prettier,
  html = prettier,
  yaml = prettier,
  markdown = prettier,
  graphql = prettier,
}

require('conform').setup {
  notify_on_error = false,
  format_on_save = function(bufnr)
    if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then return nil end
    if not formatters_by_ft[vim.bo[bufnr].filetype] then return nil end
    return { timeout_ms = 1000 }
  end,
  default_format_opts = {
    lsp_format = 'fallback', -- Use external formatters if configured below, otherwise use LSP formatting. Set to `false` to disable LSP formatting entirely.
  },
  formatters_by_ft = formatters_by_ft,
}

vim.keymap.set({ 'n', 'v' }, '<leader>f', function() require('conform').format { async = true } end, { desc = '[F]ormat buffer' })

-- Escape hatch for repos where you don't want your saves rewriting formatting.
vim.api.nvim_create_user_command('FormatToggle', function()
  vim.g.disable_autoformat = not vim.g.disable_autoformat
  vim.notify('Format on save ' .. (vim.g.disable_autoformat and 'disabled' or 'enabled'))
end, { desc = 'Toggle format on save' })
