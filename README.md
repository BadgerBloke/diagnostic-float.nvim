# diagnostic-float.nvim 🚀

A lightweight Neovim plugin for customizable diagnostic floating windows with smart auto-display and toggle functionality.

![image](https://github.com/user-attachments/assets/a6dfc62c-0a33-4ca8-97df-fa8b302e3e69)

## Features ✨

- 🕒 Auto-display diagnostics after configurable delay (default: 5s)
- 🔄 Toggle auto-display with a single command
- 🚦 Manual trigger for immediate diagnostic display
- ⚙️ Fully customizable:
  - Toggle keybindings
  - Leader commands
  - Enable/disable on startup
- 📱 Mobile-friendly floating windows (focusable=false by default)

## Installation ⚡

Using [Lazy.nvim](https://github.com/folke/lazy.nvim):

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

## Configuration ⚙️
Default configuration:
```lua
opts = {
  enabled = true,     -- Initial enabled state
  delay = 5000,       -- Delay in milliseconds (5 seconds)
  toggle_key = "<C-i>",  -- Key to show diagnostics immediately
  leader_command = "xd", -- Leader command suffix (<leader>xd)
}
```

## Commands 🛠️
- `:ToggleDiagnosticFloat` - Toggle auto-display
- `:ShowDiagnosticFloat` - Show diagnostics immediately

## Keybindings ⌨
| Key |	Mode | Description |
| --- | ---- | ----------- |
| \<C-i\> |	Normal | Show diagnostic float immediately |
| \<leader\>xd | Normal | Toggle auto-display functionality |

(Customize these in your setup)

## Requirements 📋
Neovim 0.9.0 or higher

nvim-lspconfig (for diagnostics)

## Alternatives ℹ️
trouble.nvim

lspsaga.nvim

lsp_lines.nvim

## Contributing 🤝
Pull requests are welcome! For major changes, please open an issue first.

## License 📜
MIT © Mukesh Singh
