# Diagnostic Float Plugin
![image](https://github.com/user-attachments/assets/a6dfc62c-0a33-4ca8-97df-fa8b302e3e69)

```lua
-- In your nvim/lua/plugins/diagnostic-float.lua
return {
  {
    "BadgerBloke/diagnostic-float.nvim",
    dependencies = { "neovim/nvim-lspconfig" },
    opts = {
      enabled = false,
      delay = 2000,
      toggle_key = "<C-i>",
      leader_command = "xd",
    },
    keys = {
      {
        "<C-i>",
        function()
          require("diagnostic-float").show_diagnostic_float()
        end,
        desc = "Show diagnostic",
      },
      {
        "<leader>xd",
        function()
          require("diagnostic-float").toggle()
        end,
        desc = "Toggle diagnostic",
      },
    },
  },
}

```
