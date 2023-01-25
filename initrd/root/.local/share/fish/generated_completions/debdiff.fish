# debdiff
# Autogenerated from man page /usr/share/man/man1/debdiff.1.gz
complete -c debdiff -l dirs -s d -d 'The default mode of operation is to ignore directory names which appear in th…'
complete -c debdiff -l nodirs -d 'Ignore directory names which appear in the file list'
complete -c debdiff -l move -s m -d 'It sometimes occurs that various files or directories are moved around betwee…'
complete -c debdiff -l move-regex -d 'This is the same as --move, except that FROM is treated as a regular expressi…'
complete -c debdiff -l nocontrol -d 'debdiff will usually compare the respective control files of the packages usi…'
complete -c debdiff -l control -d 'Compare the respective control files; this is the default, and it can be used…'
complete -c debdiff -l controlfiles -d 'Specify which control files to compare; by default this is just control, but …'
complete -c debdiff -l wdiff-source-control -d 'When processing source packages, compare control files using wdiff'
complete -c debdiff -l no-wdiff-source-control -d 'Do not compare control files in source packages using wdiff'
complete -c debdiff -l wp -l wl -l wt -d 'Pass a -p, -l or -t option to wdiff respectively'
complete -c debdiff -l show-moved -d 'If multiple . deb files are specified on the command line, either using '
complete -c debdiff -l noshow-moved -d 'The default behaviour; can be used to override a configuration file setting'
complete -c debdiff -l renamed -d 'If --show-moved is being used and a package has been renamed in the process, …'
complete -c debdiff -l exclude -d 'Exclude files whose basenames match PATTERN'
complete -c debdiff -l diffstat -d 'Include the result of diffstat before the generated diff'
complete -c debdiff -l no-diffstat -d 'The default behaviour; can be used to override a configuration file setting'
complete -c debdiff -l auto-ver-sort -d 'When comparing source packages, do so in version order'
complete -c debdiff -l no-auto-ver-sort -d 'Compare source packages in the order they were passed on the command-line, ev…'
complete -c debdiff -l unpack-tarballs -d 'When comparing source packages, also unpack tarballs found in the top level s…'
complete -c debdiff -l no-unpack-tarballs -d 'Do not unpack tarballs inside source packages'
complete -c debdiff -l apply-patches -d 'If the old and/or new package is in 3'
complete -c debdiff -l no-apply-patches -l noapply-patches -d 'If the old and/or new package is in 3'
complete -c debdiff -l no-conf -l noconf -d 'Do not read any configuration files'
complete -c debdiff -l debs-dir -d 'Look for the '
complete -c debdiff -l help -s h -d 'Show a summary of options'
complete -c debdiff -l version -s v -d 'Show version and copyright information'
complete -c debdiff -l quiet -s q -d 'Be quiet if no differences were found'
complete -c debdiff -l ignore-space -s w -d 'Ignore whitespace in diffs'
complete -c debdiff -s p -s l -s t

