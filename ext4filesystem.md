# Creating and mounting ext4 file system

#### What is ext4 file system?
The ext4 file system is a scalable extension of the ext3 file system. Ext4 is the default file system of Red Hat Enterprise Linux 6, and can support files and file systems up to 16 terabytes in size.

After installation, it is sometimes necessary to create a new ext4 file system. For example, if you add a new disk drive to the system, you may want to partition the drive and use the ext4 file system.

The default options are optimal for most usage scenarios but if you need to set your ext4 file system in a specific way, see manual pages for the mke4fs and mkfs.ext4 commands for available options. 
Also, you may want to examine and modify the configuration file of mke4fs, /etc/mke4fs.conf, if you plan to create ext4 file systems more often.


### Creating a Ext4 file system
The steps for creating a ext4 file system are as followa:

1. Format the partition with the ext4 file system using the mkfs.ext4 or mke4fs command:

    ~]# mkfs.ext4 block_device 

