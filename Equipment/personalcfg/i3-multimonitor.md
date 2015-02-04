#Setting up i3 with 4K + SyncMaster

This turned out to be harder than expected, since it apparently "just works" in
Gnome.

##xrandr notes:

 * xrandr doesn't know which VBOX is which physical monitor; this is determined
   by VirtualBox and is set by: "View -> Virtual Screen # -> Use Host Screen #"
 * If the size of screen 0 is too small, use `--fb (size)`
 * sometimes modes don't seem to be setable even if they're listed by `xrandr`.
 * "New" modes must be first created (`gtf [args] ; xrandr --newmode [modeline]`)
   and then added (`xrandr --addmode [screen] [name]`)

# Commands:
  130  gtf 3840 2160 30
  131  xrandr --newmode "3840x2160_30.00"  339.57  3840 4080 4496 5152  2160 2161 2164 2197
  132  xrandr --addmode VBOX1 3840x2160_30.00
  133  xrandr --output VBOX1 --mode 3840x2160_30.00 --left-of VBOX0
# At this point I needed to switch which virtual screen # to associate with
# which physical monitor (see above), because VBOX1 was now being sent
# (incompletely) to the SyncMaster.

# This may be automatable; see https://superuser.com/questions/428159/forcing-monitor-resolution-in-virtualbox-vm-on-linux-guest
