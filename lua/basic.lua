vim.opt.guifont = "JetBrainsMono Nerd Font:h15"
-- utf
vim.g.encoding = "UTF-8"
vim.opt.fileencoding = "utf-8"
-- jkhl 移动时光标周围保留8行
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
---- 使用相对行号
vim.opt.number = true
vim.opt.relativenumber = false
---- 高亮所在行
vim.opt.cursorline = true
---- 显示左侧图标指示列
vim.opt.signcolumn = "yes"
---- 右侧参考线，超过表示代码太长了，考虑换行
vim.opt.colorcolumn = "120"
---- 缩进2个空格等于一个Tab
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftround = true
---- >> << 时移动长度
vim.opt.shiftwidth = 4
---- 空格替代tab
vim.opt.expandtab = true
---- 新行对齐当前行
vim.opt.autoindent = true
vim.opt.smartindent = true
---- 搜索大小写不敏感，除非包含大写
vim.opt.ignorecase = true
vim.opt.smartcase = true
---- 搜索不要高亮
vim.opt.hlsearch = true
---- 边输入边搜索
vim.opt.incsearch = true
---- 命令行高为2，提供足够的显示空间
vim.opt.cmdheight = 1
---- 当文件被外部程序修改时，自动加载
vim.opt.autoread = true
---- 禁止折行
vim.opt.wrap = true
-- 光标在行首尾时<Left><Right>可以跳到下一行
vim.opt.whichwrap = "<,>,[,]"
---- 允许隐藏被修改过的buffer
vim.opt.hidden = true
---- 鼠标支持
vim.opt.mouse = "a"
---- 禁止创建备份文件
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
---- smaller updatetime
vim.opt.updatetime = 300
---- 设置 timeoutlen 为等待键盘快捷键连击时间500毫秒，可根据需要设置
---- 遇到问题详见：https://github.com/nshen/learn-neovim-lua/issues/1
vim.opt.timeoutlen = 500
---- split window 从下边和右边出现
vim.opt.splitbelow = true
vim.opt.splitright = true
---- 自动补全不自动选中
vim.opt.completeopt = "menu,menuone,noselect,noinsert"
---- 样式
vim.opt.termguicolors = true
---- 是否显示不可见字符
vim.opt.list = false
---- 不可见字符的显示，这里只把空格显示为一个点
vim.opt.listchars = "space:·,tab:··"
---- 补全增强
vim.opt.wildmenu = true
---- Dont' pass messages to |ins-completin menu|
-- vim.o.shortmess = vim.o.shortmess .. "c"
---- 补全最多显示10行
vim.opt.pumheight = 10
---- 永远显示 tabline
vim.opt.showtabline = 2
---- 使用增强状态栏插件后不再需要 vim 的模式提示
vim.opt.showmode = false
---- 配置剪切板
vim.opt.clipboard = "unnamedplus"
vim.opt.spelllang = 'en_us,cjk'
vim.opt.spell = false

---- neovide config
vim.g.neovide_cursor_vfx_mode = "torpedo"
if vim.g.neovide then
    vim.g.neovide_input_use_logo = 1            -- enable use of the logo (cmd) key
    vim.keymap.set('n', '<D-s>', ':w<CR>')      -- Save
    vim.keymap.set('v', '<D-c>', '"+y')         -- Copy
    vim.keymap.set('n', '<D-v>', '"+P')         -- Paste normal mode
    vim.keymap.set('v', '<D-v>', '"+P')         -- Paste visual mode
    vim.keymap.set('c', '<D-v>', '<C-R>+')      -- Paste command mode
    vim.keymap.set('i', '<D-v>', '<ESC>l"+Pli') -- Paste insert mode
end
---- Allow clipboard copy paste in neovim
vim.g.neovide_input_use_logo = 1
vim.api.nvim_set_keymap('', '<D-v>', '+p<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('!', '<D-v>', '<C-R>+', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<D-v>', '<C-Y>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<D-v>', '<C-R>+', { noremap = true, silent = true })
