#!/bin/bash
#set -x
black="\033[0;30m"
red="\033[0;31m"
green="\033[0;32m"
orange="\033[0;33m"
yellow="\033[0;33m"
blue="\033[0;34m"
purple="\033[0;35m"
cyan="\033[0;36m"
white="\033[0;37m"
nocolor="\033[0m"
script=$(readlink -f "$0")
basedir=$(dirname "$script")
datemonitor=$(date +%Y-%m-%d__%I-%M-%S-%p)

#
IFS=$'\n'
runkern=$(uname -r)
userdatadir=$(readlink -e "$basedir/configs/userdata/" 2>/dev/null)
root=$(df -t zfs / 2>/dev/null | awk '{print $1}' | tail -n1)
bootfs=$(zpool list "$root" -H -o bootfs 2>/dev/null)
bootmount=$(df /boot 2>/dev/null | awk '/boot/{print $6}')
bootdrive=$(df /boot 2>/dev/null | awk '/boot/{print $1}')
totalmem=$(awk '/MemTotal/{print $2/1024"gb"}' /proc/meminfo)
hugepagestotal=$(awk '( $1 == "HugePages_Total:" ) { print $2 }' /proc/meminfo)
hugepage=$(awk '( $1 == "Hugepagesize:" ) { print $2/1024^2 }' /proc/meminfo)
hugepageamount=$(awk '( $1 == "Hugetlb:" ) { print $2/1024^2 }' /proc/meminfo)
pcipassthroughids=$(rg -i -o -e "pci-stub.ids=.*|vfio-pci.ids=.*" </proc/cmdline 2>/dev/null | awk '{print $1}' | sed 's&pci-stub.ids=&&' | sed 's&vfio-pci.ids=&&')
distro=$(grep -i pretty_name </etc/os-release | sed 's*pretty_name=**' | sed 's&"&&g')
autoarcminb=$(awk '/MemTotal/{print $2*1024*.50}' /proc/meminfo)
autoarcmaxb=$(awk '/MemTotal/{print $2*1024*.75}' /proc/meminfo)
autoarcmin=$(awk '/MemTotal/{print $2/1024/1024*.50}' /proc/meminfo)
autoarcmax=$(awk '/MemTotal/{print $2/1024/1024*.75}' /proc/meminfo)
cpumodel=$(lscpu | grep -i "model name" | head -n1 | awk '{$1="";$2="";print $0}')
numas=$(lscpu | grep -i "numa" | tail +2)
nohz_full=$(grep -v "#" <"$basedir"/configs/cmdline_default.conf | grep -o "nohz_full=.*" | sed 's@nohz_full=@@g')
irqaffinity=$(grep -v "#" <"$basedir"/configs/cmdline_default.conf | grep -o "irqaffinity=.*" | sed 's@irqaffinity=@@g')
rcu_nocbs=$(grep -v "#" <"$basedir"/configs/cmdline_default.conf | grep -o "rcu_nocbs=.*" | sed 's@rcu_nocbs=@@g')
rcupriority=$(grep -v "#" <"$basedir"/configs/cmdline_default.conf | grep -o "rcutree.kthread_prio=.*" | sed 's@rcutree.kthread_prio=@@g')
initfiles=(gpg gpgv perl ssh-keygen wpa_supplicant wget parted wipefs rc-status dpkg arch-chroot automount debootstrap rc-service rc-update ifup ifquery ifdown apt apt-get apt-cache apt-mark dhclient ssh sshfs zfs zdb zed zfs_ids_to_path zhack zinject zpool zstream ztest ldd openrc bash locale-gen locale agetty gpm tmux grc figlet fish nano udevadm udevd bat)

#
mkdir -p "/bootback"
mkdir -p "$basedir/configs/userdata"
mkdir -p "$basedir/configs/userdata/autosaves"
mkdir -p "$basedir/linux/include"
mkdir -p "$basedir/linux/include/config"
touch "$basedir/linux/include/config/kernel.release"
mkdir -p "$basedir/linux"
mkdir -p "$basedir/configs/auto_backup_configs"
mkdir -p "$basedir/configs/userdata"
mkdir -p "$basedir/initrd/usr"
mkdir -p "$basedir/initrd/usr/bin"
mkdir -p "$basedir/initrd/sys"
mkdir -p "$basedir/initrd/proc"
mkdir -p "$basedir/initrd/dev"
mkdir -p "$basedir/initrd/dev/pts"
mkdir -p "$basedir/initrd/dev/shm"
#sed 's&xanmod1&'"$sethostname"'-zfsulti.efi&gi' <"$basedir"/linux/include/config/kernel.release
cp --archive /dev/{null,console,mouse,tty,tty1,tty2,tty3,tty4,tty5,tty6,tty7,tty8,tty9,sda1} "$basedir/initrd/dev/" 2>/dev/null

#
#makerust() {
#make CC=clang -j36
#}
#
#make() {
#make -j36
#}

#
kverorg=$(cat "$basedir/linux/include/config/kernel.release" 2>/dev/null)

#
kver=$(sed 's&xanmod1&'"$sethostname"'-zfsulti.efi&gI' <"$basedir"/linux/include/config/kernel.release)

#
xanmodstdv=$(curl -s "https://api.github.com/repos/xanmod/linux/releases?per_page=100" | grep tarball_url | cut -d '"' -f 4 | sort --version-sort | awk -F "/" '{print $8}' | rg -v "rt" | tail -n1)
xanmodstddl=$(curl -s "https://api.github.com/repos/xanmod/linux/releases?per_page=100" | grep tarball_url | cut -d '"' -f 4 | sort --version-sort | rg -v "rt" | tail -n1)
xanmodrtv=$(curl -s "https://api.github.com/repos/xanmod/linux/releases?per_page=100" | grep tarball_url | cut -d '"' -f 4 | sort --version-sort | awk -F "/" '{print $8}' | rg "rt" | tail -n1)
xanmodrtdl=$(curl -s "https://api.github.com/repos/xanmod/linux/releases?per_page=100" | grep tarball_url | cut -d '"' -f 4 | sort --version-sort | rg "rt" | tail -n1)

