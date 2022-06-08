 #!/bin/bash
#Xanmod Ultra Performance Edition By Fixapc.net
#This script Automatically Downloads The Latest ZFS And Xanmod Kernel Releases And Creates A Universal Kernel Using Only Build In Modules.

#Variables
	xandeps="\ngrub2 \nlz4 \nclang \nllvm \ngcc \nbc \nopenssl \niptables \nprocps \nlibnfs-utils \npcmciautils \nbtrfs-progs \nsquashfs-tools \nxfsprogs \nreiserfsprogs \njfsutils \ne2fsprogs \nkmod \nutil-linux \npahole \nbison \nflex \nbinutils"
	zfs_debian_deps="\ngdebi \ndkms \nbuild-essential \nautoconf \nautomake \nlibtool \ngawk \nalien \nfakeroot \ndkms \nlibblkid-dev \nuuid-dev \nlibudev-dev \nlibssl-dev \nzlib1g-dev \nlibaio-dev \nlibattr1-dev \nlibelf-dev \npython3 \npython3-dev \npython3-setuptools \npython3-cffi \nlibffi-dev \npython3-packaging \ngit \nlibcurl4-openssl-dev"
	#make="make LLVM=1 -j$(nproc)"
	make="make -j$(nproc)"
	dateconfig=$(date +"kernel.config_%Y-%m-%d-%I-%M%p")
	red='\e[1;31m'
	nocolor='\e[1;m'
	yellow='\e[1;33m'
	green='\e[1;32m'


#Remove Old Directories
        echo -e  "$yellow Removing Previous Xanmod Kernel Source To Prevent Bad Builds $nocolor"
        rm -R -f linux-5.18.1-xanmod1/
        echo -e " $green Done $nocolor "
        rm -R -f 5.18.1-xanmod1.tar.gz*

#Remove Old Directories
        echo -e  "$yellow Removing Previous ZFS Source Folder To Prevent Bad Builds $nocolor"
        rm -r -f  zfs
        echo -e " $green Done $nocolor "

#Remove Old Directories
        echo -e  "$yellow Removing Previous Firmware Source Folder To Prevent Bad Builds $nocolor"
        rm -r -f linux-firmware
        echo -e " $green Done $nocolor "

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
	read -p " $red Do You Want To Install The Latest Linux Firmware From Kernel.org $nocolor (y/n)  " FIRM
	if [ "$FIRM" = "y" ]
        	then
#See If LZ4 File Already Exsists
		if [ -f linux-firmware.tar.lz4 ]
			then
			echo -e "$red Lz4 Has Already Been Created For Firmware $nocolor "
			else
			echo -e " $yellow Downloading The Latest Firmware From Kernel.org $nocolor "
			git clone https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git
			echo -e " $yellow Creating lz4 Archive $nocolor "
			tar --use-compress-program=lz4 -cf linux-firmware.tar.lz4 linux-firmware
			echo -e " $yellow Delete Linux-Firmware Folder $nocolor "
			rm -R linux-firmware/
			echo -e " $green DONE! $nocolor "
		fi

#Either Way Do This Do
			echo -e " $yellow Extracting LZ4 $nocolor "
			lz4 -c linux-firmware.tar.lz4 | tar x
       			echo -e " $green DONE! $nocolor "
		else
        	echo "Continuing Without Firmware"
	fi


#See If LZ4 Is Prevent For Kernel Files
	if [ -f 5.18.1-xanmod1.tar.lz4 ]
		then
		echo -e "$red Lz4 Has Already Been Created For Kernel Files, Continuing $nocolor "
		else
		echo -e " $yellow Downloading Xanmod Kernel 18.1 $nocolor "
		wget -q --show-progress https://github.com/xanmod/linux/archive/5.18.1-xanmod1.tar.gz
		echo -e " $green DONE! $nocolor "
		echo -e " $yellow Extracting Xanmod Kernel 18.1 $nocolor "
	        tar  xf 5.18.1-xanmod1.tar.gz
		echo -e " $green DONE! $nocolor "
		echo -e " $yellow Creating LZ4 Achive For Fast Reuse $nocolor "
		tar --use-compress-program=lz4 -cf 5.18.1-xanmod1.tar.lz4 linux-5.18.1-xanmod1
		echo -e " $green DONE! $nocolor "
		echo -e " $yellow Delete Old Xanmod Kernel Folder $nocolor "
		rm -R linux-5.18.1-xanmod1/
		echo -e " $green DONE! $nocolor "
	fi



