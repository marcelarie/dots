-- Autorun programs
local awful = require('awful')
local autorun = true
local autorunApps = {
	"autorandr main"
}
if autorun then
    for app = 1, #autorunApps do awful.util.spawn(autorunApps[app]) end
end
