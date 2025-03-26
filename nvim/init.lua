--[[
      - https://learnxinyminutes.com/docs/lua/
    After understanding a bit more about Lua, you can use `:help lua-guide` as a
    reference for how Neovim integrates Lua.
    - :help lua-guide
    - (or HTML version): https://neovim.io/doc/user/lua-guide.html



-- [[ Setting options ]]
-- test
-- See `:help vim.opt`
-- For more options, you can see `:help option-list`

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true
-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
require 'vim-keymaps'
require 'vim-opts'
require('lazy').setup 'plugins'
-- require('lazy').setup({
--   -- Use `opts = {}` to automatically pass options to a plugin's `setup()` function, forcing the plugin to be loaded.
--   -- Alternatively, use `config = function() ... end` for full control over the configuration.
--   --:w
--
--   -- If you prefer to call `setup` explicitly, use:
--   --    {
--   --        'lewis6991/gitsigns.nvim',
--   --        config = function()
--   --            require('gitsigns').setup({
--   --                -- Your gitsigns configuration here
--   --            })
--   --        end,
--   --    }
--   --
--   -- Here is a more advanced example where we pass configuration
--   -- options to `gitsigns.nvim`.
--   --
--
--   -- NOTE: Plugins can also be configured to run Lua code when they are loaded.
--   --
--   -- This is often very useful to both group configuration, as well as handle
--   -- lazy loading plugins that don't need to be loaded immediately at startup.
--   --
--   -- For example, in the following configuration, we use:
--   --  event = 'VimEnter'
--   --
--   -- which loads which-key before all the UI elements are loaded. Events can be
--   -- normal autocommands events (`:help autocmd-events`).
--   --
--   -- Then, because we use the `opts` key (recommended), the configuration runs
--   -- after the plugin has been loaded as `require(MODULE).setup(opts)`.
--
--
--
--   -- The following comments only work if you have downloaded the kickstart repo, not just copy pasted the
--   -- init.lua. If you want these files, they are in the repository, so you can just download them and
--   -- place them in the correct locations.
--
--   -- NOTE: Next step on your Neovim journey: Add/Configure additional plugins for Kickstart

--   --
--   --  Here are some example plugins that I've included in the Kickstart repository.
--   --  Uncomment any of the lines below to enable them (you will need to restart nvim).
--   --
--   -- require 'kickstart.plugins.debug',
--   -- require 'kickstart.plugins.indent_line',
--   -- require 'kickstart.plugins.lint',
--   -- require 'kickstart.plugins.autopairs',
--   require 'kickstart.plugins.neo-tree',
--   -- require 'kickstart.plugins.gitsigns', -- adds gitsigns recommend keymaps
--
--   -- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
--   --    This is the easiest way to modularize your config.
--   --
--   --  Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
--   -- { import = 'custom.plugins' },
--   --
--   -- For additional information with loading, sourcing and examples see `:help lazy.nvim-🔌-plugin-spec`
--   -- Or use telescope!
--   -- In normal mode type `<space>sh` then write `lazy.nvim-plugin`
--   -- you can continue same window with `<space>sr` which resumes last telescope search
-- }, {
--   ui = {
--     -- If you are using a Nerd Font: set icons to an empty table which will use the
--     -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
--     icons = vim.g.have_nerd_font and {} or {
--       cmd = '⌘',
--       config = '🛠',
--       event = '📅',
--       ft = '📂',
--       init = '⚙',
--       keys = '🗝',
--       plugin = '🔌',
--       runtime = '💻',
--       require = '🌙',
--       source = '📄',
--       start = '🚀',
--       task = '📌',
--       lazy = '💤 ',
--     },
--   },
-- })
--
-- -- The line beneath this is called `modeline`. See `:help modeline`
-- -- vim: ts=2 sts=2 sw=2 et
