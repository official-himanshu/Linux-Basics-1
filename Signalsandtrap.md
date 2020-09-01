## Signals 
** Signals are software interrupts sent to a program to indicate that an important event as occured.
** The events can vary from user requests to illegal memory access errors.
** Some signals, such as the interrupt signal, indicate that a user has asked the program to do something that is not in the usual flow of control.

The following table lists out common signals you might encounter and want to use in your programs −

Signal Name	Signal Number	Description
SIGHUP	        1	        Hang up detected on controlling terminal or death of controlling process
SIGINT	        2	        Issued if the user sends an interrupt signal (Ctrl + C)
SIGQUIT	        3	        Issued if the user sends a quit signal (Ctrl + D)
SIGFPE	        8	        Issued if an illegal mathematical operation is attempted
SIGKILL	        9	        If a process gets this signal it must quit immediately and will not perform any clean-up operations
SIGALRM	        14	      Alarm clock signal (used for timers)
SIGTERM	        15	      Software termination signal (sent by kill by default)

we can also see all the signal type by typing the commmand: ->kill -l

#### Default Actions
Every signal has a default action associated with it. The default action for a signal is the action that a script or program performs when it receives a signal.

Some of the possible default actions are −

-Terminate the process.

-Ignore the signal.

-Dump core. This creates a file called core containing the memory image of the process when it received the signal.

-Stop the process.

-Continue a stopped process.

## Trapping Signals
When you press the Ctrl+C or Break key at your terminal during execution of a shell program, normally that program is immediately terminated, and your command prompt returns. 
This may not always be desirable. For instance, you may end up leaving a bunch of temporary files that won't get cleaned up.

trap commands signals
Here command can be any valid Unix command, or even a user-defined function, and signal can be a list of any number of signals you want to trap.

There are two common uses for trap in shell scripts −

--Clean up temporary files
--Ignore signals

### Cleaning Up Temporary Files

As an example of the trap command, the following shows how you can remove some files and then exit if someone tries to abort the program from the terminal −

      $ trap "rm -f $WORKDIR/work1$$ $WORKDIR/dataout$$; exit" 2
From the point in the shell program that this trap is executed, the two files work1$$ and dataout$$ will be automatically removed if signal number 2 is received by the program.

Hence, if the user interrupts the execution of the program after this trap is executed, you can be assured that these two files will be cleaned up. The exit command that follows the rm is necessary because without it, the execution would continue in the program at the point that it left off when the signal was received.

Signal number 1 is generated for hangup. Either someone intentionally hangs up the line or the line gets accidentally disconnected.

You can modify the preceding trap to also remove the two specified files in this case by adding signal number 1 to the list of signals −

      $ trap "rm $WORKDIR/work1$$ $WORKDIR/dataout$$; exit" 1 2
Now these files will be removed if the line gets hung up or if the Ctrl+C key gets pressed.

The commands specified to trap must be enclosed in quotes, if they contain more than one command. Also note that the shell scans the command line at the time that the trap command gets executed and also when one of the listed signals is received.

Thus, in the preceding example, the value of WORKDIR and $$ will be substituted at the time that the trap command is executed. If you wanted this substitution to occur at the time that either signal 1 or 2 was received, you can put the commands inside single quotes −

      $ trap 'rm $WORKDIR/work1$$ $WORKDIR/dataout$$; exit' 1 2

### Ignoring Signals
If the command listed for trap is null, the specified signal will be ignored when received. For example, the command −

      $ trap '' 2
This specifies that the interrupt signal is to be ignored. You might want to ignore certain signals when performing an operation that you don't want to be interrupted. You can specify multiple signals to be ignored as follows −

      $ trap '' 1 2 3 15
Note that the first argument must be specified for a signal to be ignored and is not equivalent to writing the following, which has a separate meaning of its own −

      $ trap  2
If you ignore a signal, all subshells also ignore that signal. However, if you specify an action to be taken on the receipt of a signal, all subshells will still take the default action on receipt of that signal.

### Resetting Traps
After you've changed the default action to be taken on receipt of a signal, you can change it back again with the trap if you simply omit the first argument; so −

      $ trap 1 2
This resets the action to be taken on the receipt of signals 1 or 2 back to the default.



