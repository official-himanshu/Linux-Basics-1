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
ANS: 
