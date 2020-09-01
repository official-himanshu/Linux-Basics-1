#### How to run a script in debug mode?
Ans:- We can use following methods.
1. while executing your script run as:
          ->bash -x <script-name>
          
2. we can also include "set +x" within the script.


#### Write script to check memory usage of my system.
Ans:- please visit for answer: https://github.com/official-himanshu/Linux-Basics-1/blob/master/Scripts/freespacecheck.sh

#### Methods to iterate a loop using user input.
Ans: We can use c-type loop in bash but it is not executing in shell as its syntax are different.
     We also can use a for-in loop with "seq" like:
     
      for i in $(seq 1 ${a}); do
      
      
