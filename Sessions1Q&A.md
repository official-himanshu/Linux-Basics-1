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
ANS:- 
                             
