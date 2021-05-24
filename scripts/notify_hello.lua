#!/usr/bin/lua

local lgi = require 'lgi'
Notify = lgi.require('Notify')
Notify.init("Hello world")
Hello = Notify.Notification.new("Hello world",
                                "This is an example notification.",
                                "dialog-information")
Hello:show()
