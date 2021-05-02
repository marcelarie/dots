-- Autorun programs
local awful = require('awful')
local autorun = true
local autorunApps = {
    "xrandr --output eDP --primary --mode 1920x1080 --pos 1920x0 --rotate normal --output DisplayPort-0 --mode 1920x1080 --pos 0x0 --rotate normal --output DisplayPort-1 --off --output DisplayPort-2 --off --output VGA-1 --off --output VGA1 --off --output VIRTUAL1 --off"
}
if autorun then
    for app = 1, #autorunApps do awful.util.spawn(autorunApps[app]) end
end
