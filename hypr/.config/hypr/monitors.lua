-- Default: preferred resolution, auto position, scale 1.2
hl.monitor({
	output = "",
	mode = "preferred",
	position = "auto",
	scale = 1.2,
})

-- External monitor: positioned at top-left
hl.monitor({
	output = "HDMI-A-1",
	mode = "preferred",
	position = "0x0",
	scale = 1.0,
})

-- Laptop screen: positioned below external monitor
hl.monitor({
	output = "eDP-1",
	mode = "preferred",
	position = "0x1440", -- 2K monitor
	-- position = "0x1080", -- 1080p monitor
	scale = 1.0,
})