#
function checkxanmodversion() {
	if [ "$1" = "$(cat "$basedir"/linux/include/config/kernel.release 2>/dev/null)" ]; then
		echo -e "kernel versions matched, skipping download"
	else
		cd "$basedir" || return
		echo -e "kernel versions missmatched"
		echo -e "removing old kernel configuration files - please be patient"
		rm -rfv "$basedir/linux"
		rm -rfv "$basedir/*tar.gz*"
		mkdir -p "$basedir/linux"
		echo -e "downloading - kernel"
		wget -c "$2" -O - | tar -xzv --strip-components=1 -C linux
		export kver
	fi
}

#detect if zfs cron is installed
iszfscronjobsinstalled() {
	if [ -f /etc/cron.hourly/zfsulti ] && [ -f /etc/cron.daily/zfsulti ] && [ -f /etc/cron.monthly/zfsulti ] && [ -f /etc/cron.weekly/zfsulti ]; then
		echo "yes"
	else
		echo "no"
	fi
}

#detect if hdsentinel is installed
ishdsentinelinstalled() {
	if [ -f /bin/hdsentinel ]; then
		echo "yes"
	else
		echo "no"
	fi
}

#
zfsinstalldeps() {
	zfsultideps="rustc rust-all autogen bat python3-full batcat ripgrep libssl-dev libblkid-dev uuid-dev fish tmux grc libvirt-daemon-driver-storage-zfs alien dh-make dh-dist-zilla dh-acc dh-autoreconf intltool intltool-debian libtool gettext autoconf libelf-dev grub2-common grub-efi-amd64-bin libncurses-dev pkg-config rsync flex bison binutils build-essential git figlet ksh bc fio acl sysstat mdadm lsscsi parted attr dbench nfs-kernel-server samba rng-tools pax linux-perf selinux-utils quota build-essential autoconf automake libtool gawk alien fakeroot dkms libblkid-dev uuid-dev libudev-dev libssl-dev zlib1g-dev libaio-dev libattr1-dev libelf-dev python3 python3-dev python3-setuptools python3-cffi libffi-dev python3-packaging git libcurl4-openssl-dev"
	echo -e "$zfsultideps" | xargs -n5 | column -t | bat -l bash --style=plain
	read -r -p "$(echo -e "would you like to install the required/following dependencies? \n $green Y/y$nocolor=YES \n $red ENTER$nocolor=NO")" zfsultidepsinstall
	if [ "$zfsultidepsinstall" = Y ] || [ "$zfsultidepsinstall" = y ]; then
		echo -e "installing dependencies - starting"
		apt-get update
		echo -e "$zfsultideps" | xargs -n1 apt-get -y install
		ln -sf /usr/bin/batcat /usr/bin/bat
	fi
	if [ "$zfsultidepsinstall" = n ] || [ "$zfsultidepsinstall" = N ]; then
		echo -e "not installing dependencies - exiting"
	fi
}

#
function pooltunerz() {
	"$1" "$2" recordsize="$3" dedup="$4" logbias=throughput copies=1 primarycache=all secondarycache=all volmode=full relatime=on compression="$5" acltype=nfsv4 xattr=sa aclinherit=passthrough aclmode=passthrough dnodesize=16k sharenfs=off nbmand=off sharesmb=off checksum=on overlay=on reservation=200g refreservation=100g redundant_metadata=all rootcontext=none sync=standard atime=on "$6"
	"$1" "$2" autoexpand=on expand=on failmode=continue cachefile=none "$6"
}

