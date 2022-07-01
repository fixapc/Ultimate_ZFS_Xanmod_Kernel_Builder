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

#=======================VARIABLES=====================
	xandeps="\ngrub-efi-amd64 \nlz4 \nclang \nllvm \ngcc \nbc \nopenssl \niptables \nprocps \nlibnfs-utils \npcmciautils \nbtrfs-progs \nsquashfs-tools \nxfsprogs \nreiserfsprogs \njfsutils \ne2fsprogs \nkmod \nutil-linux \nbison \nflex \nbinutils"
	zfs_debian_deps="\ngdebi \ndkms \nbuild-essential \nautoconf \nautomake \nlibtool \ngawk \nalien \nfakeroot \ndkms \nlibblkid-dev \nuuid-dev \nlibudev-dev \nlibssl-dev \nzlib1g-dev \nlibaio-dev \nlibattr1-dev \nlibelf-dev \npython3 \npython3-dev \npython3-setuptools \npython3-cffi \nlibffi-dev \npython3-packaging \ngit \nlibcurl4-openssl-dev"
	#make="make LLVM=1 -j$(nproc)"
	make="make -j$(nproc)"
	dateconfig=$(date +"kernel.config_%Y-%m-%d-%I-%M%p")
	red='\e[1;31m'
	nocolor='\e[1;m'
	yellow='\e[1;33m'
	green='\e[1;32m'
	SCRIPT=$(readlink -f "$0")
	basedir=$(dirname "$SCRIPT")
	kernelcmds=$(strings $basedir/configs/cmdline.conf | grep -v "#" | tr '\n' ' ')
	menuconfig="menuconfig MENUCONFIG_COLOR=blackbg"
	bootdrive=$(df)

#=======================BEGIN SCRIPT==================

#Confirm base directory before execution
	echo
	cd $basedir
	echo -e "$green Script Working Directory: $nocolor" $basedir
	echo
	echo
	echo

	echo -e "$yellow Current List Of Kernel Parameters To Be Used For Kernel Install  $nocolor"
	strings $basedir/configs/cmdline.conf | grep -v "#" | sort -u | column

        read -p "Would You Like To Edit The Kernel Parameters Before Installation? (y/n)" Kerncmds
        if [ "$Kerncmds" = "y" ]
                then
		nano $basedir/configs/cmdline.conf
                else
                echo -e "$red Contiuning Without Changing Kernel Parameters $nocolor"
        fi

#Applying Kernel Parameters Config
		sed -i 's@CONFIG_CMDLINE=.*@CONFIG_CMDLINE="'"$kernelcmds"'"@' $basedir/configs/kernel.config
		sed -i '/CONFIG_ZFS/d' $basedir/configs/kernel.config
		echo CONFIG_ZFS=y >> $basedir/configs/kernel.config


#Check to see if directory is present, if so do not make
        if [ -d $basedir/configs/auto_backup_configs ]
                then
		echo -e "$yellow config backup directory present, not making $nocolor"
                else
		mkdir $basedir/configs/auto_backup_configs
        fi

#Check to see if hostid0 is present for hassle free mounting.
        if [ -f /etc/zfs/hostid ]
                then
                echo -e "$yellow hostid0 already present not making $nocolor"
                else
                echo 0 > /etc/zfs/hostid0
        fi

#List Required Dependencies
	echo -e "$yellow Displaying List Of Dependencies That Will Be Installed $nocolor"
	echo -e  "$xandeps $zfs_debian_deps" | column

#Ask User If They Wish To Continue
	read -p " Do you want to Install The Dependencies? (y/n)  " CONT
	if [ "$CONT" = "y" ]
		then
		echo -e " $yellow Installing Dependencies $nocolor "
		echo -e $xandeps $zfs_debian_deps | xargs apt-get install -y
		else
		echo "Contiuning Without Dependencies"
	fi

#Do you want to install the latest firmware?
	read -p "Do You Want To Install The Latest Linux Firmware From Kernel.org (y/n)" FIRM
	if [ "$FIRM" = "y" ]
	then

#See If LZ4 File Already Exsists
		if [ -d $basedir/linux-firmware ]
			then
			echo -e "$red Firmware Folder Present, We Will Update Instead! $nocolor"
			cd $basedir/linux-firmware && git fetch --prune && git pull --all
			echo -e "$green DONE! $nocolor "
			else
			echo -e "$yellow Downloading The Latest Firmware From Kernel.org $nocolor"
			cd $basedir && git clone https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git
			echo -e "$green DONE! $nocolor"
		fi

#Install The Firmware
	echo -e "$yellow Moving To Firmware Directory $nocolor"
	cd $basedir/linux-firmware
	echo -e "$yellow Installing The Latest Firmware $nocolor"
	$make install
	echo -e "$green DONE! $nocolor"

#Skip Firmware
	else
	echo -e "$yellow Skipping Firmware $nocolor"
	fi

#Install Arch Linux ZFS Grub Patch?
	read -p "Do you eish To install The Arch Linux Grub patch? This allows using the bootfs property correctly, this will overwrite /etc/grub.d/10_linux (y/n)" GRUB
        if [ "$GRUB" = "y" ]
                then
                cp -a $basedir/10_linux /etc/grub.d/10_linux
                echo -e " $green DONE! $nocolor "
                else
                echo -e "$yellow Contiuning Without Grub Patch $nocolor"
        fi

