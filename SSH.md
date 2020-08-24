# SSH
### SSH keys
An SSH key is an access credential in the SSH protocol. Its function is similar to that of user names and passwords, but the keys are primarily 
used for automated processes and for implementing single sign-on by system administrators and power users.

An SSH key is an alternate way to identify yourself that doesn't require you to enter you username and password every time. SSH keys come in pairs, 
a public key that gets shared with services like GitHub, and a private key that is stored only on your computer. If the keys match, you're granted access.

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

        himanshu@himanshu$ vim .ssh/authorised_key
        
-Changes are made in file ~/.ssh/authorized_keys such as copy the pub in file ~/.ssh/authorized_keys on the machine to which you want to connect, appending it to its end if the file already exists.
-And Change the permissions of the ~/.ssh/authorized_keys file using the following command:

        himanshu@himanshu$ chmod 600 ~/.ssh/authorized_key
        
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


                               
