#!/bin/bash
#Ultimate ZFS Kernel Builder - Based On Xanmod Fixapc.net
#This script automatically downloads the latest ZFS and Xanmod kernel.
#1. A customized kernel configuration has been added that has based on a pure latency based build.
#2. ZFS is compiled and installed as a built in module.
#3. All I/O Scheduling has been removed for better I/O performance. Aka none / noop
#4. All filesystems are baked in for compatibility, speed and to help guard against page faults.
#5. Debugging has been disabled
#6. Cgroups and other resource managment has been Axed.
#7. Built in sleep and power management functions have been disabled.
#8. This is a basic first time upload and there will be more to come. Thanks to Xanmod for their work.
#9. USE AT YOUR OWM RISK UNTIL OFFICAL RELEASE

#Enable Logging
	#set -x

#=======================VARIABLES=====================
	xandeps="\ngrub-efi-amd64 \nlz4 \ncoccinelle \nclang \nllvm \ngcc \nbc \nopenssl \niptables \nprocps \nlibnfs-utils \npcmciautils \nbtrfs-progs \nsquashfs-tools \nxfsprogs \nreiserfsprogs \njfsutils \ne2fsprogs \nutil-linux \nbison \nflex \nbinutils"
	zfs_debian_deps="\ngdebi \nbuild-essential \nautoconf \nautomake \nlibtool \ngawk \nalien \nfakeroot \nlibblkid-dev \nuuid-dev \nlibudev-dev \nlibssl-dev \nzlib1g-dev \nlibaio-dev \nlibattr1-dev \nlibelf-dev \npython3 \npython3-dev \npython3-setuptools \npython3-cffi \nlibffi-dev \npython3-packaging \ngit \nlibcurl4-openssl-dev"
	#make="make "CC=clang" "LD=ld.lld" "KERNEL_LLVM=1" "LLVM_IAS=1" "LLVM=1" "-j$(nproc)""
	#make="make LLVM=1 -j$(nproc)"
	make="make -j$(nproc)"
	dateconfig=$(date +"kernel.config_%Y-%m-%d-%I-%M%p")
	datecmds=$(date +"cmdline.conf_%Y-%m-%d-%I-%M%p")
	red='\e[1;31m'
	yellow='\e[1;33m'
	orange='\e[0;33m'
	green='\e[1;32m'
	nocolor='\e[1;m'
	SCRIPT=$(readlink -f "$0")
	basedir=$(dirname "$SCRIPT")
	kernelcmds=$(strings $basedir/configs/cmdline.conf | grep -v "#" | tr '\n' ' ')
	menuconfig=""$make" menuconfig MENUCONFIG_COLOR=blackbg"
	bootdrive=$(df | grep -i /boot  | awk '{print $1}' | tr -d [:digit:])
	initmodver=$(ls "$basedir"/initrd/lib/modules/ | grep -i xanmod)
	bootlocation=$(df | grep -i /boot  | awk '{print $1,$6}')
	runkern=$(uname -r)
	autobakdir=$(readlink -e  configs/auto_backup_configs)
	autobakdir=$(readlink -e  configs/auto_backup_configs)
	chk4scripts=$(if [ -f /bin/zpool_create_default ] ; then echo "$green Ultimate ZFS Scripts Located: $nocolor /bin /sbin /usr/local/sbin " ; else echo "$red Ultimate ZFS Scripts Installed $noclor " ; fi)

#=======================BEGIN SCRIPT==================
#Silently Clean Config
	grep -rl "CONFIG_ZFS" $basedir/configs | xargs sed -i '/CONFIG_ZFS/d' > /dev/null 2>&1 &

#Confirm base directory before execution
	cd $basedir
	figlet -t -c Ultimate ZFS Xanmod Kernel Builder By Fixapc.net
	echo -e "$yellow Script Working Directory: $nocolor" $basedir
	echo -e "$green Current Kernel Version: $nocolor" $runkern
	echo -e "$green Installed ZFS Version $nocolor" $(modinfo zfs | grep -E "version" )
	echo -e "$chk4scripts"
	echo -e "$green Current Boot: $nocolor" $bootlocation
	echo -e "$green Autobackupdir: $nocolor" $autobakdir
	#echo -e "$green Recommended Performance Settings: $nocolor" Arcblk: 16K  Ashift: 8K/16K  Recsize: 16K  Avgblk: 16K


