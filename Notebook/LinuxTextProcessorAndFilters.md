# 1.NANO
-> GNU nano is a friendly and convenient text editor like vi and emac. 
   It offers many other extra features like word searching, replacing, jump to a line or column, filename tab completion, auto-indentation, etc.
   Nano is a clone of the pico text editor. Nano is not pre-installed in all distros, but Ubuntu has it.
   so we can simple open nano editor by typing commands -> nano [filename]
   
   Sometimes, you may need to open a file and go at exact line or column. Nano allows you to do this with:
   -> nano +line,columns file
   Search with regular expressions – press M-R (Alt + R keys) and input your search with the regular expressions you wish to use.
  1. Go to line – press ^T (Ctrl + T) followed by the line to which you want to move the cursor to.
  2. Replace text – press ^R (Ctrl + R) in search mode, or ^\ in regular mode. You will be asked to enter your search, after pressing Enter, you will be asked to input the text which will be used for the replacement. Finally you will be asked if you wish to replace a matched instance of your search, or all matches. If you choose “No”, the cursor will be moved towards the next match.
  3. Go to first line – press ^Y (Ctrl + Y).
  4. Go to last line – press ^V (Ctrl +V).
  5. save using line - press ^O (Ctrl+O).
  
  Nano’s interface is very similar to a GUI text editors. If you wish to copy or cut a text in GUI editor, you will first have to select it. Same thing goes in nano. To mark a text press Ctrl + ^ then move the cursors with the arrow keys.

    1. To copy the marked text press Alt + ^.
    2. To cut the marked text press ^K (Ctrl +K).
    3. To paste the marked text, move the cursor to a suitable position and press ^U (Ctrl + U).
    
# 2. vim editor
Vim is a powerful text editor used in CLI (command line interface). Linux uses a lot of configuration files, you'll often need to edit them and vim is a great tool to do so.
Alternatives to vim are the command-line editor's nano and joe.
Vim is a text editor that is upwards compatible to Vi. It can be used to edit all kinds of plain text. It is especially useful for editing programs.

There are several command we can run in vim editor.

