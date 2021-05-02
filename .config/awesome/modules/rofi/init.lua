local gears = require('gears')
local awful = require('awful')

local modkey = "Mod4"

Rofikeys = gears.table.join(globalkeys, awful.key({modkey}, "d", function()
    os.execute(string.format(
                   "rofi -modi combi -theme gruvbox-dark -show drun -font 'Fira Code 9'",
                   'run', 'dmenu'))
end, {description = "show rofi", group = "launcher"}),
                            awful.key({modkey}, "g", function()
    os.execute(string.format("~/scripts/dmsearch-distrotube/dmsearch", 'run',
                             'dmenu'))
end, {description = "show rofi", group = "launcher"}))