#Create ZFS create files
	#Default Zpool
	#cp -a -r -f -v $basedir/zfs_command_scripts/* {/sbin/,/bin/,/usr/local/sbin/}



#Check to see if hostid0 is present for hassle free mounting.
#         if [ -f /etc/zfs/hostid0 ]
#                 then
#                 echo -e "$yellow hostid0 already present not making $nocolor"
#                 else
#                 touch /etc/zfs/hostid0
#                 echo 0 > /etc/zfs/hostid0
#         fi

#Check to see if directory is present, if so do not make
        if [ -d $basedir/configs/auto_backup_configs ]
                then
                echo -e "$green Configuration Directory Present, Not Making $nocolor" $(readlink -e configs/auto_backup_configs)
                else
                mkdir $basedir/configs/auto_backup_configs
        fi

#Continue With Last Session (Kernel Parameters) Or Use Defaults
	 if [ -f $basedir/configs/cmdline.conf.save ]
		then
		echo -e "$yellow Previous Kernel Parameters Configuration Found $nocolor" $(readlink -e $basedir/configs/cmdline.conf.save)
		echo -e "$yellow Would You Like To Use Your Last Saved Kernel Parameters Configuration? $nocolor"
		echo -e "$yellow You Can Edit This Configuration With Nano Before Continuing $nocolor"
		read -p "$(echo -e $green Y= Use Last Saved Kernel Parameters $nocolor $red N= Use Default Kernel Parameter List $nocolor)" Savedcmds
			if [ "$Savedcmds" = "Y" ]

		        	then
				cp -a $basedir/configs/cmdline.conf.save $basedir/configs/cmdline.conf

				else
				echo -e "$yellow Using Default Config $nocolor"
				cp -a $basedir/configs/cmdline_default.conf $basedir/configs/cmdline.conf
				fi

#If not previous config found copy defaults to the cmdline file that will be used.
		else
		echo -e "$yellow No Previous Configurations Found From Last Sessions Continuing With Default Config $nocolor"
		cp -a $basedir/configs/cmdline_default.conf $basedir/configs/cmdline.conf
		fi


#Show kernel parameters
		echo -e "$yellow Current Kernel Parameters Based On Your Selection $nocolor"
		strings $basedir/configs/cmdline.conf | grep -v "#" | sort -u | column


#Ask if user would like to edit before installing

        echo -e "$yellow Would You Like To Edit The Kernel Parameters Before Installation? $nocolor " 
        read -p "$(echo -e $green Y= YES EDIT PARAMETERS $nocolor $red N= NO DO NOT EDIT NOW $nocolor)" Kerncmds
        if [ "$Kerncmds" = "Y" ]
                then
		nano  $basedir/configs/cmdline.conf
		echo -e "$yellow Would You Like To Save These Kernel Parameters $nocolor "
		read -p "$(echo -e $green Y= YES SAVE PARAMETERS $nocolor $red N= DO NOT SAVE $nocolor)" Kerncmdssave
        	if [ "$Kerncmdssave" = "Y" ]
        	then
        		echo -e "$yellow Saving Kernel Parameters $nocolor"
			cp -a -f $basedir/configs/cmdline.conf $basedir/configs/cmdline.conf.save
			cp -a -f $basedir/configs/cmdline.conf $basedir/configs/auto_backup_configs/$datecmds
		else
                	echo -e "$yellow Not Saving To Config.save $nocolor"
                	#Create an autosave but not a user save
                	cp -a -f $basedir/configs/cmdline.conf $basedir/configs/auto_backup_configs/$datecmds
                fi


                else
                echo -e " $red Continuing Without Changing Kernel Parameters $nocolor "
        fi

#Apply kernel CMD line to kernel config file
	sed -i 's@CONFIG_CMDLINE=.*@CONFIG_CMDLINE="'"$kernelcmds"'"@' $basedir/configs/kernel.config

#List Required Dependencies
	echo -e "$yellow Displaying List Of Dependencies That Will Be Installed $nocolor"
	echo -e  "$xandeps $zfs_debian_deps" | column

