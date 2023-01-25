# FileCheck-14
# Autogenerated from man page /usr/share/man/man1/FileCheck-14.1.gz
complete -c FileCheck-14 -o help -d 'Print a summary of command line options'
complete -c FileCheck-14 -l check-prefix -d 'FileCheck searches the contents of match-filename for patterns to match'
complete -c FileCheck-14 -l check-prefixes -d 'An alias of \\%--check-prefix that allows multiple prefixes to be specified as…'
complete -c FileCheck-14 -l comment-prefixes -d 'By default, FileCheck ignores any occurrence in match-filename of any check p…'
complete -c FileCheck-14 -l allow-unused-prefixes -d 'This option controls the behavior when using more than one prefix as specifie…'
complete -c FileCheck-14 -l input-file -d 'File to check (defaults to stdin)'
complete -c FileCheck-14 -l match-full-lines -d 'By default, FileCheck allows matches of anywhere on a line'
complete -c FileCheck-14 -l strict-whitespace -d 'By default, FileCheck canonicalizes input horizontal whitespace (spaces and t…'
complete -c FileCheck-14 -l ignore-case -d 'By default, FileCheck uses case-sensitive matching'
complete -c FileCheck-14 -l implicit-check-not -d 'Adds implicit negative checks for the specified patterns between positive che…'
complete -c FileCheck-14 -l dump-input -d 'Dump input to stderr, adding annotations representing currently enabled diagn…'
complete -c FileCheck-14 -l dump-input-context -d 'In the dump requested by --dump-input, print <N> input lines before and <N> i…'
complete -c FileCheck-14 -l dump-input-filter -d 'In the dump requested by --dump-input, print only input lines of kind <value>…'
complete -c FileCheck-14 -l enable-var-scope -d 'Enables scope for regex variables'
complete -c FileCheck-14 -o 'D<VAR' -d 'Sets a filecheck pattern variable VAR with value VALUE that can be used in CH…'
complete -c FileCheck-14 -o 'D#<FMT>' -d 'Sets a filecheck numeric variable NUMVAR of matching format FMT to the result…'
complete -c FileCheck-14 -o version -d 'Show the version number of this program'
complete -c FileCheck-14 -s v -d 'Print good directive pattern matches'
complete -c FileCheck-14 -o vv -d 'Print information helpful in diagnosing internal FileCheck issues, such as di…'
complete -c FileCheck-14 -l allow-deprecated-dag-overlap -d 'Enable overlapping among matches in a group of consecutive CHECK-DAG: directi…'
complete -c FileCheck-14 -l allow-empty -d 'Allow checking empty input.  By default, empty input is rejected'
complete -c FileCheck-14 -l color -d 'Use colors in output (autodetected by default)'
complete -c FileCheck-14 -o verify -d 'warnings not covered by any CHECK: patterns'
complete -c FileCheck-14 -o dump-input

