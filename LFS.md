# Linux file system
In computing, a file system (often abbreviated to fs), controls how data is stored and retrieved.
Without a file system, data placed in a storage medium would be one large body of data with no way to tell where one piece of data stops and the next begins. 
By separating the data into pieces and giving each piece a name, the data is easily isolated and identified.

The structure and logic rules used to manage the groups of data and their names is called a "file system".

There are many different kinds of file systems. Each one has different structure and logic, properties of speed, flexibility, security, size and more. 
Some file systems have been designed to be used for specific applications.

# Directory Structure
Unix uses a hierarchical file system structure, much like as upside-down tree structure, with root(/) at the base of the file system, and other directories spreading from there.
1. The entire file directory system started with the root(/) directory.

                                                                             /
                                                                             |
                       ---------------------------------------------------------------------------------------------------------------
                       |            |               |             |             |             |           |           |               |
                      /bin        /boot           /etc          /home         /lib          /root       /sbin       /usr             /sys
                                                                  |
                                                        ----------------------
                                                        |                     |
                                                      /himanshu           /guest
                                    
 The directories have specific purposes and generally hold the same types of information for easily locating files.
 
 1. /bin: /bin is the directory that contains binaries, that is, some of the applications and programs you can run. You will find the ls program mentioned above in this directory, as well as other basic tools for making and removing files and directories, moving them around, and so on. There are more bin directories in other parts of the file system tree, but we’ll be talking about those in a minute.
 
 2. /boot: The /boot directory contains files required for starting your system. Do I have to say this? Okay, I’ll say it: DO NOT TOUCH!. If you mess up one of the files in here, you may not be able to run your Linux and it is a pain to repair. On the other hand, don’t worry too much about destroying your system by accident: you have to have superuser privileges to do that.
 
 3. /dev: /dev contains device files.  Many of these are generated at boot time or even on the fly. For example, if you plug in a new webcam or a USB pendrive into your machine, a new device entry will automagically pop up here.
 
 4. /etc: /etc is the directory where names start to get confusing. /etc gets its name from the earliest Unixes and it was literally “et cetera” because it was the dumping ground for system files administrators were not sure where else to put.

       Nowadays, it would be more appropriate to say that etc stands for “Everything to configure,” as it contains most, if not all system-wide configuration            files. For example, the files that contain the name of your system, the users and their passwords, the names of machines on your network and when and where        the partitions on your hard disks should be mounted are all in here. Again, if you are new to Linux, it may be best if you don’t touch too much in here            until you have a better understanding of how things work.
       
 5. /home: /home is where you will find your users’ personal directories. In my case, under /home there are one directories: /home/himanshu, which contains all my stuff;
 
 6. /lib: /lib is where libraries live. Libraries are files containing code that your applications can use. They contain snippets of code that applications use to draw windows on your desktop, control peripherals, or send files to your hard disk.
 There are more lib directories scattered around the file system, but this one, the one hanging directly off of / is special in that, among other things, it contains the all-important kernel modules. The kernel modules are drivers that make things like your video card, sound card, WiFi, printer, and so on, work.
 
 7. /media: The /media directory is where external storage will be automatically mounted when you plug it in and try to access it. As opposed to most of the other items on this list, /media does not hail back to 1970s, mainly because inserting and detecting storage (pendrives, USB hard disks, SD cards, external SSDs, etc) on the fly, while a computer is running, is a relatively new thing.
 
 8. /root: /root is the home directory of the superuser (also known as the “Administrator”) of the system. It is separate from the rest of the users’ home directories BECAUSE YOU ARE NOT MEANT TO TOUCH IT. Keep your own stuff in you own directories, people.
 
9. /run: /run is another new directory. System processes use it to store temporary data for their own nefarious reasons. This is another one of those DO NOT TOUCH folders.

10. /sbin: /sbin is similar to /bin, but it contains applications that only the superuser (hence the initial s) will need. You can use these applications with the sudo command that temporarily concedes you superuser powers on many distributions. /sbin typically contains tools that can install stuff, delete stuff and format stuff. As you can imagine, some of these instructions are lethal if you use them improperly, so handle with care.

11. /usr: The /usr directory was where users’ home directories were originally kept back in the early days of UNIX. However, now /home is where users kept their stuff as we saw above. These days, /usr contains a mish-mash of directories which in turn contain applications, libraries, documentation, wallpapers, icons and a long list of other stuff that need to be shared by applications and services.

You will also find bin, sbin and lib directories in /usr. What is the difference with their root-hanging cousins? Not much nowadays. Originally, the /bin directory (hanging off of root) would contain very basic commands, like ls, mv and rm; the kind of commands that would come pre-installed in all UNIX/Linux installations, the bare minimum to run and maintain a system. /usr/bin on the other hand would contain stuff the users would install and run to use the system as a work station, things like word processors, web browsers, and other apps.

But many modern Linux distributions just put everything into /usr/bin and have /bin point to /usr/bin just in case erasing it completely would break something. So, while Debian, Ubuntu and Mint still keep /bin and /usr/bin (and /sbin and /usr/sbin) separate; others, like Arch and its derivatives just have one “real” directory for binaries, /usr/bin, and the rest or **bin*s are “fake” directories that point to /usr/bin.

12. /srv: /srv contains data for server.  If you are running a web server from your Linux box, your HTML files for your sites would go into /srv/http (or /srv/www). If you were running an FTP server, your files would go into /srv/ftp.


13. /sys: /sys is another virtual directory like /proc and /dev and also contains information from devices connected to your computer.