#Ask User If They Wish To Continue
	echo -e " $yellow Do you want to Install The Dependencies? $nocolor"
	read -p "$(echo -e $green Y= YES INSTALL DEPS $nocolor $red N= NO DO NOT INSTALL DEPS $nocolor)" CONT
	if [ "$CONT" = "Y" ]
		then
		echo -e " $yellow Installing Dependencies $nocolor "
		echo -e $xandeps $zfs_debian_deps | xargs apt-get install -y
		else
		echo -e " $red Continuing Without Dependencies $nocolor "
	fi

#Do you want to install the latest firmware?
	echo -e " $yellow Do You Want To Install The Latest Firmware From Kernel.org $nocolor "
	read -p "$(echo -e $green Y= YES INSTALL FIRMWARE $nocolor $red N= NO NOT NOW $nocolor)" FIRM

	if [ "$FIRM" = "Y" ]
	then

#Check if firmware directory is present
		if [ -d $basedir/linux-firmware ]
			then
			echo -e "$green Firmware Folder Present, We Will Update Instead! $nocolor"
			cd $basedir/linux-firmware && git fetch --prune && git pull --all
			echo -e "$green DONE! $nocolor "
			else
			echo -e "$yellow Downloading The Latest Firmware From Kernel.org $nocolor"
			cd $basedir && git clone https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git
			echo -e "$green DONE! $nocolor"
		fi

#Install The Firmware
	echo -e "$yellow Installing The Latest Firmware $nocolor"
	cd $basedir/linux-firmware && $make install
	echo -e "$green DONE! $nocolor"

#Skip Firmware
	else
	echo -e "$red SKIPPING LATEST FIRMWARE INSTALL $nocolor"
	fi

#Install Arch Linux ZFS Grub Patch?
	#read -p "Do you eish To install The Arch Linux Grub patch? This allows using the bootfs property correctly, this will overwrite /etc/grub.d/10_linux (y/n)" GRUB
        #if [ "$GRUB" = "y" ]
        #        then
        #        cp -a $basedir/10_linux /etc/grub.d/10_linux
        #        echo -e " $green DONE! $nocolor "
        #        else
        #        echo -e "$yellow Contiuning Without Grub Patch $nocolor"
        #fi

#Check To See If Xanmon Source Code Is Already On This System
	if [ -d $basedir/linux ]
		then
		echo -e "$green Kernel Folder Present!, We Will Update Instead! $nocolor"
		cd $basedir/linux && git fetch --prune && git pull --all
		echo -e " $green DONE! $nocolor "
		else
		echo -e " $yellow Cloning Xanmod Repo! $nocolor "
		cd $basedir && git clone https://github.com/xanmod/linux.git
		echo -e " $green DONE! $nocolor "
	fi

#Check for presence of ZFS Folder
        if [ -d $basedir/zfs ]
                then
                echo -e "$green ZFS Folder Present, We Will Update Instead $nocolor"
		cd $basedir/zfs && git fetch --prune && git pull --all
		echo -e "$green DONE! $nocolor"
                else
                echo -e " $yellow Downloading ZFS Repo $nocolor "
                cd $basedir && git clone https://github.com/openzfs/zfs.git
                echo -e " $green DONE! $nocolor "
        fi


#USE LAST MADE CONFIG
	echo -e "$yellow Using Last Modified Kernel Configuration $nocolor"
	cp -a -f $basedir/configs/kernel.config $basedir/linux/.config
	echo -e "$green DONE! $nocolor "

#Run Make Config W
	echo  -e "$yellow Running Make Clean, Menuconfig And Make Prepare $nocolor "
	echo  -e "$yellow Please Add Any Other Items You Wish To Add To Configuration $nocolor "
	cd $basedir/linux && $make clean
	$menuconfig
	$make prepare
	echo  -e "$green DONE! $nocolor"

#declare updated kernel version from make prepare
	declare kver=$(cat "$basedir"/linux/include/config/kernel.release)

#Change module directory name to match kernel version set in make menuconfig
	if [ -d $basedir/initrd/lib/modules/$kver ]
		then
		echo  -e "$green initrd modules folder matches kernel version, continuing $nocolor"
		else
		echo  -e "$green kernel name has changed, updating folder path for initrd modules $nocolor"
		mv $basedir/initrd/lib/modules/$initmodver $basedir/initrd/lib/modules/$kver
	fi

