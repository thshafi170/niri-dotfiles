# niri-dots-n-apps
A collection of wayland configurations and app recommendations that I daily drive with niri

# App Recommendations
## Niri + Wayland stuff
If you install all of the below, my dots should run out of the box
- swww - wallpaper management
- swaync - notification management
- walker - stylish app launcher
- pantheon-agent-polkit - the elementary os policy kit, maintains gtk styling and restricts its height & width automatically
- waybar - adds a top bar
- wlr/taskbar - adds an app bar
- wl-color-picker - adds a color picker
- grimblast - screenshot utility
- mixxc - a pretty simple audio mixer
- blueman-manager - gui bluetooth management
- swaync-client - a gui for viewing notifications
- xwayland-satellite
- waypaper-engine - swww gui manager

# Theming
The gtk theme I am using is sweet, and the icon theme I'm using is Lucrezia Dark

# Attributions
- Quadpine's Rose theme for Walker - I do plan to develop my own sweet theme, and abenz1267 has plans for theme distribution, but I massively prefer this to any included themes, so for now it's included in the theme folder.
- Nebulosa2007's niri waybar config - it forms the basis for the waybar, I just tinkered with it.

# Things I need and may develop
Alongside the apps I've already found and am looking for, I'm also hoping to build a few myself.

## A graphical user interface for configuring the Niri json file
Niri is a compositor and a compositor alone. I think this is a good thing, and I'd rather YaLTer only need to focus on making said compositor as good as possible. For experienced users the .json config is more than good enough, particularly given it's live reload capabilities. That being said, it shouldn't be too hard to make a gui to config this, particularly given the use of the json file format. I'm considering making an app in Vala that does just that.

## A Calendar application which leverages CalDAV and has a layer shell widget component
To put it fairly simply, I really want to be able to click the calendar icon in my waybar, have a small pane appear leveraging layer shell that shows all my upcoming appointments, then to be able to double click on a date to open that date in the calendar and to book a new appointment. If this already exists, please let me know.

## A live CD running Fedora + all my config
At some point I'll likely switch from Ubuntu to fedora because updating and compiling things takes a lot longer than it should, and has resulted in me installing a mountain of developer tools that are clogging up my ssd. Obviously, this is a slow, tedious process, because I have a lot of config and apps on this system.
