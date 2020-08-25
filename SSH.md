# SSH
### SSH keys
An SSH key is an access credential in the SSH protocol. Its function is similar to that of user names and passwords, but the keys are primarily 
used for automated processes and for implementing single sign-on by system administrators and power users.

An SSH key is an alternate way to identify yourself that doesn't require you to enter you username and password every time. SSH keys come in pairs, 
a public key that gets shared with services like GitHub, and a private key that is stored only on your computer. If the keys match, you're granted access.

###### The main use of key-based authentication is to enable secure automation. Automated secure shell file transfers are used to seamlessly integrate applications and also for automated systems & configuration management.

In a nutshell:

A pair of encryption keys are generated which are mathematically linked to each other: a private key and a public key. 
The public key is used to encrypt a message whereas the private key is used to decrypt it. This provides a very nice 
property which allows anyone having access to the public key to encrypt a message that can only be decrypted by someone with access to the private key.

The inverse of this property is used for creating digital signatures in which a sender uses the private key to digitally sign a message and a receiver 
uses the corresponding public key (which has been verified via other channels to belong to the sender) to verify the signature. The receiver can then 
be confident that the message was indeed from someone with access to the private key. This forms the basis of public key authentication.

##### Authenticating users
This is where the SSH server verifies the identity of the user that is connecting. SSH offers various methods of authenticating users. Password authentication is the most common one but public key authentication is another.
When using public key authentication the SSH server checks if the user trying to authenticate to an account that has an authorized public key is in possession of the corresponding private key. Keys used for this purpose are referred to as SSH user keys.


##### Authenticating servers
This is where the SSH client verifies the identity of the SSH server. Allows users connecting to a server to verify that this is in fact the same SSH server I connected to the last time or that this is indeed the server that it claims to be 
(basically to prevent a Man-in-the-middle attack). Keys used for this purpose are referred to as SSH host keys.

#### What Is ssh-keygen?
Ssh-keygen is a tool for creating new authentication key pairs for SSH. Such key pairs are used for automating logins, single sign-on, and for authenticating hosts.

## SSH Keys and Public Key Authentication
The SSH protocol uses public key cryptography for authenticating hosts and users. The authentication keys, called SSH keys, are created using the keygen program.

SSH introduced public key authentication as a more secure alternative to the older .rhosts authentication. It improved security by avoiding the need to have password stored in files, and eliminated the possibility of a compromised server stealing the user's password.

However, SSH keys are authentication credentials just like passwords. Thus, they must be managed somewhat analogously to user names and passwords. They should have a proper termination process so that keys are removed when no longer needed.

#### Creating a SSH key pair for user authentication
The simplest way to generate a key pair is to run ssh-keygen without arguments. In this case, it will prompt for the file in which to store keys.

        -> ssh-keygen
        
### Choosing an Algorithm and Key Size

SSH supports several public key algorithms for authentication keys. These include:

rsa - an old algorithm based on the difficulty of factoring large numbers. A key size of at least 2048 bits is recommended for RSA; 4096 bits is better. RSA is getting old and significant advances are being made in factoring. Choosing a different algorithm may be advisable. It is quite possible the RSA algorithm will become practically breakable in the foreseeable future. All SSH clients support this algorithm.

dsa - an old US government Digital Signature Algorithm. It is based on the difficulty of computing discrete logarithms. A key size of 1024 would normally be used with it. DSA in its original form is no longer recommended.

ecdsa - a new Digital Signature Algorithm standarized by the US government, using elliptic curves. This is probably a good algorithm for current applications. Only three key sizes are supported: 256, 384, and 521 (sic!) bits. We would recommend always using it with 521 bits, since the keys are still small and probably more secure than the smaller keys (even though they should be safe as well). Most SSH clients now support this algorithm.

ed25519 - this is a new algorithm added in OpenSSH. Support for it in clients is not yet universal. Thus its use in general purpose applications may not yet be advisable.

The algorithm is selected using the -t option and key size using the -b option. The following commands illustrate:

    ssh-keygen -t rsa -b 4096
    ssh-keygen -t dsa
    ssh-keygen -t ecdsa -b 521
    ssh-keygen -t ed25519

#### Specifying the File Name
Normally, the tool prompts for the file in which to store the key. However, it can also be specified on the command line using the -f <filename> option.

        ssh-keygen -f ~/tatu-key-ecdsa -t ecdsa -b 521
        
#### Copying the Public Key to the Server
To use public key authentication, the public key must be copied to a server and installed in an authorized_keys file. This can be conveniently done using the ssh-copy-id tool. Like this:

        ssh-copy-id -i ~/.ssh/tatu-key-ecdsa user@host
        
