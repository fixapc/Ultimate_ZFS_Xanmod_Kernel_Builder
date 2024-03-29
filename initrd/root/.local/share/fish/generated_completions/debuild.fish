# debuild
# Autogenerated from man page /usr/share/man/man1/debuild.1.gz
complete -c debuild -l no-conf -l noconf -d 'Do not read any configuration files'
complete -c debuild -l rootcmd -s r -d 'Command to gain root (or fake root) privileges'
complete -c debuild -l preserve-env -d 'Do not clean the environment, except for PATH'
complete -c debuild -l preserve-envvar -s e -d 'Do not clean the var variable from the environment'
complete -c debuild -l set-envvar -d 'Set the environment variable var to value and do not remove it from the envir…'
complete -c debuild -l prepend-path -d 'Once the normalized PATH has been set, prepend value to it'
complete -c debuild -l lintian -d 'Run lintian after dpkg-buildpackage'
complete -c debuild -l no-lintian -d 'Do not run lintian after dpkg-buildpackage'
complete -c debuild -l no-tgz-check -d 'Even if we\'re running dpkg-buildpackage and the version number has a Debian r…'
complete -c debuild -l tgz-check -d 'If we\'re running dpkg-buildpackage and the version number has a Debian revisi…'
complete -c debuild -l username -d 'When signing, use debrsign instead of debsign'
complete -c debuild -l foo-hook -d 'Set a hook as described above.   If hook is blank, this unsets the hook'
complete -c debuild -l clear-hooks -d 'Clears all hooks.   They may be reinstated by later command line options'
complete -c debuild -l check-dirname-level -d 'See the above section Directory name checking for an explanation of this opti…'
complete -c debuild -l check-dirname-regex -d 'See the above section Directory name checking for an explanation of this opti…'
complete -c debuild -s d -d 'Do not run dpkg-checkbuilddeps to check build dependencies'