#
kerneloptionscheck() {
	echo -e "confirming module loading is disabled for $sethostname"
	sed -i 's&.*CONFIG_MODULES=.*&CONFIG_MODULES=# is not set&gI' "$basedir/linux/.config"
	echo -e "confirming zfs module is buildin for $sethostname"
	sed -i 's&.*CONFIG_ZFS.*&CONFIG_ZFS=y&gI' "$basedir/linux/.config"
	if [[ $(hostname) == "$sethostname" ]]; then
		echo -e "local:$green$(hostname) $nocolor $yellow pickedhostname:$nocolor $green $sethostname $nocolor"
		echo -e "localhostname:$(hostname) matches picked hostname:$sethostname skipping generic cpu v1 set for compiler"
	else
		echo -e "localhost does not match picked hostname, confirming generic cpu v1 set for compiler"
		sed -i 's&CONFIG_MK8=.*&# CONFIG_MK8 is not set&gI' "$basedir/linux/.config"
		sed -i 's&CONFIG_MK8SSE3=.*&# CONFIG_MK8SSE3 is not set&gI' "$basedir/linux/.config"
		sed -i 's&CONFIG_MK10=.*&# CONFIG_MK10 is not set&gI' "$basedir/linux/.config"
		sed -i 's&CONFIG_MBARCELONA=.*&# CONFIG_MBARCELONA is not set&gI' "$basedir/linux/.config"
		sed -i 's&CONFIG_MBOBCAT=.*&# CONFIG_MBOBCAT is not set&gI' "$basedir/linux/.config"
		sed -i 's&CONFIG_MJAGUAR=.*&# CONFIG_MJAGUAR is not set&gI' "$basedir/linux/.config"
		sed -i 's&CONFIG_MBULLDOZER=.*&# CONFIG_MBULLDOZER is not set&gI' "$basedir/linux/.config"
		sed -i 's&CONFIG_MPILEDRIVER=.*&# CONFIG_MPILEDRIVER is not set&gI' "$basedir/linux/.config"
		sed -i 's&CONFIG_MSTEAMROLLER=.*&# CONFIG_MSTEAMROLLER is not set&gI' "$basedir/linux/.config"
		sed -i 's&CONFIG_MEXCAVATOR=.*&# CONFIG_MEXCAVATOR is not set&gI' "$basedir/linux/.config"
		sed -i 's&CONFIG_MZEN=.*&# CONFIG_MZEN is not set&gI' "$basedir/linux/.config"
		sed -i 's&CONFIG_MZEN2=.*&# CONFIG_MZEN2 is not set&gI' "$basedir/linux/.config"
		sed -i 's&CONFIG_MPSC=.*&# CONFIG_MPSC is not set&gI' "$basedir/linux/.config"
		sed -i 's&CONFIG_MCORE2=.*&# CONFIG_MCORE2 is not set&gI' "$basedir/linux/.config"
		sed -i 's&CONFIG_MATOM=.*&# CONFIG_MATOM is not set&gI' "$basedir/linux/.config"
		sed -i 's&CONFIG_MNEHALEM=.*&# CONFIG_MNEHALEM is not set&gI' "$basedir/linux/.config"
		sed -i 's&CONFIG_MWESTMERE=.*&# CONFIG_MWESTMERE is not set&gI' "$basedir/linux/.config"
		sed -i 's&CONFIG_MSILVERMONT=.*&# CONFIG_MSILVERMONT is not set&gI' "$basedir/linux/.config"
		sed -i 's&CONFIG_MGOLDMONT=.*&# CONFIG_MGOLDMONT is not set&gI' "$basedir/linux/.config"
		sed -i 's&CONFIG_MGOLDMONTPLUS=.*&# CONFIG_MGOLDMONTPLUS is not set&gI' "$basedir/linux/.config"
		sed -i 's&CONFIG_MSANDYBRIDGE=.*&# CONFIG_MSANDYBRIDGE is not set&gI' "$basedir/linux/.config"
		sed -i 's&CONFIG_MIVYBRIDGE=.*&# CONFIG_MIVYBRIDGE is not set&gI' "$basedir/linux/.config"
		sed -i 's&CONFIG_MHASWELL=.*&# CONFIG_MHASWELL is not set&gI' "$basedir/linux/.config"
		sed -i 's&CONFIG_MBROADWELL=.*&# CONFIG_MBROADWELL is not set&gI' "$basedir/linux/.config"
		sed -i 's&CONFIG_MSKYLAKE=.*&# CONFIG_MSKYLAKE is not set&gI' "$basedir/linux/.config"
		sed -i 's&CONFIG_MSKYLAKEX=.*&# CONFIG_MSKYLAKEX is not set&gI' "$basedir/linux/.config"
		sed -i 's&CONFIG_MCANNONLAKE=.*&# CONFIG_MCANNONLAKE is not set&gI' "$basedir/linux/.config"
		sed -i 's&CONFIG_MICELAKE=.*&# CONFIG_MICELAKE is not set&gI' "$basedir/linux/.config"
		sed -i 's&CONFIG_MCASCADELAKE=.*&# CONFIG_MCASCADELAKE is not set&gI' "$basedir/linux/.config"
		sed -i 's&CONFIG_MCOOPERLAKE=.*&# CONFIG_MCOOPERLAKE is not set&gI' "$basedir/linux/.config"
		sed -i 's&CONFIG_MTIGERLAKE=.*&# CONFIG_MTIGERLAKE is not set&gI' "$basedir/linux/.config"
		sed -i 's&CONFIG_MSAPPHIRERAPIDS=.*&# CONFIG_MSAPPHIRERAPIDS is not set&gI' "$basedir/linux/.config"
		sed -i 's&CONFIG_MROCKETLAKE=.*&# CONFIG_MROCKETLAKE is not set&gI' "$basedir/linux/.config"
		sed -i 's&CONFIG_MALDERLAKE=.*&# CONFIG_MALDERLAKE is not set&gI' "$basedir/linux/.config"
		sed -i 's&CONFIG_GENERIC_CPU2=.*&# CONFIG_GENERIC_CPU2 is not set&gI' "$basedir/linux/.config"
		sed -i 's&CONFIG_GENERIC_CPU3=.*&# CONFIG_GENERIC_CPU3 is not set&gI' "$basedir/linux/.config"
		sed -i 's&CONFIG_GENERIC_CPU4=.*&# CONFIG_GENERIC_CPU4 is not set&gI' "$basedir/linux/.config"
		sed -i 's&CONFIG_MNATIVE_INTEL=.*&# CONFIG_MNATIVE_INTEL is not set&gI' "$basedir/linux/.config"
		sed -i 's&CONFIG_MNATIVE_AMD=.*&# CONFIG_MNATIVE_AMD is not set&gI' "$basedir/linux/.config"
		sed -i 's&CONFIG_GENERIC_CPU=.*&# CONFIG_GENERIC_CPU is not set&gI' "$basedir/linux/.config"
	fi
}

#
zfscronjobshourly() {
	cat <<'EOF'
#!/bin/bash
zfs snap -r rpool@$(date +\%Y-\%m-\%d__\%I-\%M-\%S-\%p__HOURLY)
echo -1 > /proc/sys/kernel/sched_rt_runtime_us
echo -1 > /proc/sys/kernel/sched_rt_period_us
2048 > /proc/sys/fs/mqueue/queues_max
12860060 > /proc/sys/fs/file-max
2000000 > /proc/sys/fs/fanotify/max_user_marks
2048 > /proc/sys/fs/fanotify/max_user_groups
65536 > /proc/sys/fs/fanotify/max_queued_events
1024 > /proc/sys/fs/inotify/max_user_instances
65536 > /proc/sys/fs/inotify/max_queued_events
524288  > /proc/sys/fs/inotify/max_user_watches
bash -c "ulimit -n 1028"
bash -c "ulimit -n 1028"
bash -c "ulimit -c unlimited"
bash -c "ulimit -d unlimited"
bash -c "ulimit -f unlimited"
bash -c "ulimit -l unlimited"
bash -c "ulimit -m unlimited"
bash -c "ulimit -s unlimited"
bash -c "ulimit -t unlimited"
bash -c "ulimit -v unlimited"
bash -c "ulimit -u unlimited"
EOF
}

#
zfscronjobsdaily() {
	cat <<'EOF'
#!/bin/bash
zfs snap -r rpool@$(date +\%Y-\%m-\%d__\%I-\%M-\%S-\%p__DAILY)
EOF
}

#
zfscronjobsweekly() {
	cat <<'EOF'
#!/bin/bash
zfs snap -r rpool@$(date +\%Y-\%m-\%d__\%I-\%M-\%S-\%p__DAILY)
zpool scrub rpool
EOF
}

