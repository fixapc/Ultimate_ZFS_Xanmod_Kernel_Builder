# ctags-universal
# Autogenerated from man page /usr/share/man/man1/ctags-universal.1.gz
complete -c ctags-universal -l exclude -d 'Add <pattern> to a list of excluded files and directories'
complete -c ctags-universal -l exclude-exception -d 'Add <pattern> to a list of included files and directories'
complete -c ctags-universal -l filter -d 'Makes ctags behave as a filter, reading source file names from standard input…'
complete -c ctags-universal -l filter-terminator -d 'Specifies a <string> to print to standard output following the tags for each …'
complete -c ctags-universal -l links -d 'Indicates whether symbolic links (if supported) should be followed'
complete -c ctags-universal -l maxdepth -d 'Limits the depth of directory recursion enabled with the --recurse (-R) option'
complete -c ctags-universal -l recurse -d 'Recurse into directories encountered in the list of supplied files'
complete -c ctags-universal -s R -d 'Equivalent to --recurse'
complete -c ctags-universal -s L -d 'Read from <file> a list of file names for which tags should be generated'
complete -c ctags-universal -l append -d 'Indicates whether tags generated from the specified files should be appended …'
complete -c ctags-universal -s a -d 'Equivalent to --append'
complete -c ctags-universal -s f -d 'Use the name specified by <tagfile> for the tag file (default is "tags", or "…'
complete -c ctags-universal -s o -d 'Equivalent to "-f tagfile"'
complete -c ctags-universal -l format -d 'Change the format of the output tag file'
complete -c ctags-universal -l output-format -d 'Specify the output format.  The default is u-ctags'
complete -c ctags-universal -s e -d 'Same as --output-format=etags'
complete -c ctags-universal -s x -d 'Same as --output-format=xref'
complete -c ctags-universal -l sort -d 'Indicates whether the tag file should be sorted on the tag name (default is y…'
complete -c ctags-universal -s u -d 'Equivalent to --sort=no (i. e.  "unsorted")'
complete -c ctags-universal -l etags-include -d 'Include a reference to <file> in the tag file'
complete -c ctags-universal -l input-encoding -d 'Specifies the <encoding> of the input files'
complete -c ctags-universal -l 'input-encoding-<LANG>' -d 'Specifies a specific input <encoding> for <LANG>'
complete -c ctags-universal -l output-encoding -d 'Specifies the <encoding> of the tags file'
complete -c ctags-universal -l language-force -d 'By default, ctags automatically selects the language of a source file, ignori…'
complete -c ctags-universal -l languages -d 'Specifies the languages for which tag generation is enabled, with <list> cont…'
complete -c ctags-universal -l 'alias-<LANG>' -d 'Adds (\\(aq+\\(aq) or removes (\\(aq-\\(aq) an alias <pattern> to a language spec…'
complete -c ctags-universal -l alias-all -d 'This clears aliases setting of all languages'
complete -c ctags-universal -l guess-language-eagerly -d 'Looks into the file contents for heuristically guessing the proper language p…'
complete -c ctags-universal -s G -d 'Equivalent to --guess-language-eagerly'
complete -c ctags-universal -l langmap -d 'Controls how file names are mapped to languages (see the --list-maps option)'
complete -c ctags-universal -l 'map-<LANG>' -o ']<extension>' -d 'This option provides the way to control mapping(s) of file names to languages…'
complete -c ctags-universal -l excmd -d 'Determines the type of EX command used to locate tags in the source file'
complete -c ctags-universal -s n -d 'Equivalent to --excmd=number'
complete -c ctags-universal -s N -d 'Equivalent to --excmd=pattern'
complete -c ctags-universal -l extras -o '][<flags>' -d 'Specifies whether to include extra tag entries for certain kinds of informati…'
complete -c ctags-universal -l fields -d 'Specifies which language-independent fields are to be included in the tag ent…'
complete -c ctags-universal -l pattern-length-limit -d 'Truncate patterns of tag entries after <N> characters'
complete -c ctags-universal -l pseudo-tags -d 'Enable/disable emitting pseudo-tag named <pseudo-tag>'
complete -c ctags-universal -l put-field-prefix -d 'Put UCTAGS as prefix for the name of fields newly introduced in Universal Cta…'
complete -c ctags-universal -o '][<roles>' -d 'Specifies a list of kind-specific roles of tags to include in the output file…'
complete -c ctags-universal -l tag-relative -d 'Specifies how the file paths recorded in the tag file'
complete -c ctags-universal -l use-slash-as-filename-separator -d 'Uses slash (\\(aq/\\(aq) character as filename separators instead of backslash …'
complete -c ctags-universal -s B -d 'Use backward searching patterns (e. g.  ?pattern?).  [Ignored in etags mode]'
complete -c ctags-universal -s F -d 'Use forward searching patterns (e. g.  /pattern/) (default)'
complete -c ctags-universal -l options -d 'Read additional options from file or directory'
complete -c ctags-universal -l options-maybe -d 'Same as --options but doesn\\(aqt cause an error if file (or directory) specif…'
complete -c ctags-universal -l optlib-dir -d 'Add an optlib <directory> to or reset the optlib path list'
complete -c ctags-universal -l 'kinddef-<LANG>' -d 'Define a kind for <LANG>.  Don\\(aqt be confused this with --kinds-<LANG>'
complete -c ctags-universal -l langdef -d 'Defines a new user-defined language, <name>, to be parsed with regular expres…'
complete -c ctags-universal -l 'mline-regex-<LANG>' -d 'Define multi-line regular expression for locating tags in specific language'
complete -c ctags-universal -l 'regex-<LANG>' -d 'Define single-line regular expression for locating tags in specific language'
complete -c ctags-universal -l if0 -d 'Indicates a preference as to whether code within an "#if 0" branch of a prepr…'
complete -c ctags-universal -l line-directives -d 'Specifies whether #line directives should be recognized'
complete -c ctags-universal -s D -d 'Defines a C preprocessor <macro>'
complete -c ctags-universal -s h -d 'Specifies a <list> of file extensions, separated by periods, which are to be …'
complete -c ctags-universal -s I -d 'Specifies a <identifier-list> of identifiers which are to be specially handle…'
complete -c ctags-universal -l 'param-<LANG>:<name>' -d 'Set a <LANG> specific parameter, a parameter specific to the <LANG>'
complete -c ctags-universal -l list-aliases -d 'Lists the aliases for either the specified <language> or all languages, and t…'
complete -c ctags-universal -l list-excludes -d 'Lists the current exclusion patterns used to exclude files'
complete -c ctags-universal -l list-extras -d 'Lists the extras recognized for either the specified <language> or all langua…'
complete -c ctags-universal -l list-features -d 'Lists the compiled features'
complete -c ctags-universal -l list-fields -d 'Lists the fields recognized for either the specified <language> or all langua…'
complete -c ctags-universal -l list-kinds -d 'Subset of --list-kinds-full'
complete -c ctags-universal -l list-kinds-full -d 'Lists the tag kinds recognized for either the specified <language> or all lan…'
complete -c ctags-universal -l list-languages -d 'Lists the names of the languages understood by ctags, and then exits'
complete -c ctags-universal -l list-map-extensions -d 'Lists the file extensions which associate a file name with a language for eit…'
complete -c ctags-universal -l list-map-patterns -d 'Lists the file name patterns which associate a file name with a language for …'
complete -c ctags-universal -l list-maps -d 'Lists file name patterns and the file extensions which associate a file name …'
complete -c ctags-universal -l list-mline-regex-flags -d 'Output list of flags which can be used in a multiline regex parser definition'
complete -c ctags-universal -l list-params -d 'Lists the parameters for either the specified <language> or all languages, an…'
complete -c ctags-universal -l list-pseudo-tags -d 'Output list of pseudo-tags'
complete -c ctags-universal -l list-regex-flags -d 'Lists the flags that can be used in --regex-<LANG> option'
complete -c ctags-universal -l list-roles -d 'List the roles for either the specified <language> or all languages'
complete -c ctags-universal -l list-subparsers -d 'Lists the subparsers for a base language for either the specified <baselang> …'
complete -c ctags-universal -l machinable -d 'Use tab character as separators for --list- option output'
complete -c ctags-universal -l with-list-header -d 'Print headers describing columns in --list- option output'
complete -c ctags-universal -l help -d 'Prints to standard output a detailed usage description, and then exits'
complete -c ctags-universal -s '?' -d 'Equivalent to --help'
complete -c ctags-universal -l help-full -d 'Prints to standard output a detailed usage description including experimental…'
complete -c ctags-universal -l license -d 'Prints a summary of the software license to standard output, and then exits'
complete -c ctags-universal -l print-language -d 'Just prints the language parsers for specified source files, and then exits'
complete -c ctags-universal -l quiet -d 'Write fewer messages (default is no)'
complete -c ctags-universal -l totals -d 'Prints statistics about the source files read and the tag file written during…'
complete -c ctags-universal -l verbose -d 'Enable verbose mode'
complete -c ctags-universal -s V -d 'Equivalent to --verbose'
complete -c ctags-universal -l version -d 'Prints a version identifier for ctags to standard output, and then exits'
complete -c ctags-universal -s w -d 'This option is silently ignored for backward-compatibility with the ctags of …'
complete -c ctags-universal -l file-scope -d 'This options is removed'
complete -c ctags-universal -l extra -d 'Equivalent to --extras=[+|-][<flags>|*], which was introduced to make the opt…'
complete -c ctags-universal -l '<LANG>-kinds' -d 'This option is obsolete.  Use --kinds-<LANG>=.  instead'
complete -c ctags-universal -l kinds-C
complete -c ctags-universal -l list- -d 'List options'
complete -c ctags-universal -l foo -l foo -o foo -o foo -d 'Input/Output File Options'
complete -c ctags-universal -l _xformat -d 'JSON output format'
complete -c ctags-universal -l 'kinds-<LANG>' -d 'of one-letter.  See "%Letters and names" for details'
complete -c ctags-universal -o '<pattern>' -d respectively
complete -c ctags-universal -o '*-' -o '*-' -d or
