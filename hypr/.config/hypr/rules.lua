-- Suppress maximize requests from all apps
hl.window_rule({
	name = "suppress-maximize",
	match = { class = ".*" },
	suppress_event = "maximize",
})

-- Fix XWayland drag issues
hl.window_rule({
	name = "fix-xwayland-drag",
	match = { class = "^$", title = "^$", xwayland = true, float = true, fullscreen = false, pin = false },
	no_focus = true,
})

-- Float specific apps
hl.window_rule({
	name = "float-pavucontrol",
	match = { class = "^pavucontrol$" },
	float = true,
	center = true,
	size = { 800, 500 },
})
hl.window_rule({ name = "float-nm-editor", match = { class = "^nm-connection-editor$" }, float = true, center = true })
hl.window_rule({ name = "float-blueman", match = { class = "^blueman-manager$" }, float = true, center = true })

-- Wofi: no animation
hl.layer_rule({ name = "wofi-noanim", match = { namespace = "^wofi$" }, no_anim = true })

-- Waybar: blur
hl.layer_rule({ name = "waybar-blur", match = { namespace = "^waybar$" }, blur = true, xray = false })

-- Mako notifications: blur
hl.layer_rule({ name = "mako-blur", match = { namespace = "^notifications$" }, blur = true })
