# debdiff-apply
# Autogenerated from man page /usr/share/man/man1/debdiff-apply.1.gz
complete -c debdiff-apply -s h -l help -d 'show this help message and exit'
complete -c debdiff-apply -s v -l verbose -d 'Output more information'
complete -c debdiff-apply -s c -l changelog -d 'Path to debian/changelog; default: debian/changelog'
complete -c debdiff-apply -s D -l distribution -d 'Distribution to use, if the patch doesn\'t already contain a changelog; defaul…'
complete -c debdiff-apply -l repl -d 'Run the python REPL after processing'
complete -c debdiff-apply -l source-version -d 'Don\'t apply the patch; instead print out the version of the package that it i…'
complete -c debdiff-apply -l target-version -d 'Don\'t apply the patch; instead print out the new version of the package  debd…'
complete -c debdiff-apply -l no-clean -d 'Don\'t clean temporary directories after a failure, so you can examine what fa…'
complete -c debdiff-apply -l quilt-refresh -d 'If the building of the new source package fails, try to refresh patches using…'
complete -c debdiff-apply -s d -l directory -d 'Extract the '
