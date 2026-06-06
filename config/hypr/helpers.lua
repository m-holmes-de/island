-- Island helpers for Hyprland Lua configuration.

island = island or {}

local function shell_quote(value)
  return "'" .. tostring(value):gsub("'", "'\\''") .. "'"
end

-- Bind a key to a command with a description
function island.bind(keys, description, action, options)
  local opts = options or {}
  if description then
    opts.description = description
  end

  if type(action) == "string" then
    action = hl.dsp.exec_cmd(action)
  end

  hl.bind(keys, action, opts)
end

-- Launch a command (exec-once equivalent)
function island.exec_on_start(command)
  hl.on("hyprland.start", function()
    hl.exec_cmd(command)
  end)
end

-- Launch a TUI app in ghostty
function island.tui(command)
  return "ghostty -e " .. shell_quote(command)
end

-- Send a notification
function island.notify(message)
  return "notify-send -u low " .. shell_quote(message)
end

-- Window rule helper
function island.window(match, rules)
  rules.match = rules.match or {}
  if type(match) == "string" then
    rules.match.class = match
  else
    for key, value in pairs(match) do
      rules.match[key] = value
    end
  end
  hl.window_rule(rules)
end