Once the public key has been configured on the server, the server will allow any connecting user that has the private key to log in. During the login process, the client proves possession of the private key by digitally signing the key exchange.

#### Adding the Key to SSH Agent
ssh-agent is a program that can hold a user's private key, so that the private key passphrase only needs to be supplied once. A connection to the agent can also be forwarded when logging into a server, allowing SSH commands on the server to use the agent running on the user's desktop.

For more information on using and configuring the SSH agent, see the ssh-agent page.

#### Creating Host Keys
The tool is also used for creating host authentication keys. Host keys are stored in the /etc/ssh/ directory.

Host keys are just ordinary SSH key pairs. Each host can have one host key for each algorithm. The host keys are almost always stored in the following files:

        /etc/ssh/ssh_host_dsa_key
        /etc/ssh/ssh_host_ecdsa_key
        /etc/ssh/ssh_host_ed25519_key
        /etc/ssh/ssh_host_rsa_key
The host keys are usually automatically generated when an SSH server is installed. They can be regenerated at any time. However, if host keys are changed, clients may warn about changed keys. Changed keys are also reported when someone tries to perform a man-in-the-middle attack. Thus it is not advisable to train your users to blindly accept them. Changing the keys is thus either best done using an SSH key management tool that also changes them on clients, or using certificates.

-----------------------------------------------------------------------------
To use the keys with your SiteGround account, you need to upload the public key in Site Tools > Devs > SSH Keys Manager. The private key needs to be loaded in your Terminal using the ssh-add command:

        ssh-add /home/youruser/.ssh/id_rsa
After which you will be asked to enter the passphrase of your key.

#### what is .pem file?
Privacy-Enhanced Mail (PEM) is a de facto file format for storing and sending cryptographic keys, certificates, and other data, based on a set of 1993 IETF standards defining "privacy-enhanced mail." While the original standards were never broadly adopted, and were supplanted by PGP and S/MIME, the textual encoding they defined became very popular. The PEM format was eventually formalized by the IETF in RFC 7468.
                                                                        OR
                                                                      
Privacy Enhanced Mail (PEM) files are a type of Public Key Infrastructure (PKI) file used for keys and certificates. PEM, initially invented to make e-mail secure, is now an Internet security standard.

#### How to create pem file and access linux Server via pem file?
1st create the keys and RSA will create public and private keys. if you no need add passphrase on your key then you can add passphrase with key but I skipped the passphrase on server.Use this command-

        -> ssh-keygen -t rsa -b 2048

#### Now we are creating private to pem key
We sinmple rename the private key or copy the content form private key to other .pem file.
Example:
        
        himanshu@himanshu$ mv private_key private_key.pem
                               or
        himanshu@himanshu$ cat private_key>private_key.pem
        
#### Change the permission of ~/.ssh directory as
        
        himanshu@himanshu$ chmod 700 ~/.ssh
        
#### Create a file ~/.ssh/authorized_keys  if already exist ignore this step

        himanshu@himanshu$ vim .ssh/authorised_keys
        
-Changes are made in file ~/.ssh/authorized_keys such as copy the pub in file ~/.ssh/authorized_keys on the machine to which you want to connect, appending it to its end if the file already exists.
-And Change the permissions of the ~/.ssh/authorized_keys file using the following command:

        himanshu@himanshu$ chmod 600 ~/.ssh/authorized_keys
        
#### USING KEY-BASED AUTHENTICATION
To improve the system security even further, you can enforce key-based authentication by disabling the standard password authentication. To do so, open the /etc/ssh/sshd_config configuration file in a text editor such as vim, and change or uncomment if exist the option as follows:

        $ sudo    vim     /etc/ssh/sshd_config
        RSAAuthentication             yes
        PubkeyAuthentication      yes
        AuthorizedKeysFile      .ssh/authorized_keys
        PasswordAuthentication    no
        # Change to no to disable s/key passwords
        ChallengeResponseAuthentication    no
        #UsePAM no
        UsePAM        yes
        Save and exit (:wq)
#### restart the sshd service as

        systemctl restart sshd

#### Now access the server by ssh through pem file ( without password ) from local.

         ssh –i <path to pem file(test.pem)> <user>himanshu@<IP> 

### What is SSH?
The SSH protocol (also referred to as Secure Shell) is a method for secure remote login from one computer to another. It provides several alternative options for strong authentication, and it protects the communications security and integrity with strong encryption. It is a secure alternative to the non-protected login protocols (such as telnet, rlogin) and insecure file transfer methods (such as FTP).

#### Typical uses of the SSH protocol
The protocol is used in corporate networks for:

providing secure access for users and automated processes

interactive and automated file transfers

issuing remote commands

managing network infrastructure and other mission-critical system components.

