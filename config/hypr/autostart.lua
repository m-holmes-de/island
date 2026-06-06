-- Autostart applications

island.exec_on_start("waybar")
island.exec_on_start("mako")
island.exec_on_start("hyprpaper")
island.exec_on_start("hypridle")
island.exec_on_start("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")

-- Clipboard history
island.exec_on_start("wl-paste --type text --watch cliphist store")
island.exec_on_start("wl-paste --type image --watch cliphist store")

-- Set systemd environment for slow-launching apps
island.exec_on_start("systemctl --user import-environment $(env | cut -d'=' -f 1)")
island.exec_on_start("dbus-update-activation-environment --systemd --all")
