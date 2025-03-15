local wezterm = require("wezterm")
local keymaps = require("keybind")

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- フォントの設定
config.font = wezterm.font("Meslo LG L for Powerline", {weight="Medium", stretch="Normal", style="Normal"})
-- フォントサイズの設定
config.font_size = 13

-- カラースキームの設定
-- config.color_scheme = 'AdventureTime'
-- config.color_scheme = 'Dracula+'
-- config.color_scheme = 'Dark Ocean'
config.color_scheme = 'nightfox'
-- 背景透過
config.window_background_opacity = 0.78

config.automatically_reload_config = true
config.window_close_confirmation = "NeverPrompt"
config.default_cursor_style = "BlinkingBar"
config.macos_window_background_blur = 20
config.window_decorations = "NONE"
config.window_frame = {
  inactive_titlebar_bg = "none",
  active_titlebar_bg = "none",
}
 config.window_background_gradient = {
   colors = { "#192330" },
 }
config.show_new_tab_button_in_tab_bar = false
config.colors = {
 tab_bar = {
   inactive_tab_edge = "none",
 },
}
-- ✅ ペーンの分割線の色を設定
config.colors = {
  split = "#8699C0", -- 薄い灰色と青の中間の色
}

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
   local background = "#2f1922"
   local foreground = "#5c6d74"

   if tab.is_active then
     background = "e6dccf"
--     background = "2f1922"
--     background = "#232f19"
     foreground = "#FFFFFF"
   end

   local title = "   " .. wezterm.truncate_right(tab.active_pane.title, max_width - 1) .. "   "

   return {
     { Background = { Color = background } },
     { Foreground = { Color = foreground } },
     { Text = title },
   }
end)

-- Scroll back
config.scrollback_lines = 3500

-- Paste
local act = wezterm.action

config.keys = {

-- paste from the clipboard

{ key = 'v', mods = 'CTRL', action = act.PasteFrom 'Clipboard' },

-- paste from the primary selection

{ key = 'v', mods = 'CTRL', action = act.PasteFrom 'PrimarySelection' },

}

config.mouse_bindings = {
	{
		event = { Down = { streak = 1, button = "Right" } },
		mods = "NONE",
		action = act({ PasteFrom = "Clipboard" }),
	},
}

-- ✅ Import keymaps from keymaps.lua
config.leader = keymaps.leader -- Use the imported leader key
for _, keymap in ipairs(keymaps.keys) do
  table.insert(config.keys, keymap) -- Merge keymaps into config.keys
end

-- exit
config.exit_behavior = 'CloseOnCleanExit'

return config
