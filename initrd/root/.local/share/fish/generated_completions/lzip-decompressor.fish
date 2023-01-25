# lzip-decompressor
# Autogenerated from man page /usr/share/man/man1/lzip-decompressor.1.gz
complete -c lzip-decompressor -s h -l help -d 'display this help and exit'
complete -c lzip-decompressor -s V -l version -d 'output version information and exit'
complete -c lzip-decompressor -s a -l trailing-error -d 'exit with error status if trailing data'
complete -c lzip-decompressor -s B -l data-size -d 'set size of input data blocks [2x8=16 MiB]'
complete -c lzip-decompressor -s c -l stdout -d 'write to standard output, keep input files'
complete -c lzip-decompressor -s d -l decompress -d decompress
complete -c lzip-decompressor -s f -l force -d 'overwrite existing output files'
complete -c lzip-decompressor -s F -l recompress -d 'force re-compression of compressed files'
complete -c lzip-decompressor -s k -l keep -d 'keep (don\'t delete) input files'
complete -c lzip-decompressor -s l -l list -d 'print (un)compressed file sizes'
complete -c lzip-decompressor -s m -l match-length -d 'set match length limit in bytes [36]'
complete -c lzip-decompressor -s n -l threads -d 'set number of (de)compression threads [2]'
complete -c lzip-decompressor -s o -l output -d 'write to <file>, keep input files'
complete -c lzip-decompressor -s q -l quiet -d 'suppress all messages'
complete -c lzip-decompressor -s s -l dictionary-size -d 'set dictionary size limit in bytes [8 MiB]'
complete -c lzip-decompressor -s t -l test -d 'test compressed file integrity'
complete -c lzip-decompressor -s v -l verbose -d 'be verbose (a 2nd -v gives more)'
complete -c lzip-decompressor -s 0 -s 9 -d 'set compression level [default 6]'
complete -c lzip-decompressor -l fast -d 'alias for -0'
complete -c lzip-decompressor -l best -d 'alias for -9'
complete -c lzip-decompressor -l loose-trailing -d 'allow trailing data seeming corrupt header'
complete -c lzip-decompressor -l in-slots -d 'number of 1 MiB input packets buffered [4]'
complete -c lzip-decompressor -l out-slots -d 'number of 1 MiB output packets buffered [64]'
complete -c lzip-decompressor -l check-lib -d 'compare version of lzlib. h with liblz. {a,so}'
