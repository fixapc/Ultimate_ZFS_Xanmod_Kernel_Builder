# dpkg-depcheck
# Autogenerated from man page /usr/share/man/man1/dpkg-depcheck.1.gz
complete -c dpkg-depcheck -s a -l all -d 'Report all packages used to run command.   This is the default behaviour'
complete -c dpkg-depcheck -s b -l build-depends -d 'Do not report any build-essential or essential packages used, or any of their…'
complete -c dpkg-depcheck -s d -l ignore-dev-deps -d 'Do not show packages used which are direct dependencies of -dev packages used'
complete -c dpkg-depcheck -s m -l min-deps -d 'Output a minimal set of packages needed, taking into account direct dependenc…'
complete -c dpkg-depcheck -s C -l C-locale -d 'Run command with the C locale'
complete -c dpkg-depcheck -l no-C-locale -d 'Don\'t change locale when running command'
complete -c dpkg-depcheck -s l -l list-files -d 'Also report the list of files used in each package'
complete -c dpkg-depcheck -l no-list-files -d 'Do not report the files used in each package.   Cancels a -l option'
complete -c dpkg-depcheck -s o -l output -d 'Output the package diagnostics to FILE instead of stdout'
complete -c dpkg-depcheck -s O -l strace-output -d 'Write the strace output to FILE when tracing command instead of using a tempo…'
complete -c dpkg-depcheck -s I -l strace-input -d 'Get strace output from FILE instead of tracing command; strace must have be r…'
complete -c dpkg-depcheck -s f -l features -d 'Enable or disabled features given in the comma-separated LIST as follows'
complete -c dpkg-depcheck -l no-conf -l noconf -d 'Do not read any configuration files'
complete -c dpkg-depcheck -s h -l help -d 'Display usage information and exit'
complete -c dpkg-depcheck -s v -l version -d 'Display version and copyright information and exit'

