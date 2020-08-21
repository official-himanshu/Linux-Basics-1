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
    
#2. vim editor
Vim is a powerful text editor used in CLI (command line interface). Linux uses a lot of configuration files, you'll often need to edit them and vim is a great tool to do so.
Alternatives to vim are the command-line editor's nano and joe.


