# calfjackhost
# Autogenerated from man page /usr/share/man/man1/calfjackhost.1.gz
complete -c calfjackhost -s c -l client -d 'sets JACK client name (the name calfjackhost uses when registering in JACK)'
complete -c calfjackhost -s i -l input -d 'name prefix for audio inputs'
complete -c calfjackhost -s o -l output -d 'name prefix for audio outputs'
complete -c calfjackhost -s m -l midi -d 'name prefix for MIDI inputs'
complete -c calfjackhost -l connect-midi -d 'automatically connect all MIDI ports to client:port'
complete -c calfjackhost -s M -d 'automatically connect all MIDI ports to system:midi_capture_n'
complete -c calfjackhost -s v -l version -d 'prints a version string (calf some. version. number)'
complete -c calfjackhost -s l -l load -d 'Loads the session state from a file'
complete -c calfjackhost -s s -l state -d 'Loads the session state from a file, if such a file exists'
complete -c calfjackhost -s L -l list -d 'List all available plug-ins'
complete -c calfjackhost -s h -s '?' -l help -d 'prints a help text'
complete -c calfjackhost -s t -l no-tray -d 'disable the tray icon on start'

