import theme.spill
import os

config.load_autoconfig()

config.set("content.cookies.accept", "all", "chrome-devtools://*")
config.set("content.cookies.accept", "all", "devtools://*")

config.set(
    "content.headers.user_agent",
    "Mozilla/5.0 ({os_info}) AppleWebKit/{webkit_version} (KHTML, like Gecko) {upstream_browser_key}/{upstream_browser_version} Safari/{webkit_version}",
    "https://web.whatsapp.com/",
)
config.set(
    "content.headers.user_agent",
    "Mozilla/5.0 ({os_info}; rv:71.0) Gecko/20100101 Firefox/71.0",
    "https://accounts.google.com/*",
)
config.set(
    "content.headers.user_agent",
    "Mozilla/5.0 ({os_info}) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99 Safari/537.36",
    "https://*.slack.com/*",
)
config.set(
    "content.headers.user_agent",
    "Mozilla/5.0 ({os_info}; rv:71.0) Gecko/20100101 Firefox/71.0",
    "https://docs.google.com/*",
)
config.set(
    "content.headers.user_agent",
    "Mozilla/5.0 ({os_info}; rv:71.0) Gecko/20100101 Firefox/71.0",
    "https://drive.google.com/*",
)

config.set("content.images", True, "chrome-devtools://*")
config.set("content.images", True, "devtools://*")


# Bindings for normal mode
config.bind(",M", "spawn xdg-open {url}")
config.bind(",Y", "spawn watchlist {url}")
config.bind(",m", "hint links spawn xdg-open {hint-url}")
config.bind(",y", "hint links spawn watchlist {hint-url}")
config.bind(",v", "hint links spawn mpv {hint-url}")
config.bind(
    "ar",
    "open javascript:location.href='https://reader.miniflux.app/bookmarklet?uri='+encodeURIComponent(window.location.href)",
)
config.bind(
    "aw",
    "open javascript:(function()%7Bvar%20url=location.href%7C%7Curl;var%20wllbg=window.open('https://wallabag.nixnet.xyz/bookmarklet?url='%20+%20encodeURIComponent(url),'_blank');%7D)();",
)
config.bind("eu", "edit-url")
config.bind("ec", "config-edit")
config.bind("cs", "config-source")
# Bars
config.bind("xb", "config-cycle statusbar.show always never")
config.bind("xt", "config-cycle tabs.show always never")
config.bind(
    "xx",
    "config-cycle statusbar.show always never;; config-cycle tabs.show always never",
)
# Gopass stuff
config.bind(
    '<z><l>',
    'spawn --userscript qute-pass --dmenu-invocation menu --mode gopass')
config.bind(
    '<z><u><l>',
    'spawn --userscript qute-pass --username-only --dmenu-invocation menu --mode gopass')
config.bind(
    '<z><p><l>',
    'spawn --userscript qute-pass --password-only --dmenu-invocation menu --mode gopass')
config.bind(
    '<z><o><l>',
    'spawn --userscript qute-pass --otp-only --dmenu-invocation menu --mode gopass')

# Security/Privacy
c.content.cookies.accept = "no-3rdparty"
c.content.blocking.hosts.lists = [
    "https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling-porn/hosts"
]

# Theme Stuff and Styling
theme.spill.paint(c, {"spacing": {"vertical": 0, "horizontal": 0}})
# c.colors.webpage.darkmode.enabled = True

# TODO Sort these
c.content.fullscreen.window = True  # Limits 'fullscreen' to window dimensions
c.content.autoplay = False  # Disables autplay of videos
if os.environ["TERMINAL"] != "foot":
    c.editor.command = [os.environ["TERMINAL"], "-e", os.environ["EDITOR"], "{file}"]
if os.environ["TERMINAL"] == "foot":
    c.editor.command = [os.environ["TERMINAL"], os.environ["EDITOR"], "{file}"]

c.url.start_pages = [
    "https://reader.miniflux.app",
    "https://wallabag.nixnet.xyz"]
c.url.open_base_url = True  # Opens search engine when no search param is given
c.url.searchengines = {
    "DEFAULT": "https://searx.neocities.org/?q={}",
    "a": "https://wiki.archlinux.org/index.php?search={}",
    "d": "https://duckduckgo.com/?q={}",
    "e": "https://www.ecosia.org/search?q={}",
    "f": "https://flathub.org/apps/search/{}",
    "g": "https://github.com/search?q={}",
    "h": "https://search.tx0.co/?q={}&i=nope&files=&repos=",
    "p": "https://www.protondb.com/search?q={}",
    "w": "https://en.wikipedia.org/w/index.php?search={}",
}

# Allow JS selectively
c.content.javascript.enabled = False
allow_JS = [
    "https://destinationlinux.network/*",
    "*://localhost/*",
    "*://127.0.0.1/*",
    "https://github.com/*",
    "https://flathub.org/*",
    "https://searx.neocities.org/*",
    "https://web.whatsapp.com",
    "https://moodle.ucenfotec.ac.cr/*",
    "https://drive.google.com/*",
    "https://meet.google.com/*",
    "https://docs.google.com/*",
    "https://reader.miniflux.app/*",
    "https://*.protondb.com/*",
    "https://fosstodon.org/*",
    "https://peertube.co.uk/*",
    "https://wallabag.nixnet.xyz/*",
    "https://mepla.org/*",
    # Browser-specific stuff
    "chrome-devtools://*",
    "devtools://*",
    "chrome://*/*",
    "qute://*/*",
]
for site in allow_JS:
    with config.pattern(site) as p:
        p.content.javascript.enabled = True

c.spellcheck.languages = ["en-US", "es-ES"]

config.source("./redirectors.py")
