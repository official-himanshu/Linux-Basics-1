## IORedirections

As whenever we use a command to display some thing it is displayed over the terminal itself. It means we write command on terminal and print standard output on terminal.

We can user IO Redirections to save our outpur to a file and take input from a file.
Lets discuss them one by one:

### Output Redirection
The output from a command normally intended for standard output can be easily diverted to a file instead. This capability is known as output redirection.

If the notation > file is appended to any command that normally writes its output to standard output, the output of that command will be written to file instead of your terminal.

Check the following who command which redirects the complete output of the command in the users file.

for example:-
          
          $ls -l > list
          $netstat > netlist
          
         
### Input Redirections
Just as the output of a command can be redirected to a file, so can the input of a command be redirected from a file. 
As the greater-than character > is used for output redirection, the less-than character < is used to redirect the input of a command.