#
zfscronjobsmonthly() {
	cat <<'EOF'
#!/bin/bash
zfs snap -r rpool@$(date +\%Y-\%m-\%d__\%I-\%M-\%S-\%p__MONTHLY)
EOF
}

#
setupsymlinksformoduleinfo() {
	echo -e "confirming modules directory exists (/lib/modules/$kverorg"
	mkdir -p "/lib/modules/$kverorg"
	echo -e "creating symlinks to kernel sources ($kverorg) for $sethostname - starting"
	ln -sf "$basedir"/linux "/lib/modules/$kverorg/build"
	ln -sf "$basedir"/linux "/lib/modules/$kverorg/kernel"
	echo -e "creating symlinks to kernel sources ($kverorg) for $sethostname - finished"
}

#
pooltuning() {
	if [ "$tunepoolsq" != N ] && [ "$tunepoolsq" != n ]; then
		echo -e "\n"
	else
		read -r -p "$(echo -e "press enter to continue to pool tuning $nocolor $red n=$nocolor do not tune pools")" tunepoolsq
		if
			[ "$tunepoolsq" = N ] || [ "$tunepoolsq" = n ]
		then
			echo -e "skipping pool tuning"
		else
			echo -e "warning: $nocolor $yellow make sure your drives are imported by /dev/disk/by-id this custom zfs tuned zfs kernel"
			echo -e "does not like the cache file and will delete it to prevent zombie pools and a host of other problems related to the cache file."
			echo -e "if your pools are not imported using /dev/disk/by-id removing the cache file could cause a label mix up"
			echo -e "note: pools are always imported by /dev/disk/by-id during boot so this will be changed for you at first boot :)"
		fi
		clear
		echo -e -n "$white your pools:$nocolor $red"
		zpool list -H -o name
		echo -e "$nocolor"
		echo -e "you can type all to tune all pools"
		read -r -p "$(echo -e "please enter the pool name you would like to tune:")" pool2tune
		echo -e "$green small block size benefits $nocolor
		$green 1. faster cli workgrep,awk,sed,etc... $nocolor
		$green 2. faster switching between small files iops $nocolor
		$green 3. better transfer rates of small files $nocolor
		$red small block size cons $nocolor
		$red 1. higher cpu workloads $nocolor
		$red 2. higher drive temps $nocolor
		$red 3. extremely slow performance on spinning rust $yellow unless special vdevs are set $nocolor $nocolor
		$red 4. possible i/o hang depending on zfs features, dedup, compression....... $nocolor
		$green large block size benefits $nocolor
		$green 1. higher compression ratios $nocolor
		$green 2. less cpu and drive stress $nocolor
		$green 3. lower cpu and drive temps $nocolor
		$green 4. faster transfer rates on larger files $nocolor
		$red large block size cons $nocolor
		$red 1. horrible cli performance (grep,awk,sed,etc...) $nocolor
		$red 2. i/o hangs from constant drive thrashing while working with small files $nocolor
		$red 3. possible i/o hang depending on zfs features, dedup, compression....... $nocolor
		$green a good block size on newer nvmes would be 8-32k set globally across all pools with a decent cpu $nocolor
		$green a lower block size can also be used with spinners as long as they have a special vdev and cache $nocolor
		$green newer nvmes can usually hit near max zfs transfer rates on small block sizes anyway $nocolor
		$purple blk size - recommended drive hardware $nocolor $yellow and or $nocolor $purple - recommened workload $nocolor
		$red 1k$nocolor - $red ultra high i/o nvmes or - cli only $nocolor
		$red 2k$nocolor - $red very high i/o nvmes or - cli only $nocolor
		$red 4k$nocolor - $red ultra and very high i/o nvmes - all $nocolor
		$red 8k$nocolor -  stardard nvmes - focused on small files
		$yellow 16k$nocolor - $green standard nvmes - all (default) $nocolor
		$yellow 32k$nocolor -  standard nvmes/ssds - all
		$yellow 64k$nocolor -  standard nvmes/ssds - all
		$yellow 128k$nocolor -  spinning rust $red no special vdev $nocolor - most files greater than 128k
		$green 256k$nocolor -  spinning rust $red no special vdev $nocolor - most files greater than 256k
		$green 512k$nocolor -  spinning rust $red no special vdev $nocolor - most files greater than 512k
		$green 1m$nocolor -  spinning rust $red no special vdev $nocolor - most files greater than 1m" | column -t --separator=-
		read -r -p "$(echo -e "please pick a block size for all pools")" blksize
		echo -e "blk size set to $blksize
		for dedup the only option available here is edonr,verify because of safety and speed but other options can be set manually
		please select a pooltune for your pools this is highly recommended
		option (1) dedup: off, compression: lz4"
		pooltunerz echo -e "$blksize" edonr,verify lz4 | xargs -n5 | column -t | bat -l bash --style=plain
		echo -e "option (2) dedup: off, compression: lz4 recommended for most users"
		pooltunerz echo -e "$blksize" off lz4 | xargs -n5 | column -t | bat -l bash --style=plain
		echo -e "option (3) dedup: off, compression: off"
		pooltunerz echo -e "$blksize" off off | xargs -n5 | column -t | bat -l bash --style=plain
		read -r -p "$(echo -e "please select options 1-3")" zfspooltune
		if [ "$zfspooltune" = 1 ]; then
			echo -e "tuning $pool2tune please be patient"
			pooltunerz zfs set "$blksize" edonr,verify lz4 "$pool2tune"
		fi
		if [ "$zfspooltune" = 2 ]; then
			echo -e "tuning $pool2tune please be patient"
			pooltunerz zfs set "$blksize" off lz4 "$pool2tune"
		fi
		if [ "$zfspooltune" = 3 ]; then
			echo -e "tuning $pool2tune please be patient"
			pooltunerz zfs set "$blksize" off off "$pool2tune"
		fi
		read -r -p "$(echo -e "$green y=$nocolor tune another pool $red n=$nocolor done tuning")" tuneanotherpool
		if [ "$tuneanotherpool" = Y ] || [ "$tuneanotherpool" = y ]; then
			pooltuning
		fi
	fi
}

