http://it7otdanqu7ktntxzm427cba6i53w6wlanlh23v5i3siqmos47pzhvyd.onion/Darktea/Issues_Support_Feedback/issues/16

dont require login for the webinterface

---

Jun 30, 2025, 6:24 AM GMT

milahu:

i have raised this issue before (#14?), but it was removed (why?)

this is still an issue

currently, the "login required" policy is in place for DDOS protection from web scrapers

but this DDOS protection can also be implemented with rate limiting of HTTP requests
https://onionservices.torproject.org/apps/web/onionspray/guides/dos/#webserver-rate-limiting

or gitea could be modified to require login only in periods of high server load
assuming that the DDOS attacks (or webscraping) do not happen 100% of the time

> dont require login for the webinterface

also the git interface requires authentication:

```
$ cd $(mktemp -d)
$ chmod 0777 .
$ LANG=C sudo -u nobody git -c remote.origin.proxy=socks5h://127.0.0.1:9050 clone --depth=1 http://it7otdanqu7ktntxzm427cba6i53w6wlanlh23v5i3siqmos47pzhvyd.onion/Darktea/Issues_Support_Feedback
Cloning into 'Issues_Support_Feedback'...
Username for 'http://it7otdanqu7ktntxzm427cba6i53w6wlanlh23v5i3siqmos47pzhvyd.onion': 
```
