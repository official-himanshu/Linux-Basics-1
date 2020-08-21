# What replace BIOS and why?
ANS:-  Now computer makers replace BIOS with UEFI which stands for Unified Extensible Firmware Interface.
      UEFI is a mini-operating system that sits on top of a computer's hardware and firmware.
      Instead of being stored in firmware, as is the BIOS, the UEFI code is stored in the /EFI/ directory in non-volatile memory.
      Thus, UEFI can be in NAND flash memory on the motherboard or it can reside on a hard drive, or even on a network share.
      
ADVANTAGES OF UEFI:
1. The first thing you'll notice about UEFI systems is that they boot faster and you can have even larger primary drives. 
2. The BIOS is unable to boot from hard disks with more than 2.2TB (terabytes). That's a hard limit set in the Master Boot Record (MBR) that you can't fix.
   But UEFI even can boot from 3TB hardisk. So high end PC's has no choice but they have to move to UEFI.
3. UEFI uses the GUID (Globally Unique ID) Partition Table, both to replace the MBR and address partitions. With GUID, you'll be able to boot from hard disks as large as 9.4ZB (zetabytes).
4. Today, if a PC can't be booted, a technician has to be onsite to fix the PC. BIOS simply doesn't support networking, never mind basic, remote troubleshooting and maintenance tools. 
   With UEFI, an OEM can built in networking functionality and basic repair tools.
5. Secure boot systems, easier network booting, and instant-on access to all your hardware.

WHAT'S THE PROBLEM IN UEFI.
-> In addition, UEFI is just a framework. If an OEM wants to offer full support for all the possible hardware that might be available on a given motherboard and offer diagnostic tools, 
   it has to create them. That's not cheap. Apple, HP, and IBM have made the commitment, but other vendors have been biding their time.
# How does Secure Boot work in UEFI?
ANS:-Secure Boot works like a security gate. Code with valid credentials gets through the gate and executes. 
      However, Secure Boot blocks at the gate and rejects a code that has bad credentials, or no credential. Intel® Desktop Boards embed the default Secure Boot keys for Windows 8*.
   
# How will MBR knows which GRUB to load in dual boot?
ANS: First Possible Answer--
      
Grub will install itself to the master boot record of your drive. It's important to realize that the master boot record is the first sector of your partitioned drive, and not a partition itself. See http://en.wikipedia.org/wiki/Master_boot_record for more information

Given this information, basically Grub will overwrite the MBR information that Windows 7 installed, but it won't touch the "System Reserved Partition" that Windows 7 creates (unless you ask it to). The new MBR will simply tell your system to load GRUB, and then GRUB will ensure that the proper OS is loaded. This makes it easy for you to switch between operating systems.

Second Possible Answer--
When Windows installs itself, it puts a bootloader (NTLDR in NT through XP; winboot after that) in the master boot record that reads boot.ini to show you the boot list. Once you pick something from that list, the bootloader's job is done, and the appropriate kernel is started from an actual partition on your drive.

Grub does the same thing; the bootloader is only there to show the grub.conf/menu.lst list, and once you've picked something it transfers control to a regular partition. Thus grub will overwrite the NTLDR/winboot in the MBR, but not anything in a normal partition, and it knows how to transfer control to a Windows partition if you choose Windows from the boot list.

# If Grub.conf is deleted, how an it be restored again?
ANS:- So we can restored the grub file as follows:
      first type command----ls /dev/sd*
                             grub-install /dev/sda
                             
                             After that we need to configure this grub installation by using the command:
                             grub-mkconfig -o /boot/grub/grub.cfg
                             

# Why are there hidden files on linux?
ANS:- Hidden files, also called dot files on Unix operating systems, are files used in order to execute some scripts or to store configuration about some services on your host.
In Linux,there are Hidden files that allow you to configure and export environment variables onto our working path.
https://devconnected.com/how-to-show-hidden-files-on-linux/#:~:text=Hidden%20files%2C%20also%20called%20dot,stores%20user%20initialization%20scripts%20or%20.

