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

-- Detect external monitor height at startup to correctly position eDP-1 below it
local function get_monitor_height(output)
	local handle = io.popen("hyprctl monitors -j 2>/dev/null")
	if not handle then
		return nil
	end

	local result = handle:read("*a")
	handle:close()

	local pattern = '"name"%s*:%s*"' .. output .. '".-"height"%s*:%s*(%d+)'
	local height = result:match(pattern)

	return tonumber(height)
end

-- Falls back to 1080 if external monitor is not connected
local edp_y = get_monitor_height("HDMI-A-1") or 1080

-- Laptop screen: positioned below external monitor
hl.monitor({
	output = "eDP-1",
	mode = "preferred",
	position = "0x" .. edp_y,
	scale = 1.0,
})