#### How does the ssh protocol work?
-> The protocol works in the client-server model, which means that the connection is established by the SSH client connecting to the SSH server. 
-> The SSH client drives the connection setup process and uses public key cryptography to verify the identity of the SSH server.
->  After the setup phase the SSH protocol uses strong symmetric encryption and hashing algorithms to ensure the privacy and integrity of the data that is exchanged between the client and server.

Now simple process of ssh--
- Client initiate the connection by contacting the server.
- SSH server sends public key to the client.
- both client and server negotiate parameters and open secure parameters.
- User login to server host operating system.

#### SSH provides strong encryption and integrity protection
Once a connection has been established between the SSH client and server, the data that is transmitted is encrypted according to the parameters negotiated in the setup. During the negotiation the client and server agree on the symmetric encryption algorithm to be used and generate the encryption key that will be used. The traffic between the communicating parties is protected with industry standard strong encryption algorithms (such as AES (Advanced Encryption Standard)), and the SSH protocol also includes a mechanism that ensures the integrity of the transmitted data by using standard hash algoritms (such as SHA-2 (Standard Hashing Algorithm)).

#### What is known host in SSH?
The known_hosts file is for verifying the identity of other systems. ssh(1) can automatically add keys to the user's file, but they can be added manually as well. The file contains a list of public keys for all the hosts which the user has connected to.

#### /etc/ssh/ssh_config
This file defines all the default settings for the client utilities for all users on that system. It must be readable by all users. The configuration options are described in detail in ssh_config(5).

#### /etc/ssh/ssh_known_hosts
This contains the system-wide list of known host keys used to verify the identity of the remote host and thus hinder impersonation or eavesdropping. This file should be prepared by the system administrator to contain the public host keys of all necessary hosts. It should be world-readable.

#### Client-Side Files
These files reside on the client machine.


##### ~/.ssh/config
The user's own configuration file which, where applicable, overrides the settings in the global client configuration file, /etc/ssh/ssh_config. The configuration options are described in detail in ssh_config(5).

This file must not be accessible to other users in any way. Set strict permissions: read/write for the user, and not accessible by others. It may group-writable if and only if that user is the only member of the group in question.

##### ~/.ssh/known_hosts
This file is local to the user account and contains the known keys for remote hosts. Often these are collected from the hosts when connecting for the first time, but they can be added manually. As with those keys stored in the global file, /etc/ssh/ssh_known_hosts, these keys are used to verify the identity of the remote host, thus protecting against impersonation or man-in-the-middle attacks. With each subsequent connection the key will be compared to the key provided by the remote server. If there is a match, the connection will proceed. If the match fails, ssh(1) will fail with an error message. If there is no key at all listed for that remote host, then the key's fingerprint will be displayed and there will be the option to automatically add the key to the file. This file can be created and edited manually, but if it does not exist it will be created automatically by ssh(1) when it first connects to a remote host.

The ~/.ssh/known_hosts file can use either hashed or clear text host names. Even with hashed names, it can still be searched using ssh-keygen(1) using the -F option.

    $ ssh-keygen -F server3.example.com
The default file to be searched will be ~/.ssh/known_hosts and the key is printed if found. A different file can be searched using the -f option. If a key must be removed from the file, the -R option works similarly to search by host and then remove it if found even if the host name is hashed.

    $ ssh-keygen -R server4.example.com -f ~/.ssh/known_hosts
When a key is removed, it will then be appended to the file ~/.ssh/known_hosts.old in case it is needed later. Again, see the manual page for sshd(8) for the format of these known_host files.

#### Server side Client Files
These client files reside on the server. By default they are kept in the user's directory. However, the server can be configured to look for them in other locations if needed.

#### ~/.ssh/authorized_keys
authorized_keys is a one-key-per-line register of public ECDSA, RSA, and ED25519 keys that this account can use to log in with. The file's contents are not highly sensitive, but the recommended permissions are read/write for the user and not accessible by others. As always, the whole key including options and comments must be on a single, unbroken line.

#### What is sshd?
sshd (OpenSSH Daemon) is the daemon program for ssh(1).  Together these
programs replace rlogin and rsh, and provide secure encrypted communications between two untrusted hosts over an insecure network.

sshd listens for connections from clients.  It is normally started at boot from /etc/init.d/ssh.  It forks a new daemon for each incoming connection.
The forked daemons handle key exchange, encryption, authentication, command execution, and data exchange.

The sshd process is started when the system boots. The program is usually located at /usr/sbin/sshd. It runs as root. The initial process acts as the master server that listens to incoming connections. Generally this process is the one with the lowest process id or the one that has been running the longest. It is also the parent process of all the other sshd processes. The following command can be used to display the process tree on Linux, and it is easy to see which one is the parent process.


                               
