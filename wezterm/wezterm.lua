require('event')

local wezterm = require('wezterm')

wezterm.on('format-tab-title', function(tab)
    local pane = tab.active_pane
    local title = tab.tab_index + 1 .. ': ' .. pane.title
    if pane['domain_name'] then
        title = title .. ' - (' .. pane.domain_name .. ')'
    end
    return title
end)

return {
    initial_cols = 125,
    initial_rows = 45,
    font = wezterm.font('Hack Nerd Font'),
    font_size = 12,
    colors = {
        tab_bar = {
            active_tab = {
                bg_color = '#24283b',
                fg_color = '#c0caf5',
            },
        },
    },
    color_scheme = 'tokyonight',
    window_frame = {
        font_size = 12.0,
    },
    window_decorations = 'INTEGRATED_BUTTONS|RESIZE',
    window_padding = {
        left = 0,
        right = 0,
        top = 2,
        bottom = 0,
    },
    tab_max_width = 20,
    foreground_text_hsb = {
        hue = 1.0,
        saturation = 1.0,
        brightness = 1.4,
    },
    -- term = 'wezterm',
    default_cursor_style = 'BlinkingBlock',
    -- default_cwd = wezterm.home_dir .. '/workspace',
    native_macos_fullscreen_mode = true,
    -- status_update_interval = 5000,
    clean_exit_codes = { 0, 1, 130 },
    -- exit_behavior = 'Close',
    keys = {
        { key = 'e', mods = 'CMD', action = wezterm.action({ EmitEvent = 'window-visible-text' }) },
        { key = 'l', mods = 'CMD', action = wezterm.action({ ShowLauncherArgs = { flags = 'DOMAINS' } }) },
        { key = 'w', mods = 'CMD', action = wezterm.action({ CloseCurrentPane = { confirm = false } }) },
        { key = 'd', mods = 'CMD', action = wezterm.action({ SplitHorizontal = { domain = 'CurrentPaneDomain' } }) },
        {
            key = 'd',
            mods = 'CMD|SHIFT',
            action = wezterm.action({ SplitVertical = { domain = 'CurrentPaneDomain' } }),
        },
        {
            key = '[',
            mods = 'CMD',
            action = wezterm.action({ ActivatePaneDirection = 'Next' }),
        },
        {
            key = ']',
            mods = 'CMD',
            action = wezterm.action({ ActivatePaneDirection = 'Prev' }),
        },
        {
            key = '>',
            mods = 'CMD|SHIFT',
            action = wezterm.action.MoveTabRelative(1),
        },
        {
            key = '<',
            mods = 'CMD|SHIFT',
            action = wezterm.action.MoveTabRelative(-1),
        },
        { key = 'Enter', mods = 'CMD', action = 'ToggleFullScreen' },
    },
    quote_dropped_files = 'Posix',
    hyperlink_rules = {
        {
            regex = [[\b(https|http)://\S*\b]],
            format = '$0',
        }
    }
}