#Get file location for files in initfiles list array and do a whereis. After whereis cp each file 1 by 1 to to initrd
copyfilestoinit() (
	for ((i = 0; i < ${#initfiles[@]}; i++)); do
		echo -e "${initfiles[i]}"
		file[i]=$(whereis -b "${initfiles[i]}" | awk '{print $2}' | xargs)
		echo -e "This is file ${file[i]}"
		libs[i]=$(ldd "${file[i]}" | sed 's&[^/]*&&' | awk '{print $1,$2=""}' | grep -v "ld-linux" | xargs)
		echo -e "This is file ${libs[i]}"
		cp -v --force --preserve --remove-destination "${file[i]}" -T "$basedir"/initrd"${file[i]}"
	done

	#Get libs and prepare for injection to initrd, create array based on libs line numbers
	IFS=$'\n' read -rd '' -a filesarray <<<"$(echo -e "${libs[*]}" | sort -u | xargs readlink -e | sort -u)"

	#Copy Required Library files to initrd
	for ((i = 0; i < ${#filesarray[@]}; i++)); do
		echo -e "$green Copying ${filesarray[i]} to initrd $nocolor THIS IS A TEST WITH IFS"
		libfile[i]=$(echo -e "${libs[*]}" | sort -u | xargs readlink -e | sort -u | sed -n "$i"p)
		echo -e "This is libfile ${libfile[i]}"
		cp -v --force --preserve --remove-destination "${libfile[i]}" -T "$basedir"/initrd"${libfile[i]}"
	done
	cp -v --force --preserve --remove-destination "/lib/x86_64-linux-gnu/ld-linux-x86-64.so.2" "$basedir/initrd/lib/x86_64-linux-gnu/"
	#create soft link with force, but according to current directory. Do not use basedir for this or it will failed when in init.
	ln -sf "initrd/lib/x86_64-linux-gnu/ld-linux-x86-64.so.2" "initrd/lib64/ld-linux-x86-64.so.2"
)

#
installhdsentinel() {
	if [ -f /bin/hdsentinel ] && [ -f "$basedir/extras/hdsentinel-019c-x64" ]; then
		echo -e "hdsentinel files found! skipping install"
	else
		rm -f -v "$basedir/extras/hdsentinel-019c-x64.*"
		rm -f -v "$basedir/extras/hdsentinel-019c-x64"
		echo -e "hdsentinel not located, installing now"
		cd "$basedir/extras" || return
		echo -e "downloading hdsentinel"
		wget https://www.hdsentinel.com/hdslin/hdsentinel-019c-x64.gz
		echo -e "extracting hdsentinel - in progress"
		gunzip hdsentinel-019c-x64.gz
		echo -e "extracting hdsentinel - finished"
		echo -e "installing to /bin - in progress"
		cp -a -f -v "$basedir/extras/hdsentinel-019c-x64" /bin/hdsentinel
		echo -e "installing to /bin - finished"
		chmod +x /bin/hdsentinel
		echo -e "hdsentinel installed to /bin/hdsentinel"
	fi
}

#update default configuration for root, pci passthrough ids, hugepages and arc settings based on system information
function applyautocalcs() {
	sed -i 's@zfs.zfs_arc_min=.*@zfs.zfs_arc_min='"$autoarcminb"'@' "$basedir/configs/cmdline_default.conf"
	sed -i 's@zfs.zfs_arc_max=.*@zfs.zfs_arc_max='"$autoarcmaxb"'@' "$basedir/configs/cmdline_default.conf"
	sed -i 's@.*root=.*@root=zfs:'"$bootfs"'@' "$basedir/configs/cmdline_default.conf"
	sed -i 's@default_hugepagesz=.*@default_hugepagesz='"$hugepage"''"g"'@' "$basedir/configs/cmdline_default.conf"
	sed -i 's@hugepages=.*@hugepages='"$hugepagestotal"'@' "$basedir/configs/cmdline_default.conf"
	sed -i 's@hugepagesz=.*@hugepagesz='"$hugepage"''"g"'@' "$basedir/configs/cmdline_default.conf"
	sed -i "s@pci-stub.ids=.*@pci-stub.ids=$pcipassthroughids@" "$basedir/configs/cmdline_default.conf"
}

#
function createautosave() {
	echo -e "creating autosave for $purple $sethostname $nocolor description:$yellow$1$nocolor time:$yellow$(date)$nocolor"
	cp -a -f "$sethostnamecmdlineconfig" "$basedir/configs/userdata/autosaves/cmdline.conf.$sethostname.$1.$datemonitor.save"
	cp -a -f "$sethostnamekernelconfig" "$basedir/configs/userdata/autosaves/kernel.config.$sethostname.$1.$datemonitor.save"
}

#
getzfsultisysteminfo() {
	cd "$basedir" || return
	figlet -t -c "ultimate zfs xanmod kernel builder by fixapc.net"
	echo -e "system info
	$green distro:$nocolor $distro
	$green script working directory:$nocolor $basedir
	$green running kernel:$nocolor $runkern
	$green hostname:$nocolor $(hostname)
	$green running zfs version $nocolor $(modinfo zfs | grep -e "version")
	$green host cpu:$nocolor $cpumodel
	$green numa node cpus:$nocolor $numas
	$green recommended nohz_full cpus:$nocolor $nohz_full
	$green recommended rcu_nocb cpus:$nocolor $rcu_nocbs
	$green recommended irqaffinity cpus:$nocolor $irqaffinity
	$green rcu kthread 0-99 priority:$nocolor $rcupriority
	$green total memory: $nocolor $totalmem gb
	$green single huge-page size:$nocolor $hugepage gb
	$green num of allocated hugepages:$nocolor $hugepageamount gb
	$green auto calculated arc min(tram-hugepagesx.50):$nocolor $autoarcmin gb
	$green auto calculated arc max(tram-hugepagesx.75):$nocolor $autoarcmax gb
	$green current os running root pool:$nocolor$root
	$green current os running root pool bootfs:$nocolor$bootfs
	$green current boot drive:$nocolor$bootdrive
	$green current boot drive mount:$nocolor$bootmount
	$green zfs ultimate cron jobs installed?:$nocolor $(iszfscronjobsinstalled)
	$green zfs ultimate stats installed?:$nocolor
	$green hdsentinel installed?:$nocolor $(ishdsentinelinstalled)
	$green zfs ultimate user data directory:$nocolor $userdatadir
	$green current pool tune profiles:$nocolor $tuneprofiles"
	read -r -p "$(echo -e "Press Enter To Start The Installation \n $green ENTER$nocolor=YES \n $red N/n$nocolor=NO")" startinstall
	if [ "$startinstall" = n ] || [ "$startinstall" = N ]; then
		exit
	fi
}

#start cronjob installations
installzfsulticrons() {
	echo -e "would you like to install the zfs ultimate cronjobs?"
	read -r -p "$(echo -e "$green" Y= yes cronjobs "$nocolor" "$red" V= viewcron jobs "$nocolor" "$red" N= no not now "$nocolor")" installcrons
	if [ "$installcrons" = V ] || [ "$installcrons" = v ]; then
		echo -e "hourly crons"
		zfscronjobshourly | bat -l bash --style=plain
		echo -e "daily crons"
		zfscronjobsdaily | bat -l bash --style=plain
		echo -e "monthly crons"
		zfscronjobsmonthly | bat -l bash --style=plain
		echo -e "weekly crons"
		zfscronjobsweekly | bat -l bash --style=plain
	fi
	if [ "$installcrons" = Y ] || [ "$installcrons" = y ]; then
		echo -e "installing cron jobs to /etc/cron.hourly"
		zfscronjobshourly >/etc/cron.hourly/zfsulti
		chmod +x /etc/cron.hourly/zfsulti
		echo -e "installing cron jobs to /etc/cron.daily"
		zfscronjobsdaily >/etc/cron.daily/zfsulti
		chmod +x /etc/cron.daily/zfsulti
		echo -e "installing cron jobs to /etc/cron.weekly"
		zfscronjobsmonthly >/etc/cron.weekly/zfsulti
		chmod +x /etc/cron.weekly/zfsulti
		echo -e "installing cron jobs to /etc/cron.monthly"
		zfscronjobsweekly >/etc/cron.monthly/zfsulti
		chmod +x /etc/cron.monthly/zfsulti
		echo -e "finished installing crons"
	else
		echo -e "not installing crons"
	fi
}

#stat htop installation
starthtopinstall() {
	echo -e "would you like to install the custom htop layout with arc, this will overwrite current htop theme"
	read -r -p "$(echo -e "$green" Y= yes install custom htop layout "$nocolor" "$red" N= no not now "$nocolor")" htop
	if [ "$htop" = Y ] || [ "$htop" = y ]; then
		getent passwd | grep /bin/bash | cut -d: -f6 | sort -u | xargs -I {} cp -a "$basedir"/extras/htoprc -t {}/.config/htop/
	else
		echo -e "not installing"
	fi
}

#
loadhostnameprofile() {
	sort -u "$basedir/configs/userdata/savedvariables.txt" >/tmp/savedvariables.txt && mv /tmp/savedvariables.txt "$basedir/configs/userdata/savedvariables.txt"
	lastconfigurationlist=$(sort -u "$basedir/configs/userdata/savedvariables.txt")
	if [ -f "$basedir/configs/userdata/cmdline.conf.$(hostname).save" ] && [ -f "$basedir/configs/userdata/kernel.config.$(hostname).save" ]; then
		echo -e "config files found for $(hostname) skipping first run"
	else
		echo -e config files not fund for "$(hostname)" generating defaults
		echo -e cmdline.conf."$(hostname)".save >>"$basedir/configs/userdata/savedvariables.txt"
		echo -e kernel.config."$(hostname)".save >>"$basedir/configs/userdata/savedvariables.txt"
		cp -f "$basedir/configs/cmdline_default.conf" "$basedir/configs/userdata/cmdline.conf.$(hostname).save"
		cp -f "$basedir/configs/kernel_default.config" "$basedir/configs/userdata/kernel.config.$(hostname).save"
		cp -f "$basedir/configs/cmdline_default.conf" "$basedir/configs/userdata/cmdline.conf.defaults.save"
		cp -f "$basedir/configs/kernel_default.config" "$basedir/configs/userdata/kernel.config.defaults.save"
	fi

	#read choices in array bash set variable based on selection
	echo -e "$lastconfigurationlist"
	read -r -p "pick from a list of previous saves:" pickedconfig
	sethostname=$pickedconfig
	echo -e "$sethostname" >>"$basedir/configs/userdata/savedvariables.txt"
	echo
	echo -e "choosen hostname/savename: $green $sethostname"
	read -r -p "$(echo -e "would you like to save this using the current hostname? \n $red N/n=$nocolor create a new hostname \n $green ENTER=$nocolor Use the samename ")" newnameyesno
	if [ "$newnameyesno" = N ] || [ "$newnameyesno" = n ]; then
		read -r -p "what hostname would you like to set for the configuration:" readnewhostname
		cp -a -r -f -v "$basedir/configs/userdata/cmdline.conf.$sethostname.save" "$basedir/configs/userdata/cmdline.conf.$readnewhostname.save"
		cp -a -r -f -v "$basedir/configs/userdata/kernel.config.$sethostname.save" "$basedir/configs/userdata/kernel.config.$readnewhostname.save"
		sethostname=$readnewhostname
		echo -e "$sethostname" >>"$basedir/configs/userdata/savedvariables.txt"
		echo -e "choosen hostname/savename: $green $sethostname"
		createautosave after-choosing-different-savename
	fi
	sethostnamecmdlineconfig="$basedir/configs/userdata/cmdline.conf.$pickedconfig.save"
	sethostnamekernelconfig="$basedir/configs/userdata/kernel.config.$pickedconfig.save"
	echo -e "current kernel parameters based on your selection"
	grep -v "#" <"$sethostnamecmdlineconfig" | sort -u | xargs -n1 | bat -l bash --style=full
	createautosave before-nanoedit-kernelparams
	echo -e "you must save kernel parameters with $red cntl+s $nocolor in nano before exiting"
	echo -e "would you like to edit the kernel parameters with nano"
	read -r -p "$(echo -e "$green Y/y=$nocolor yes load nano and edit parameters $red N/n=$nocolor no do not edit parameters")" kerncmds
	if [ "$kerncmds" = Y ] || [ "$kerncmds" = y ]; then
		nano "$sethostnamecmdlineconfig"
		createautosave after-save-nanoedit-kernelparams
	else
		echo -e "not editing parameters"
		createautosave after-deny-nanoedit-kernelparams
	fi
	kernelcmds=$(grep -v "#" <"$sethostnamecmdlineconfig" | xargs)
	sed -i 's&CONFIG_CMDLINE=.*&CONFIG_CMDLINE="'"$kernelcmds"'"&' "$sethostnamekernelconfig"
}

#
firmwareinstall() {
	createautosave before-firmware-question
	echo -e " $yellow do you want to install the latest firmware from kernel.org"
	read -r -p "$(echo -e "$green y=yes install firmware $nocolor $yellow v= $nocolor view full change log $nocolor $red n= no not now $nocolor")" firm
	if [ "$firm" = Y ] || [ "$firm" = y ]; then
		if [ -d "$basedir/linux-firmware" ]; then
			echo -e "firmware folder present - starting update"
			cd "$basedir/linux-firmware" || return
			git fetch --prune
			git pull --all
			echo -e "firmware folder present - finished"
			createautosave after-firmware-update
		else
			createautosave before-first-firmware-download
			echo -e "downloading the latest firmware from kernel.org - starting"
			cd "$basedir" || return
			git clone https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git
			echo -e "downloading the latest firmware from kernel.org - finished"
			createautosave after-first-firmware-download
		fi
		echo -e "installing the latest firmware - starting"
		cd "$basedir/linux-firmware" || return
		make -j36
		make install -j36
		echo -e "installing the latest firmware - finished"
	else
		echo -e "skipping firmware update"
	fi
}

#
selectkernel() {
	echo -e "would you like to install the standard or realtime kernel
		latest rt version:$xanmodrtv
		latest standard version:$xanmodstdv"
	read -r -p "$(echo -e "$red R$nocolor=rt kernel $yellow S$nocolor= standard kernel")" rtorrolling
	if [[ "$rtorrolling" == "r" ]] || [[ "$rtorrolling" == "R" ]]; then
		checkxanmodversion "$xanmodrtv" "$xanmodrtdl"
	else
		checkxanmodversion "$xanmodstdv" "$xanmodstddl"
	fi
}

#
saveuserconfigtokernelbuilder() {
	echo -e "applying kernel configuration - starting"
	cp -a -f "$sethostnamekernelconfig" "$basedir/linux/.config"
	echo -e "applying kernel configuration - finished"
}

#
zfsdownload() {
	#check for presence of zfs folder
	if [[ -f "$basedir/zfs/Makefile.am" ]]; then
		echo -e "zfs folder present, we will update instead"
		cd "$basedir/zfs" || return
		git fetch --prune
		git pull --all
		echo -e "done!"
	else
		echo -e "downloading zfs repo - starting"
		cd "$basedir" || return
		git clone https://github.com/openzfs/zfs.git
		echo -e "downloading zfs repo - finished"
	fi
}

#
kernelconfig() {
	echo -e "running make clean, for kernel configuration pertaining to $sethostname - starting"
	echo -e "please feel free to edit the kernel configuration"
	cd "$basedir/linux" || return
	make clean -j36
	echo -e "running make clean, for kernel configuration pertaining to $sethostname - finished"
	echo -e "running make menuconfig, for kernel configuration pertaining to $sethostname - starting"
	make menuconfig MENUCONFIG_COLOR=blackbg -j36
	echo -e "running make menuconfig, for kernel configuration pertaining to $sethostname - finished"
	echo -e "running make prepare, for kernel configuration pertaining to $sethostname - starting"
	make prepare -j36
	echo -e "running make prepare, for kernel configuration pertaining to $sethostname - finished"
}

#
saveconfiguredkernelchanges() {
	createautosave after-makemenu-config
	cp -a -f "$basedir/linux/.config" "$sethostnamekernelconfig"
}

#copymoduleinfotoinit() {
#	cp -a -r -f "$basedir"/linux/
#}

#
zfspkginstall() {
	echo -e "moving to zfs folder - starting"
	cd "$basedir/zfs" || return
	echo -e "moving to zfs folder - finished"
	echo -e "running make clean for zfs buildin module, pertaining to $sethostname - starting"
	make clean -j36
	echo -e "running make clean for zfs buildin module, pertaining to $sethostname - finished"
	echo -e "running make prepare for zfs buildin module, pertaining to $sethostname - starting"
	make prepare -j36
	echo -e "running make prepare for zfs buildin module, pertaining to $sethostname - finished"
	echo -e "confirming deb pkgs and rpmg are removed to ensure clean install $sethostname - starting"
	rm -r -f -v ./*.deb
	rm -r -f -v ./*.rpm
	echo -e "confirming deb pkgs and rpmg are removed to ensure clean install $sethostname - finished"
	echo -e "building zfs deb files for $sethostname - starting"
	make deb-utils -j36
	echo -e "building zfs deb files for $sethostname - finished"
	echo -e "installing zfs debs for $sethostname - starting"
	dpkg -i ./*.deb
	echo -e "installing zfs debs for $sethostname - finished"
}

#
zfsbuiltininstall() {
	echo -e "moving to zfs folder - starting"
	cd "$basedir/zfs" || return
	echo -e "moving to zfs folder - finished"
	echo -e "running autogen for zfs buildin module, pertaining to $sethostname - starting"
	./autogen.sh
	echo -e "running autogen for zfs buildin module, pertaining to $sethostname - finished"
	echo -e "running configure.ac for $sethostname - starting"
	./configure --with-linux="$basedir/linux" --with-linux-obj="$basedir/linux" --enable-linux-builtin
	echo -e "running configure.ac for $sethostname - finished"
	echo -e "copying builtin zfs module to kernel sources ($kver) for $sethostname - starting"
	./copy-builtin "$basedir/linux"
	echo -e "copying builtin zfs module to kernel sources ($kver) for $sethostname - finsihed"
}

#
compilekernel() {
	echo -e "moving to kernel folder - starting"
	cd "$basedir/linux" || return
	echo -e "moving to kernel folder - finished"
	echo -e "running make prepare for kernel ($kver / $kverorg) pertaining to $sethostname - starting"
	make prepare -j36
	echo -e "running make prepare for kernel ($kver / $kverorg) pertaining to $sethostname - finished"
	echo -e "running make for kernel ($kver / $kverorg) pertaining to $sethostname - starting"
	make -j36
	echo -e "running make for kernel ($kver / $kverorg) pertaining to $sethostname - finished"
	echo -e "running make headers for kernel ($kver / $kverorg) pertaining to $sethostname - starting"
	make headers -j36
	echo -e "running make headers for kernel ($kver / $kverorg) pertaining to $sethostname - finished"
	echo -e "running make headers_install for kernel ($kver / $kverorg) pertaining to $sethostname - starting"
	make headers_install -j36
	echo -e "running make headers_install for kernel ($kver / $kverorg) pertaining to $sethostname - finished"
	echo -e "running make scripts for kernel ($kver / $kverorg) pertaining to $sethostname - starting"
	make scripts -j36
	echo -e "running make scripts for kernel ($kver / $kverorg) pertaining to $sethostname - finished"
}

#
checkifbootmounted() {
	if [ "$bootmount" = /boot ]; then
		mkdir -p "$bootmount"/otherhosts
		echo -e "bootdrive mounted, continuing with kernel installation"
	else
		echo -e "boot drive not mounted, attempting to mount before final kernel install for $sethostname - starting"
		mount "$bootmount"
		echo -e "boot drive not mounted, attempting to mount before final kernel install for $sethostname - finished"
	fi
}

#
kerneltobootmatcheshost() {
	echo -e "savedhostname matches hostname, copying to $bootmount on $bootdrive for $sethostname - starting"
	cp -a -r -f -v "$basedir/linux/arch/x86/boot/bzImage" "/$bootmount/vmlinuz-$kver"
	cp -a -f -v -v "$basedir/linux/System.map" "/$bootmount/System.map-$kver"
	echo -e "savedhostname matches hostname, copying to $bootmount on $bootdrive for $sethostname - finished"
	echo -e "Creating kernel backup for $sethostname - starting"
	cp -a -r -f -v "$basedir/linux/arch/x86/boot/bzImage" "/bootback/vmlinuz-$kver"
	cp -a -f -v -v "$basedir/linux/System.map" "/bootback/System.map-$kver"
	echo -e "Creating kernel backup for $sethostname - finished"
}

#
kerneltobootmissmatch() {
	echo -e "savedhostname does not match hostname, copying to subdirectory in $bootmount on $bootdrive for $sethostname - starting"
	mkdir -p "$bootmount/otherhosts"
	cp -a -r -f -v "$basedir/linux/arch/x86/boot/bzImage" "$bootmount/otherhosts/vmlinuz-$kver"
	cp -a -f -v -v "$basedir/linux/System.map" "$bootmount/otherhosts/System.map-$kver"
	echo -e "savedhostname does not match hostname, copying to subdirectory in $bootmount on $bootdrive for $sethostname - finished"
	echo -e "Creating kernel backup for $sethostname - starting"
	cp -a -r -f -v "$basedir/linux/arch/x86/boot/bzImage" "/bootback/vmlinuz-$kver"
	cp -a -f -v -v "$basedir/linux/System.map" "/bootback/System.map-$kver"
	chattr +x "/bootback/vmlinuz-$kver"
	chattr +x "/bootback/System.map-$kver"
	echo -e "Creating kernel backup for $sethostname - finished"
}

#
updategrub() {
	echo -e "updating grub for $sethostname - starting"
	update-grub
	grub-set-default 0
	echo -e "updating grub for $sethostname - finished"
}

#
finishedinstall() {
	echo -e "finished installing zfs ultimate kernel builder for $sethostname
	kernel version $kver / $kverorg installed to $bootmount on $bootdrive for $sethostname
	zfs developer version $zfsv installed to $bootmount on $bootdrive for $sethostname"
	createautosave finished-installing-kernel
}

#
zfsinstalldeps
getzfsultisysteminfo
loadhostnameprofile
export sethostname
selectkernel
kver=$(sed 's&xanmod1&'"$sethostname"'-zfsulti.efi&gI' <"$basedir"/linux/include/config/kernel.release)
zfsdownload
saveuserconfigtokernelbuilder

#
if [[ $(hostname) == "$sethostname" ]]; then
	echo -e "hostname name matches savedhost name $sethostname - starting full install"
	installhdsentinel
	starthtopinstall
	installzfsulticrons
	pooltuning
	firmwareinstall
	saveuserconfigtokernelbuilder
	kernelconfig
	kver=$(sed 's&xanmod1&'"$sethostname"'-zfsulti.efi&gI' <"$basedir"/linux/include/config/kernel.release)
	kerneloptionscheck
	saveconfiguredkernelchanges
	zfsbuiltininstall
	zfsv=$(grep zfs_meta_version <"$basedir/zfs/zfs_config.h" 2>/dev/null | awk '{print $3}' | grep -v zfs_meta_version | sed 's&"&&g')
	zfspkginstall
	copyfilestoinit
	kerneloptionscheck
	compilekernel
	setupsymlinksformoduleinfo
	checkifbootmounted
	kerneltobootmatcheshost
else
	echo -e "hostname does not match savedhostname, starting kernel only install $sethostname"
	kernelconfig
	kerneloptionscheck
	saveconfiguredkernelchanges
	zfsbuiltininstall
	copyfilestoinit
	kerneloptionscheck
	compilekernel
	checkifbootmounted
	kerneltobootmissmatch
fi

updategrub
finishedinstall
