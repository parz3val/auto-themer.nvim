local M = {}

local function get_system_theme_macos()
  local handle = io.popen("defaults read -g AppleInterfaceStyle 2>/dev/null")
  local result = handle:read("*a")
  handle:close()
  if result and result:find("Dark") then
    return "dark"
  else
    return "light"
  end
end

local function get_system_theme()
  if vim.fn.has("macunix") == 1 then
    return get_system_theme_macos()
  else
    local colorfgbg = vim.env.COLORFGBG
    if colorfgbg then
      if string.find(colorfgbg, "dark") then
        return "dark"
      elseif string.find(colorfgbg, "light") then
        return "light"
      end
    end

    local gtk_theme = vim.env.GTK_THEME
    if gtk_theme then
      if string.find(gtk_theme:lower(), "dark") then
        return "dark"
      elseif string.find(gtk_theme:lower(), "light") then
        return "light"
      end
    end

    return "dark"
  end
end

function M.setup(options)
  options = options or {}
  local default_on_unknown = options.default_on_unknown or "dark"

  local function set_vim_background()
    local system_theme = get_system_theme()
    local theme_to_set = system_theme

    if theme_to_set ~= "dark" and theme_to_set ~= "light" then
      theme_to_set = default_on_unknown
    end

    vim.o.background = theme_to_set
    -- vim.notify(
    --   string.format("Set background to %s (system theme: %s)", theme_to_set, system_theme),
    --   vim.log.levels.INFO
    -- )
  end

  vim.schedule(set_vim_background)
end

return M