In some cases you can also manipulate those devices. I can, for example, change the brightness of the screen of my laptop by modifying the value stored in the /sys/devices/pci0000:00/0000:00:02.0/drm/card1/card1-eDP-1/intel_backlight/brightness file (on your machine you will probably have a different file). But to do that you have to become superuser. The reason for that is, as with so many other virtual directories, messing with the contents and files in /sys can be dangerous and you can trash your system. DO NOT TOUCH until you are sure you know what you are doing.

14. /tmp: /tmp contains temporary files, usually placed there by applications that you are running. The files and directories often (not always) contain data that an application doesn’t need right now, but may need later on.

You can also use /tmp to store your own temporary files — /tmp is one of the few directories hanging off / that you can actually interact with without becoming superuser.

15. /var: /var was originally given its name because its contents was deemed variable, in that it changed frequently. Today it is a bit of a misnomer because there are many other directories that also contain data that changes frequently, especially the virtual directories we saw above.

Be that as it may, /var contains things like logs in the /var/log subdirectories. Logs are files that register events that happen on the system. If something fails in the kernel, it will be logged in a file in /var/log; if someone tries to break into your computer from outside, your firewall will also log the attempt here. It also contains spools for tasks. These “tasks” can be the jobs you send to a shared printer when you have to wait because another user is printing a long document, or mail that is waiting to be delivered to users on the system.                                                                

---------------------------------------------------------------------------------------------------------

# File System

Ext: an old one and no longer used due to limitations.

Ext2: first Linux file system that allows 2 terabytes of data allowed.

Ext3: came from Ext2, but with upgrades and backward compatibility.

The only problem about it that the servers don’t use this kind of file system because this file system doesn’t support file recovery or disk snapshots.

Ext4: faster and allow large files with significant speed.

It is a very good option for SSD disks and you notice when you try to install any Linux distro that this one is the default file system that Linux suggests.

JFS: old file system made by IBM. It works very well with small and big files, but it failed and files corrupted after long time use, reports say.

XFS: old file system and works slowly with small files.

Btrfs: made by Oracle. It is not stable as Ext in some distros, but you can say that it is a replacement for it if you have to. It has a good performance.

You may notice From the comparison above that Ext4 is the best Linux File System

# Naming file system conventions
1. All file names are case sensitive. So filename vivek.txt Vivek.txt VIVEK.txt all are three different files.
2. You can use upper and lowercase letters, numbers, “.” (dot), and “_” (underscore) symbols.
3. You can use other special characters such as blank space, but they are hard to use and it is better to avoid them.
4. In short, filenames may contain any character except / (root directory), which is reserved as the separator between files and directories in a pathname. You cannot use the null character.
5. No need to use . (dot) in a filename. Some time dot improves readability of filenames. And you can use dot based filename extension to identify file. For example:
        .sh = Shell file
        .tar.gz = Compressed archive
6. Most modern Linux and UNIX limit filename to 255 characters (255 bytes). However, some older version of UNIX system limits filenames to 14 characters only.
7. A filename must be unique inside its directory. For example, inside /home/vivek directory you cannot create a demo.txt file and demo.txt directory name. However, other directory may have files with the same names. For example, you can create demo.txt directory in /tmp.

# ZFS and AUFS
 ZFS = ZFS is a combined file system and logical volume manager. It includes support for high storage capacities, integration of concepts of file systems and volume management, snapshots and copy on write clones (that is, an optimization strategy that allows callers who ask for resources that are indistinguishable to be given pointers to the same resource), continuous integrity checking and automatic repair, RAID -Z, and native NFSv4 ACLs. It is an open source software that is licensed under the Common Development and Distribution License (or CDDL).
 
ZFS is made up of a plethora of features and components. The storage pool of ZFS is known as a zpool. It is constructed of virtual devices (or vdevs) which are constructed of block devices – files, hard drive partitions or entire drives (recommended). As such, vdevs are often times considered to be a group of hard drives. A ZFS capacity is rather large in comparison to standard file systems. It is a 128 bit file system, enabling it to address 18 quintillion times more data than 64 bit systems. The limitations found in ZFS are designed specifically to be large enough to never be encountered (within the known limits of physics, and the number of atoms in the earth’s crust to construct a storage device of this magnitude). The other features include a copy on write transactional model, snapshots and clones, dynamic striping, variable block sizes, lightweight file system creation, cache management, adaptive endianness, and deduplication (to name a few of the more common features).

AUFS = AuFS stands for Another Union File System.

AuFS started as an implementation of UnionFS Union File System.

An union filesystem takes an existing filesystem and transparently overlays it on a newer filesystem. It allows files and directories of separate filesystem to co-exist under a single roof. AuFS can merge several directories and provide a single merged view of it.

AuFS is used in many of the opensource projects like, Slax, Knoppix, and many other live CD and live USB distributions.
On Debian based systems, for example on Ubuntu, do the following to install aufs.

-> apt-get install aufs-tools

Example 1 – Understanding How AuFS Works
This example shows how to mount two directories of a same filesystem.

-> mkdir /tmp/dir1

-> mkdir /tmp/aufs-root

-> mount -t aufs -o br=/tmp/dir1:/home/lakshmanan none /tmp/aufs-root/
The first two commands created 2 new directories. The mount.aufs is the command to mount the filesystem as Union mount.

The mount command, specifies it is going to union mount “/tmp/dir1″ and /home/lakshmanan” under “/tmp/aufs-root”. The directory “/tmp/aufs-root” will have the content of both “/tmp/dir1” and “/home/lakshmanan”.

The following options are used in the above mount command example:

-o – specifies options to be passed to the filesystem
br – specifies a branch, where each branch is separated by colon (:). A branch is nothing but a directory on a system.
none – specifies we don’t have any device associated with it, since we are going to mount two directories

for more visit -- https://www.thegeekstuff.com/2013/05/linux-aufs/