#Check To See If Xanmon Source Code Is Already On This System
	if [ -d $basedir/linux ]
		then
		echo -e "$red Kernel Folder Present!, We Will Update Instead! $nocolor"
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
                echo -e "$red ZFS Folder Present, We Will Update Instead $nocolor"
		cd $basedir/zfs && git fetch --prune && git pull --all
		echo -e "$green DONE! $nocolor"
                else
                echo -e " $yellow Downloading ZFS Repo $nocolor "
                cd $basedir && git clone https://github.com/openzfs/zfs.git
                echo -e " $green DONE! $nocolor "
        fi


#USE LAST MADE CONFIG
	echo -e "$yellow Using Last Modified Kernel Configuration $nocolor"
	cp -a $basedir/configs/kernel.config $basedir/linux/.config
	echo -e "$green DONE! $nocolor "

#Run Make Config W
	echo  -e "$yellow Running Make Clean, Menuconfig And Make Prepare $nocolor "
	echo  -e "$yellow Please Add Any Other Items You Wish To Add To Configuration $nocolor "
	cd $basedir/linux && $make clean $menuconfig prepare
	echo  -e "$green DONE! $nocolor "

#Backup Changes From Menuconfig
	 echo -e "$yellow Backing Up Configuration $nocolor "
         cp -a $basedir/linux/.config $basedir/configs/auto_backup_configs/$dateconfig
	 echo -e "$green DONE! $nocolor "
	 echo -e "$yellow Saving Kernel Configuration To Be Used During Next Makemenu Config $nocolor "
         cp -a $basedir/linux/.config $basedir/configs/kernel.config
	 echo -e "$green DONE! $nocolor "

#Make clean for ZFS
        echo -e "$yellow Running Make Clean And Prepare For ZFS Directory $nocolor "
        cd $basedir/zfs && $make clean
        echo  -e "$green DONE! $nocolor "

#ZFS Start 2nd Configuration Again For ZFS Builit In Configuration
	echo -e " $yellow Running ZFS Configuration $nocolor "
	 ./autogen.sh
	 ./configure 				\
	 --with-linux="$basedir"/linux 		\
	 --with-linux-obj="$basedir"/linux 	\
	 --with-gnu-ld 				\
	 --enable-pyzfs				\
	 --enable-linux-builtin			\
	#--enable-systemd 			\
	#--enable-sysvinit 			\
	--with-udevdir				\
	--disable-systemd 			\
	--disable-sysvinit
	#--enable-dependency-tracking 		\
	#--with-spec=generic 			\
	#--with-gcov=GCOV 			\
	#--bindir=bin			 	\
	#--includedir= 				\
	#--sysconfdir=DIR 			\
	#--sbindir=sbin 			\
	echo -e "$green DONE! $nocolor"

#Make Standard ZFS Install
       echo -e " $yellow Running Make And Make Install For ZFS $nocolor "
       $make && $make install
       echo -n -e "$green DONE! $nocolor"

#Running Configure
	echo -e " $yellow Installing ZFS Built In Module To Kernel Source Directory $nocolor "
	./copy-builtin "$basedir"/linux
	echo -e "$green DONE! $nocolor"

#Build New Kernel
 	echo -e " $yellow Installing Kernel, Modules, Headers And Symbol Layout With ZFS Built In $nocolor "
	cd "$basedir"/linux && $make && $make headers_install && $make vdso_install && $make modules_install
	echo -e "$green DONE! $nocolor"

#Declare Variables
  	declare kver=$(cat "$basedir"/linux/include/config/kernel.release)
        declare zfsv=$(cat "$basedir"/zfs/zfs_config.h | grep  ZFS_META_VERSION | awk '{print $3}' | grep -v ZFS_META_VERSION | tr -d ['"'])

#Copy Kernel To Boot Directory
	echo -e "$yellow Moving Kernel And System.map To Boot Directory $nocolor"
	cp -a "$basedir"/linux/System.map /boot/System.map-"$kver"
	cp -a "$basedir"/linux/arch/x86/boot/bzImage /boot/vmlinuz-"$kver"

#Update Grub
	echo -e "$yellow Updating Grub, Note: Grubs kernel parameters are still passed to the kernel $nocolor"
	update-grub

#Finished
	echo -e "Kernel $kver has been installed"
	echo -e "ZFS $zfsv developer version has been installed"

#Install Arch Linux ZFS Grub Patch?
        read -p "Do you want to add a UEFI boot menu entry directly to the Kernels EFI stub?, this is the fastest possbile way to boot the kernel but is known to be buggy on many motherboards. The the grubs menu entry will still be used if the EFI stub booting does not work (y/n) " efistub
        if [ "$efistub" = "y" ]
                then
                echo -e "$red Delete Any Previously Installed Kernels By This Script $nocolor"
		efibootmgr | grep "Ultimate ZFS Kernel" | awk '{print $1}' | tr -d "[:punct:] [:alpha:]" | xargs efibootmgr -B -d
              	efibootmgr --disk /dev/sda --part 1 --create --label "Ultimate ZFS Kernel"  --loader vmlinuz-"$kver" --unicode 'root=zfs:rpool rw' --verbose
                else
                echo -e " $yellow NOT adding an EFI Stub $nocolor "
        fi

#Install Arch Linux ZFS Grub Patch?
        read -p "DO YOU WISH TO REBOOT NOW (y/n) " rebootnow
        if [ "$rebootnow" = "y" ]
                then
                echo -e " $red REBOOTING NOW! $nocolor "
		reboot
                else
                echo -e " $yellow NOT REBOOTING $nocolor "
        fi
exit





