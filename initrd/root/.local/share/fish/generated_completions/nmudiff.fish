# nmudiff
# Autogenerated from man page /usr/share/man/man1/nmudiff.1.gz
complete -c nmudiff -l new -d 'Instead of mailing the bug reports which are to be closed by this NMU, a new …'
complete -c nmudiff -l old -d 'Send the bug report to all of the bugs which are being closed by this NMU, ra…'
complete -c nmudiff -l mutt -d 'Use mutt(1) (or neomutt(1)) for editing and sending the message to the BTS (d…'
complete -c nmudiff -l no-mutt -d 'Use sensible-editor(1) to edit the message and then mail it directly using /u…'
complete -c nmudiff -l sendmail -d 'Specify the sendmail command'
complete -c nmudiff -l from -d 'If using the sendmail (--no-mutt) option, then the email to the BTS will be s…'
complete -c nmudiff -l delay -d 'Indicate in the generated mail that the NMU has been uploaded to the DELAYED …'
complete -c nmudiff -l no-delay -l nodelay -d 'Equivalent to --delay 0'
complete -c nmudiff -l no-conf -l noconf -d 'Do not read any configuration files'
complete -c nmudiff -l no-pending -l nopending -d 'Do not add the pending tag'
complete -c nmudiff -l non-dd -l nondd -d 'Mention in the email that you require sponsorship'
complete -c nmudiff -l template -d 'Use content of TEMPLATEFILE for message body instead of default template'
complete -c nmudiff -l help -d 'Display a help message and exit successfully'
complete -c nmudiff -s t -d 'devscripts configuration files; see below'
complete -c nmudiff -l version -d 'Display version and copyright information and exit successfully'

