local mappings = require("which-keys").rest_key_mappings()

for key, remap in pairs(mappings) do
    local opts = { buffer = 0, desc = remap[2], noremap = true, silent = true }
    vim.keymap.set("n", key, remap[1], opts)
end
