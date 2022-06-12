
# Ultimate ZFS Xanmod Kernel Builder

A brief description of what this project does and who it's for
- This script is for those of you who love ZFS and the Xanmod kernel
        and want to squeeze every drop of peformance out of your 
        system you can with the perfectly thoughout Performanced based configuration
        NOTE: I spent 6 months on that blue kernel screen while you where sleeping 
        with your girlfriend so trust me this is a really good kernel configuration from a script kiddy and can be easily proven by benchmarks
- Help Teach Linux Enthusiast The Benefits Of A Highly Customized Kernel
- Specifically Tuned For ZFS And Low Latency Based KVM Computing
- Keeping The RIGHT Modules Out Of User Space Interferance And Away From Page Faults By Building The Most Important Ones Into Kernel
- Automatically Downloads The Latest Developer Release Of Xanmod And ZFS, Than Configures It With A Tuned Configuration.
- The idea is to keep the kernel from interfering with any resouces by workings of its resource management.  
   
        REQUIREMENTS NOTES: While This Kernel Configuration Gives A Very Noticable Kick In Performance Along With Much Lower CPU Usage. 
        It does come at a cost. Because of the amount of built in modules and the disablement of page merging, compression and compaction. 
        memory usage will be higher. This was an easy trade off for the the lower latency and CPU usage.

- Pros: Super Super Fast Kernel Response
- Page Fault Protections By Using Built In Modules
- Further Increased Page Fault Protections By Stopping The Kernel From Moving Memory Around. 
- Increased Stability As The Modules That Are Built In Are Denied Many Access Paths From User Space.
- Ability To Play Games And Use Your KVM Guest While Stressing The Host At 100% Without Performance loss
        OR THE NEED FOR CPU ISOLATION, as long as you correctly follow on screen prompts. 

     
## Used By

This project is used by the following companies:

- Project110
- Dfwelectronics Recycling
- Fixapc
- Peaceful Rest Funeral Homes
- Artsplash Expressions
- Barry Reids Roofing

![Logo](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/th5xamgrr6se0x5ro4g6.png)


## Roadmap

- Assisted Zpool Creation

- Kexec Kernel Reload (Reload Kernel And Initrd Without Reboot)

- Arch Linux Support

- Gentoo Support

- Multiple Choice Preconfigurations Favoring Latency Or Memory Compression, Page Compression And Cgroups Resource Management

- Universal Configuration With All Build In Modules For The Most Common Hardware.

- Initramless EFI Stub Booting With Pool Import Support

- Readonly Backup Initramfs With Exported Symbols For Emergency Universal

- Possible ZFS Boot Menu Initigration

- Arch Memory Calculator That Implements Total Amount Of Hugepages Assigned By KVM To Prevent Overallocation And Memory Thrashing.

- Debian, Devuan Repositories

- Multi Choice Prompt For Configuring RCU Threads, KVM Based FIFO Threads And Standard Scheduler Threads Based On CPU Core Count.
        Note: This will get rid of the need to use ISOLATE CPUs for an ultra low latency based KVM experiance. 
