# debcommit
# Autogenerated from man page /usr/share/man/man1/debcommit.1.gz
complete -c debcommit -s c -l changelog -d 'Specify an alternate location for the changelog'
complete -c debcommit -s r -l release -d 'Commit a release of the package'
complete -c debcommit -s R -l release-use-changelog -d 'When used in conjunction with --release, if there are uncommitted changes to …'
complete -c debcommit -s m -l message -d 'Specify a commit message to use'
complete -c debcommit -s n -l noact -d 'Do not actually do anything, but do print the commands that would be run'
complete -c debcommit -s d -l diff -d 'Instead of committing, do print the diff of what would have been committed if…'
complete -c debcommit -s C -l confirm -d 'Display the generated commit message and ask for confirmation before committi…'
complete -c debcommit -s e -l edit -d 'Edit the generated commit message in your favorite editor before committing it'
complete -c debcommit -s a -l all -d 'Commit all files'
complete -c debcommit -s s -l strip-message -l no-strip-message -d 'If this option is set and the commit message has been derived from the change…'
complete -c debcommit -l sign-commit -l no-sign-commit -d 'If this option is set, then the commits that debcommit creates will be signed…'
complete -c debcommit -l sign-tags -l no-sign-tags -d 'If this option is set, then tags that debcommit creates will be signed using …'

