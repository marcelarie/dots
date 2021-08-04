-- Autorun programs
local awful = require('awful')
local autorun = true
local autorunApps = {
	"autorandr main",
    'setxkbmap -layout "us(dvorak),es(dvorak),us,es" -option grp:shifts_toggle',
}
if autorun then
    for app = 1, #autorunApps do awful.util.spawn(autorunApps[app]) end
end
