# dch
# Autogenerated from man page /usr/share/man/man1/dch.1.gz
complete -c dch -l append -s a -d 'Add a new changelog entry at the end of the current version\'s entries'
complete -c dch -l increment -s i -d 'Increment either the final component of the Debian release number or, if this…'
complete -c dch -l newversion -s v -d 'This specifies the version number (including the Debian release part) explici…'
complete -c dch -l edit -s e -d 'Edit the changelog in an editor'
complete -c dch -l release -s r -d 'Finalize the changelog for a release.  Update the changelog timestamp'
complete -c dch -l force-save-on-release -d 'When --release is used, an editor is opened to allow inspection of the change…'
complete -c dch -l no-force-save-on-release -d 'Do not do so'
complete -c dch -l create -d 'This will create a new debian/changelog file (or NEWS if the --news option is…'
complete -c dch -l empty -d 'When used in combination with --create, suppress the automatic addition of an…'
complete -c dch -l package -d 'This specifies the package name to be used in the new changelog; this may onl…'
complete -c dch -l nmu -s n -d 'Increment the Debian release number for a non-maintainer upload by either app…'
complete -c dch -l bin-nmu -d 'Increment the Debian release number for a binary non-maintainer upload by eit…'
complete -c dch -l qa -s q -d 'Increment the Debian release number for a Debian QA Team upload, and add a QA…'
complete -c dch -l rebuild -s R -d 'Increment the Debian release number for a no-change rebuild by appending a "b…'
complete -c dch -l security -s s -d 'Increment the Debian release number for a Debian Security Team non-maintainer…'
complete -c dch -l lts -d 'Increment the Debian release number for a LTS Security Team non-maintainer up…'
complete -c dch -l team -d 'Increment the Debian release number for a team upload, and add a Team upload …'
complete -c dch -l upstream -s U -d 'Don\'t append distro-name1 to the version on a derived distribution'
complete -c dch -l bpo -d 'Increment the Debian release number for an upload to bullseye-backports, and …'
complete -c dch -l stable -d 'Increment the Debian release number for an upload to the current stable relea…'
complete -c dch -l local -s l -d 'Add a suffix to the Debian version number for a local build'
complete -c dch -l force-bad-version -s b -d 'Force a version number to be less than the current one (e. g'
complete -c dch -l allow-lower-version -d 'Allow a version number to be less than the current one if the new version mat…'
complete -c dch -l force-distribution -d 'Force the provided distribution to be used, even if it doesn\'t match the list…'
complete -c dch -l auto-nmu -d 'Attempt to automatically determine whether a change to the changelog represen…'
complete -c dch -l no-auto-nmu -d 'Disable automatic NMU detection'
complete -c dch -l fromdirname -s d -d 'This will take the upstream version number from the directory name, which sho…'
complete -c dch -l closes -d 'Add changelog entries to close the specified bug numbers'
complete -c dch -l query -d 'Should we attempt to query the BTS when generating closes entries?'
complete -c dch -l preserve -s p -d 'Preserve the source tree directory name if the upstream version number (or th…'
complete -c dch -l no-preserve -l nopreserve -d 'Do not preserve the source tree directory name (default)'
complete -c dch -l vendor -d 'Override the distributor ID over the default returned by dpkg-vendor'
complete -c dch -l distribution -s D -d 'Use the specified distribution in the changelog entry being edited, instead o…'
complete -c dch -l urgency -s u -d 'Use the specified urgency in the changelog entry being edited, instead of usi…'
complete -c dch -l changelog -s c -d 'This will edit the changelog file instead of the standard debian/changelog'
complete -c dch -l news -d 'This will edit newsfile (by default, debian/NEWS) instead of the regular chan…'
complete -c dch -l multimaint -d 'Should we indicate that parts of a changelog entry have been made by differen…'
complete -c dch -l multimaint-merge -d 'Should all changes made by the same author be merged into the same changelog …'
complete -c dch -l maintmaint -s m -d 'Do not modify the maintainer details previously listed in the changelog'
complete -c dch -l controlmaint -s M -d 'Use maintainer details from the debian/control Maintainer field rather than r…'
complete -c dch -l mainttrailer -s t -d 'If mainttrailer is set, it will avoid modifying the existing changelog traile…'
complete -c dch -l check-dirname-level -d 'See the above section "Directory name checking" for an explanation of this op…'
complete -c dch -l check-dirname-regex -d 'See the above section "Directory name checking" for an explanation of this op…'
complete -c dch -l no-conf -l noconf -d 'Do not read any configuration files'
complete -c dch -l release-heuristic -d 'Controls how debchange determines if a package has been released, when decidi…'
complete -c dch -l help -s h -d 'Display a help message and exit successfully'
complete -c dch -l noquery -d 'DEBCHANGE_QUERY_BTS to no, as described below'
complete -c dch -l version -d 'Display version and copyright information and exit successfully'
complete -c dch -l nomainttrailer

