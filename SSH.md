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
