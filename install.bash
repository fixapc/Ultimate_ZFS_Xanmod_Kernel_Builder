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
	xandeps="\ngrub-efi \nlz4 \nclang \nllvm \ngcc \nbc \nopenssl \niptables \nprocps \nlibnfs-utils \npcmciautils \nbtrfs-progs \nsquashfs-tools \nxfsprogs \nreiserfsprogs \njfsutils \ne2fsprogs \nkmod \nutil-linux \npahole \nbison \nflex \nbinutils"
	zfs_debian_deps="\ngdebi \ndkms \nbuild-essential \nautoconf \nautomake \nlibtool \ngawk \nalien \nfakeroot \ndkms \nlibblkid-dev \nuuid-dev \nlibudev-dev \nlibssl-dev \nzlib1g-dev \nlibaio-dev \nlibattr1-dev \nlibelf-dev \npython3 \npython3-dev \npython3-setuptools \npython3-cffi \nlibffi-dev \npython3-packaging \ngit \nlibcurl4-openssl-dev"
	#make="make LLVM=1 -j$(nproc)"
	make="make -s -j$(nproc)"
	dateconfig=$(date +"kernel.config_%Y-%m-%d-%I-%M%p")
	red='\e[1;31m'
	nocolor='\e[1;m'
	yellow='\e[1;33m'
	green='\e[1;32m'

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
		if [ -d linux-firmware ]
			then
			echo -e "$red Firmware Folder Present, We Will Checkout Instead! $nocolor "
			cd linux-firmware/
			git checkout main
			cd ..
			echo -e " $green DONE! $nocolor "
			else
			echo -e " $yellow Downloading The Latest Firmware From Kernel.org $nocolor "
			git clone https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git
			echo -e " $green DONE! $nocolor "
		fi

#Install The Firmware
	echo -e " $yellow Moving To Firmware Directory $nocolor "
	cd linux-firmware/
	echo -e " $yellow Installing The Latest Firmware $nocolor "
	$make install
	echo -e " $green DONE! $nocolor "
	cd ..

#Skip Firmware
	else
	echo -e " $yellow Skipping Firmware $nocolor "
	fi

#Install Arch Linux ZFS Grub Patch?
	read -p " Do you eish To install The Arch Linux Grub patch? This allows using the bootfs property correctly, this will overwrite /etc/grub.d/10_linux (y/n) " GRUB
        if [ "$GRUB" = "y" ]
                then
                cp -a 10_linux /etc/grub.d/10_linux
                echo -e " $green DONE! $nocolor "
                else
                echo -e " $yellow Contiuning Without Grub Patch $nocolor "
        fi

#Check to see if Xanmon Source Clone Is Available
	if [ -d linux ]
		then
		echo -e "$red Kernel Folder Present!, Checkout Instead! $nocolor "
		cd linux/
		git checkout origin
		echo -e " $green DONE! $nocolor "
		cd ..
		else
		echo -e " $yellow Cloning Xanmod Repo! $nocolor "
		git clone https://github.com/xanmod/linux.git
		echo -e " $green DONE! $nocolor "
	fi

#See If LZ4 Is Prevent For Kernel Files
        if [ -d zfs ]
                then
                echo -e "$red Lz4 Has Already Been Created For ZFS Files, Checkout Instead $nocolor "
		cd zfs/
		git checkout master
		echo -e " $green DONE! $nocolor "
		cd ..
                else
                echo -e " $yellow Downloading ZFS Repo $nocolor "
                git clone https://github.com/openzfs/zfs.git
                echo -e " $green DONE! $nocolor "
        fi

#USE LAST MADE CONFIG
	echo -e " $yellow Using Last Modified Kernel $nocolor $nocolor "
	cp -a kernel.config linux/.config
	echo -e "$green DONE! $nocolor "

#Moving To Kernel Build Directory
        echo -e "$yellow Moving To Kernel Directory $nocolor "
        cd linux/

#Run Make Config W
	echo  -e "$yellow Make Clean $nocolor "
	$make clean
	echo  -e "$green DONE! $nocolor "
	echo  -e "$yellow Running Make Menuconfig $nocolor "
	$make menuconfig
	echo  -e "$green DONE! $nocolor "

#Backup Changes From Menuconfig
	 echo -e "$yellow Backing Up Configuration $nocolor "
         cp -a .config ../$dateconfig
	 echo -e "$green DONE! $nocolor "
	 echo -e "$yellow Saving Kernel Configuration To Be Used During Next Makemenu Config $nocolor "
         cp -a .config ../kernel.config
	 echo -e "$green DONE! $nocolor "

#Run Make Prepare
	echo -e "$yellow Running Make Prepare, Prior To Running The ZFS Built In Module Command $nocolor "
	$make prepare
	echo -e "$green DONE! $nocolor "

#Moving To ZFS Directory
	echo -e " $yellow Moving To ZFS Directory $nocolor "
	cd ../zfs/
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
		./configure --with-linux=../linux/ --with-linux-obj=../linux/ --enable-systemd --enable-linux-builtin
		echo -e "$green DONE! $nocolor "

		else
        	echo "$yellow Configuring for Sysvinit, OpenRC, Runit and or other......"
		echo -e " $yellow Running ZFS Configuration $nocolor "
		./configure --with-linux=../linux/ --with-linux-obj=../linux/ --enable-sysvinit --enable-linux-builtin
		echo -e "$green DONE! $nocolor "
	fi


#Running Configure
	echo -e " $yellow Installing ZFS Built In Module To Kernel Source Directory $nocolor "
	./copy-builtin ../linux/
	cd ..
	echo -e "$green DONE! $nocolor "

#Build New Kernel
	echo -e " $yellow Moving To Kernel Source Directory $nocolor "
	cd linux/
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
	echo -e " $yellow Running Make Install $nocolor "
	$make install
	echo -n -e "$green DONE! $nocolor "
	echo -e " $yellow Make Kernel Image $nocolor "

#Moving To ZFS Directory
        echo -e " $yellow Moving To ZFS Directory $nocolor "
	cd ../zfs/
	echo -n -e "$green DONE! $nocolor "
	echo -e " $yellow Making ZFS Deb Packages Based On Sysvinit $nocolor "
	$make deb-utils deb-dkms
	echo -n -e "$green DONE! $nocolor "

#Now Install Compiled ZFS Packages
	rm -f -v zfs-dracut*
	echo -e " $yellow Installing ZFS .Deb Packages $nocolor "
	for file in *.deb; do sudo gdebi -q --non-interactive $file; done
	cd ..
	echo -n -e "$green DONE! $nocolor "


#Rebuild DKMS Modules
	#dkms autoinstall -k  5.18.2-xanmod1-Rolling5  --kernelsourcedir=linux/

#Installation Completed
	echo -e " $green Finished Installing $nocolor $red Bleeding Edge $nocolor $green Xanmod Kernel With $nocolor $red Bleeding Edge $nocolor $green Built In ZFS $nocolor"
