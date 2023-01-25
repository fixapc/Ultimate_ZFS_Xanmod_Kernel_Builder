# links2
# Autogenerated from man page /usr/share/man/man1/links2.1.gz
complete -c links2 -o help -d 'Print a help screen'
complete -c links2 -o version -d 'Prints the links version number and exit'
complete -c links2 -o lookup -d 'Does name lookup, like command "host"'
complete -c links2 -s g -d 'Run Links2 in graphics mode.  If not given, Links2 will run in text mode'
complete -c links2 -o no-g -d 'Run in text mode (overrides previous -g)'
complete -c links2 -o driver -d 'Graphics driver to use'
complete -c links2 -o mode -d 'Pass a parameter to the graphics driver'
complete -c links2 -o display -d 'Set Xwindow display'
complete -c links2 -o force-html -d 'Treat files with unknown type as html rather than text'
complete -c links2 -o source -d 'Write unformatted data stream to stdout'
complete -c links2 -o dump -d 'Write formatted document to stdout'
complete -c links2 -o width -d 'For dump, document will be formatted to this screen width (but it can still e…'
complete -c links2 -o codepage -d 'For dump, convert output to specified character set -- for example iso-8859-2…'
complete -c links2 -o anonymous -d 'Restrict links so that it can run on an anonymous account'
complete -c links2 -o no-connect -d 'Runs links2 as a separate instance - instead of connecting to existing instan…'
complete -c links2 -o download-dir -d 'Default download directory.  (default: actual dir)'
complete -c links2 -o language -d 'Set user interface language'
complete -c links2 -o max-connections -d 'Maximum number of concurrent connections.  (default: 10)'
complete -c links2 -o max-connections-to-host -d 'Maximum number of concurrent connection to a given host.  (default: 2)'
complete -c links2 -o retries -d 'Number of retries.  (default: 3)'
complete -c links2 -o receive-timeout -d 'Timeout on receive.  (default: 120)'
complete -c links2 -o unrestartable-receive-timeout -d 'Timeout on non restartable connections.  (default: 600)'
complete -c links2 -o timeout-when-trying-multiple-addresses -d 'Timeout for connection when trying multiple addresses or when resuming a keep…'
complete -c links2 -o bind-address -d 'Use a specific local IP address'
complete -c links2 -o bind-address-ipv6 -d 'Use a specific local IPv6 address'
complete -c links2 -o no-libevent -d 'Don\'t use libevent library'
complete -c links2 -o no-openmp -d 'Don\'t use OpenMP'
complete -c links2 -o download-utime -d 'Set time of downloaded files to last modification time reported by server'
complete -c links2 -o format-cache-size -d 'Number of formatted document pages cached.  (default: 5)'
complete -c links2 -o memory-cache-size -d 'Cache memory in bytes.  (default: 1048576)'
complete -c links2 -o image-cache-size -d 'Cache memory in bytes.  (default: 1048576)'
complete -c links2 -o font-cache-size -d 'Cache memory in bytes.  (default: 2097152)'
complete -c links2 -o aggressive-cache -d 'Always cache everything regardless of server\'s caching recomendations'
complete -c links2 -o address-preference -d '(default 0) 0 - use system default.  1 - prefer IPv4.  2 - prefer IPv6'
complete -c links2 -o http-proxy -d 'Host and port number of the HTTP proxy, or blank.  (default: blank)'
complete -c links2 -o ftp-proxy -d 'Host and port number of the FTP proxy, or blank.  (default: blank)'
complete -c links2 -o https-proxy -d 'Host and port number of the HTTPS proxy, or blank.  (default: blank)'
complete -c links2 -o socks-proxy -d 'Userid, host and port of Socks4a, or blank.  (default: blank)'
complete -c links2 -o append-text-to-dns-lookups -d 'Append text to dns lookups.  It is useful for specifying fixed tor exit node'
complete -c links2 -o no-proxy-domains -d 'No proxy for specified domains.  (default: blank)'
complete -c links2 -o only-proxies -d '"1" causes that Links won\'t initiate any non-proxy connection'
complete -c links2 -o 'ssl.certificates' -d '(default 1) 0 - ignore invalid certificate.  1 - warn on invalid certificate'
complete -c links2 -o 'ssl.builtin-certificates' -d '(default 0; on DOS and OpenVMS default 1) Use built-in certificates instead o…'
complete -c links2 -o 'ssl.client-cert-key' -d 'Name of the PEM encoded file with the user private key for client certificate…'
complete -c links2 -o 'ssl.client-cert-crt' -d 'Name of the PEM encoded file with the user certificate for client certificate…'
complete -c links2 -o 'ssl.client-cert-password' -d 'Password for the user private key'
complete -c links2 -o async-dns -d 'Asynchronous DNS resolver on(1)/off(0)'
complete -c links2 -o dns-over-https -d 'DNS over HTTPS url'
complete -c links2 -o 'http-bugs.http10' -d '(default 0) "1" forces using only HTTP/1. 0 protocol'
complete -c links2 -o 'http-bugs.allow-blacklist' -d '(default 1) "1" defaults to using list of servers that have broken HTTP/1'
complete -c links2 -o 'http-bugs.bug-no-accept-charset' -d '(default 0) Do not send Accept-Charset field of HTTP header'
complete -c links2 -o 'http-bugs.no-compression' -d '(default 0) "1" causes that links won\'t advertise HTTP compression support (b…'
complete -c links2 -o 'http-bugs.retry-internal-errors' -d '(default 0) Retry on internal server errors (50x)'
complete -c links2 -o 'http.fake-firefox' -d '(default 0) Fake that the browser is Firefox in the HTTP header'
complete -c links2 -o 'http.do-not-track' -d '(default 0) Send "do not track" request in the HTTP header'
complete -c links2 -o 'http.referer' -d '(default 0) 0 - do not send referer.  1 - send the requested URL as referer'
complete -c links2 -o 'http.fake-referer' -d 'Fake referer value'
complete -c links2 -o 'http.fake-user-agent' -d 'Fake user agent value'
complete -c links2 -o 'http.extra-header' -d 'Extra string added to HTTP header'
complete -c links2 -o 'ftp.anonymous-password' -d 'Password for anonymous ftp access'
complete -c links2 -o 'ftp.use-passive' -d 'Use ftp PASV command to bypass firewalls'
complete -c links2 -o 'ftp.use-erpt-epsv' -d 'Use EPRT and EPSV commands instead of PORT and PASV'
complete -c links2 -o 'ftp.set-iptos' -d 'Set IP Type-of-service to high throughput on ftp connections'
complete -c links2 -o 'smb.allow-hyperlinks-to-smb' -d 'Allow hyperlinks to SMB protocol'
complete -c links2 -o menu-font-size -d 'Size of font in menu'
complete -c links2 -o menu-background-color -d 'Set menu background color in graphics mode.  RRGGBB are hex'
complete -c links2 -o menu-foreground-color -d 'Set menu foreground color in graphics mode.  RRGGBB are hex'
complete -c links2 -o scroll-bar-area-color -d 'Set color of scroll bar area.  RRGGBB are hex'
complete -c links2 -o scroll-bar-bar-color -d 'Set color of scroll bar.  RRGGBB are hex'
complete -c links2 -o scroll-bar-frame-color -d 'Set color of scroll bar frame.  RRGGBB are hex'
complete -c links2 -o bookmarks-file -d 'File to store bookmarks'
complete -c links2 -o bookmarks-codepage -d 'Character set of bookmarks file'
complete -c links2 -o save-url-history -d 'Save URL history on exit'
complete -c links2 -o enable-cookies -d 'Enable cookies'
complete -c links2 -o save-cookies -d 'Save cookies on exit'
complete -c links2 -o max-cookie-age -d 'Maximum cookie age in days.  0 - unlimited'
complete -c links2 -o display-red-gamma -d 'Red gamma of display.  (default 2. 2)'
complete -c links2 -o display-green-gamma -d 'Green gamma of display.  (default 2. 2)'
complete -c links2 -o display-blue-gamma -d 'Blue gamma of display.  (default 2. 2)'
complete -c links2 -o user-gamma -d 'Additional gamma.  (default 1)'
complete -c links2 -o bfu-aspect -d 'Display aspect ration'
complete -c links2 -o dither-letters -d 'Do letter dithering'
complete -c links2 -o dither-images -d 'Do image dithering'
complete -c links2 -o display-optimize -d 'Optimize for CRT (0), LCD RGB (1), LCD BGR (2)'
complete -c links2 -o gamma-correction -d 'Type of gamma correction: (default 2) 0 - 8-bit (fast).  1 - 16-bit (slow)'
complete -c links2 -o overwrite-instead-of-scroll -d 'Overwrite the screen instead of scrolling it (valid for svgalib and framebuff…'
complete -c links2 -o font -d 'Font file for normal text'
complete -c links2 -o font-bold -d 'Font file for bold text'
complete -c links2 -o font-monospaced -d 'Font file for monospaced text'
complete -c links2 -o font-monospaced-bold -d 'Font file for monospaced bold text'
complete -c links2 -o font-italic -d 'Font file for italic text'
complete -c links2 -o font-italic-bold -d 'Font file for italic bold text'
complete -c links2 -o font-monospaced-italic -d 'Font file for monospaced italic text'
complete -c links2 -o font-monospaced-italic-bold -d 'Font file for monospaced italc bold text'
complete -c links2 -o html-assume-codepage -d 'Use the given codepage when the webpage did not specify its codepage'
complete -c links2 -o html-hard-assume -d 'Use always character set from "-html-assume-codepage" no matter what server s…'
complete -c links2 -o html-tables -d 'Render tables.  (0) causes tables being rendered like in lynx'
complete -c links2 -o html-frames -d 'Render frames.  (0) causes frames  rendered like in lynx'
complete -c links2 -o html-break-long-lines -d 'Break long lines in <pre> sections'
complete -c links2 -o html-images -d 'Display links to unnamed images as [IMG]'
complete -c links2 -o html-image-names -d 'Display filename of an image instead of [IMG]'
complete -c links2 -o html-display-images -d 'Display images in graphics mode'
complete -c links2 -o html-image-scale -d 'Scale images in graphics mode'
complete -c links2 -o html-bare-image-autoscale -d 'Autoscale images displayed in full screen'
complete -c links2 -o html-numbered-links -d 'Number links in text mode'
complete -c links2 -o html-table-order -d 'In text mode, walk through table by rows (0) or columns (1)'
complete -c links2 -o html-auto-refresh -d 'Process refresh to other page (1), or display link to that page (0)'
complete -c links2 -o html-target-in-new-window -d 'Allow opening new windows from html'
complete -c links2 -o html-margin -d 'Margin in text mode'
complete -c links2 -o html-user-font-size -d 'Size of font on pages in graphics mode'
complete -c links2 -o html-text-color -d 'Text color in text mode'
complete -c links2 -o html-link-color -d 'Link color in text mode'
complete -c links2 -o html-background-color -d 'Background color in text mode'
complete -c links2 -o html-ignore-document-color -d 'Ignore colors specified in html document in text mode'
complete -c links2 -o html-g-text-color -d 'Text color in graphics mode'
complete -c links2 -o html-g-link-color -d 'Link color in graphics mode'
complete -c links2 -o html-g-background-color -d 'Background color in graphics mode'
complete -c links2 -o html-g-ignore-document-color -d 'Ignore colors specified in html document in graphics mode'

