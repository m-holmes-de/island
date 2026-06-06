-- Island Hyprland Configuration
-- https://wiki.hypr.land/Configuring/Start/

-- Set up module path for island configs
package.path = os.getenv("HOME") .. "/.config/?.lua;" .. package.path

-- Load helpers first
require("hypr.helpers")

-- Core configuration
require("hypr.monitors")
require("hypr.input")
require("hypr.appearance")
require("hypr.bindings")
require("hypr.rules")
require("hypr.autostart")
