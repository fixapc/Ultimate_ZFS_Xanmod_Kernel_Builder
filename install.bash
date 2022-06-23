#!/bin/bash
#Ultimate ZFS Kernel Builder - Based On Xanmod Fixapc.net
#This script automatically downloads the latest ZFS and Xanmod kernel.
#1. A customized configuration kernel configuration has been added that has based on a pure latency based build.
#2. ZFS is compiled and installed as a built in module.
#3. All I/O Scheduling has been removed for better I/O performance. Aka none / noop
#4. All filesystems are baked in for compatibility, speed and to help guard against page faults.
#5. Debugging has been disabled
#6. Cgroups and other resource managment has been Axed.
#7. Built in sleep and power management functions have been disabled.
#8. This is a basic first time upload and there will be more to come. Thanks to Xanmod for their work.


#Variables
	xandeps="\ngrub-efi-amd64 \nlz4 \nclang \nllvm \ngcc \nbc \nopenssl \niptables \nprocps \nlibnfs-utils \npcmciautils \nbtrfs-progs \nsquashfs-tools \nxfsprogs \nreiserfsprogs \njfsutils \ne2fsprogs \nkmod \nutil-linux \nbison \nflex \nbinutils"
	zfs_debian_deps="\ngdebi \ndkms \nbuild-essential \nautoconf \nautomake \nlibtool \ngawk \nalien \nfakeroot \ndkms \nlibblkid-dev \nuuid-dev \nlibudev-dev \nlibssl-dev \nzlib1g-dev \nlibaio-dev \nlibattr1-dev \nlibelf-dev \npython3 \npython3-dev \npython3-setuptools \npython3-cffi \nlibffi-dev \npython3-packaging \ngit \nlibcurl4-openssl-dev"
	#make="make LLVM=1 -j$(nproc)"
	make="make -s -j$(nproc)"
	dateconfig=$(date +"kernel.config_%Y-%m-%d-%I-%M%p")
	red='\e[1;31m'
	nocolor='\e[1;m'
	yellow='\e[1;33m'
	green='\e[1;32m'
	SCRIPT=$(readlink -f "$0")
	basedir=$(dirname "$SCRIPT")

#Confirm base directory before execution
	cd $basedir
	echo Current Directory $basedir

#List Required Dependencies
	echo -e "$yellow Displaying List Of Dependencies That Will Be Installed $nocolor" 
	echo -e -n $xandeps
	echo -e $zfs_debian_deps

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
	read -p " Do You Want To Install The Latest Linux Firmware From Kernel.org (y/n)  " FIRM
	if [ "$FIRM" = "y" ]
	then

#See If LZ4 File Already Exsists
		if [ -d $basedir/linux-firmware ]
			then
			echo -e "$red Firmware Folder Present, We Will Update Instead! $nocolor "
			cd $basedir/linux-firmware && git fetch --prune && git pull --all
			echo -e " $green DONE! $nocolor "
			else
			echo -e " $yellow Downloading The Latest Firmware From Kernel.org $nocolor "
			cd $basedir && git clone https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git
			echo -e " $green DONE! $nocolor "
		fi

#Install The Firmware
	echo -e " $yellow Moving To Firmware Directory $nocolor "
	cd $basedir/linux-firmware
	echo -e " $yellow Installing The Latest Firmware $nocolor "
	$make install
	echo -e " $green DONE! $nocolor "

#Skip Firmware
	else
	echo -e " $yellow Skipping Firmware $nocolor "
	fi

#Install Arch Linux ZFS Grub Patch?
	read -p " Do you eish To install The Arch Linux Grub patch? This allows using the bootfs property correctly, this will overwrite /etc/grub.d/10_linux (y/n) " GRUB
        if [ "$GRUB" = "y" ]
                then
                cp -a $basedir/10_linux /etc/grub.d/10_linux
                echo -e " $green DONE! $nocolor "
                else
                echo -e " $yellow Contiuning Without Grub Patch $nocolor "
        fi

#Check to see if Xanmon Source Clone Is Available
	if [ -d $basedir/linux ]
		then
		echo -e "$red Kernel Folder Present!, We Will Update Instead! $nocolor "
		cd $basedir/linux && git fetch --prune && git pull --all
		echo -e " $green DONE! $nocolor "
		else
		echo -e " $yellow Cloning Xanmod Repo! $nocolor "
		cd $basedir && git clone https://github.com/xanmod/linux.git
		echo -e " $green DONE! $nocolor "
	fi

#See If LZ4 Is Prevent For Kernel Files
        if [ -d $basedir/zfs ]
                then
                echo -e "$red ZFS Folder Present, We Will Update Instead $nocolor "
		cd $basedir/zfs && git fetch --prune && git pull --all
		echo -e " $green DONE! $nocolor "
                else
                echo -e " $yellow Downloading ZFS Repo $nocolor "
                cd $basedir && git clone https://github.com/openzfs/zfs.git
                echo -e " $green DONE! $nocolor "
        fi

#USE LAST MADE CONFIG
	echo -e " $yellow Using Last Modified Kernel $nocolor $nocolor "
	cp -a $basedir/kernel.config $basedir/linux/.config
	echo -e "$green DONE! $nocolor "

#Moving To Kernel Build Directory
        echo -e "$yellow Moving To Kernel Directory $nocolor "
        cd $basedir/linux

#Run Make Config W
	echo  -e "$yellow Make Clean $nocolor "
	$make clean
	echo  -e "$green DONE! $nocolor "
	echo  -e "$yellow Running Make Menuconfig $nocolor "
	$make menuconfig
	echo  -e "$green DONE! $nocolor "

