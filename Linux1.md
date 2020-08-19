What is a Linux?

=> Linux is an open-source operating system like other operating systems such as Microsoft Windows, Apple Mac OS, iOS, Google android, etc.
=> An operating system is a software that enables the communication between computer hardware and software. 
   It conveys input to get processed by the processor and brings output to the hardware to display it. This is the basic function of an operating system.
   Although it performs many other important tasks, let's not talk about that.

Why use Linux?

=> So there are various features of Linux systems that make it completely different and one of the most used operating systems. 
 -Multiuser capability: Multiple users can access the same system resources like memory, hard disk, etc. But they have to use different terminals to operate.
 -Multitasking: More than one function can be performed simultaneously by dividing the CPU time intelligently.
 -Portability: Portability doesn't mean it is smaller in file size or can be carried in pen drives or memory cards. It means that it support different types of hardware.
 -Security: It provides security in three ways namely authenticating (by assigning password and login ID), authorization (by assigning permission to read, write and execute) and encryption (converts file into an unreadable format).
 -Live CD/USB: Almost all Linux distros provide live CD/USB so that users can run/try it without installing it.
 -Graphical User Interface (X Window system): Linux is command line based OS but it can be converted to GUI based by installing packages.
 -Support's customized keyboard: As it is used worldwide, hence supports different languages keyboards.
 -Application support: It has its own software repository from where users can download and install many applications.
 -File System: Provides hierarchical file system in which files and directories are arranged.
 -Open Source: Linux code is freely available to all and is a community based development project.

How to use linux?
=> We can use Linux through an interactive user interface as well as from the terminal (Command Line Interface). 
Different distributions have a slightly different user interface but almost all the commands will have the same behavior for all the distributions.
To run Linux from the terminal, press the "CTRL+ALT+T" keys. And, to explore its functionality, press the application button given on the left down corner of your desktop.

How does a linux system boot up?
=> 1. BIOS
BIOS stands for Basic Input/Output System. In simple terms, the BIOS loads and executes the Master Boot Record (MBR) boot loader.

When you first turn on your computer, the BIOS first performs some integrity checks of the HDD or SSD.

Then, the BIOS searches for, loads, and executes the boot loader program, which can be found in the Master Boot Record (MBR). The MBR is sometimes on a USB stick or CD-ROM such as with a live installation of Linux.

Once the boot loader program is detected, it's then loaded into memory and the BIOS gives control of the system to it.

=> 2. MBR
MBR stands for Master Boot Record, and is responsible for loading and executing the GRUB boot loader.

The MBR is located in the 1st sector of the bootable disk, which is typically /dev/hda, or /dev/sda, depending on your hardware. The MBR also contains information about GRUB, or LILO in very old systems.

=> 3. GRUB
Sometimes called GNU GRUB, which is short for GNU GRand Unified Bootloader, is the typical boot loader for most modern Linux systems.

The GRUB splash screen is often the first thing you see when you boot your computer. It has a simple menu where you can select some options. If you have multiple kernel images installed, you can use your keyboard to select the one you want your system to boot with. By default, the latest kernel image is selected.

The splash screen will wait a few seconds for you to select and option. If you don't, it will load the default kernel image.

In many systems you can find the GRUB configuration file at /boot/grub/grub.conf or /etc/grub.conf. Here's an example of a simple grub.conf file:

#boot=/dev/sda
default=0
timeout=5
splashimage=(hd0,0)/boot/grub/splash.xpm.gz
hiddenmenu
title CentOS (2.6.18-194.el5PAE)
      root (hd0,0)
      kernel /boot/vmlinuz-2.6.18-194.el5PAE ro root=LABEL=/
      initrd /boot/initrd-2.6.18-194.el5PAE.img
      
 =>4. Kernel
The kernel is often referred to as the core of any operating system, Linux included. It has complete control over everything in your system.

In this stage of the boot process, the kernel that was selected by GRUB first mounts the root file system that's specified in the grub.conf file. Then it executes the /sbin/init program, which is always the first program to be executed. You can confirm this with its process id (PID), which should always be 1.

The kernel then establishes a temporary root file system using Initial RAM Disk (initrd) until the real file system is mounted.

=> 5. Init
At this point, your system executes runlevel programs. At one point it would look for an init file, usually found at /etc/inittab to decide the Linux run level.

Modern Linux systems use systemmd to choose a run level instead

=> 6. Runlevel programs
Depending on which Linux distribution you have installed, you may be able to see different services getting started. For example, you might catch starting sendmail …. OK.
