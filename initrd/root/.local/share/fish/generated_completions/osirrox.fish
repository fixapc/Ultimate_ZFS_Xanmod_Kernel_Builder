# osirrox
# Autogenerated from man page /usr/share/man/man1/osirrox.1.gz
complete -c osirrox -s x -d 'Enable automatic sorting of program arguments into a sequence that (most like…'
complete -c osirrox -o list_arg_sorting -d 'List all xorriso commands in the order which applies if command -x is in effe…'
complete -c osirrox -o dev -d 'Set input and output drive to the same address and load an ISO image if it is…'
complete -c osirrox -o indev -d 'Set input drive and load an ISO image if present'
complete -c osirrox -o outdev -d 'Set output drive and if it differs from the input drive then switch from grow…'
complete -c osirrox -o drive_class -d 'Add a drive path pattern to one of the safety lists or make those lists empty'
complete -c osirrox -o drive_access -d 'Control whether device file locking mechanisms shall be used when acquiring a…'
complete -c osirrox -o scsi_dev_family -d 'GNU/Linux specific: '
complete -c osirrox -o grow_blindly -d 'If predicted_nwa is a non-negative number then perform blind growing rather t…'
complete -c osirrox -o read_speed -d 'Set the speed for reading'
complete -c osirrox -o load -d 'Load a particular (possibly outdated) ISO session from -dev or -indev'
complete -c osirrox -o displacement -d 'Compensate a displacement of the image versus the start address for which the…'
complete -c osirrox -o read_fs -d 'Specify which kind of filesystem tree to load if present'
complete -c osirrox -o assert_volid -d 'Refuse to load ISO images with volume IDs which do not match the given search…'
complete -c osirrox -o in_charset -d 'Set the character set from which to convert file names when loading an image'
complete -c osirrox -o auto_charset -d 'Enable or disable recording and interpretation of the output character set na…'
complete -c osirrox -o hardlinks -d 'Enable or disable loading and recording of hardlink relations'
complete -c osirrox -o acl -d 'Enable or disable processing of ACLs'
complete -c osirrox -o xattr -d 'Enable or disable processing of xattr attributes'
complete -c osirrox -o md5 -d 'Enable or disable processing of MD5 checksums for the overall session and for…'
complete -c osirrox -o for_backup -d 'Enable all extra features which help to produce or to restore backups with hi…'
complete -c osirrox -o ecma119_map -d 'Choose the conversion of file names when a session gets loaded, if they stem …'
complete -c osirrox -o joliet_map -d 'Choose the conversion of file names when a session gets loaded from a Joliet …'
complete -c osirrox -o iso_nowtime -d 'Choose whether to use the current time ("dynamic") or a fixed time point for …'
complete -c osirrox -o disk_dev_ino -d 'Enable or disable processing of recorded file identification numbers (dev_t a…'
complete -c osirrox -o file_name_limit -d 'Set the maximum permissible length for file names in the range of 64 to 255'
complete -c osirrox -o rom_toc_scan -d 'Read-only drives do not tell the actual media type but show any media as ROM …'
complete -c osirrox -o calm_drive -d 'Reduce drive noise until it is actually used again'
complete -c osirrox -o ban_stdio_write -d 'Allow for writing only the usage of MMC optical drives'
complete -c osirrox -o early_stdio_test -d 'If enabled by "on" then regular files and block devices get tested for effect…'
complete -c osirrox -o data_cache_size -d 'Set the size and granularity of the data cache which is used when ISO images …'
complete -c osirrox -o disk_pattern -d 'Set the pattern expansion mode for the disk_path parameters of several comman…'
complete -c osirrox -o add -d 'Insert the given files or directory trees from filesystem into the ISO image'
complete -c osirrox -o add_plainly -d 'If set to mode "unknown" then any command word that does not begin with "-" a…'
complete -c osirrox -o path_list -d 'Like -add but read the parameter words from file disk_path or standard input …'
complete -c osirrox -o quoted_path_list -d 'Like -path_list but with quoted input reading rules'
complete -c osirrox -o map -d 'Insert file object disk_path into the ISO image as iso_rr_path'
complete -c osirrox -o map_single -d 'Like -map, but if disk_path is a directory then its sub tree is not inserted'
complete -c osirrox -o map_l -d 'Perform -map with each of the disk_path parameters'
complete -c osirrox -o update -d 'Compare file object disk_path with file object iso_rr_path'
complete -c osirrox -o update_r -d 'Like -update but working recursively.  I. e'
complete -c osirrox -o update_l -d 'Perform -update_r with each of the disk_path parameters'
complete -c osirrox -o update_li -d 'Perform -update_r with each of the iso_rr_path parameters'
complete -c osirrox -o update_lxi -d 'Perform -update_r with each of the disk_path parameters and with iso_rr_paths…'
complete -c osirrox -o cut_out -d 'Map a byte interval of a regular disk file into a regular file in the ISO ima…'
complete -c osirrox -o cpr -d 'Insert the given files or directory trees from filesystem  into the ISO image'
complete -c osirrox -o mkdir -d 'Create empty directories if they do not exist yet'
complete -c osirrox -o lns -d 'Create a symbolic link with address iso_rr_path which points to target_text'
complete -c osirrox -o clone -d 'Create a copy of the ISO file object iso_rr_path_original with the new addres…'
complete -c osirrox -o cp_clone -d 'Create copies of one or more ISO file objects as with command -clone'
complete -c osirrox -o file_size_limit -d 'Set the maximum permissible size for a single data file'
complete -c osirrox -o not_mgt -d 'Control the behavior of the exclusion lists'
complete -c osirrox -o not_paths -d 'Add the given paths to the list of excluded absolute disk paths'
complete -c osirrox -o not_leaf -d 'Add a single shell parser style pattern to the list of exclusions for disk le…'
complete -c osirrox -o not_list -d 'Read lines from disk_path and use each of them either as -not_paths parameter…'
complete -c osirrox -o quoted_not_list -d 'Like -not_list but with quoted input reading rules'
complete -c osirrox -o follow -d 'Enable or disable resolution of symbolic links and mountpoints under disk_pat…'
complete -c osirrox -o pathspecs -d 'Control parameter interpretation with xorriso actions -add and -path_list'
complete -c osirrox -o overwrite -d 'Allow or disallow overwriting of existing files in the ISO image by files wit…'
complete -c osirrox -o split_size -d 'Set the threshold for automatic splitting of regular files'
complete -c osirrox -o iso_rr_pattern -d 'Set the pattern expansion mode for the iso_rr_path parameters of several comm…'
complete -c osirrox -o rm -d 'Delete the given files from the ISO image'
complete -c osirrox -o rm_r -d 'Delete the given files or directory trees from the ISO image'
complete -c osirrox -o rmdir -d 'Delete empty directories'
complete -c osirrox -o move -d 'Rename the file given by the first (origin) iso_rr_path to the second (destin…'
complete -c osirrox -o mv -d 'Rename the given file objects in the ISO tree to the last parameter in the li…'
complete -c osirrox -o chown -d 'Set ownership of file objects in the ISO image'
complete -c osirrox -o chown_r -d 'Like -chown but affecting all files below eventual directories'
complete -c osirrox -o chgrp -d 'Set group attribute of file objects in the ISO image'
complete -c osirrox -o chgrp_r -d 'Like -chgrp but affecting all files below eventual directories'
complete -c osirrox -o chmod -d 'Equivalent to shell command chmod in the ISO image'
complete -c osirrox -o chmod_r -d 'Like -chmod but affecting all files below eventual directories'
complete -c osirrox -o setfacl -d 'Attach the given ACL to the given iso_rr_paths'
complete -c osirrox -o setfacl_r -d 'Like -setfacl but affecting all files below eventual directories'
complete -c osirrox -o setfacl_list -d 'Read the output of -getfacl_r or shell command getfacl -R and apply it to the…'
complete -c osirrox -o setfattr -d 'Attach the given xattr pair of name and value to the given iso_rr_paths'
complete -c osirrox -o setfattr_r -d 'Like -setfattr but affecting all files below eventual directories'
complete -c osirrox -o setfattr_list -d 'Read the output format of -getfattr_r or shell command getfattr -Rd and apply…'
complete -c osirrox -o alter_date -d 'Alter the date entries of files in the ISO image'
complete -c osirrox -o alter_date_r -d 'Like -alter_date but affecting all files below eventual directories'
complete -c osirrox -o hide -d 'Prevent the names of the given files from showing up in the directory trees o…'
complete -c osirrox -o find -d PP
complete -c osirrox -o exec -d 'A restricted substitute for shell command find in the ISO image'
complete -c osirrox -o external_filter -d 'Register a content filter by associating a name with a program path, program …'
complete -c osirrox -o unregister_filter -d 'Remove an -external_filter registration'
complete -c osirrox -o close_filter_list -d 'Irrevocably ban commands -concat "pipe", -external_filter, and -unregister_fi…'
complete -c osirrox -o set_filter -d 'Apply an -external_filter or a built-in filter to the given data files in the…'
complete -c osirrox -o set_filter_r -d 'Like -set_filter but affecting all data files below eventual directories'
complete -c osirrox -o rollback -d 'Discard the manipulated ISO image and reload it from -indev'
complete -c osirrox -o changes_pending -d 'Write runs are performed only if a change of the image has been made  since t…'
complete -c osirrox -o commit -d 'Perform the write operation'
complete -c osirrox -o eject -d 'Eject the medium in -indev, -outdev, or both drives, respectively'
complete -c osirrox -o commit_eject -d 'Combined -commit and -eject'
complete -c osirrox -o blank -d 'Make media ready for writing from scratch (if not -dummy is activated)'
complete -c osirrox -o format -d 'Convert unformatted DVD-RW into overwritable ones, "de-ice" DVD+RW, format ne…'
complete -c osirrox -o list_formats -d 'Put out a list of format descriptors as reported by the output drive for the …'
complete -c osirrox -o list_speeds -d 'Put out a list of speed values as reported by the drives with the loaded media'
complete -c osirrox -o list_profiles -d 'Put out a list of media types supported by -indev, -outdev, or both, respecti…'
complete -c osirrox -o truncate_overwritable -d 'On overwritable medium copy the volume descriptors of an existing session to …'
complete -c osirrox -o close_damaged -d 'Try to close the upcoming track and session if the drive reported the medium …'
complete -c osirrox -o joliet -d 'If enabled by "on", generate Joliet tree additional to ISO 9660 + Rock Ridge …'
complete -c osirrox -o hfsplus -d 'If enabled by "on", generate a HFS+ filesystem inside the ISO 9660 image and …'
complete -c osirrox -o rockridge -d 'Mode "off" disables production of Rock Ridge information for the ISO 9660 fil…'
complete -c osirrox -o compliance -d 'Adjust the compliance to specifications of ISO 9660/ECMA-119 and its contempo…'
complete -c osirrox -o rr_reloc_dir -d 'Specify the name of the relocation directory in which deep directory subtrees…'
complete -c osirrox -o volid -d 'Specify the volume ID, which most operating systems will consider to be the v…'
complete -c osirrox -o volset_id -d 'Set the volume set ID string to be written with the next -commit'
complete -c osirrox -o publisher -d 'Set the publisher ID string to be written with the next -commit'
complete -c osirrox -o application_id -d 'Set the application ID string to be written with the next -commit'
complete -c osirrox -o system_id -d 'Set the system ID string to be written with the next -commit'
complete -c osirrox -o volume_date -d 'Set one of the four overall timestamps for subsequent image writing'
complete -c osirrox -o copyright_file -d 'Set the copyright file name to be written with the next -commit'
complete -c osirrox -o abstract_file -d 'Set the abstract file name to be written with the next -commit'
complete -c osirrox -o biblio_file -d 'Set the biblio file name to be written with the next -commit'
complete -c osirrox -o preparer_id -d 'Set the preparer ID string to be written with the next -commit'
complete -c osirrox -o application_use -d 'Specify the content of the Application Use field which can take at most 512 b…'
complete -c osirrox -o out_charset -d 'Set the character set to which file names get converted when writing an image'
complete -c osirrox -o uid -d 'User id to be used for all files when the new ISO tree gets written to media'
complete -c osirrox -o gid -d 'Group id to be used for all files when the new ISO tree gets written to media'
complete -c osirrox -o zisofs -d 'Set global parameters for zisofs compression'
complete -c osirrox -o speed -d 'Set the burn speed'
complete -c osirrox -o stream_recording -d 'Setting "on" tries to circumvent the management of defects on DVD-RAM, BD-RE,…'
complete -c osirrox -o dvd_obs -d 'GNU/Linux specific: Set the number of bytes to be transmitted with each write…'
complete -c osirrox -o modesty_on_drive -d 'Control whether the drive buffer shall be kept from getting completely filled'
complete -c osirrox -o use_immed_bit -d 'Control whether several long lasting SCSI commands shall be executed with the…'
complete -c osirrox -o stdio_sync -d 'Set the number of bytes after which to force output to stdio: pseudo drives'
complete -c osirrox -o dummy -d 'If "on" then simulate burning or refuse with FAILURE event if no simulation i…'
complete -c osirrox -o fs -d 'Set the size of the fifo buffer which smoothens the data stream from ISO imag…'
complete -c osirrox -o close -d 'If -close is set to "on" then mark the written medium as not appendable any m…'
complete -c osirrox -o write_type -d 'Set the write type for the next burn run'
complete -c osirrox -o padding -d 'Append the given number of extra bytes to the image stream'
complete -c osirrox -o boot_image -d 'br      "discard"|"keep"|"patch"|"replay"|"show_status"|      bootspec|"next" '
complete -c osirrox -o append_partition -d 'Cause a prepared filesystem image to be appended to the ISO image and to be d…'
complete -c osirrox -o jigdo -d 'Clear Jigdo Template Extraction parameter list or add a parameter to that list'
complete -c osirrox -o charset -d 'Set the character set from which to convert file names when loading an image …'
complete -c osirrox -o local_charset -d 'Override the system assumption of the local character set name'
complete -c osirrox -o abort_on -d 'Set the severity threshold for events to abort the program'
complete -c osirrox -o return_with -d 'Set the threshold and exit_value to be returned at program end if no abort ha…'
complete -c osirrox -o report_about -d 'Set the threshold for events to be reported'
complete -c osirrox -o signal_handling -d 'Control the installation of a signal handler which shall react on external si…'
complete -c osirrox -o error_behavior -d 'Control the program behavior at problem event occasions'
complete -c osirrox -o dialog -d 'Enable or disable to enter dialog mode after all program arguments are proces…'
complete -c osirrox -o page -d 'Describe terminal to the text pager.  See also above, paragraph Result pager'
complete -c osirrox -o use_readline -d 'If "on" then use readline for dialog.  Else use plain stdin'
complete -c osirrox -o reassure -d 'If "on" then ask the user for "y" or "n": '
complete -c osirrox -o devices -d 'Show list of available MMC drives with the addresses of their libburn standar…'
complete -c osirrox -o device_links -d 'Like -devices, but presenting the drives with addresses of symbolic links whi…'
complete -c osirrox -o toc -d 'br Show media specific tables of content'
complete -c osirrox -o toc_of -d 'Like command -toc but explicitly choosing which drive\'s table-of-content to s…'
complete -c osirrox -o mount_cmd -d 'Emit an appropriate command line for mounting the ISO session indicated by dr…'
complete -c osirrox -o mount_opts -d 'Set options which influence -mount and -mount_cmd'
complete -c osirrox -o session_string -d 'Print to the result channel a text which gets composed according to format an…'
complete -c osirrox -o print_size -d 'Print the foreseeable consumption of 2048 byte blocks by next -commit'
complete -c osirrox -o tell_media_space -d 'Print available space on the output medium and the free space after subtracti…'
complete -c osirrox -o pvd_info -d 'Print various ID strings and timestamps which can be found in loaded ISO imag…'
complete -c osirrox -o report_el_torito -d 'br With mode plain print a report about the information found in the El Torit…'
complete -c osirrox -o report_system_area -d 'With mode plain print a report about the information found in the System Area…'
complete -c osirrox -o cd -d 'Change the current working directory in the ISO image'
complete -c osirrox -o cdx -d 'Change the current working directory in the local filesystem'
complete -c osirrox -o pwd -d 'br Tell the current working directory in the ISO image'
complete -c osirrox -o pwdx -d 'br Tell the current working directory in the local filesystem'
complete -c osirrox -o ls -d 'List files in the ISO image which match shell patterns (i. e'
complete -c osirrox -o lsd -d 'Like -ls but listing directories as themselves and not by their content'
complete -c osirrox -o lsl -d 'Like -ls but also list some of the file attributes'
complete -c osirrox -o lsdl -d 'Like -lsd but also list some of the file attributes'
complete -c osirrox -o lsx -d 'List files in the local filesystem which match shell patterns'
complete -c osirrox -o lsdx -d 'Like -lsx but listing directories as themselves and not by their content'
complete -c osirrox -o lslx -d 'Like -lsx but also listing some of the file attributes'
complete -c osirrox -o lsdlx -d 'Like -lsdx but also listing some of the file attributes'
complete -c osirrox -o getfacl -d 'Print the access permissions of the given files in the ISO image using the fo…'
complete -c osirrox -o getfacl_r -d 'Like -gefacl but listing recursively the whole file trees underneath eventual…'
complete -c osirrox -o getfattr -d 'Print the xattr of the given files in the ISO image'
complete -c osirrox -o getfattr_r -d 'Like -gefattr but listing recursively the whole file trees underneath of dire…'
complete -c osirrox -o du -d 'Recursively list size of directories and files in the ISO image which match o…'
complete -c osirrox -o dus -d 'List size of directories and files in the ISO image  which match one of the p…'
complete -c osirrox -o dux -d 'Recursively list size of directories and files in the local filesystem which …'
complete -c osirrox -o dusx -d 'List size of directories and files in the local filesystem which match one of…'
complete -c osirrox -o findx -o name -o type -d 'Like -find but operating on local filesystem and not on the ISO image'
complete -c osirrox -o compare -d 'Compare attributes and eventual data file content of a fileobject in the loca…'
complete -c osirrox -o compare_r -d 'Like -compare but working recursively.  I. e'
complete -c osirrox -o compare_l -d 'Perform -compare_r with each of the disk_path parameters'
complete -c osirrox -o show_stream -d 'Display the content stream chain of data files in the ISO image'
complete -c osirrox -o show_stream_r -d 'Like -show_stream but working recursively'
complete -c osirrox -o check_media -d 'Try to read data blocks from the indev drive, optionally copy them to a disk …'
complete -c osirrox -o check_media_defaults -d 'Preset options for runs of -check_media, -extract_cut and best_effort file ex…'
complete -c osirrox -o check_md5 -d 'Compare the data content of the given files in the loaded image with their re…'
complete -c osirrox -o check_md5_r -d 'Like -check_md5 but checking all data files underneath the given paths'
complete -c osirrox -o osirrox -d 'Setting off disables disk filesystem manipulations'
complete -c osirrox -o extract -d 'Copy the file objects at and underneath iso_rr_path to their corresponding ad…'
complete -c osirrox -o extract_single -d 'Like -extract, but if iso_rr_path is a directory then its sub tree gets not r…'
complete -c osirrox -o extract_l -d 'Perform -extract with each of the iso_rr_path parameters'
complete -c osirrox -o extract_cut -d 'Copy a byte interval from a data file out of an ISO image into a newly create…'
complete -c osirrox -o cpx -d 'Copy single leaf file objects from the ISO image to the address given by disk…'
complete -c osirrox -o cpax -d 'Like -cpx but restoring mtime, atime as in ISO image and trying to set owners…'
complete -c osirrox -o cp_rx -d 'Like -cpx but also extracting whole directory trees from the ISO image'
complete -c osirrox -o cp_rax -d 'Like -cp_rx but restoring mtime, atime as in ISO image and trying to set owne…'
complete -c osirrox -o paste_in -d 'Read the content of a ISO data file and write it into a data file on disk beg…'
complete -c osirrox -o concat -d 'Copy the data content of one or more data files of the ISO image into a disk …'
complete -c osirrox -o extract_boot_images -d 'Copy boot equipment to disk, which is not necessarily represented as data fil…'
complete -c osirrox -o mount -d 'Produce the same line as -mount_cmd and then execute it as external program r…'
complete -c osirrox -o as -d 'br Perform the variable length option list as sparse emulation of the program…'
complete -c osirrox -o read_mkisofsrc -d 'Try one by one to open for reading:  . /. mkisofsrc , $MKISOFSRC , $HOME/'
complete -c osirrox -o pacifier -d 'Control behavior of UPDATE pacifiers during write operations'
complete -c osirrox -o scdbackup_tag -d 'Set the parameter "name" for a scdbackup checksum record'
complete -c osirrox -o no_rc -d 'br Only if used as first program argument this command prevents reading and i…'
complete -c osirrox -o options_from_file -d 'Read quoted input from fileaddress and execute it like dialog lines'
complete -c osirrox -o help -d 'br Print helptext'
complete -c osirrox -o version -d 'Print program name and version, component versions, license'
complete -c osirrox -o list_extras -d 'Tell whether certain extra features were enabled at compile time'
complete -c osirrox -o history -d 'Copy textline into libreadline history'
complete -c osirrox -o status -d 'Print the current settings of xorriso.  Modes: . br   short'
complete -c osirrox -o status_history_max -d 'Set maximum number of history lines to be reported with -status "long_history"'
complete -c osirrox -o list_delimiter -d 'Set the list delimiter to be used instead of "--"'
complete -c osirrox -o sh_style_result -d 'Make the result output of some filesystem inspection commands look more like …'
complete -c osirrox -o backslash_codes -d 'Enable or disable the interpretation of symbolic representations of special c…'
complete -c osirrox -o temp_mem_limit -d 'Set the maximum size of temporary memory to be used for image dependent buffe…'
complete -c osirrox -o print -d 'Print a text line to the result channel which is by default stdout'
complete -c osirrox -o print_info -d 'Print a text line to the info channel which is by default stderr'
complete -c osirrox -o print_mark -d 'Print a text line to the mark channel which is by default directed to both, r…'
complete -c osirrox -o prompt -d 'Show text at beginning of output line and wait for the user to hit the Enter …'
complete -c osirrox -o sleep -d 'Wait for the given number of seconds before performing the next command'
complete -c osirrox -o errfile_log -d 'br If problem events are related to input files from the filesystem, then the…'
complete -c osirrox -o session_log -d 'If path is not empty it gives the address of a plain text file where a log re…'
complete -c osirrox -o scsi_log -d 'Mode "on" enables very verbose logging of SCSI commands and drive replies'
complete -c osirrox -o end -d 'br End program after writing pending changes'
complete -c osirrox -o rollback_end -d 'Discard pending changes.  End program immediately'
complete -c osirrox -o pkt_output -d 'Consolidate text output on stdout and classify each line by a channel indicat…'
complete -c osirrox -o logfile -d 'Copy output of a channel to the given file.  Channel may be one of: "'
complete -c osirrox -o mark -d 'If text is not empty it will get put out on "M" channel each time xorriso is …'
complete -c osirrox -o msg_op -d 'This command shall facilitate extraction of particular information from the m…'
complete -c osirrox -o named_pipe_loop -d 'Temporarily replace standard input, standard output and standard error by nam…'
complete -c osirrox -o launch_frontend -d 'Start the program that is given as first parameter'
complete -c osirrox -o prog -d 'Use text as name of this program in subsequent messages'
complete -c osirrox -o 'compare*' -o 'update*' -d 'parameters "concat_split_on" and "concat_split_off" which control the handlin…'
complete -c osirrox -o wholename -d 'Matches if pattern matches the file path as it would be printed by action "ec…'
complete -c osirrox -o disk_name -d 'Like -name but testing the leaf name of the file source on disk'
complete -c osirrox -o disk_path -d 'Matches if the given disk_path is equal to the path of the file source on disk'
complete -c osirrox -o maxdepth -d 'Matches only files which are at most at the given depth level relative to the…'
complete -c osirrox -o mindepth -d 'Matches only files which are at least at the given depth level'
complete -c osirrox -o damaged -d 'Matches files which use data blocks marked as damaged by a previous run of -c…'
complete -c osirrox -o pending_data -d 'Matches files which get their content from outside the loaded ISO image'
complete -c osirrox -o lba_range -d 'Matches files which use data blocks within the range of start_lba and start_l…'
complete -c osirrox -o has_acl -d 'Matches files which have a non-trivial ACL'
complete -c osirrox -o has_xattr -d 'Matches files which have xattr name-value pairs from user namespace'
complete -c osirrox -o has_aaip -d 'Matches files which have ACL or any xattr'
complete -c osirrox -o has_any_xattr -d 'Matches files which have any xattr other than ACL'
complete -c osirrox -o has_md5 -d 'Matches data files which have MD5 checksums'
complete -c osirrox -o has_hfs_crtp -d 'Matches files which have the given HFS+ creator and type attached'
complete -c osirrox -o has_hfs_bless -d 'Matches files which bear the given HFS+ blessing'
complete -c osirrox -o has_filter -d 'Matches files which are filtered by -set_filter'
complete -c osirrox -o hidden -d 'Matches files which are hidden in "iso_rr" tree, in "joliet" tree, in "hfsplu…'
complete -c osirrox -o bad_outname -d 'Matches files with names which change when converted forth and back between t…'
complete -c osirrox -o name_limit_blocker -d 'Matches file names which would prevent command -file_name_limit with the give…'
complete -c osirrox -o prune -d 'If this test is reached and the tested file is a directory then -find will no…'
complete -c osirrox -o use_pattern -d 'This pseudo test controls the interpretation of wildcards with tests'
complete -c osirrox -o or_use_pattern -d 'Like -use_pattern, but automatically appending the test by -or rather than by…'
complete -c osirrox -o decision -d 'If this test is reached then the evaluation ends immediately and action is pe…'
complete -c osirrox -o true -o false -d 'Always match or match not, respectively.  Evaluation goes on'
complete -c osirrox -o sort_lba -d 'Always match'
complete -c osirrox -o not -d 'Matches if the next test or sub expression does not match'
complete -c osirrox -o undamaged -o has_no_acl -o has_no_xattr
complete -c osirrox -o has_no_aaip -o has_no_filter
complete -c osirrox -o and -d 'Matches if both neighboring tests or expressions match'
complete -c osirrox -o or -d 'Matches if at least one of both neighboring tests or expressions matches'
complete -c osirrox -o sub -o subend -d 'Enclose a sub expression which gets evaluated first before it is processed by…'
complete -c osirrox -o if -o then -o elseif -o then
complete -c osirrox -o else -o endif -d 'Enclose one or more sub expressions'
complete -c osirrox -o if-expressions
complete -c osirrox -o path-list -s m -o exclude-list
complete -c osirrox -s f -o print-size -o pad -o no-pad -s V -s v -o graft-points -s z
complete -c osirrox -o no-emul-boot -s b -s c -o boot-info-table -o boot-load-size -o input-charset -s G
complete -c osirrox -o output-charset -s U -o hide-joliet -o hide-list -o hide-joliet-list -d 'file paths and pathspecs'
complete -c osirrox -o quiet -d 'persists until things happen like -commit, -rollback, -dev, or end of xorriso'
complete -c osirrox -o root -o old-root -d 'by default'
complete -c osirrox -l old-root-no-ino -d 'or to "on" by --old-root-devno '
complete -c osirrox -l old-root-no-md5
complete -c osirrox -l hardlinks -l acl
complete -c osirrox -l xattr -l md5 -l stdio_sync -d 'They work like the xorriso commands with the same name and hardcoded paramete…'
complete -c osirrox -l sort-weight -d 'The number becomes the LBA sorting weight of regular file iso_rr_path or of a…'
complete -c osirrox -l modification-date -d '(see -volume_date uuid).  For EFI bootable GRUB boot images use'
complete -c osirrox -l efi-boot -d 'It performs -boot_image grub efi_path= surrounded by two'
complete -c osirrox -l boot-catalog-hide
complete -c osirrox -o mips-boot
complete -c osirrox -o mipsel-boot
complete -c osirrox -o partition_offset
complete -c osirrox -o untranslated_name_len
complete -c osirrox -l old-empty
complete -c osirrox -l no_rc -d 'prevents interpretation of startup files.  See section FILES below'
complete -c osirrox -o isosize -o multi -o msinfo -l grow_overwriteable_iso -d 'write_start_address=, track source file path or "-" for standard input as tra…'
complete -c osirrox -o audio -o scanbus
complete -c osirrox -s M -d 'write_start_address=32s with -as cdrecord'
complete -c osirrox -o prog_help -d 'Use text as name of this program and perform -help'
complete -c osirrox -o 3h
complete -c osirrox -o volume -d '"volume_date_uuid", -volume_date "all_file_dates" to "set_to_mtime", and -iso…'

