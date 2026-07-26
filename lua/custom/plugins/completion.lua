-- [[ Snippet Engine ]] and [[ Autocomplete Engine ]]
local gh = require('custom.util').gh

-- NOTE: You can also specify plugin using a version range for its git tag.
--  See `:help vim.version.range()` for more info
vim.pack.add { { src = gh 'L3MON4D3/LuaSnip', version = vim.version.range '2.*' } }
require('luasnip').setup {}

-- `friendly-snippets` contains a variety of premade snippets.
--    See the README about individual language/framework/plugin snippets:
--    https://github.com/rafamadriz/friendly-snippets
--
-- vim.pack.add { gh 'rafamadriz/friendly-snippets' }
-- require('luasnip.loaders.from_vscode').lazy_load()

vim.pack.add { { src = gh 'saghen/blink.cmp', version = vim.version.range '1.*' } }
require('blink.cmp').setup {
  keymap = {
    -- 'default' (recommended) for mappings similar to built-in completions
    --   <c-y> to accept ([y]es) the completion.
    --    This will auto-import if your LSP supports it.
    --    This will expand snippets if the LSP sent a snippet.
    -- 'super-tab' for tab to accept
    -- 'enter' for enter to accept
    -- 'none' for no mappings
    --
    -- For an understanding of why the 'default' preset is recommended,
    -- you will need to read `:help ins-completion`
    --
    -- No, but seriously. Please read `:help ins-completion`, it is really good!
    --
    -- All presets have the following mappings:
    -- <tab>/<s-tab>: move to right/left of your snippet expansion
    -- <c-space>: Open menu or open docs if already open
    -- <c-n>/<c-p> or <up>/<down>: Select next/previous item
    -- <c-e>: Hide menu
    -- <c-k>: Toggle signature help
    --
    -- See `:help blink-cmp-config-keymap` for defining your own keymap
    --
    -- 'super-tab' accepts with <tab>, which is the VSCode muscle memory. It still
    -- jumps snippet placeholders with <tab>/<s-tab> when a snippet is active.
    preset = 'super-tab',

    -- VSCode accepts with both <tab> and <enter>; 'super-tab' only binds <tab>,
    -- so add <enter> on top of the preset. 'fallback' keeps a normal newline
    -- when the completion menu isn't open.
    ['<CR>'] = { 'accept', 'fallback' },

    -- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
    --    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
  },

  appearance = {
    -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
    -- Adjusts spacing to ensure icons are aligned
    nerd_font_variant = 'mono',
  },

  completion = {
    -- Pop the documentation window open on its own, like VSCode's suggest widget.
    -- `<c-space>` still toggles it manually, and `<c-b>`/`<c-f>` scroll it.
    documentation = { auto_show = true, auto_show_delay_ms = 200 },

    -- Preview the selected item inline, greyed out, ahead of the cursor.
    ghost_text = { enabled = true },

    list = {
      selection = {
        -- Preselect the first item so <tab>/<enter> accepts it straight away.
        preselect = true,
        -- ...but don't write it into the buffer just from moving the selection.
        -- VSCode only commits text when you accept, and blink's default of
        -- `true` otherwise makes <c-n>/<c-p> edit the buffer as you browse.
        auto_insert = false,
      },
    },
  },

  sources = {
    -- 'buffer' is VSCode's word-based suggestions: it keeps completions coming
    -- in files with no language server attached.
    default = { 'lsp', 'path', 'snippets', 'buffer' },
  },

  snippets = { preset = 'luasnip' },

  -- Blink.cmp includes an optional, recommended rust fuzzy matcher,
  -- which automatically downloads a prebuilt binary when enabled.
  --
  -- By default, we use the Lua implementation instead, but you may enable
  -- the rust implementation via `'prefer_rust_with_warning'`
  --
  -- See `:help blink-cmp-config-fuzzy` for more information
  fuzzy = { implementation = 'lua' },

  -- Shows a signature help window while you type arguments for a function
  signature = { enabled = true },
}
