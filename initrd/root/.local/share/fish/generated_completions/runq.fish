# runq
# Autogenerated from man page /usr/share/man/man8/runq.8.gz
complete -c runq -l help -d 'This option causes Exim to output a few sentences stating what it is'
complete -c runq -l version -d 'This option is an alias for -bV and causes version information to be displayed'
complete -c runq -o Ac -d '-Am These options are used by Sendmail for selecting configuration files and …'
complete -c runq -o 'B<type>' -d 'This is a Sendmail option for selecting 7 or 8 bit processing'
complete -c runq -o bd -d 'This option runs Exim as a daemon, awaiting incoming SMTP connections'
complete -c runq -o bdf -d 'This option has the same effect as -bd except that it never disconnects from …'
complete -c runq -o be -d 'Run Exim in expansion testing mode'
complete -c runq -o bem -d 'This option operates like -be except that it must be followed by the name of …'
complete -c runq -o bF -d 'This option is the same as -bf except that it assumes that the filter being t…'
complete -c runq -o bf -d 'This option runs Exim in user filter testing mode; the file is the filter fil…'
complete -c runq -o bfd -d 'This sets the domain of the recipient address when a filter file is being tes…'
complete -c runq -o bfl -d 'This sets the local part of the recipient address when a filter file is being…'
complete -c runq -o bfp -d 'This sets the prefix of the local part of the recipient address when a filter…'
complete -c runq -o bfs -d 'This sets the suffix of the local part of the recipient address when a filter…'
complete -c runq -o bh -d 'This option runs a fake SMTP session as if from the given IP address, using t…'
complete -c runq -o bhc -d 'This option operates in the same way as -bh, except that address verification…'
complete -c runq -o bi -d 'Sendmail interprets the -bi option as a request to rebuild its alias file'
complete -c runq -o bI:help -d 'We shall provide various options starting -bI: for querying Exim for informat…'
complete -c runq -o bI:dscp -d 'This option causes Exim to emit an alphabetically sorted list of all recognis…'
complete -c runq -o bI:sieve -d 'This option causes Exim to emit an alphabetically sorted list of all supporte…'
complete -c runq -o bm -d 'This option runs an Exim receiving process that accepts an incoming, locally-…'
complete -c runq -o bmalware -d 'This debugging option causes Exim to scan the given file or directory (depend…'
complete -c runq -o bnq -d 'By default, Exim automatically qualifies unqualified addresses (those without…'
complete -c runq -o bP -d 'If this option is given with no arguments, it causes the values of all Exim\'s…'
complete -c runq -o bp -d 'This option requests a listing of the contents of the mail queue on the stand…'
complete -c runq -o bpa -d 'This option operates like -bp, but in addition it shows delivered addresses t…'
complete -c runq -o bpc -d 'This option counts the number of messages in the queue, and writes the total …'
complete -c runq -o bpr -d 'This option operates like -bp, but the output is not sorted into chronologica…'
complete -c runq -o bpra -d 'This option is a combination of -bpr and -bpa'
complete -c runq -o bpru -d 'This option is a combination of -bpr and -bpu'
complete -c runq -o bpu -d 'This option operates like -bp but shows only undelivered top-level addresses …'
complete -c runq -o brt -d 'This option is for testing retry rules, and it must be followed by up to thre…'
complete -c runq -o brw -d 'This option is for testing address rewriting rules, and it must be followed b…'
complete -c runq -o bS -d 'This option is used for batched SMTP input, which is an alternative interface…'
complete -c runq -o bs -d 'This option causes Exim to accept one or more messages by reading SMTP comman…'
complete -c runq -o bt -d 'This option runs Exim in address testing mode, in which each argument is take…'
complete -c runq -o bV -d 'This option causes Exim to write the current version number, compilation numb…'
complete -c runq -o bv -d 'This option runs Exim in address verification mode, in which each argument is…'
complete -c runq -o bvs -d 'This option acts like -bv, but verifies the address as a sender rather than a…'
complete -c runq -o bw -d 'This option runs Exim as a daemon, awaiting incoming SMTP connections, simila…'
complete -c runq -s C -d 'This option causes Exim to find the runtime configuration file from the given…'
complete -c runq -o 'D<macro>' -d 'This option can be used to override macro definitions in the configuration fi…'
complete -c runq -o 'd<debug' -d 'This option causes debugging information to be written to the standard error …'
complete -c runq -o 'dd<debug' -d 'This option behaves exactly like -d except when used on a command that starts…'
complete -c runq -o dropcr -d 'This is an obsolete option that is now a no-op'
complete -c runq -s E -d 'This option specifies that an incoming message is a locally-generated deliver…'
complete -c runq -o ex -d 'There are a number of Sendmail options starting with -oe which seem to be cal…'
complete -c runq -s F -d 'This option sets the sender\'s full name for use when a locally-generated mess…'
complete -c runq -s f -d 'This option sets the address of the envelope sender of a locally-generated me…'
complete -c runq -s G -d 'This option is equivalent to an ACL applying: '
complete -c runq -s h -d 'This option is accepted for compatibility with Sendmail, but has no effect'
complete -c runq -s i -d 'This option, which has the same effect as -oi, specifies that a dot on a line…'
complete -c runq -s L -d 'This option is equivalent to setting syslog_processname in the config file an…'
complete -c runq -s M -d 'This option requests Exim to run a delivery attempt on each message in turn'
complete -c runq -o Mar -d 'This option requests Exim to add the addresses to the list of recipients of t…'
complete -c runq -o MC -d 'This option is not intended for use by external callers'
complete -c runq -o MCA -d 'This option is not intended for use by external callers'
complete -c runq -o MCD -d 'This option is not intended for use by external callers'
complete -c runq -o MCd -d 'This option is not intended for use by external callers'
complete -c runq -o MCG -d 'This option is not intended for use by external callers'
complete -c runq -o MCK -d 'This option is not intended for use by external callers'
complete -c runq -o MCL -d 'This option is not intended for use by external callers'
complete -c runq -o MCP -d 'This option is not intended for use by external callers'
complete -c runq -o MCp -d 'This option is not intended for use by external callers'
complete -c runq -o MCQ -d 'This option is not intended for use by external callers'
complete -c runq -o MCq -d 'This option is not intended for use by external callers'
complete -c runq -o MCS -d 'This option is not intended for use by external callers'
complete -c runq -o MCT -d 'This option is not intended for use by external callers'
complete -c runq -o MCr -d '-MCs <SNI> These options are not intended for use by external callers'
complete -c runq -o MCt -d 'This option is not intended for use by external callers'
complete -c runq -o Mc -d 'This option requests Exim to run a delivery attempt on each message, in turn,…'
complete -c runq -o Mes -d 'This option requests Exim to change the sender address in the message to the …'
complete -c runq -o Mf -d 'This option requests Exim to mark each listed message as "frozen"'
complete -c runq -o Mg -d 'This option requests Exim to give up trying to deliver the listed messages, i…'
complete -c runq -o MG -d 'This option requests that each listed message be moved from its current queue…'
complete -c runq -o Mmad -d 'This option requests Exim to mark all the recipient addresses in the messages…'
complete -c runq -o Mmd -d 'This option requests Exim to mark the given addresses as already delivered ("…'
complete -c runq -o Mrm -d 'This option requests Exim to remove the given messages from the queue'
complete -c runq -o Mset -d 'This option is useful only in conjunction with -be (that is, when testing str…'
complete -c runq -o Mt -d 'This option requests Exim to "thaw" any of the listed messages that are "froz…'
complete -c runq -o Mvb -d 'This option causes the contents of the message body (-D) spool file to be wri…'
complete -c runq -o Mvc -d 'This option causes a copy of the complete message (header lines plus body) to…'
complete -c runq -o Mvh -d 'This option causes the contents of the message headers (-H) spool file to be …'
complete -c runq -o Mvl -d 'This option causes the contents of the message log spool file to be written t…'
complete -c runq -s m -d 'This is a synonym for -om that is accepted by Sendmail (https://docs. oracle'
complete -c runq -s N -d 'This is a debugging option that inhibits delivery of a message at the transpo…'
complete -c runq -s n -d 'This option is interpreted by Sendmail to mean "no aliasing"'
complete -c runq -s O -d 'This option is interpreted by Sendmail to mean set option'
complete -c runq -o oA -d 'This option is used by Sendmail in conjunction with -bi to specify an alterna…'
complete -c runq -o oB -d 'This is a debugging option which limits the maximum number of messages that c…'
complete -c runq -o odb -d 'This option applies to all modes in which Exim accepts incoming messages, inc…'
complete -c runq -o odf -d 'This option requests "foreground" (synchronous) delivery when Exim has accept…'
complete -c runq -o odi -d 'This option is synonymous with -odf'
complete -c runq -o odq -d 'This option applies to all modes in which Exim accepts incoming messages, inc…'
complete -c runq -o odqs -d 'This option is a hybrid between -odb/-odi and -odq'
complete -c runq -o oee -d 'If an error is detected while a non-SMTP message is being received (for examp…'
complete -c runq -o oem -d 'This is the same as -oee, except that Exim always exits with a non-zero retur…'
complete -c runq -o oep -d 'If an error is detected while a non-SMTP message is being received, the error…'
complete -c runq -o oeq -d 'This option is supported for compatibility with Sendmail, but has the same ef…'
complete -c runq -o oew -d 'This option is supported for compatibility with Sendmail, but has the same ef…'
complete -c runq -o oi -d 'This option, which has the same effect as -i, specifies that a dot on a line …'
complete -c runq -o oitrue -d 'This option is treated as synonymous with -oi'
complete -c runq -o oMa -d 'A number of options starting with -oM can be used to set values associated wi…'
complete -c runq -o oMaa -d 'See -oMa above for general remarks about the -oM options'
complete -c runq -o oMai -d 'See -oMa above for general remarks about the -oM options'
complete -c runq -o oMas -d 'See -oMa above for general remarks about the -oM options'
complete -c runq -o oMi -d 'See -oMa above for general remarks about the -oM options'
complete -c runq -o oMm -d 'See -oMa above for general remarks about the -oM options'
complete -c runq -o oMr -d 'See -oMa above for general remarks about the -oM options'
complete -c runq -o oMs -d 'See -oMa above for general remarks about the -oM options'
complete -c runq -o oMt -d 'See -oMa above for general remarks about the -oM options'
complete -c runq -o om -d 'In Sendmail, this option means "me too", indicating that the sender of a mess…'
complete -c runq -o oo -d 'This option is ignored'
complete -c runq -o oP -d 'This option is useful only in conjunction with -bd or -q with a time value'
complete -c runq -o oPX -d 'This option is not intended for general use'
complete -c runq -o or -d 'This option sets a timeout value for incoming non-SMTP messages'
complete -c runq -o os -d 'This option sets a timeout value for incoming SMTP messages'
complete -c runq -o ov -d 'This option has exactly the same effect as -v'
complete -c runq -o oX -d 'This option is relevant only when the -bd (start listening daemon) option is …'
complete -c runq -o oY -d 'This option controls the creation of an inter-process communications endpoint…'
complete -c runq -o pd -d 'This option applies when an embedded Perl interpreter is linked with Exim'
complete -c runq -o ps -d 'This option applies when an embedded Perl interpreter is linked with Exim'
complete -c runq -o 'p<rval>:<sval>' -d 'For compatibility with Sendmail, this option is equivalent to '
complete -c runq -s q -d 'This option is normally restricted to admin users'
complete -c runq -o 'q<qflags>' -d 'The -q option may be followed by one or more flag letters that change its beh…'
complete -c runq -o qq -d 'An option starting with -qq requests a two-stage queue run'
complete -c runq -o qi -d 'If the i flag is present, the queue runner runs delivery processes only for t…'
complete -c runq -o qf -d 'If one f flag is present, a delivery attempt is forced for each non-frozen me…'
complete -c runq -o qff -d 'If ff is present, a delivery attempt is forced for every message, whether fro…'
complete -c runq -o ql -d 'The l (the letter "ell") flag specifies that only local deliveries are to be …'
complete -c runq -o 'q<qflags><time>' -d 'When a time value is present, the -q option causes Exim to run as a daemon, s…'
complete -c runq -o 'qR<rsflags>' -d 'This option is synonymous with -R.  It is provided for Sendmail compatibility'
complete -c runq -o 'qS<rsflags>' -d 'This option is synonymous with -S'
complete -c runq -o 'R<rsflags>' -d 'The <rsflags> may be empty, in which case the white space before the string i…'
complete -c runq -s r -d 'This is a documented (for Sendmail) obsolete alternative name for -f'
complete -c runq -o 'S<rsflags>' -d 'This option acts like -R except that it checks the string against each messag…'
complete -c runq -o Tqt -d 'This is an option that is exclusively for use by the Exim testing suite'
complete -c runq -s t -d 'When Exim is receiving a locally-generated, non-SMTP message on its standard …'
complete -c runq -o ti -d 'This option is exactly equivalent to -t -i'
complete -c runq -o tls-on-connect -d 'This option is available when Exim is compiled with TLS support'
complete -c runq -s U -d 'Sendmail uses this option for "initial message submission", and its documenta…'
complete -c runq -s v -d 'This option causes Exim to write information to the standard error stream, de…'
complete -c runq -s x -d 'AIX uses -x for a private purpose ("mail from a local mail program has Nation…'
complete -c runq -s X -d 'This option is interpreted by Sendmail to cause debug information to be sent …'

