config.load_autoconfig(False)

# UI Hiding - Strip everything for a clean 'paper' look
c.tabs.show = "never"
c.statusbar.show = "never"
c.scrolling.bar = "never"
c.window.title_format = "Typst Preview: {perc}{current_title}"
c.window.hide_decoration = True

# Behavior
c.auto_save.session = True
c.scrolling.smooth = True

# Colors - Pure white/black or Retro (Optional)
# If you want a retro look, uncomment the darkmode line:
# c.colors.webpage.darkmode.enabled = True

# Keybindings for Previewing
config.bind("r", "reload")  # Quick refresh if watch delays
config.bind("xb", "config-cycle statusbar.show always never")
config.bind("xt", "config-cycle tabs.show always never")

# Search & Start
c.url.default_page = "https://duckduckgo.com"
c.url.start_pages = ["https://duckduckgo.com"]
c.url.searchengines = {"DEFAULT": "https://kagi.com/search?q={}"}

# Quick search on Wikipedia or WolframAlpha
c.url.searchengines["w"] = "https://en.wikipedia.org/wiki/Special:Search?search={}"
c.url.searchengines["wa"] = "https://www.wolframalpha.com/input/?i={}"
