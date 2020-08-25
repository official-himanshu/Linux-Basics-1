# A brief introduction to sed, grep and awk

### SED COMMAND 

Linux 'sed' command stands for stream editor. It is used to edit streams (files) using regular expressions. But this editing is not permanent. 
It remains only in display, but in actual, file content remains the same.
A stream editor is used to perform basic text transformations on an input stream (a file or input from a pipeline).Primarily, 
it is used for text substitution; additionally, it can be used for other text manipulation operations like insert, delete, search, and more. 
The sed command allows us to edit files without opening them. Regular expression support makes it a more powerful text manipulation tool.

Basic sed command is given as:

    ->sed [OPTIONS]... {script_only_if_no_other_script} [input-file]...

Lets look at some command line option of sed command are:

    -n, --quiet, --silent:          It forcefully allows us to print of pattern space.
    -e script, --expression=script: It is used to add the script to the commands to be executed.
    -f script-file, --file=script-file: It is used to add the contents of script-file to the commands to be executed.
    --follow-symlinks:              it is used to follow symlinks when processing in place.
    -i[SUFFIX], --in-place[=SUFFIX]: it is used to edit files in place (creates backup if SUFFIX option is supplied).
    -l N, --line-length=N:          It is used to specify the desired line-wrap length for the `l' command.
    --posix:                        it is used to disable all GNU extensions.
    -E, -r, --regexp-extended:      It allows us to use the extended regular expressions in the script (for portability use POSIX -E).
    -s, --separate:                 it is used for considering files as separate rather than as a single and continues the long stream.
    -u, --unbuffered:               It is used for loading the minimal amounts of data from the input files and flushes the output buffers more often.
    -z, --null-data:                It is used to separate lines by NUL characters.
    --help:                         it is used to display the help manual.
    --version:                      It is used to display version information.
            
### Sed Command Examples
Let's look at some examples of sed command:

##### Replacing or Substituting String
Sed command is mostly used to replace or substitute string in a text file. The below simple command
is used to replace a word.

    himanshu@himanshu:~$ sed 's/more/less/' file
    hello
    learn less and more to improve skills
    keep hands one to know less.
    
Here the “s” specifies the substitution operation. The “/” are delimiters. The “unix” is the search pattern and the “linux” is the replacement string.
By default, the sed command replaces the first occurrence of the pattern in each line and it won’t replace the second, third…occurrence in the line.


##### Applying to the STDIN Directory
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
    
##### Global Replacement
In the previous example, the first occurance of word is replaced but by using global replacement we can replace every matched word from the file.
    
    himanshu@himanshu:~$ echo 'class is class not globally' | sed 's/class/last/'
    last is class not globally
    himanshu@himanshu:~$ echo 'class is class globally' | sed 's/class/last/g'
    last is last globally
    

#### Using the Multiple sed Command
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

#### Reading Commands From a File
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
    
#### Modifying Lines
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
     
####  Print line number with sed command
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

### GREP Command
grep (Global Regular Expression Print) is used to search for specific terms in a file.
Different from awk and sed, grep can’t add/modify/remove the text in a specific file. But it’s useful when we just want to search and filter out matches.
The grep filter searches a file for a particular pattern of characters, and displays all lines that contain that pattern. The pattern that is searched in the file is referred to as the regular expression (grep stands for globally search for regular expression and print out). Command look like as:- 

    grep [OPTIONS] PATTERN [FILE...] 
    grep [OPTIONS] -e PATTERN ... [FILE...] 
    grep [OPTIONS] -f FILE ... [FILE...]

###### Usage
Typical use
print every line that contains the word 'test'

    grep 'test' file.txt

Options Description
   
    -c : This prints only a count of the lines that match a pattern
    -h : Display the matched lines, but do not display the filenames.
    -i : Ignores, case for matching
    -l : Displays list of a filenames only.
    -n : Display the matched lines and their line numbers.
    -v : This prints out all the lines that do not matches the pattern
    -e exp : Specifies expression with this option. Can use multiple times.
    -f file : Takes patterns from file, one per line.
    -E : Treats pattern as an extended regular expression (ERE)
    -w : Match whole word
    -o : Print only the matched parts of a matching line,
    -r : when we want to search all files in the same directory and its sub-directories then use this.

##### Checking for the given string in multiple files.
This is a basic usage of grep command. For this example, let us copy the demo_file to demo_file1. The grep output will also include the file name in front of the line that matched the specific pattern .
   Syntax:
       
       grep "string" FILE_PATTERN

Example:
       
       grep "this" demo_*
       demo_file:this line is the 1st lower case line in this file.
       demo_file:Two lines above this line is empty.
       demo_file:And this is the last line.
       demo_file1:this line is the 1st lower case line in this file.
       demo_file1:Two lines above this line is empty.
       demo_file1:And this is the last line.
       
##### Case insensitive search using grep -i
This is also a basic usage of the grep. This searches for the given string/pattern case insensitively. So it matches all the words such as “the”, “THE” and “The” case insensitively as shown below.
Syntax:
        grep -i "string" FILE

Example:

        grep -i "the" demo_file
        THIS LINE IS THE 1ST UPPER CASE LINE IN THIS FILE.
        this line is the 1st lower case line in this file.
        This Line Has All Its First Character Of The Word With Upper Case.
        And this is the last line.

##### Match regular expression in files
Syntax:
        
       grep "REGEX" filename

This is a very powerful feature, if you can use use regular expression effectively. In the following example, it searches for all the pattern that starts with “lines” and ends with “empty” with anything in-between. i.e To search “lines[anything in-between]empty” in the demo_file.
Example:

        $ grep "lines.*empty" demo_file
        Two lines above this line is empty.

From documentation of grep: A regular expression may be followed by one of several repetition operators:

-> ? The preceding item is optional and matched at most once.
-> * The preceding item will be matched zero or more times.
-> + The preceding item will be matched one or more times.
-> {n} The preceding item is matched exactly n times.
-> {n,} The preceding item is matched n or more times.
-> {,m} The preceding item is matched at most m times.
-> {n,m} The preceding item is matched at least n times, but not more than m times.

##### Highlighting the search using GREP_OPTIONS

As grep prints out lines from the file by the pattern / string you had given, if you wanted it to highlight which part matches the line, then you need to follow the following way.

When you do the following export you will get the highlighting of the matched searches. In the following example, it will highlight all the this when you set the GREP_OPTIONS environment variable as shown below.

    $ export GREP_OPTIONS='--color=auto' GREP_COLOR='100;8'
    
    $ grep this demo_file
    this line is the 1st lower case line in this file.
    Two lines above this line is empty.
    And this is the last line.


### AWK Command

AWK is mostly used for data extraction and reporting (dealing with .csv files).

Awk is a scripting language used for manipulating data and generating reports.The awk command programming language requires no compiling, and allows the user to use variables, numeric functions, string functions, and logical operators. Awk is a utility that enables a programmer to write tiny but effective programs in the form of statements that define text patterns that are to be searched for in each line of a document and the action that is to be taken when a match is found within a line. Awk is mostly used for pattern scanning and processing. It searches one or more files to see if they contain lines that matches with the specified patterns and then performs the associated actions.

Each awk procedure can be divided into three sections:

    BEGIN { ... initialization awk commands ...}
    { ... awk commands for each line of the file ...}
    END { ... finalization awk commands ...}

Control flow:

    if (condition) statement [ else statement ]
    while (condition) statement
    do statement while (condition)
    for (expr1; expr2; expr3) statement
    for (var in array) statement
    break
    continue
    exit [ expression ]

WHAT CAN WE DO WITH AWK ?

1. AWK Operations: 
(a) Scans a file line by line 
(b) Splits each input line into fields 
(c) Compares input line/fields to pattern 
(d) Performs action(s) on matched lines

2. Useful For: 
(a) Transform data files 
(b) Produce formatted reports

3.Programming Constructs: 
(a) Format output lines 
(b) Arithmetic and string operations 
(c) Conditionals and loops

AWK command looks like as:

    awk options 'selection _criteria {action }' input-file > output-file

##### Built-in variables

    Variable	Meaning
    $0	        Current line
    $1 - $n	    The nth field
    FS	        Input field separator, default value is “ “
    NF	        The number of fields/columns
    NR	        The number of records/rows
    FNR	        The number of records relative to the current input file
    OFS	        The output field separator, default value is “ “
    ORS	        The output record separator, default value is “\n”

##### Usage

Typical use

    #print 1st and 4th column
    awk '{print $1, $4}' file.txt

    #same with 'cat file.txt'
    awk '{print $0}' file.txt
    
    -F: Set input field sparator
    #print 1st and 4th column separated by ':'
    awk -F: '{print $1, $4}' file.txt
    #or
    awk 'BEGIN {FS = ":"} {print $1, $4}' file.txt
    
##### Pattern matching
    
    #print 2nd column when 1st field is precisely 'test'
    awk '$1 == "test" { print $2 }' file.txt

    #print 2nd column when 1st field contains 'test'
    awk '$1 ~ /test/ { print $2 }' file.txt
    
    #print 2nd column when 1st field DOES NOT contain 'test'
    awk '$1 !~ /test/ { print $2 }' file.txt

    #print 2nd column when this record contains 'test'
    awk '/test/ { print $2 }' file.txt

    #print 2nd column when this record DOES NOT contain 'test'
    awk '! /test/ { print $2 }' file.txt
    In-place editing: -i (GNU awk 4.1.0 or later…)

##### Splitting a Line Into Fields 
For each record i.e line, the awk command splits the record delimited by whitespace character by default and stores it in the $n variables. If the line has 4 words, it will be stored in $1, $2, $3 and $4 respectively. Also, $0 represents the whole line.

    $ awk '{print $1,$4}' emp.txt 
Output:
    
    ajay 45000 
    sunil 25000 
    varun 50000 
    amit 47000 
    tarun 15000 
    deepak 23000 
    sunil 13000 
    satvik 80000 
    
In the above example, $1 and $4 represents Name and Salary fields respectively.

##### Print the lines which matches with the given pattern
Command:

    $ awk '/manager/ {print}' emp.txt 
Output:

    ajay manager account 45000 
    varun manager sales 50000 
    amit manager account 47000 

In the above example, the awk command prints all the line which matches with the ‘manager’.


#### Difference between sed, awk and grep

Awk is a programming language that is strictly focused on pattern matching and reporting from text files. GNU awk has taken things to a whole new level. Learning awk is mostly good for historical value and working on old code.

Grep is mainly useful for searching for text within text files or input. Grep is mostly useful at the command line or in shell scripts.

Sed is much more powerful than most people realize, and can do a lot.There are two main uses of sed. First is to modify output from commands and the second is to mass edit files.  
    
### Conclusion

In this blog, we have looked into awk, sed and grep command and how to use it. So it is fairly easy to use these commands. I think the above use case give an idea about how to use this command.


    


    



