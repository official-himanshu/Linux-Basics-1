# Creating and mounting ext4 file system

#### What is ext4 file system?
The ext4 or fourth extended filesystem is a widely-used journaling file system for Linux. The ext4 file system is a scalable extension of the ext3 file system. It was designed as a progressive revision of the ext3 file system and overcomes a number of limitations in ext3.

After installation, it is sometimes necessary to create a new ext4 file system. For example, if you add a new disk drive to the system, you may want to partition the drive and use the ext4 file system.

Some prerequisite for this blog are:
1. We will assume that you have added a new hard drive to your Linux machine, in which you will create the new ext4 partition, and
2. If you are operating the system as an administrative user, use the sudo command to gain root privileges to run the commands shown in this article.


### Creating a Ext4 file system

1. First list the partition by using fdisk-l or parted -l commands to identify the hard drive you want to partition.

        root@himanshu:/home/himanshu# parted -l
        Model: ATA WDC WD5000LPCX-6 (scsi)
        Disk /dev/sda: 500GB
        Sector size (logical/physical): 512B/4096B
        Partition Table: gpt
        Disk Flags: 

        Number  Start   End    Size   File system  Name                  Flags
        1      1049kB  538MB  537MB  fat32        EFI System Partition  boot, esp
        2      538MB   500GB  500GB  ext4


        Model: SanDisk Cruzer Blade (scsi)
        Disk /dev/sdb: 15.6GB
        Sector size (logical/physical): 512B/512B
        Partition Table: loop
        Disk Flags: 

        Number  Start  End     Size    File system  Flags
        1      0.00B  15.6GB  15.6GB  fat32


Looking at the output in the above output, we have two hard disks added on the test system and we will partition disk /dev/sdb.


Now use parted command to start creating the partition on the selected storage device.

        root@himanshu:/home/himanshu# parted /dev/sdb
        GNU Parted 3.2
        Using /dev/sdb
        Welcome to GNU Parted! Type 'help' to view a list of commands.
        
Now give the new disk a label using the mklabel command.

        (parted) mklabel msdos
        Warning: Partition(s) on /dev/sdb are being used.
                                                                                                                                                                           Ignore/Cancel? Ignore   
        Warning: The existing disk label on /dev/sdb will be destroyed and all
        data on this disk will be lost. Do you want to continue?
                                                                                                                                               
        Yes/No? yes


Then create a partition using the mkpart command, give it additional parameters like “primary” or “logical” depending on the partition type that you wish to create. Then select ext4 as the file system type, set the start and end to establish the size of the partition. 
        
        (parted) mkpart
        Partition type?  primary/extended? primary
        File system type?  [ext2]? ext4
        Start? 1
        End? 14500
        (parted) 


To print the partition table on the device /dev/sdb or detailed information about the new partition, run the print command.

        (parted) print
        Model: SanDisk Cruzer Blade (scsi)
        Disk /dev/sdb: 15.6GB
        Sector size (logical/physical): 512B/512B
        Partition Table: msdos
        Disk Flags: 

        Number  Start   End     Size    Type     File system  Flags
        1      1049kB  14.5GB  14.5GB  primary  ext4         lba

Now exit the program using the quit command.

### Formatting New Ext4 Partition

Next, you need to properly format the new partition with the ext4 file system type using the mkfs.ext4 or mke4fs command as follows.

        root@himanshu:/home/himanshu# mkfs.ext4 /dev/sdb1
        mke2fs 1.44.1 (24-Mar-2018)
        Creating filesystem with 3539712 4k blocks and 885952 inodes
        Filesystem UUID: 99ba66f4-e976-492a-9d77-1b5bc6640400
        Superblock backups stored on blocks: 
	32768, 98304, 163840, 229376, 294912, 819200, 884736, 1605632, 2654208

        Allocating group tables: done                            
        Writing inode tables: done                            
        Creating journal (16384 blocks): done
        Writing superblocks and filesystem accounting information: done   