# Release cycle for Ubuntu.
ANS:- Version numbers are YY.MM
Releases of Ubuntu get a development codename (‘EoanErmine’) and are versioned by the year and month of delivery - for example, Ubuntu 19.10 was released in October 2019.
LTS or ‘Long Term Support’ releases are published every two years in April. LTS releases are the ‘enterprise grade’ releases of Ubuntu and are utilised the most. An estimated 95% of all Ubuntu installations are LTS releases.

Every six months between LTS versions, Canonical publishes an interim release of Ubuntu, with 19.10 being the latest example. These are production-quality releases and are supported for 9 months, with sufficient time provided for users to update, but these releases do not receive the long-term commitment of LTS releases.
https://ubuntu.com/about/release-cycle#:~:text=Long%20term%20support%20and%20interim,Ubuntu%20installations%20are%20LTS%20releases.

# Difference between Rolling release and Point release.
ANS:- --Rolling release, rolling update, or continuous delivery, in software development, is the concept of frequently delivering updates to applications. This is in contrast to a standard or point release development model which uses software versions that must be reinstalled over the previous version.

--A point release distribution puts out installation images on some sort of a fixed schedule, typically something like every six months, nine months or even annually. Each such release is identified by a specific name, which usually includes either the date or sequence number of the release. In most cases, between the major releases only security bug fixes and updates are made to the Linux kernel and desktop environment, but policies on utilities and applications vary between distributions. For example, most point release distributions continue to release new versions of Firefox.

#  Why is man aggregated to man0, man1 etc.
ANS:- MANUAL SECTIONS
    The standard sections of the manual include:

    1      User Commands
    2      System Calls
    3      C Library Functions
    4      Devices and Special Files
    5      File Formats and Conventions
    6      Games et. al.
    7      Miscellanea
    8      System Administration tools and Daemons

    Distributions customize the manual section to their specifics,
    which often include additional sections.
    
    There are certain terms that have different pages in different sections (e.g. printf as a command appears in section 1, as a stdlib function appears in section 3); in cases like that you can pass the section number to man before the page name to choose which one you want.
    
    https://unix.stackexchange.com/questions/3586/what-do-the-numbers-in-a-man-page-mean


# How to create and mount ext4 file system?
ANS:- CREATING AN EXT4 FILE SYSTEM
      The steps for creating an ext4 file system are as follows:
            1. Format the partition with the ext4 file system using the mkfs.ext4 or mke4fs command:
                  ->  mkfs.ext4 block_device
                              or
                  -> mke4fs -t ext4 block_device
                   block_device is the name of partition you want to create ext4 fs.
                 
            2. Label the partition using the e4label command.
                  -> e4label <block_device> new-label
            
            3. Create a mount point and mount the new file system to that mount point:
                  -> mkdir /mount/point
                  -> mount block_device /mount/point
      
A valid block device could be one of two types of entries:
    *A mapped device — A logical volume in a volume group, for example, /dev/mapper/VolGroup00-LogVol02.
     *A static device — A traditional storage volume, for example, /dev/hdbX, where hdb is a storage device name and X is the partition number.
     
     To specify stripe geometry, use the -E option of mkfs.ext4 (that is, extended file system options) with the following sub-options:
     ->  mkfs.ext4 -E stride=16,stripe-width=64 block_device

   MOUNTING AN EXT4 FILE SYSTEM
      An ext4 file system can be mounted with no extra options, same as any other file system:
      
      -> mount block_device /mount/point
      
      The default mount options are optimal for most users. Options, such as acl, noacl, data, quota, noquota, user_xattr, nouser_xattr, etc.
      
      - barrier / nobarrier
            By default, ext4 uses write barriers to ensure file system integrity even when power is lost to a device with write caches enabled. For devices                   without write caches, or with battery-backed write caches, you disable barriers using the nobarrier option:
                  -> mount -o nobarrier block_device /mount/point
                  
            Default mount options can be also set in the file system superblock using the tune4fs utility. For example, the following command sets the file system             on the /dev/mapper/VolGroup00-LogVol02 device to be mounted by default with debugging disabled and user-specified extended attributes and Posix access             control lists enabled:
                  -> tune4fs -o ^debug,user_xattr,acl /dev/mapper/VolGroup00-LogVol02
                  
   https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/5/html/deployment_guide/s1-filesystem-ext4-create
   https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/5/html/deployment_guide/s1-filesystem-ext4-mount.
                             
