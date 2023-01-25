# Ultimate ZFS Xanmod Kernel Builder README.MD - PRE-RELEASE DRAFT

![image](https://user-images.githubusercontent.com/34402379/178125916-b1fcd64a-2084-4410-b767-10c0c3792611.png)
# CURRENTLY TESTING
## DO NOT INSTALL UNLESS YOU UNDERSTAND THE RISKS

# Choose between a highly gutted kernel and a fully-loaded one.
 The ZFS Ultimate Kernel only supports fully built in modules. The Kernel sits at about a size of the 90MBs with about every kernel driver and feature available besides many of the debugging and resource management options that take a told on performance.

# Description
This script is for those of you who love ZFS and the Xanmod kernel. If you want to squeeze every drop of performance out of your system you can,
with a low latency based tuned kernel. This Kernel is specifically tuned for ZFS with all common hardware modules built in.
It is recommend to keep module loading fully DISABLED to prevent page faults and unneeded user space to kernel space access.
This kernel and its child properties are all fully compiled and turned to be built in. ZFS is tuned for 16K blocks to provide a good balance between
grepping that metadata and transferring those large files. Many internal settings have been modified to ensure the best performance for HIGH I/O based SSDs / NVMEs. If you want a rock stable ZFS installation based on the developer branch of OPENZFS and Xanmod. This is the Kernel builder For you
 

# Ideology
- Prevent kernel from touch memory and or resources to prevent page faults and latency spice.
- Matched 16K blocks across dnode size, kernel page size, record size, cache block size to ensure data is written within its original boundaries for HIGH I/O operation.
- Use statically linked libraries when ever possible to prevent symbol mismatches or corrupt libraries that can lead to loss of pool.
- Keep things simple by only needing to compile the kernel and not having to worry about external libraries, symbols and other dependencies that if not done in correct order can lead to pool lose. 
- Removal of most bugging features to prevent unneeded I/O access.

# Friendly install guide
- Auto calculation of ARC min and max with your homepages
- Auto calculation of RCU threads and priority based on cores and current KVM based setup

# Key pointers
- Stripped symbols and CLANG LTO support for improving I/O performance further. (This is currently in progress)
- Built in only kernel unless more options are added.
- Tuned for 16K blocks across the board.
- During Install you will be asked some basic memory questions to help you use the ARC from ZFS the correct way.
- Planned static libs build into ZFS binaries as a fail safe to prevent symbol mismatches and pool corruption from library failure.
- An Extremely lightweight init designed to be used at the command line, a fish shell will be built into the initram. (Work in progress)
- KVM, Qemus, VFIO Based virtualization (Built in)
- Kernel management of resources have been axed for low latency operation.
- ZIO scheduler throttling has been disabled
- Block I/O control removed
- Page migration and most memory management features have been removed from the kernel besides memory compression. 
- Select a performance profile for the kernel upon installation.
- Removal of all QOS services from CPU, memory and networking functions to prevent latency spikes. 

# Built in kernel software support - Built In
- All NFS / SMB functions besides read ahead 4.2
- All file systems built in to provide good functionality across the board.
- Network block device support for importing pools across network
- Removal of most cgroups resource management.
- All IPs tables features built in for better network interoperate and latency. 

# Supported Hardware
- All common AC+ wireless cards (Built in)
- All common 1GB + NIC network cards support (Builtin)
- Infiniband support (Builtin)

# Installation Procedure
## Debian / Devuan

# First install the required dependencies with your apt based package manager
```bash
apt install python3-full ripgrep libssl-dev libblkid-dev uuid-dev fish tmux grc libvirt-daemon-driver-storage-zfs alien dh-make dh-dist-zilla dh-acc dh-autoreconf intltool intltool-debian libtool gettext autoconf libelf-dev grub2-common grub-efi-amd64-bin libncurses-dev pkg-config rsync flex bison binutils build-essential git figlet ksh bc fio acl sysstat mdadm lsscsi parted attr dbench nfs-kernel-server samba rng-tools pax linux-perf selinux-utils quota build-essential autoconf automake libtool gawk alien fakeroot dkms libblkid-dev uuid-dev libudev-dev libssl-dev zlib1g-dev libaio-dev libattr1-dev libelf-dev linux-headers-generic python3 python3-dev python3-setuptools python3-cffi libffi-dev python3-packaging git libcurl4-openssl-dev
```

#FUT

## Used By
This kernel is used by some of my friends, family and clients on their servers and personal rigs:
- [ITADINABOX](https://www.itadinabox.com/)
- [PROJECT110](https://www.project110.com/)
- [DFW ELECTRONICS RECYCLING](https://www.dfwelectronicsrecycling.com/)
- [FIXAPC](https://www.peacefulrestfuneralhome.com/)
- [PEACEFUL REST FUNERAL HOME](https://www.peacefulrestfuneralhome.com/)
- [ART SPLASH EXPRESSIONS](https://www.artsplashexpressions.com)
- [BARRY REIDS ROOFING](https://www.barryreidsroofing.com)
- [MDVINSON](https://www.mdvinson.com)
- [ITELEMENTS](https://www.itelements.store)



## Roadmap
- Convert ZFS Libraries over to rust for better memory stability.

- Use Gentoo to build static libs and deploy compiler optimizations

- Assisted Zpool Creation

- Kexec Kernel Reload (Reload Kernel And Initrd Without Reboot)

- Arch Linux Support

- Gentoo Support

- Multiple Choice Reconfigurations Favoring Latency Or Memory Compression, Page Compression And Cgroups Resource Management

- Universal Configuration With All Build In Modules For The Most Common Hardware.

- Initramless EFI Stub Booting With Pool Import Support

- Read-only Backup Initramfs With Exported Symbols For Emergency Universal

- Possible ZFS Boot Menu Integration

- Arch Memory Calculator That Implements Total Amount Of Hugepages Assigned By KVM To Prevent Over allocation And Memory Thrashing.

- Debian, Devuan Repositories

- Auto resuming of ZFS send with stock ZFS tokens. 

- Available Ram, HUGE pages and ZFS arc calculator. Will take some basic specs to set the ARC to a small enough size to prevent swapping.

- Multi Choice Prompt For Configuring RCU Threads, KVM Based FIFO Threads And Standard Scheduler Threads Based On CPU Core Count.
        Note: This will get rid of the need to use ISOLATE CPUs for an ultra low latency based KVM experiance. 
 

## Optimizations
    Default Kernel Configuration - Intel Gutted Or Fully Loaded
    - Based On Xanmod Kernel With a Highly Custom Tune favoring Performance, Stability And Compatibility.
    - ZFS Built In
    - DKMS Initramfs For Booting Only
    - Compiles To Hardware
    - All Resource Management Removed From Kernel, Including Cgroups. NOTE: You will be to configure Cgroups with a rootless install to be able to continue using docker and other container applications.
    - Compression Turned Off For ZFS Arc Ram Based Memory Cache (Can Still Be Enabled Via CLI)
    - Persistent L2Arch Enabled By Default
    - Kernel Based Memory Compaction, Page Merging, Page Compression Removed From Kernel In Favor Of Latency And Preventing Pages Faults. 
    - Debugging, Statistics, Watchdog Timers, And Profiling Have Been Gutted
    - All File Systems Built In For Compatibility
    - Core TCP/IP IPv4/IP6 Network Based Modules Built Into Kernel For Increase Page Protections And Latency Improvements
    - All Common 10G+ Networking Networking Gear Built Into Kernel
    - OVMF Pass-through Mode Enabled By Default And Built Into Kernel
    - ALL PCI-Stub,KVM VFIO PCI Pass-through Functions Built Into Kernel Disregarding Any Modules That Create New Network Devices, These Will Still Be Autoloaded By Udev, DKMS and Kmod.
    - Kernel Compiles To 64B Memory Alignment
    - Preempted Kernel
    - Power Saving Features, Power Capping Drivers, And RF Kill Switches Removed From Kernel
    - Common Wireless AC, AX Network Card Drivers Built Into Kernel
    - Direct Memory Access Modules And RapidIO Built Into Kernel
    - File system Caching For NFS Enabled And Built In By Default
    - All NFS Versions Baked Into Kernel Besides Ones With Know Stability Issues
    - PCI-E Bus Model Set To Performance And APM Disabled
    - Built In Crypt Target Support
    - 100% Kernel Stability At Real-time FIFO Priority By Properly Configuring RCU, Kernel And Interrupt Threads.
    - All Crypto Graphic Library Functions Have Been Baked Into Kernel 
    - All Platform Drivers Having Anything To Do With Resource Management Or Power Limited Have Been Removed!
    - All Built in media Codecs.
    - All Available Media Codecs, Encoders And Decoders Built Into Kernel For Increased Multimedia Processing.
    - TCP Congestion Removed NOTE: This has a pretty noticeable effect on latency but if you are running at max bandwidth a lot
            id recommend turning it back in the kernel options
    - RCU Polling Enabled By Default
    - Fully Dynaticks Kernel Enabled By Default To Help Prevent RCU Stalls Under Heavy Load
    - RCU Boosting Set To 99, YOU MUST specify a few specific cores to handle your RCU Threads.
    - All Cgroups Resource Management Has Been Removed Besides CPU
    - Enabled Automatic Process Group Scheduling For Last Remaining Cgroup Controller (CPU). 
            (NOTE: This was one of the only items left enabled with Cgroups CPU Group Management. 
            This is so that basic threads are kept about from your FIFO KVM threads and RCU Threads.
            This allows Stressing the HOST at 100% without having any impact on your Windows based KVM.
            Meaning play halo infinite while the host is stressed at 100% without losing Performance
            On Your Guest Machine And Without Needing To Isolate CPU Cores For Your Guest. Last time 
            i tested this Configuration the guest was only hitting around 10us latency on "Latency Mon" 
            while the kernel was stress at 100%. This better than average KVM latency WITHOUT getting
            rid of your cores You pretty much using Cgroups to keep normal tasks away from FIFO threads 
            and prevent FIFO threads from merging to eliminate the need for thread and CPU isolation at
            the cost of losing all but 1 of your Cgroups controllers. Your normal task move to cores without FIFO)

## The Gist Of It

#### Pros
```
1. Scheduler CPU management can be used in place of isolcpus and cpusets. (Hard to believe but its totally true)
2. Ultra low latency configuration
3. Rock solid while at 100% guest and host stress
4. Fewer page faults due to built in modules and the kernel not moving memory around as much from memory management features (big win for KVMs)
5. Built in IOMMU Pass-through mode by default
5. Destroy benchmarks.
```

#### Cons
```
1. Cgroups mostly gutted all but 1 item, aka no docker unless you want to take the time to do a rootless install that does not require cgroups
2. Increased memory consumption due to resource management being gutted from kernel in favor of a low latency real time based build. 
```
## Installation

Install 

```bash
  Comming Soon
```
## Acknowledgements

 - [Dont Just Install Without Reading](https://github.com/fixapc)
 
## Screenies
2 older gen nvme drives benchmarking while compiling and dedup on.
![image](https://user-images.githubusercontent.com/34402379/178126455-36303c06-51d6-45b5-bc54-1b9d944e0914.png)

Guest KVM latency while compiling, benchmarking NVME and running latency top.
![image](https://user-images.githubusercontent.com/34402379/178126466-4af50d44-7874-47b2-bb6a-982940a90560.png)

Example of some of the customizations that are offered during installation, like this HTOP layout conf file. 
![image](https://user-images.githubusercontent.com/34402379/178126503-7e226422-d035-4321-9d3a-9822627146e2.png)

## Authors
- [@fixapc](https://www.github.com/fixapc)

## Looking For Contributors 
- [Submit Your Code Enhancements](https://www.github.com/fixapc)

## Credit To The Obvious Projects For Giving Us Some Of The Best Software Tech Available.
- [XANMOD](https://www.github.com/xanmod)
- [OPENZFS](https://www.github.com/openzfs)

## Slogan
- ad auxilium et prosperature egentium