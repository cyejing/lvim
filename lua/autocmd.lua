-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- vim.api.nvim_create_augroup("_lvim_user", {})
-- local agroup = vim.api.nvim_create_augroup("_lvim_user", {
    -- clear = true,
-- })
-- local autocmd = vim.api.nvim_create_autocmd

-- nvim-tree 自动关闭
--autocmd("BufEnter", {
--    nested = true,
--    group = agroup,
--    callback = function()
--        if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil then
--            vim.cmd("quit")
--        end
--    end,
--})