#See If LZ4 Is Prevent For Kernel Files
        if [ -f zfs.tar.lz4 ]
                then
                echo -e "$red Lz4 Has Already Been Created For ZFS Files, Continuing $nocolor "
                else
                echo -e " $yellow Downloading ZFS Repo $nocolor "
                git clone https://github.com/openzfs/zfs.git
                echo -e " $green DONE! $nocolor "
                echo -e " $yellow Creating LZ4 Achive For Fast Reuse $nocolor "
                tar --use-compress-program=lz4 -cf zfs.tar.lz4 zfs
                echo -e "Extract LZ4 Of Kernel Files"
                echo -e " $yellow Delete Old ZFS Folder $nocolor "
                rm -R zfs/
                echo -e " $green DONE! $nocolor "
        fi

#Extract LZ4 Of Kernel Files
        echo -e " $red Extracting Xanmodkernel $nocolor "
        lz4 -c 5.18.1-xanmod1.tar.lz4  | tar x

#Extract LZ4 Of Kernel Files
        echo -e " $red Extracting zfs LZ4 Archive $nocolor "
        lz4 -c zfs.tar.lz4  | tar x

#USE LAST MADE CONFIG
	echo -e " $yellow Using Last Modified Kernel $nocolor $nocolor "
	cp -a kernel.config linux-5.18.1-xanmod1/.config
	echo -e "$green DONE! $nocolor "

#Moving To Kernel Build Directory
        echo -e "$yellow Moving To Kernel Directory $nocolor "
        cd linux-5.18.1-xanmod1/

#Run Make Config W
	echo  -e "$yellow Running Make Menuconfig With LLVM For LTO Support $nocolor $nocolor "
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

#Running Auto Config For ZFS
	echo -e " $yellow Running Autogen $nocolor "
	./autogen.sh
	echo -e "$green DONE! $nocolor "

#Running Configure
	echo -e " $yellow Running ZFS Configuration $nocolor "
	./configure --with-linux=/usr/src/linux-5.18.1-xanmod1/ --with-linux-obj=/usr/src/linux-5.18.1-xanmod1 --enable-sysvinit --enable-linux-builtin
	echo -e " $yellow Running ZFS Make $nocolor "
	$make
	echo -e "$green DONE! $nocolor "
	echo -e " $yellow Running ZFS Make Install $nocolor "
	$make install
	echo -e "$green DONE! $nocolor "
	echo -e " $yellow Installing ZFS Built In Module To Kernel Source Directory $nocolor "
	./copy-builtin ../linux-5.18.1-xanmod1/
	echo -e "$green DONE! $nocolor "

#Build New Kernel
	echo -e " $yellow Moving To Kernel Source Directory $nocolor "
	cd ../linux-5.18.1-xanmod1/
	#echo -e " $yellow Running Make $nocolor "
	$make
	echo -e " $yellow Preparing Modules $nocolor "
	$make modules_prepare
	echo -e " $yellow Building Modules $nocolor "
	$make modules
	echo -e " $yellow Installing Modules $nocolor "
        $make modules_install
	echo -e " $yellow Running Make Install $nocolor "
	$make install
	echo -n -e "$green DONE! $nocolor "

#Make Kernel Deb Packages


#Moving To ZFS Directory
        echo -e " $yellow Moving To ZFS Directory $nocolor "
        cd /usr/src/zfs
	echo -n -e "$green DONE! $nocolor "

	echo -e " $yellow Making ZFS Deb Packages Based On Sysvinit $nocolor "
	$make deb-utils deb-dkms
	echo -n -e "$green DONE! $nocolor "

#Now Install Compiled ZFS Packages
	echo -e " $yellow Installing ZFS .Deb Packages"
 	for file in *.deb; do sudo gdebi -q --non-interactive $file; done
	echo -n -e "$green DONE! $nocolor "

#Rebuild DKMS Modules
	dkms autoinstall -k  5.18.1-xanmod1-Rolling4  --kernelsourcedir=/usr/src/linux-5.18.1-xanmod1/

#Installation Completed
	echo -e " $green Finished Installing $nocolor $red Bleeding Edge $nocolor $green Xanmod Kernel With $nocolor $red Bleeding Edge $nocolor $green Built In ZFS $nocolor"