Then label the partition using the e4label command as follows.

        root@himanshu:/home/himanshu# e2label /dev/sdb1 disk2-part1
        
### Mounting New Ext4 Parition in File System
Next, create a mount point and mount the newly created ext4 partition file system.

        root@himanshu:/home/himanshu# mkdir /mnt/disk2-part1
        root@himanshu:/home/himanshu# mount /dev/sdb1 //mnt/disk2-part1

Now using the df command, you can list all file systems on your system together with their sizes in a human readable format (-h), and their mount points and file system types (-T):

        root@himanshu:/home/himanshu# df -hT
        Filesystem     Type      Size  Used Avail Use% Mounted on
        udev           devtmpfs  1.7G     0  1.7G   0% /dev
        tmpfs          tmpfs     340M  3.5M  336M   2% /run
        /dev/sda2      ext4      457G   40G  394G  10% /
        tmpfs          tmpfs     1.7G  392M  1.3G  24% /dev/shm 
        tmpfs          tmpfs     5.0M  4.0K  5.0M   1% /run/lock
        tmpfs          tmpfs     1.7G     0  1.7G   0% /sys/fs/cgroup
        /dev/loop0     squashfs  2.3M  2.3M     0 100% /snap/gnome-system-monitor/145
        /dev/loop8     squashfs   56M   56M     0 100% /snap/core18/1885
        /dev/loop3     squashfs   83M   83M     0 100% /snap/scrcpy/238
        /dev/loop7     squashfs  2.5M  2.5M     0 100% /snap/gnome-calculator/748
        /dev/loop2     squashfs  162M  162M     0 100% /snap/gnome-3-28-1804/128
        /dev/loop6     squashfs   97M   97M     0 100% /snap/core/9665
        /dev/loop5     squashfs   83M   83M     0 100% /snap/scrcpy/243
        /dev/loop9     squashfs   55M   55M     0 100% /snap/core18/1880
        /dev/loop13    squashfs  291M  291M     0 100% /snap/vlc/1700
        /dev/loop4     squashfs   55M   55M     0 100% /snap/gtk-common-themes/1502
        /dev/loop10    squashfs   97M   97M     0 100% /snap/core/9804
        /dev/loop11    squashfs  1.0M  1.0M     0 100% /snap/gnome-logs/93
        /dev/loop14    squashfs  2.3M  2.3M     0 100% /snap/gnome-system-monitor/148
        /dev/loop12    squashfs   63M   63M     0 100% /snap/gtk-common-themes/1506
        /dev/loop1     squashfs  161M  161M     0 100% /snap/gnome-3-28-1804/116
        /dev/loop15    squashfs  1.0M  1.0M     0 100% /snap/gnome-logs/100
        /dev/loop17    squashfs  164M  164M     0 100% /snap/spotify/41
        /dev/loop16    squashfs  384K  384K     0 100% /snap/gnome-characters/550
        /dev/loop18    squashfs  4.4M  4.4M     0 100% /snap/gnome-calculator/704
        /dev/loop19    squashfs  291M  291M     0 100% /snap/vlc/1620
        /dev/loop20    squashfs  384K  384K     0 100% /snap/gnome-characters/539
        /dev/sda1      vfat      511M  6.1M  505M   2% /boot/efi
        tmpfs          tmpfs     340M   20K  340M   1% /run/user/121
        tmpfs          tmpfs     340M   72K  340M   1% /run/user/1000
        tmpfs          tmpfs     340M     0  340M   0% /run/user/0
        /dev/sdb1      ext4       14G   41M   13G   1% /mnt/disk2-part1
        
        =>/dev/sdb1      ext4       14G   41M   13G   1% /mnt/disk2-part1

Lastly, add the following entry in your /etc/fstab to enable persistent mounting of the file system, even after a reboot.

        /dev/sdb1   /mnt/disk2-part1  ext4   defaults    0   0
        
### Conclusion
In this blog we show how to create a new ext4 file system (partition) and how to mount it. I hope this blog helps you for the creation and nounting of ext4 file system even you can try by yourself to create a ext3 file system.
