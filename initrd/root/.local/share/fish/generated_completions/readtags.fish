# readtags
# Autogenerated from man page /usr/share/man/man1/readtags.1.gz
complete -c readtags -s t -l tag-file -d 'Use specified tag file (default: "tags")'
complete -c readtags -o 's[0' -l override-sort-detection -d 'Override sort detection of tag file.  METHOD: unsorted|sorted|foldcase'
complete -c readtags -s i -l icase-match -d 'Perform case-insensitive matching in the NAME action'
complete -c readtags -s p -l prefix-match -d 'Perform prefix matching in the NAME action'
complete -c readtags -s d -l debug -d 'Turn on debugging output'
complete -c readtags -s E -l escape-output -d 'Escape characters like tabs in output as described in tags(5)'
complete -c readtags -s e -l extension-fields -d 'Include extension fields in output'
complete -c readtags -s n -l line-number -d 'Also include the line number field when -e option is give'
complete -c readtags -s Q -l filter -d 'Filter the tags listed by ACTION with EXP before printing'
complete -c readtags -s S -l sorter -d 'Sort the tags listed by ACTION with EXP before printing'
complete -c readtags -s l -l list -d 'List regular tags'
complete -c readtags -s D -l list-pseudo-tags -d 'Equivalent to --list-pseudo-tags'
complete -c readtags -s 1 -d 'same file: $ readtags -S \'(<or> (<> $input &input) (<> $line &line))\' -l The …'

