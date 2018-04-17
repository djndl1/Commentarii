# Think Python

## The way of the program

```python
** # exponentiation
^ # XOR
type # gives the type    
# / and //    
string1 + string2# string concatenation
string*n# repeat a string n times    
```

Syntax: tokens and structure

\inSyntax error, runtime error(exceptions), semantic error(does not do the right thing)

## Functions

```python
import math
math.pi
math.sqrt

# Define a new function
def function_header():
    function_body
```

dot notation

## Strings

A string is a sequence. 

```python
len()# returns the number of characters in a string
s[0:5]   s[:5] s[3:]
in # operator: a boolean operator that takes two strings and returns True if appears as a substring in second
    
```

Strings are immutable, not able to change by assigning directly

__Invocation__: a method call

## Lists

\in A list is a sequence of values(elements/items)

Lists are mutable

```python
a=[1,2,3]
b=[4,5,6]
c=a+b
c
[1,2,3,4,5,6]
[0]*4
[0,0,0,0]
l.append()
l.extend()
l.sort()
l.pop()
list() # converts to a list
s.split() 
del
```

If a refers to an object and you assign b = a, then both variables refer to the same object.

## Dictionaries

A dictionary is a mapping: key-value pair/association

```python
dict() # creates a dictionary
eng2sp['one']='uno'
eng2sp = {'one': 'uno', 'two': 'dos', 'three': 'tres'}
dict.values()
dict.items()
```

## Tuples

Tuples are immutable

```python
t = 'a', 'b', 'c', 'd', 'e'
t = ('a', 'b', 'c', 'd', 'e')
# To create a tuple with a single element, you have to include a final comma
t = tuple()
```

Because tuples are immutable, you can’t modify the elements. But you can replace one tuple with another.

```python
t = ('A',) + t[1:]
a, b = b, a
```

Strictly speaking, a function can only return one value, but if the value is a tuple, the effect is the same as returning multiple values.

```python
def min_max(t):
return min(t), max(t)
```

Functions can take a variable number of arguments. A parameter name that begins with * gathers arguments into a tuple. 

```
def printall(*args):
print(args)
```

The complement of gather is **scatter**. If you have a sequence of values and you want to pass it to a function as multiple arguments, you can use the * operator.

```
t = (7, 3)
divmod(*t)
(2, 1)
```

zip is a built-in function that takes two or more sequences and returns a list of tuples where each tuple contains one element from each sequence. 

use a list of tuples to initialize a new dictionary

## Files

```python
fout = open('output.txt','w')
#  If the file doesn’t exist, a new one is created.
line1 = "This here's the wattle,\n"
fout.write(line1)
fout.close()
'.... %d ....' % a # format operator
import os # the os module
os.getcwd()
os.listdir()
os.path.exists()
os.path.isfile()

try:
    statements
except:
    statements
    
import dbm # database   
import pickle # translates almost any type ofobjects into a string suitable for storage in a database.
os.popen()
```



