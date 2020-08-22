# 1.NANO
-> GNU nano is a friendly and convenient text editor like vi and emac. 
   It offers many other extra features like word searching, replacing, jump to a line or column, filename tab completion, auto-indentation, etc.
   Nano is a clone of the pico text editor. Nano is not pre-installed in all distros, but Ubuntu has it.
   so we can simple open nano editor by typing commands -> nano [filename]
   
   Sometimes, you may need to open a file and go at exact line or column. Nano allows you to do this with:
   -> nano +line,columns file
   Search with regular expressions – press M-R (Alt + R keys) and input your search with the regular expressions you wish to use.
  1. Go to line – press ^T (Ctrl + T) followed by the line to which you want to move the cursor to.
  2. Replace text – press ^R (Ctrl +T) in search mode, or ^\ in regular mode. You will be asked to enter your search, after pressing Enter, you will be asked to input the text which will be used for the replacement. Finally you will be asked if you wish to replace a matched instance of your search, or all matches. If you choose “No”, the cursor will be moved towards the next match.
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


      
      
       


