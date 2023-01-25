# fio2gnuplot
# Autogenerated from man page /usr/share/man/man1/fio2gnuplot.1.gz
complete -c fio2gnuplot -s h -l help -d 'The option -h displays help'
complete -c fio2gnuplot -s p -l pattern -d 'A pattern in regexp to select fio input files'
complete -c fio2gnuplot -s b -l bandwidth -d 'A predefined pattern for selecting *_bw. log files'
complete -c fio2gnuplot -s i -l iops -d 'A predefined pattern for selecting *_iops. log files'
complete -c fio2gnuplot -s g -l gnuplot -d 'Render gnuplot traces before exiting'
complete -c fio2gnuplot -s o -l outputfile -d 'The basename for gnuplot traces (set with the pattern if defined)'
complete -c fio2gnuplot -s d -l outputdir -d 'The directory where gnuplot shall render files'
complete -c fio2gnuplot -s t -l title -d 'The title of the gnuplot traces'
complete -c fio2gnuplot -s G -l Global -d 'Search for \'type\' in . global files match by a pattern'
complete -c fio2gnuplot -s m -l min_time -d 'Only consider data starting from \'time\' seconds.  Default is 0'
complete -c fio2gnuplot -s M -l max_time -d 'Only consider data ending before \'time\' seconds.  Default is -1 aka nolimit'
complete -c fio2gnuplot -s v -l verbose -d 'Increasing verbosity'
complete -c fio2gnuplot -s k -l keep -d 'Keep all temporary files from gnuplot\'s output dir EXAMPLE To plot all the tr…'
