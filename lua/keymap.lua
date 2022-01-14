--
-- neovim keymap 2022
--

-- possibly unnecessary - https://bit.ly/3KcTPnM
local map = function(key)
  -- get the extra options
  local opts = {noremap = true, silent = true}
  for i, v in pairs(key) do
    if type(i) == 'string' then opts[i] = v end
  end

  -- basic support for buffer-scoped keybindings
  local buffer = opts.buffer
  opts.buffer = nil

  if buffer then
    vim.api.nvim_buf_set_keymap(0, key[1], key[2], key[3], opts)
  else
    vim.api.nvim_set_keymap(key[1], key[2], key[3], opts)
  end
end

-- rebind <Space> to <Nop> and map <Leader> to <Space>
map {'n', '<Space>', '<Nop>'}
vim.g.mapleader = ' '

-- hide search highlighting
map {'n', '<Leader>l', ':nohlsearch<CR>'}

-- window splitting, closing, moving
map {'n', '<Leader>v', '<C-w>v<C-w>l'}
map {'n', '<Leader>s', '<C-w>s<C-w>j'}
map {'n', '<Leader>c', '<C-w>c'}
map {'n', '<C-h>', '<C-w>h'}
map {'n', '<C-j>', '<C-w>j'}
map {'n', '<C-k>', '<C-w>k'}
map {'n', '<C-l>', '<C-w>l'}

-- shortcuts for deleting, saving, etc
map {'n', '<Leader>q', ':wqa!<CR>'}
map {'n', '<Leader>w', ':w!<CR>'}
map {'n', '<Leader><Esc>', ':q!<CR>'}
map {'n', '<Leader>d', ':bd!<CR>'}
map {'n', '<Leader>D', ':bufdo bd<CR>'}

-- sort
map {'n', '<Leader>S', ':sort<CR>'}
map {'n', '<Leader>U', ':sort u<CR>'}

-- telescope
map {'n', '<Leader>f', ':Telescope find_files<CR>'}

-- keep visual selection after indent
map {'v', '>', '>gv'}
map {'v', '<', '<gv'}