## Optimizations

    Default Kernel Configuration - Intel
    - Based On Xanmod Kernel With a Highly Custom Tune Faving Performance, Stability And Compadibility.
    - ZFS Built In
    - DKMS Initramfs For Booting Only
    - Compiles To Hardware
    - All Resource Management Removed From Kernel, Including Cgroups. NOTE: You will be to configure cgroups with a rootless install to be able to continue using docker and other container applications.
    - Compression Turned Off For ZFS Arc Ram Based Memory Cache (Can Still Be Enabled Via CLI)
    - Persistent L2Arch Enabled By Default
    - Kernel Based Memory Compaction, Page Merging, Page Compression Removed From Kernel In Favor Of Latency And Preventing Pages Faults. 
    - Debugging, Statistics, Watchdog Timers, And Profiling Have Been Gutted
    - All File Systems Built In For Compadibility
    - Core TCP/IP IPv4/IP6 Network Based Modules Built Into Kernel For Increase Page Protections And Latency Improvements
    - All Common 10G+ Networking Networking Gear Built Into Kernel
    - OVMF Passthrough Mode Enabled By Default And Built Into Kernel
    - ALL PCI-Stub,KVM VFIO PCI Passthrough Functions Built Into Kernel Disregarding Any Modules That Create New Network Devices, These Will Still Be Autoloaded By Udev, DKMS and Kmod.
    - Kernel Compiles To 64B Memory Alignment
    - Preempted Kernel
    - Power Saving Features, Power Capping Drivers, And RF Kill Switches Removed From Kernel
    - Common Wireless AC, AX Network Card Drivers Built Into Kernel
    - Direct Memory Access Modules And RapidIO Built Into Kernel
    - Filesystem Caching For NFS Enabled And Built In By Default
    - All NFS Versions Baked Into Kernel Besides Ones With Know Stability Issues
    - PCI-E Bus Model Set To Performance And APM Disabled
    - Built In Crypt Target Support
    - 100% Kernel Stability At Realtime FIFO Priority By Properly Configuring RCU, Kernel And Interrupt Threads.
    - All Crypto Graphic And Library Functions Have Been Baked Into Kernel 
    - All Platform Drivers Having Anything To Do With Resource Management Or Power Limited Have Been Removed!
    - Enabled MSR Writing On By Default, Allows You To Send Send Specific MSR Hex And Binary Values
            To Specified Hardware Devices To Gain Low Level Control, this can be used to overclock locked
            CPUs to Their Max Multiple On All Cores And Remove Certain Power Capping Features. 
            NOTE: Inel would rather you not know that have developer PDFs containing the correct hex and binaries to acheive these feets. 
    - All Available Media Codecs, Encoders And Decoders Built Into Kernel For Increased Multimedia Processing.
    - TCP Congestion Removed NOTE: This has a pretty noticiable effect on latency but if you are running at max bandwidth alot
            id recommend turning it back in the kernel options
    - RCU Polling Enabled By Default
    - Fully Dynaticks Kernel Enabled By Default To Help Prevent RCU Stalls Under Heavy Load
    - RCU Boosting Set To 99, YOU MUST specify a few specific cores to handle your RCU Threads.
    - All Cgroups Resource Management Has Been Removed Besides CPU
    - Enabled Automatic Process Group Scheduling For Last Remaining Cgroup Controller (CPU). 
            (NOTE: This was one of the only items left enabled with Cgroups CPU Group Managmenet. 
            This is so that basic threads are kept about from your FIFO KVM threads and RCU Threads.
            This allows Stressing the HOST at 100% without having any impact on your Windows based KVM.
            Meaning play halo infinate while the host is stressed at 100% without losing Performance
            On Your Guest Machine And Without Needing To Isolate CPU Cores For Your Guest. Last time 
            i tested this Configuration the guest was only hitting around 10us latency on "Latency Mon" 
            while the kernel was stress at 100%. This better than average KVM latency WITHOUT getting
            rid of your cores You pretty much using Cgroups to keep normal tasks away from FIFO threads 
            and prevent FIFO threads from merging to eliminate the need for thread and CPU isolation at
            the cost of losing all but 1 of your Cgroups controllers. Your normal task move to cores without FIFO)



## Installation

Install my-project with npm

```bash
  npm install my-project
  cd my-project
```
    
## Acknowledgements

 - [Awesome Readme Templates](https://awesomeopensource.com/project/elangosundar/awesome-README-templates)
 - [Awesome README](https://github.com/matiassingers/awesome-readme)
 - [How to write a Good readme](https://bulldogjob.com/news/449-how-to-write-a-good-readme-for-your-github-project)


## API Reference

#### Get all items

```http
  GET /api/items
```

| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `api_key` | `string` | **Required**. Your API key |

#### Get item

```http
  GET /api/items/${id}
```

| Parameter | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `id`      | `string` | **Required**. Id of item to fetch |

#### add(num1, num2)

Takes two numbers and returns the sum.


## Appendix

Any additional information goes here


## Authors

- [@katherinepeterson](https://www.github.com/octokatherine)

