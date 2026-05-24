-- Catppuccin Mocha
local rosewater = "rgba(f5e0dcff)"
local flamingo = "rgba(f2cdcdff)"
local pink = "rgba(f5c2e7ff)"
local mauve = "rgba(cba6f7ff)"
local red = "rgba(f38ba8ff)"
local maroon = "rgba(eba0acff)"
local peach = "rgba(fab387ff)"
local yellow = "rgba(f9e2afff)"
local green = "rgba(a6e3a1ff)"
local teal = "rgba(94e2d5ff)"
local sky = "rgba(89dcebff)"
local sapphire = "rgba(74c7ecff)"
local blue = "rgba(89b4faff)"
local lavender = "rgba(b4befeff)"
local text = "rgba(cdd6f4ff)"
local subtext1 = "rgba(bac2deff)"
local subtext0 = "rgba(a6adc8ff)"
local overlay2 = "rgba(9399b2ff)"
local overlay1 = "rgba(7f849cff)"
local overlay0 = "rgba(6c7086ff)"
local surface2 = "rgba(585b70ff)"
local surface1 = "rgba(45475aff)"
local surface0 = "rgba(313244ff)"
local base = "rgba(1e1e2eff)"
local mantle = "rgba(181825ff)"
local crust = "rgba(11111bff)"

hl.env("XCURSOR_SIZE", "24")
hl.env("XCURSOR_THEME", "Adwaita")
hl.env("QT_QPA_PLATFORM", "wayland")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("GDK_BACKEND", "wayland,x11")
hl.env("SDL_VIDEODRIVER", "wayland")
hl.env("CLUTTER_BACKEND", "wayland")

hl.config({
	general = {
		gaps_in = 4,
		gaps_out = 8,
		border_size = 3,
		col = {
			active_border = { colors = { mauve, flamingo }, angle = 90 },
			inactive_border = surface1,
		},
		resize_on_border = true,
		layout = "dwindle",
		allow_tearing = false,
	},

	decoration = {
		rounding = 8,
		rounding_power = 2,
		active_opacity = 1.0,
		inactive_opacity = 0.95,
		blur = {
			enabled = true,
			size = 4,
			passes = 2,
			vibrancy = 0.2,
		},
		shadow = {
			enabled = true,
			range = 8,
			render_power = 3,
			color = 0xcc000000,
		},
	},

	animations = {
		enabled = true,
	},

	input = {
		kb_layout = "us",
		kb_options = "ctrl:nocaps",
		follow_mouse = 1,
		sensitivity = 0,
		touchpad = {
			natural_scroll = true,
			tap_to_click = true,
			drag_lock = true,
		},
	},

	dwindle = {
		preserve_split = true,
	},

	misc = {
		force_default_wallpaper = 0,
		disable_hyprland_logo = true,
	},

	xwayland = {
		force_zero_scaling = true,
	},
})

hl.curve("easeOut", { type = "bezier", points = { { 0.16, 1 }, { 0.3, 1 } } })
hl.curve("easeInOut", { type = "bezier", points = { { 0.87, 0 }, { 0.13, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0.0, 0.0 }, { 1.0, 1.0 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })

hl.animation({ leaf = "windows", enabled = true, speed = 4, bezier = "easeOut" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4, bezier = "easeOut", style = "popin 80%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 2, bezier = "easeOut", style = "popin 80%" })
hl.animation({ leaf = "border", enabled = true, speed = 5, bezier = "easeOut" })
hl.animation({ leaf = "borderangle", enabled = true, speed = 80, bezier = "linear", style = "loop" })
hl.animation({ leaf = "fade", enabled = true, speed = 4, bezier = "easeInOut" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 5, bezier = "almostLinear", style = "slidevert" })
