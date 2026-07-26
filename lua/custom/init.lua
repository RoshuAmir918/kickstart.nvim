-- Plugin load order.
--
-- `vim.pack.add` is imperative: it puts a plugin on the runtimepath the moment
-- it runs. So each module below owns both its own `vim.pack.add` and its config,
-- and the order of these requires is the order things actually load. Add new
-- plugins by dropping a file in `custom/plugins/` and requiring it here.
--
-- `custom.pack` registers the PackChanged build hooks (fzf-native, LuaSnip,
-- nvim-treesitter) and must come first, or the very first install of those
-- plugins runs with no build step attached.
require 'custom.pack'

require 'custom.plugins.guess-indent'
require 'custom.plugins.gitsigns'
require 'custom.plugins.which-key'
require 'custom.plugins.tokyonight'
require 'custom.plugins.todo-comments'
require 'custom.plugins.mini'
require 'custom.plugins.telescope'
require 'custom.plugins.harpoon'
require 'custom.plugins.lsp'
require 'custom.plugins.conform'
require 'custom.plugins.completion'
require 'custom.plugins.treesitter'

-- Personal keymaps last, so they win any conflict with a plugin's defaults.
require 'custom.remap'