# 3. sed command
   Sed  is a stream editor.  A stream editor is used to perform basic text transformations on an input stream (a file or input from  a  pipeline).
   While  in  some  ways similar to an editor which permits scripted edits (such as ed), sed works by making only one pass over the input(s),  and
   is consequently more efficient.  But it is sed's ability to filter text in a pipeline which particularly distinguishes it from other  types  of
   editors.
        
        GIVING INPUT FILE DIRECTLY
       ->sed [OPTIONS]... {script_only_if_no_other_script} [input-file]...
       
       GIVING INPUT FILE THROUGH PIPELINE
       -> cat [OPTIONS]... [filename]... | sed {{script_only_if_no_other_script} 
       
   -- we can perform several operations on the same file as permanentaly, or temporarily. Temporarily operation done using pipeline to be visible on terminal.
   -- we can also save the changes of file to other file also by just using > option.
   -- we can give operations in the form of regular expression as well.
   
# 4. GREP command
   The grep filter searches a file for a particular pattern of characters, and displays all lines that contain that pattern. The pattern that is searched in the      file is referred to as the regular expression (grep stands for globally search for regular expression and print out).
   Command look like as:-
       grep [OPTIONS] PATTERN [FILE...]
       grep [OPTIONS] -e PATTERN ... [FILE...]
       grep [OPTIONS] -f FILE ... [FILE...]

              
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
      Displaying lines before/after/around the match using grep -A, -B and -C.
      with each such part on a separate output line.
      
# 5. AWK Command
Awk is a scripting language used for manipulating data and generating reports.The awk command programming language requires no compiling, and allows the user to use variables, numeric functions, string functions, and logical operators.
Awk is a utility that enables a programmer to write tiny but effective programs in the form of statements that define text patterns that are to be searched for in each line of a document and the action that is to be taken when a match is found within a line. Awk is mostly used for pattern scanning and processing. It searches one or more files to see if they contain lines that matches with the specified patterns and then performs the associated actions.

WHAT CAN WE DO WITH AWK ?

1. AWK Operations:
(a) Scans a file line by line
(b) Splits each input line into fields
(c) Compares input line/fields to pattern
(d) Performs action(s) on matched lines

2. Useful For:
(a) Transform data files
(b) Produce formatted reports

3. Programming Constructs:
(a) Format output lines
(b) Arithmetic and string operations
(c) Conditionals and loops

About awk programming language:

       Statements  are terminated by newlines, semi-colons or both.  Groups of
       statements such as actions or loop bodies are blocked via { ... } as in
       C.   The  last  statement  in a block doesn't need a terminator.  Blank
       lines have no meaning; an empty statement is terminated  with  a  semi-
       colon.  Long statements can be continued with a backslash, \.  A state‐
       ment can be broken without a backslash after a comma, left  brace,  &&,
       ||,  do,  else, the right parenthesis of an if, while or for statement,
       and the right parenthesis of a function definition.  A  comment  starts
       with # and extends to, but does not include the end of line.

awk command looks like as:

    awk options 'selection _criteria {action }' input-file > output-file

Some of the commands in awk are as follows:

1. PRINT THE FULL FILE LINE BY LINE

       awk '{print}' [input file]
       
In the above example, no pattern is given. So the actions are applicable to all the lines. Action print without any argument prints the whole line by default, so it prints all the lines of the file without failure.

2. Print the lines which matches with the given pattern.

       awk '/<pattern>/{print}' [input file]

In the above example, the awk command prints all the line which matches with the ‘manager’.

3. Splitting a Line Into Fields 

       awk '/{print $fieldnumber, $fieldnumber, ....} [input file]
       
4. NR: NR command keeps a current count of the number of input records. Remember that records are usually lines. Awk command performs the pattern/action statements once for each record in a file.
keyboard_arrow_down
GATEkeyboard_arrow_down
CS Subjectskeyboard_arrow_down
Studentkeyboard_arrow_down
GBlog
Puzzles
What's New ?
▲
du Command in LINUX
df Command in Linux with examples
du command in Linux with examples
df command in Linux with Examples
Sed Command in Linux/Unix with examples
SED command in Linux | Set 2
AWK command in Unix/Linux with examples
grep command in Unix/Linux
Regular Expression in grep
Difference between grep and fgrep command
fgrep command in Linux with examples
egrep command in Linux with examples
SORT command in Linux/Unix with examples
uniq Command in LINUX with examples
tr command in Unix/Linux with examples
cut command in Linux with examples
Paste command in Linux with examples
join Command in Linux
kill command in Linux with Examples
ps command in Linux with Examples
Setting up a C++ Competitive Programming Environment
Dockerizing a simple Django app
Menu driven program for system control using C++
Top 10 Kali Linux Tools For Hacking
Tr0ll 3 Walkthrough of Check the Flag or CTF Problem
User Management in Linux
Linux vs Windows Commands
How to Build Your Own Commands in Linux?
How to Hack WPA/WPA2 WiFi Using Kali Linux?
Finger command in Linux with Examples
AWK command in Unix/Linux with examples
Last Updated: 22-11-2019
Awk is a scripting language used for manipulating data and generating reports.The awk command programming language requires no compiling, and allows the user to use variables, numeric functions, string functions, and logical operators.

Awk is a utility that enables a programmer to write tiny but effective programs in the form of statements that define text patterns that are to be searched for in each line of a document and the action that is to be taken when a match is found within a line. Awk is mostly used for pattern scanning and processing. It searches one or more files to see if they contain lines that matches with the specified patterns and then performs the associated actions.

Awk is abbreviated from the names of the developers – Aho, Weinberger, and Kernighan.

WHAT CAN WE DO WITH AWK ?

1. AWK Operations:
(a) Scans a file line by line
(b) Splits each input line into fields
(c) Compares input line/fields to pattern
(d) Performs action(s) on matched lines



2. Useful For:
(a) Transform data files
(b) Produce formatted reports

3. Programming Constructs:
(a) Format output lines
(b) Arithmetic and string operations
(c) Conditionals and loops

Syntax:

awk options 'selection _criteria {action }' input-file > output-file
Options:

-f program-file : Reads the AWK program source from the file 
                  program-file, instead of from the 
                  first command line argument.
-F fs            : Use fs for the input field separator
Sample Commands

Example:
Consider the following text file as the input file for all cases below.

$cat > employee.txt 
ajay manager account 45000
sunil clerk account 25000
varun manager sales 50000
amit manager account 47000
tarun peon sales 15000
deepak clerk sales 23000
sunil peon sales 13000
satvik director purchase 80000 
1. Default behavior of Awk : By default Awk prints every line of data from the specified file.

$ awk '{print}' employee.txt
Output:



ajay manager account 45000
sunil clerk account 25000
varun manager sales 50000
amit manager account 47000
tarun peon sales 15000
deepak clerk sales 23000
sunil peon sales 13000
satvik director purchase 80000 
In the above example, no pattern is given. So the actions are applicable to all the lines. Action print without any argument prints the whole line by default, so it prints all the lines of the file without failure.

2. Print the lines which matches with the given pattern.

$ awk '/manager/ {print}' employee.txt 
Output:

ajay manager account 45000
varun manager sales 50000
amit manager account 47000 
In the above example, the awk command prints all the line which matches with the ‘manager’.

3. Splitting a Line Into Fields : For each record i.e line, the awk command splits the record delimited by whitespace character by default and stores it in the $n variables. If the line has 4 words, it will be stored in $1, $2, $3 and $4 respectively. Also, $0 represents the whole line.

$ awk '{print $1,$4}' employee.txt 
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

Built In Variables In Awk

Awk’s built-in variables include the field variables—$1, $2, $3, and so on ($0 is the entire line) — that break a line of text into individual words or pieces called fields.

NR: NR command keeps a current count of the number of input records. Remember that records are usually lines. Awk command performs the pattern/action statements once for each record in a file.

NF: NF command keeps a count of the number of fields within the current input record.

FS: FS command contains the field separator character which is used to divide fields on the input line. The default is “white space”, meaning space and tab characters. FS can be reassigned to another character (typically in BEGIN) to change the field separator.

RS: RS command stores the current record separator character. Since, by default, an input line is the input record, the default record separator character is a newline.

OFS: OFS command stores the output field separator, which separates the fields when Awk prints them. The default is a blank space. Whenever print has several parameters separated with commas, it will print the value of OFS in between each parameter.

ORS: ORS command stores the output record separator, which separates the output lines when Awk prints them. The default is a newline character. print automatically outputs the contents of ORS at the end of whatever it is given to print.

##### Awk Preprocessing
If you need to create a title or a header for your result or so. You can use the BEGIN keyword to achieve this. It runs before processing the data:

    $ awk 'BEGIN {print "Report Title"}'
    
Example:

    himanshu@himanshu:~$ awk 'BEGIN {print "The file contents:"}
    > {print $0}' emp.txt
    The file contents:
    ajay manager account 45000
    sunil clerk account 25000
    varun manager sales 50000   
    amit manager account 47000
    tarun peon sales 15000
    deepak clerk sales 23000
    sunil peon sales 13000
    satvik director purchase 80000 
    
##### Awk Postprocessing
To run a script after processing the data, use the END keyword:

    $ awk 'BEGIN {print "The File Contents:"}
    {print $0}
    END {print "File footer"}' myfile

Example:

    himanshu@himanshu:~$ awk 'BEGIN {print "The file contents:"}
    > {print $0}
    > END {print "File Footer"}' emp.txt
    The file contents:
    ajay manager account 45000
    sunil clerk account 25000
    varun manager sales 50000
    amit manager account 47000
    tarun peon sales 15000
    deepak clerk sales 23000
    sunil peon sales 13000
    satvik director purchase 80000 
    File Footer
    
##### More Variables

There are some other variables that help you to get more information:

ARGC     Retrieves the number of passed parameters.

ARGV     Retrieves the command line parameters.

ENVIRON     Array of the shell environment variables and corresponding values.

FILENAME    The file name that is processed by awk.

NF     Fields count of the line being processed.

NR    Retrieves total count of processed records.

FNR     The record which is processed.

IGNORECASE     To ignore the character case.




      
      
       


