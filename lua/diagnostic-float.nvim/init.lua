-- diagnostic-float.nvim
-- A Neovim plugin to show diagnostics in a floating window
-- with configurable auto-display and toggle functionality

local M = {}

-- Default configuration
local config = {
  enabled = true,
  delay = 5000,
  toggle_key = "<C-i>",
  leader_command = "xd",
}

-- Function to show diagnostic float immediately
function M.show_diagnostic_float()
  vim.diagnostic.open_float(nil, { focusable = true, source = "if_many" })
end

-- Function to toggle diagnostic float auto-display
function M.toggle()
  config.enabled = not config.enabled
  if config.enabled then
    vim.notify("Diagnostic float auto-display enabled", vim.log.levels.INFO)
  else
    vim.notify("Diagnostic float auto-display disabled", vim.log.levels.INFO)
  end
end

-- Setup function to initialize the module
function M.setup(opts)
  -- Merge user options with defaults
  config = vim.tbl_deep_extend("force", config, opts or {})

  -- Set the updatetime to control CursorHold delay
  vim.opt.updatetime = config.delay

  -- Create commands
  vim.api.nvim_create_user_command("ToggleDiagnosticFloat", M.toggle, {
    desc = "Toggle automatic diagnostic float window",
  })

  vim.api.nvim_create_user_command("ShowDiagnosticFloat", M.show_diagnostic_float, {
    desc = "Show diagnostic float window immediately",
  })

  -- Auto-display on CursorHold
  vim.api.nvim_create_autocmd("CursorHold", {
    group = vim.api.nvim_create_augroup("DiagnosticFloat", { clear = true }),
    callback = function()
      if config.enabled then
        vim.diagnostic.open_float(nil, { focusable = false, source = "if_many" })
      end
    end,
  })

  -- Set keymaps if configured
  if config.toggle_key and config.toggle_key ~= "" then
    vim.keymap.set("n", config.toggle_key, M.show_diagnostic_float, {
      noremap = true,
      silent = true,
      desc = "Show diagnostic float window",
    })
  end

  if config.leader_command and config.leader_command ~= "" then
    vim.keymap.set("n", "<leader>" .. config.leader_command, M.toggle, {
      noremap = true,
      silent = true,
      desc = "Toggle diagnostic float auto-display",
    })
  end
end

return M
