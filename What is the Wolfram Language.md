# An Elementary Introduction to the Wolfram Language

## What is the Wolfram Language

It's _knowledge based_.

## Practicalities of Using the Wolfram Language

`shfit + return`  to finish the input.

### Fundamentals

```mathematica
Min[]
Max[]
```

$\quad\quad$ Lists can contain anything, including graphics.

```mathematica
ListPlot[]
Range[]: a function that makes a list of numbers = a:b:c in matlab
Reverse[]: reverses the elements in a list
Join[]: joins lists together
ListLinePlot[]: plots a list and joining them up
BarChart[]
PieChart[]
NumberLinePlot[]: plot numbers in a number line
Column[]: make a lsit in a column
```

$\quad\quad$ Do arithmetic with lists

```mathematica
{1, 2, 3} + 10  
{1, 1 ,2} * {1, 2, 3} 
Range[10]^2
which are all entry-wise
Sort[]
Length[]
Total[] = sum up
Count[]: counts the frequency
First[]; Last[]; Part[]: give out a member of the list
IntegerDigits[]: break a number into a list of digits
Take[]: takes the first a few members of a list
Drop[]: drops the last several members of a list
Table[]: build up vectors, matrices, tensors, and other arrays. 
RandomInteger[]
{Red, Green, Blue, Purple, Orange, Black}
ColorNegate[]
Blend[]: blends colors
RGBColor[]
Hue[]
RandomColor[]
Style[]: displays with expr formatted using the specified option settings
Graphics[]
Graphics3D[]
```

##### Interactive manipulation

```mathematica
Manipulate[]
```

##### Images

```mathematica
CurrentImage[]: Get the current image from your computer's camera
ColorNegate[]
Blur[]
ImageCollage[]
DominantColors[]
Binarize[]
EdgeDetect[]
ImageAdd[]
```

##### Strings and Text

```mathematica
"A string"
StringLength[]
StringReverse[]
ToUpperCase[]
StringTake[]:  takes a certain number of characters from the beginning of a string
StringJoin[]
Charactersp[]: breaks a string into a list of its characters
WikipediaData[]
TextSentences[]:  breaks a text string into a list of sentences
WordCloud[]
IntegerName[]
LetterNumber[]
Transliterate[]
```

Sound

```mathematica
SoundNote[]: corresponds to MIDI sound
Speak[]
Beep[]
```

Arrays

```mathematica
Grid[]
ArrayPlot[]
RandomColor[]
Rasterize[]
```

Paris of coordinates are represented as `{x, y}`

#### Real-World Data

[Wolfram Knowledgebase](http://www.wolfram.com/knowledgebase/)

```mathematica
Ctrl + =
EntityValue[]
InputForm[]
UnitConvert[]
CurrencyConvert[]
Rotate[]
```

Graph and Network

```mathematica
Graph[]
FindShortestPath[]
UndirectedGraph[]
```

More about numbers

```mathematica
Prime[]
Precision can be speficied.
```

Visualization

```mathematica
Histogram[]
ListPlot3D[]
ListContourPlot[]
ReliefPlot[]
```

Function

```mathematica
f@x
x//f
Framed[]: display x framed
/@: apply to each element
f/@{1,2,3} = {f[1], f[2], f[3]}
#...&: Blur[#,5]&/@{circle1, circle2, circle3}
f[#, a]&@x = f[#, a]@[x]
&: signifies what comes before it is the body of the pure function
->
Array[f,10]
#1,#2
```

Pure functions are a characteristic feature of functional programming. They're often called lambda expressions

Applying Functions repeatedly

```mathematica
Nestlist[]
Nest[]
NestGraph[]
```

Rearranging Lists

```mathematica
Transpose[{{1, 2}, {3, 4}, {5, 6}, {7, 8}, {9, 10}}]
{{1, 3, 5, 7, 9}, {2, 4, 6, 8, 10}}

Thread[]:generating input to Graph
Partition[]: takes a list, and partitions it into blocks of a specified size
Split[]: Splits a list into sequences of successive identical elements
Gather[]: gathers identical elements together in lists
SortBy[]: sorts according to the result of applying function
Riffle[]: inserts things between successive elements of a list
Permutations[]: permutations of a list
Subsets[]: gives the power set
Tuples[]: generates all possible combinations of a given number of those elements
RandomChoice[]: lets you make a random choice from a lsit of elements
RandomSample[]: never picking any particular elements more than once
Flatten[]: unravels lsits, effectively just deleting inner braces
```

Parts of Lists

```mathematica
Part[]:pick out elements from a list
[[#1, #2]]
negative part numbers count from the end of a list
[[2;;5]]: a span
Position[]: gives the position of an element in a list
ReplacePart[]: can replace with Nothing
TakeLargest[]
TakeSmallest[]
```

###### Pattern

$\quad\quad$a fundamental concept in the language

```mathematica
_: blank stands for anything
MatchQ[]: test one thing at a time against a pattern
Cases[]:gives a list of the Subscript[e, i] that match the pattern. 
a|b: either a or b, different from a||b, which is a logic construct
__:double blank indicates any sequence of things
/.: slash dot performs a replacment
{x_,x_}: two elements being the same
x_: named pattern
a->b: rule
```

######Expressions and their structure

__Atoms__: _numbers_, _strings_, _symbols_, as the ultimate building blocks of _symbolic expressions_

```mathematica
TreeForm[]: gives the structure of an expression in a tree
@@:replaces the head of the list with f
->/Rule[]: generate a rule
@@@: f @@@ {{1, 2, 3}, {4, 5, 6}}
```

_Head_ and _arguments_ : every part of an expression has a head, even its atoms

$\quad\quad$The basic concept of symbolic languages comes directly from work in mathematical logic stretching back to the 1930s and before, but other than in the Wolfram Language it's been very rare for it to be implemented in practice.

$\quad\quad$Wolfram Language expressions are a bit like XML expressions (and can be converted to and from them). But unlike XML expressions, Wolfram Language expressions can evaluate so that they automatically change their structure.

###### Associations

$\quad\quad$Associations are a kind of generalization of lists, in which every element has a key as well as a value.

```mathematica
/@: applies a function to each value in the association
Normal[]: turns an association into a normal list
```

