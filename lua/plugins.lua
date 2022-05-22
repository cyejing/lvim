-- Additional Plugins

lvim.plugins = {
  --  UI --
  { "folke/tokyonight.nvim" },

  -- lualine --
  { "arkav/lualine-lsp-progress" },

  -- utils --
  {
    "Pocco81/AutoSave.nvim",
    config = function()
      require("autosave").setup(Config.autosave)
    end,
  },
}

Config = {
  autosave = {
    enabled = true,
    execution_message = "AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"),
    events = { "InsertLeave", "TextChanged" },
    conditions = {
      exists = true,
      filename_is_not = {},
      filetype_is_not = {},
      modifiable = true
    },
    on_off_commands = true,
    write_all_buffers = false,
    clean_command_line_interval = 0,
    debounce_delay = 135
  }
}

