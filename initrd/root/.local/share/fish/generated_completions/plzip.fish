# plzip
# Autogenerated from man page /usr/share/man/man1/plzip.1.gz
complete -c plzip -s h -l help -d 'display this help and exit'
complete -c plzip -s V -l version -d 'output version information and exit'
complete -c plzip -s a -l trailing-error -d 'exit with error status if trailing data'
complete -c plzip -s B -l data-size -d 'set size of input data blocks [2x8=16 MiB]'
complete -c plzip -s c -l stdout -d 'write to standard output, keep input files'
complete -c plzip -s d -l decompress -d decompress
complete -c plzip -s f -l force -d 'overwrite existing output files'
complete -c plzip -s F -l recompress -d 'force re-compression of compressed files'
complete -c plzip -s k -l keep -d 'keep (don\'t delete) input files'
complete -c plzip -s l -l list -d 'print (un)compressed file sizes'
complete -c plzip -s m -l match-length -d 'set match length limit in bytes [36]'
complete -c plzip -s n -l threads -d 'set number of (de)compression threads [2]'
complete -c plzip -s o -l output -d 'write to <file>, keep input files'
complete -c plzip -s q -l quiet -d 'suppress all messages'
complete -c plzip -s s -l dictionary-size -d 'set dictionary size limit in bytes [8 MiB]'
complete -c plzip -s t -l test -d 'test compressed file integrity'
complete -c plzip -s v -l verbose -d 'be verbose (a 2nd -v gives more)'
complete -c plzip -s 0 -s 9 -d 'set compression level [default 6]'
complete -c plzip -l fast -d 'alias for -0'
complete -c plzip -l best -d 'alias for -9'
complete -c plzip -l loose-trailing -d 'allow trailing data seeming corrupt header'
complete -c plzip -l in-slots -d 'number of 1 MiB input packets buffered [4]'
complete -c plzip -l out-slots -d 'number of 1 MiB output packets buffered [64]'
complete -c plzip -l check-lib -d 'compare version of lzlib. h with liblz. {a,so}'

