## Immutable objects in python
### Strings in pyhton.
string in pyhton are immutable i.e when we ever want to modify a string then the var of that string will point toward to new memory location, hence the new memory is 
assigned to the same variable.
Also some of the other immutable objects are : integer, tuple, float, bool, frozenset, string.

###### Immutability on tuples is only partly true. The tuple itself cannot be modified, but objects referenced by the tuple can be modified. 
If the tuple has an immutable field like a string, then the tuple cannot be modified and it is sometimes called “non-transitive immutability.” 
But a mutable field like a list can be edited, even if it’s embedded in the “immutable” tuple.


## Mutable objects in python
In python there are several mutable objects like list, dictonary and set.
we can modify these objects on the same memory reference.

#### Why do mutable and immutable objects matter and how differently does Python treat them?
Numbers, strings, and tuples are immutable. Lists, dictionaries, and sets are mutable, as are most new objects you’ll code with classes.
Immutability may be used to ensure that an object remains constant throughout your program. The values of mutable objects can be changed at any time and place, whether you expect it or not.
You can change a single value of a mutable data type and it won’t change its memory address. However, you can’t change a single value of an immutable type. It will throw an error.
