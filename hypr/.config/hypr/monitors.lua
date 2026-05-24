-- Default: preferred resolution, auto position, scale 1.2
-- Adjust scale for your display (1.0 = no scaling, 1.6 = HiDPI)
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

-- Update `position` to place eDP-1 below the external monitor
-- Y offset = external monitor height / scale
-- Example: 1440px @ 1.0 scale → "0x1440"
--          1440px @ 2.0 scale → "0x720"
hl.monitor({
	output = "eDP-1",
	mode = "preferred",
	position = "0x1440",
	scale = 1.0,
})