#Backup Changes From Menuconfig
	 echo -e "$yellow Backing Up Configuration $nocolor "
         cp -a -f $basedir/linux/.config $basedir/configs/auto_backup_configs/$dateconfig
	 echo -e "$green DONE! $nocolor "
	 echo -e "$yellow Saving Kernel Configuration To Be Used During Next Makemenu Config $nocolor "
         cp -a -f $basedir/linux/.config $basedir/configs/kernel.config
	 echo -e "$green DONE! $nocolor "

#Make clean for ZFS
        echo -e "$yellow Running Make Clean And Prepare For ZFS Directory $nocolor "
        cd $basedir/zfs && $make clean
        echo  -e "$green DONE! $nocolor "


#Test Deleting Old Shared Libaries To Confirm Static Libs Are Enabled
#ZFS Start 2nd Configuration Again For ZFS Builit In Configuration
	echo -e " $yellow Running ZFS Configuration $nocolor "
	 ./autogen.sh
	 ./configure				\
	 --with-linux="$basedir"/linux 		\
	 --with-linux-obj="$basedir"/linux	\
	 --enable-linux-builtin			\
	 --enable-static			\
	 #--enable-shared			\
	 #--enable-pyzfs			\
	 #--with-gnu-ld  			\
	 --sbindir=/sbin			\
	 --bindir=/bin                          \
	 --libdir=/lib				\
	 --localstatedir=/var   		\
	 --includedir=/usr/include
	#--enable-sysvinit			\
	#--with-dracutdir			\
	#--with-mounthelperdir			\
	#--disable-fast-install			\
	#--with-udevdir				\
	#--with-config=all 			\
	#--with-libintl-prefix			\
	#--with-pkgconfigdir			\
 	#--with-aix-soname=both			\
	#--enable-sysvinit			\
	#--enable-pyzfs				\
	#--enable-systemd 			\
	#--enable-sysvinit 			\
	#--enable-dependency-tracking		\
	#--oldincludedir			\
	#--with-python-sys-prefix		\
	#--sysconfdir=etc  			\
	#--enable-static			\
	#--disable-shared			\
	#--includedir=/usr/include		\
	#--exec-prefix				\
	#--disable-systemd 			\
	#--disable-sysvinit			\
	#--with-spec=generic 			\
	#--with-gcov=GCOV 			\
	echo -e "$green DONE! $nocolor"

#Make Standard ZFS Install
        echo -e " $yellow Running Make And Make Install For ZFS $nocolor "
        $make
	$make install; ldconfig; depmod;
       	echo -e "$green DONE! $nocolor"

#Running Configure
	echo -e " $yellow Installing ZFS Built In Module To Kernel Source Directory $nocolor "
	./copy-builtin "$basedir"/linux
	echo -e "$green DONE! $nocolor"

#Applying Mandatory Kernel Parameter Config
	sed -i 's@.*CONFIG_ZFS.*@CONFIG_ZFS=y@' $basedir/linux/.config

#Build New Kernel
 	echo -e " $yellow Installing Kernel, Modules, Headers And Symbol Layout With ZFS Built In $nocolor "
	cd "$basedir"/linux
	$make prepare
	$make
	$make modules
	$make headers
	$make modules_prepare
	$make headers_install
	$make nsdeps
	$make scripts
	$make nsdeps
	$make modules_install
	echo -e "$green DONE! $nocolor"

#Install Basic Debian Based Packages
#	echo -e "$green Installing ZFS Utils, ZFS-Dracut And ZFS-Initramfs $nocolor"
#        cd "$basedir"/zfs && $make deb-utils && dpkg -i --force-all *.deb

#Declare Variables

        declare zfsv=$(cat "$basedir"/zfs/zfs_config.h | grep  ZFS_META_VERSION | awk '{print $3}' | grep -v ZFS_META_VERSION | tr -d ['"'])


