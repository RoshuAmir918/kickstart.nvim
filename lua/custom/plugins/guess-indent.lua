-- Automatically detects and sets the indentation for the current buffer.
--
-- To install a plugin simply call `vim.pack.add` with its git url. That downloads
-- the default branch of the plugin. For most plugins installing is not enough --
-- you also need to call their `.setup()` to start them.
local gh = require('custom.util').gh

vim.pack.add { gh 'NMAC427/guess-indent.nvim' }
require('guess-indent').setup {}
