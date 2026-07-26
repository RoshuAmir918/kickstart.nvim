-- [[ Harpoon ]]
--
-- Pin the handful of files you're actually working between, then jump straight to
-- them by number, instead of fuzzy-finding the same four paths all day. Telescope
-- is for finding a file you don't have; Harpoon is for the ones you keep.
--
-- NOTE: `harpoon2` is a rewrite living on its own branch, with a different API
-- from the default branch, so the `version` pin below is required, not cosmetic.
local gh = require('custom.util').gh

vim.pack.add {
  -- Also added by `telescope.lua`, but listed here because Harpoon depends on it
  -- too, so this module doesn't rely on load order to work.
  gh 'nvim-lua/plenary.nvim',
  { src = gh 'ThePrimeagen/harpoon', version = 'harpoon2' },
}

local harpoon = require 'harpoon'

-- Required by harpoon2. Note the `:` -- it's a method call, not `harpoon.setup()`.
harpoon:setup()

vim.keymap.set('n', '<leader>a', function() harpoon:list():add() end, { desc = 'H[a]rpoon file' })
vim.keymap.set('n', '<C-e>', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = 'Harpoon quick menu' })

-- Jump to a slot. The list is ordered, not sorted, so these stay put as you work.
vim.keymap.set('n', '<C-h>', function() harpoon:list():select(1) end, { desc = 'Harpoon file 1' })
vim.keymap.set('n', '<C-t>', function() harpoon:list():select(2) end, { desc = 'Harpoon file 2' })
vim.keymap.set('n', '<C-n>', function() harpoon:list():select(3) end, { desc = 'Harpoon file 3' })
vim.keymap.set('n', '<C-s>', function() harpoon:list():select(4) end, { desc = 'Harpoon file 4' })

-- Cycle the list. Terminals that don't send distinct codes for ctrl+shift never
-- deliver these, in which case use the quick menu above instead.
vim.keymap.set('n', '<C-S-P>', function() harpoon:list():prev() end, { desc = 'Harpoon previous' })
vim.keymap.set('n', '<C-S-N>', function() harpoon:list():next() end, { desc = 'Harpoon next' })
