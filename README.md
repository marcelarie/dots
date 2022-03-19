```
                                      ╭─────────────────────────╮
                           დოოოოოდ    │                         │
                           |     |    │  OS        NixOS        │
                           |     |   ╭│  TERM      kitty        │
                           |-Ο Ο-|   ││  WM        leftwm       │
                          Ͼ   ∪   Ͽ  ││  SHELL     fish         │
                           |     |   ╯│  EDITOR    neovim       │
                          ˏ`-.ŏ.-´ˎ   │                         │
                              @       │             ...and more │
                               @      ╰─────────────────────────╯ 
```

## 4k scaling

nice post: https://blog.yossarian.net/2020/12/24/A-few-HiDPI-tricks-for-Linux

- [x] Xresources dpi
- [x] GTK dpi
- [x] Q5
- [x] kitty font size
- [x] Icon size
- [x] Polybar config
- [x] Electron ( no need for now )
- [x] Sddm scaling
- [x] dmenu
- [x] update all language servers
   - [ ] znote

# thinkpad p14s G2

Notes:
For AMD computers xbacklight needs acpilight
On xfce-powermanager the option **Handle display brightness keys** can be disabled,
enable it to control the brightness with the keyboard.

Notes:
xrandr --output DP-0 --auto --output HDMI-0 --auto --scale 2x2 --right-of DP-0

Todos nix:

- HiDPI support for GTK
- HiDPI support on internal tty
- Install script/command to use flakes on nixos minimal install
- Clean `dots` distro 
- Use a remote flake (?)