#Backup Changes From Menuconfig
	 echo -e "$yellow Backing Up Configuration $nocolor "
         cp -a $basedir/linux/.config $basedir/$dateconfig
	 echo -e "$green DONE! $nocolor "
	 echo -e "$yellow Saving Kernel Configuration To Be Used During Next Makemenu Config $nocolor "
         cp -a $basedir/linux/.config $basedir/kernel.config
	 echo -e "$green DONE! $nocolor "

#Run Make Prepare
	echo -e "$yellow Running Make Prepare, Prior To Running The ZFS Built In Module Command $nocolor "
	$make prepare
	echo -e "$green DONE! $nocolor "

#Moving To ZFS Directory
	echo -e " $yellow Moving To ZFS Directory $nocolor "
	cd $basedir/zfs
	echo -e "$green DONE! $nocolor "

#Make clean for ZFS
	echo -e " $yellow Running Make Clean For ZFS Directory $nocolor "
	$make clean
	echo  -e "$green DONE! $nocolor "

#Running Auto Config For ZFS
	echo -e " $yellow Running Autogen $nocolor "
	./autogen.sh
	echo -e "$green DONE! $nocolor "


#Sysvinit Or SystemD?
	read -p " Are you using SystemD for your init? (y/n)  " SYSD
	if [ "$SYSD" = "y" ]
        	then
        	echo -e " $yellew Configuring ZFS for SystemD $nocolor "
		echo -e " $yellow Running ZFS Configuration $nocolor "
		./configure --with-linux="$basedir"/linux --with-linux-obj="$basedir"/linux --enable-systemd --enable-linux-builtin
		echo -e "$green DONE! $nocolor "

		else
        	echo "$yellow Configuring for Sysvinit, OpenRC, Runit and or other......"
		echo -e " $yellow Running ZFS Configuration $nocolor "
		./configure --with-linux="$basedir"/linux --with-linux-obj="$basedir"/linux --enable-sysvinit --enable-linux-builtin
		echo -e "$green DONE! $nocolor "
	fi


#Running Configure
	echo -e " $yellow Installing ZFS Built In Module To Kernel Source Directory $nocolor "
	./copy-builtin $basedir/linux
	echo -e "$green DONE! $nocolor "

#Build New Kernel
	echo -e " $yellow Moving To Kernel Source Directory $nocolor "
	cd $basedir/linux
	echo -e " $yellow Running Make $nocolor "
	$make
	echo -e "$green DONE! $nocolor "
	echo -e " $yellow Preparing Modules $nocolor "
	$make modules_prepare
	echo -e "$green DONE! $nocolor "
	echo -e " $yellow Building Modules $nocolor "
	$make modules
	echo -e "$green DONE! $nocolor "
	echo -e " $yellow Installing Modules $nocolor "
        $make modules_install
	echo -e "$green DONE! $nocolor "
	echo -e " $yellow Make Headers $nocolor "
	$make headers
	echo -e "$green DONE! $nocolor "
	echo -e " $yellow Installing Headers $nocolor "
	$make headers_install
	echo -e "$green DONE! $nocolor "
#	echo -e " $yellow Running Make Install $nocolor "
#	$make install
#	echo -n -e "$green DONE! $nocolor "

#Moving To ZFS Directory
	echo -n -e "$yellow Cleaning Deb Package Install Files $nocolor "
	cd $basedir/zfs && rm  *.deb *.rpm
	echo -n -e "$green DONE! $nocolor "
	echo -e " $yellow Making ZFS Deb Packages Based On Sysvinit $nocolor "
	$make deb-utils deb-dkms
	echo -n -e "$green DONE! $nocolor "

#Now Install Compiled ZFS Packages
	echo -e " $yellow Installing ZFS .Deb Packages $nocolor "
	for file in *.deb; do sudo gdebi -q --non-interactive $file; done
	cd $basedir
	echo -n -e "$green DONE! $nocolor "

	echo -e " $yellow Running Make Install $nocolor "
	cd $basedir/linux
	$make install
	echo -n -e "$green DONE! $nocolor "



#Declare kver variable
	declare kver=$(cat "$basedir"/linux/include/config/kernel.release)

#Rebuild DKMS Modules
#	echo "$yellow Confirming DKMS ZFS Module Has Been Added To Initrd $nocolor "
#	dkms add -m zfs -v 2.1.99
#	echo "$green DONE! $nocolor "
#	echo "$yellow Rebuild DKMS modules for new kernel $nocolor "
#	dkms autoinstall -k $kver
#	echo "$green DONE! $nocolor "

#Rebuild Initramfs for confirmation
#	echo "$yellow Confirming Update Of Initramfs Files $nocolor "
#	update-initramfs -u -k $kver
#	echo "$green DONE! $nocolor "

#Confirm ZFS Module Is In Initramfs
	lsinitramfs /boot/initrd.img-"$kver" | grep zfs.ko && update-grub && echo "$green FOUND ZFS MODULE IN NEW INITRAMFS AND UPDATED GRUB, INSTALL FINISHED! (SAFE TO REBOOT!) $nocolor "

#Building Initramfs Into Kernel - In Progress
#	echo -e " $green Building Another Initramfs To Working Directory, To Build Into Kernel  $nocolor"
#	update-initramfs -c -k $kver -b "$basedir/initramfs_src_files" -v | grep -i zfs.ko

#	echo -e " $yellow Unpacking Built Initramfs Into Initramfs Source Directory $nocolor"
#	cd $basedir/initramfs_src_files
#	lsinitramfs --unpack $kver
#	echo -e " $green DONE! $nocolor"

#Running Make Install

