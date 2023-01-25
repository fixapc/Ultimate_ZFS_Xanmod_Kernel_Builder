# alien.1p
# Autogenerated from man page /usr/share/man/man1/alien.1p.gz
complete -c 'alien.1p' -s d -l to-deb -d 'Make debian packages.  This is the default'
complete -c 'alien.1p' -s r -l to-rpm -d 'Make rpm packages'
complete -c 'alien.1p' -s t -l to-tgz -d 'Make tgz packages'
complete -c 'alien.1p' -l to-slp -d 'Make slp packages'
complete -c 'alien.1p' -s p -l to-pkg -d 'Make Solaris pkg packages'
complete -c 'alien.1p' -s i -l install -d 'Automatically install each generated package, and remove the package file aft…'
complete -c 'alien.1p' -s g -l generate -d 'Generate a temporary directory suitable for building a package from, but do n…'
complete -c 'alien.1p' -s s -l single -d 'Like -g, but do not generate the packagename. orig directory'
complete -c 'alien.1p' -s c -l scripts -d 'Try to convert the scripts that are meant to be run when the package is insta…'
complete -c 'alien.1p' -l patch -d 'Specify the patch to be used instead of automatically looking the patch up in…'
complete -c 'alien.1p' -l anypatch -d 'Be less strict about which patch file is used, perhaps attempting to use a pa…'
complete -c 'alien.1p' -l nopatch -d 'Do not use any patch files'
complete -c 'alien.1p' -l description -d 'Specify a description for the package'
complete -c 'alien.1p' -l version -d 'Specify a version for the package'
complete -c 'alien.1p' -s T -l test -d 'Test the generated packages'
complete -c 'alien.1p' -s k -l keep-version -d 'By default, alien adds one to the minor version number of each package it con…'
complete -c 'alien.1p' -l bump -d 'Instead of incrementing the version number of the converted package by 1, inc…'
complete -c 'alien.1p' -l fixperms -d 'Sanitize all file owners and permissions when building a deb'
complete -c 'alien.1p' -l target -d 'Force the architecture of the generated package to the given string'
complete -c 'alien.1p' -s v -l verbose -d 'Be verbose: Display each command alien runs in the process of converting a pa…'
complete -c 'alien.1p' -l veryverbose -d 'Be verbose as with --verbose, but also display the output of each command run'
complete -c 'alien.1p' -s h -l help -d 'Display a short usage summary'

