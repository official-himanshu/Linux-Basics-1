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

Nowadays, it would be more appropriate to say that etc stands for “Everything to configure,” as it contains most, if not all system-wide configuration files. For example, the files that contain the name of your system, the users and their passwords, the names of machines on your network and when and where the partitions on your hard disks should be mounted are all in here. Again, if you are new to Linux, it may be best if you don’t touch too much in here until you have a better understanding of how things work.
                                                                       
