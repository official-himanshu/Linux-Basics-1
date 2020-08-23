# LINUX SED COMMAND OR LINUX STREAM EDITOR

Linux 'sed' command stands for stream editor. It is used to edit streams (files) using regular expressions. But this editing is not permanent. 
It remains only in display, but in actual, file content remains the same.
A stream editor is used to perform basic text transformations on an input stream (a file or input from a pipeline).Primarily, 
it is used for text substitution; additionally, it can be used for other text manipulation operations like insert, delete, search, and more. 
The sed command allows us to edit files without opening them. Regular expression support makes it a more powerful text manipulation tool.

Basic sed command is given as:

    ->sed [OPTIONS]... {script_only_if_no_other_script} [input-file]...
    ->echo <text> | sed {script_only_if_no_other_script}          //input from a pipeline
    ->cat [input-file]... | sed {script_only_if_no_other_script}

Lets look at some command line option of sed command are:

    -n, --quiet, --silent: It forcefully allows us to print of pattern space.
    -e script, --expression=script: It is used to add the script to the commands to be executed.
    -f script-file, --file=script-file: It is used to add the contents of script-file to the commands to be executed.
    --follow-symlinks: it is used to follow symlinks when processing in place.
    -i[SUFFIX], --in-place[=SUFFIX]: it is used to edit files in place (creates backup if SUFFIX option is supplied).
    -l N, --line-length=N: It is used to specify the desired line-wrap length for the `l' command.
    --posix: it is used to disable all GNU extensions.
    -E, -r, --regexp-extended: It allows us to use the extended regular expressions in the script (for portability use POSIX -E).
    -s, --separate: it is used for considering files as separate rather than as a single and continues the long stream.
    -u, --unbuffered: It is used for loading the minimal amounts of data from the input files and flushes the output buffers more often.
    -z, --null-data: It is used to separate lines by NUL characters.
    --help: it is used to display the help manual.
    --version: It is used to display version information.
            
### Sed Command Examples
Let's look at some examples of sed command:

##### 1. Replacing or Substituting String
Sed command is mostly used to replace or substitute string in a text file. The below simple command
is used to replace a word.

    himanshu@himanshu:~$ sed 's/more/less/' file
    hello
    learn less and more to improve skills
    keep hands one to know less.
    
Here the “s” specifies the substitution operation. The “/” are delimiters. The “unix” is the search pattern and the “linux” is the replacement string.
By default, the sed command replaces the first occurrence of the pattern in each line and it won’t replace the second, third…occurrence in the line.


##### 2. Applying to the STDIN Directory
We can apply sed command to the STDIN, it is not limited to manipulate files.

    himanshu@himanshu:~$ echo sededitor | sed 's/sededitor/sedcommand/'
    sedcommand
    himanshu@himanshu:~$ echo sed7 | sed 's/7/10/'
    sed10
    himanshu@himanshu:~$ cat >file
    hello
    learn more and more to improve skills
    keep hands one to know more.
    himanshu@himanshu:~$ cat file | sed 's/more/less/'
    hello
    learn less and more to improve skills
    keep hands one to know less.
    
##### 3. Global Replacement
In the previous example, the first occurance of word is replaced but by using global replacement we can replace every matched word from the file.
    
    himanshu@himanshu:~$ echo 'class is class not globally' | sed 's/class/last/'
    last is class not globally
    himanshu@himanshu:~$ echo 'class is class globally' | sed 's/class/last/g'
    last is last globally
    
#### 4. Removing a line
We can remove the line by finding match of word, delete by giving a specific line, delete by giving a range,etc. Some of the example are as follows:

    himanshu@himanshu:~$ cat -n file
     1	hello
     2	learn more and more to improve skills
     3	keep hands one to know more.
     4	deleting a line by searching a specific word
     5	deleting by giving a specific line number
     6	deleting by giving a range
     7	deleting first line 
     8	deleting last line
    himanshu@himanshu:~$ cat -n file | sed '/deleting/d'
     1	hello
     2	learn more and more to improve skills
     3	keep hands one to know more.
    himanshu@himanshu:~$ cat -n file
     1	hello
     2	learn more and more to improve skills
     3	keep hands one to know more.
     4	deleting a line by searching a specific word
     5	deleting by giving a specific line number
     6	deleting by giving a range
     7	deleting first line 
     8	deleting last line
    himanshu@himanshu:~$ cat -n file | sed '1d'
     2	learn more and more to improve skills
     3	keep hands one to know more.
     4	deleting a line by searching a specific word
     5	deleting by giving a specific line number
     6	deleting by giving a range
     7	deleting first line 
     8	deleting last line
    himanshu@himanshu:~$ cat -n file | sed '2,5d'
     1	hello
     6	deleting by giving a range
     7	deleting first line 
     8	deleting last line
    himanshu@himanshu:~$ cat -n file | sed '$d'        //$ is used for last line
     1	hello
     2	learn more and more to improve skills
     3	keep hands one to know more.
     4	deleting a line by searching a specific word
     5	deleting by giving a specific line number
     6	deleting by giving a range
     7	deleting first line 

#### 5. Using the Multiple sed Command
The '-e' option allows us to execute the multiple sed commands at once. We can perform more than one sed operation by executing the command as:

    sed -e '<script 1> ; <script 2>' <file name>  
    sed -e '<script 1> -e <script 2> -e ... <file name>
    
The above command will apply all the specified operations in file.
    
    himanshu@himanshu:~$ cat file
    hello
    learn more and more to improve skills
    keep hands one to know more.
    deleting a line by searching a specific word
    deleting by giving a specific line number
    deleting by giving a range
    deleting first line 
    deleting last line
    himanshu@himanshu:~$ cat file | sed -e 's/deleting/complete/g' -e 's/more/less/g'
    hello
    learn less and less to improve skills
    keep hands one to know less.
    complete a line by searching a specific word
    complete by giving a specific line number
    complete by giving a range
    complete first line 
    complete last line

#### 6. Reading Commands From a File
We can save the sed commands in a file and apply them at once in any file. It can be done by specifying the '-f' option as follows:

    sed -f <sed file> <file name> 
    
The above command will apply all the specified commands in the 'SedCommand' file.
Here 'commandfile' is a file which contains script of sed command and 'file' is a simple file on which we apply script.

    himanshu@himanshu:~$ cat >commandfile
    s/deleting/complete/g;
    $d
    himanshu@himanshu:~$ sed -f commandfile file
    hello
    learn more and more to improve skills
    keep hands one to know more.
    complete a line by searching a specific word
    complete by giving a specific line number
    complete by giving a range
    complete first line 

#### 7. Transformation of Characters
The 'y' flag is used to transform the characters. The transformation of characters cannot be limited to specific occurrences. To transform characters, execute the command as follows:

    himanshu@himanshu:~$ cat alpha
    abcdef
    defabc
    abcghi
    acbedgf
    himanshu@himanshu:~$ sed 'y/abc/xyz/' alpha
    xyzdef
    defxyz
    xyzghi
    xzyedgf
    
#### 8. Modifying Lines
The 'c' flag is used to modify a specific line. To modify a line, execute the command as follows:

    sed '<line no>c\<line>' <file name>
    
The above command will update the line three. Consider the below output:

    himanshu@himanshu:~$ cat -n file
     1	hello
     2	learn more and more to improve skills
     3	keep hands one to know more.
     4	deleting a line by searching a specific word
     5	deleting by giving a specific line number
     6	deleting by giving a range
     7	deleting first line 
     8	deleting last line

    himanshu@himanshu:~$ cat -n file | sed '4c Modified by a given line'
     1	hello
     2	learn more and more to improve skills
     3	keep hands one to know more.
     Modified by a given line
     5	deleting by giving a specific line number
     6	deleting by giving a range
     7	deleting first line 
     8	deleting last line
     
#### 9. Print line number with sed command
The '=' sign or is used to print the line number. To print the line number, execute the command as follows:

    sed '=' <file name>
    
The above command will display the line number of file content.

    himanshu@himanshu:~$ sed = file
    1
    hello
    2
    learn more and more to improve skills
    3
    keep hands one to know more.
    4
    deleting a line by searching a specific word
    5
    deleting by giving a specific line number
    6
    deleting by giving a range
    7
    deleting first line 
    8
    deleting last line
    
    
### Conclusion

So we can use sed command for various stream editing and for easily modification of file. Also we can write this modification to a new file or we can modify the current file as well. This command is so useful in editing the scripts and a program.



    


    



