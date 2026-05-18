DoomWM is an extremely fast, small, and dynamic window
manager for X.

This is my current build that I personally use and
dont plan on moving to other WM or DEs. And is
based on the concept of "productivity over looks and bling".
Sure It might not be the best looking or even
working window manager or other wm but with this you will
never need a mouse for your workflow, everything is
perfectly useable when combined with the
[dotfiles](https://github.com/iamb4uc/dots.git) I have.

Features
--------
- Per-tag layout, gaps, master count, bar visibility, and master-size memory.
- Bottom status bar with plain numbered tag labels.
- Optional XEmbed system tray for apps like NetworkManager, bluetooth tools,
  KeepassXC, and other tray-aware programs.
- Scratchpad terminal, swallowing, extra layouts, and Xinerama support.

Requirements
------------
Install these packages:

```sh
xbps-install libX11 libXft libXinerama libX11-devel libXft-devel libXinerama-devel
```


Installation
------------
Edit config.mk to match your local setup (doomwm is
installed into the /usr/local namespace by default).

**No need to edit if you use VOIDLINUX**

Afterwards enter the following command to build and install doomwm (if
necessary as root):

```sh
make clean install
```

Running DoomWM
-----------
Add the following line to your .xinitrc to start DoomWM using startx:
```sh
exec doomwm
```
This uses an autostart script from `~/.local/share/doomwm/autostart.sh`, so
make that file executable using `chmod +x`.

DoomWM executes the autostart scripts directly. Keep the `#!/bin/sh` line at the
top of the script; background long-running commands inside the script with `&`.

Also, this works very well when used with my
[dots](https://github.com/iamb4uc/dots.git)
[DoomTerm config](https://github.com/iamb4uc/DoomTerm.git)
[DoomMenu config](https://github.com/iamb4uc/DoomMenu.git)
and lastly my
[DoomStatus config](https://github.com/iamb4uc/DoomStatus.git)
