config.load_autoconfig(False)

# --- UI Cleanup (Less Ugly) ---
c.colors.webpage.darkmode.enabled = True
c.statusbar.show = "in-mode"        # Hide statusbar unless typing a command
c.tabs.show = "switching"           # Only show tabs when you're switching them
c.scrolling.bar = "never"           # Hide the bulky scrollbar
c.window.title_format = "{perc}{current_title}" # Clean window title
c.fonts.default_size = "11pt"
c.fonts.default_family = "JetBrains Mono" # Or your favorite monospace font

# --- Keybindings ---

# 2. Define the Leader mappings
# <Leader>h to go back in history
config.bind('<Space>h', 'back')
config.bind('<Space>l', 'forward')
config.bind('<Space>o', 'set-cmd-text -s :open')
config.bind('<Space>w', 'set-cmd-text -s :open -w')