#Copy Modules Information To Initramfs
	echo -e "$green Copying Module Symbols And Link Data To Initramfs $nocolor"
	cp -a -f /lib/modules/$kver/modules.alias $basedir/initrd/lib/modules/$kver/
	cp -a -f /lib/modules/$kver/modules.alias.bin $basedir/initrd/lib/modules/$kver/
	cp -a -f /lib/modules/$kver/modules.builtin $basedir/initrd/lib/modules/$kver/
	cp -a -f /lib/modules/$kver/modules.builtin.alias.bin $basedir/initrd/lib/modules/$kver/
	cp -a -f /lib/modules/$kver/modules.builtin.bin $basedir/initrd/lib/modules/$kver/
	cp -a -f /lib/modules/$kver/modules.builtin.modinfo $basedir/initrd/lib/modules/$kver/
	cp -a -f /lib/modules/$kver/modules.dep $basedir/initrd/lib/modules/$kver/
	cp -a -f /lib/modules/$kver/modules.dep.bin $basedir/initrd/lib/modules/$kver/
	cp -a -f /lib/modules/$kver/modules.devname $basedir/initrd/lib/modules/$kver/
	cp -a -f /lib/modules/$kver/modules.order $basedir/initrd/lib/modules/$kver/
	cp -a -f /lib/modules/$kver/modules.softdep $basedir/initrd/lib/modules/$kver/
	cp -a -f /lib/modules/$kver/modules.symbols $basedir/initrd/lib/modules/$kver/
	cp -a -f /lib/modules/$kver/modules.symbols.bin $basedir/initrd/lib/modules/$kver/



#Copy Symbol files only present in src
#	cp -a -f $basedir/linux/Modules.symvers $basedir/initrd/lib/modules/$kver/
#	cp -a -f $basedir/linux/modules-only.symvers $basedir/initrd/lib/modules/$kver/
#	cp -a -f $basedir/linux/modules.nsdeps $basedir/initrd/lib/modules/$kver/


#Installing System.map to multiple locations to confirm correct Symbol lookup
	cp -a -f $basedir/linux/System.map /lib/modules/$kver/
	cp -a -f $basedir/linux/System.map /
	cp -a -f $basedir/linux/System.map /boot

#Confirm Binarys Match And Overwrite Any ZFS Package binares installed by distro to prevent miss matched libraries and symbol issues.


	echo -e "$yellow Copying Compiled ZFS Binaries To Multiple Distro Based Exported Paths $nocolor"
	echo /bin/ /usr/local/bin /usr/local/sbin/ /sbin | xargs -n1 cp -v /sbin/fsck.zfs /sbin/zdb /sbin/zed /sbin/zfs /sbin/zfs_ids_to_path /sbin/zgenhostid /sbin/zstreamdump /sbin/zpool /sbin/ztest /sbin/zstream /sbin/zinject /sbin/zhack



#Add items to bootdirectory
	echo -e "$yellow Compiling Kernel A 2nd Time To Confirm Correct Symbol Lookup $nocolor"
	$make bzImage
	cp -a -f $basedir/linux/arch/x86/boot/bzImage /boot/vmlinuz-$kver

#Update Grub
	echo -e "$yellow Updating Grub, Note: Grubs kernel parameters are still passed to the kernel $nocolor"
	update-grub

#Finished
	echo -e "$green Kernel $kver has been installed $nocolor"
	echo -e "$green ZFS $zfsv developer version has been installed $nocolor"

#Install Arch Linux ZFS Grub Patch?
        echo -e " $yellow Do you want to add a UEFI boot menu entry directly to the Kernels EFI stub?, this is the fastest possbile way to boot the kernel but is known to be buggy on many motherboards. The the grubs menu entry will still be used if the EFI stub booting does not work $nocolor " 
        read -p " $(echo -e $green Y= YES, INSTALL EFI STUB TO BOOT $nocolor $red N= NO, DO NOT INSTALL EFI STUB ENTRY TO BOOT $nocolor) " efistub
        if [ "$efistub" = "Y" ]
                then
                echo -e "$red Deleting Any Previously Installed Kernel Boot Entries By This Script $nocolor"
		efibootmgr | grep "Ultimate ZFS Kernel" | awk '{print $1}' | tr -d "[:punct:] [:alpha:]" | xargs -n1 efibootmgr -B -b
              	efibootmgr --disk "$bootdrive" --part 1 --create --label "Ultimate ZFS Kernel"  --loader vmlinuz-"$kver" --unicode 'root=zfs:rpool rw' --verbose
                else
                echo -e " $red NOT adding an EFI Stub $nocolor "
        fi

#Ask To Reboot
	echo -e "$yellow DO YOU WISH TO REBOOT NOW"
        read -p " $(echo -e $green Y= YES $nocolor $red N=NO $nocolor) " rebootnow
        if [ "$rebootnow" = "Y" ]
                then
                echo -e " $red REBOOTING NOW! $nocolor "
		reboot
                else
                echo -e " $yellow NOT REBOOTING $nocolor "
        fi

