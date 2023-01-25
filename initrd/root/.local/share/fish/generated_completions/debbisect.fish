# debbisect
# Autogenerated from man page /usr/share/man/man1/debbisect.1.gz
complete -c debbisect -s h -l help -d 'show this help message and exit'
complete -c debbisect -s d -l debug -d 'Print lots of debugging statements'
complete -c debbisect -s v -l verbose -d 'Be verbose'
complete -c debbisect -l cache -d 'cache directory -- by default $TMPDIR is used'
complete -c debbisect -l nocache -d 'disable cache'
complete -c debbisect -l port -d 'manually choose port number for the apt cache instead of automatically choosi…'
complete -c debbisect -l depends -d 'Comma separated list of binary packages the test script requires'
complete -c debbisect -l qemu -d 'Create qemu virtual machine and pass a ssh config file to the test script'
complete -c debbisect -l architecture -d 'Chosen architecture when creating the chroot with --depends or --qemu (defaul…'
complete -c debbisect -l suite -d 'Chosen suite when creating the chroot with --depends or --qemu (default: unst…'
complete -c debbisect -l components -d 'Chosen components (separated by comma or whitespace) when creating the chroot…'
complete -c debbisect -l no-find-exact-package -d 'Normally, when the --depends argument is given so that debbisect takes care o…'

