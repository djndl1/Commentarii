# Mathematica: A Problem Centered Approach

## 1. Introduction

```mathematica
Block[
    {$MaxExtraPrecision=500},
    statement
]

Parametric[]: plots the graph of the function dependent on other parameters
ContourPlot[]: Find all the points which satisfy the equation
PlotPoints->: may be added to create a finer, more detailed plot
RevolutionPlot3D{}: rotate a function around a axis
```

###### Handling Data

```mathematica
Table[]: 
TableView[]: view in a table
TableForm[]
Export[]: export the data
```

$\quad\quad$*Mathematica* provides built-in functions to access data on U.S. and other stocks, mutual funds and other financial instruments, as well as indices, and currency exchange rates.*Mathematica* provides built-in functions to access data on U.S. and other stocks, mutual funds and other financial instruments, as well as indices, and currency exchange rates.

###### LInear Algebra

```mathematica
/.: ReplaceAll
Show[]: 
MatrixForm
@:Prefix
//:Postfix
/@:Map
```

###### Calculus

```mathematica
D[]
FullSimplify[]
Integrate[]
Exclusions: is an option that specifies where to exclude in regions used by functions like Plot, Plot3D, and NIntegrate.
Nintegrate[]: gives a number approximation to the integral
```

##2. Basics

$\quad\quad$*Mathematica* is not approaching the expressions numerically.

```mathematica
?Command ??Command
TrigExpand[]: expands out trigonometric functions
E^ instead Exp[] is much handier.
(* comment *)
%: previous output
%%: the second previous output and so on
n!
FactorInteger[]
Prime[]: produces the n-th prime number
NextPrime[]: gives the next prime larger
(*the set of prime numbers is infinite*)
PrimePi[]: gives the number of primes \[Pi](x) less than or equal to x
LCM[]: least common multiple
Mod[m,n]: gives the remainder on division of m by n
Quotient[m,n]: m=qn+r, finds q
Binomial[]
Alt+: stops the evaluation or Quit Kernel
Together[expr]: puts terms in a sum over a common denominator, and cancels factors in the result. 
Apart[]: the inverse of Together
TrigExpand[]
TrigFactor[]
Degree: Sin[30 Degree]
(*In Mathematica, the underscore is reserved and will be used in the definition of functions*)
Clear[]: clear a variable
Clear["Global`*"]: clear all values and definitions
(*Assigning a value to a symbol works globally. That means, if you open a new NoteBook, the values given to variables in a previous NoteBook still exist.*)
```

###### Dynamic Variables

```mathematica
Dynamic[x]
Slider[]
Manipulate[]
```

## 3. Defining functions

###### Formulas as functions

```mathematica
f[n_]:=n^2+4
Fibonacci[n]
Binomial[n,m]
Divisible[]
f[x_,y_]:=Sqrt[x^2+y^2]
```

One can define functions with pre-defined (default) values.

```mathematica
f[x_:1]:=Sqrt[x]
```

###### Anonymous functions

$\quad\quad$ Define a function as we go without giving it a name.

```mathematica
#(#+1)&[4]
18 // 2^2 # + # &
```

## 4. Lists

```mathematica
p = {x, 1, -8/3, a, b, {c, d, e}, radio}
p[[-2, {2, 3}]]
{d, e}
;; (*List Slicing*)
[[All]] = [[;;]]
Most[]: gives expr with the last element removed. 
Rest[]: gives expr with the first element removed. 
Level[]: track and access the different levels of a list
TreeForm[]
Depth[]: gives the depth of the list
Append[]; Prepend[]; Insert[];RotateLeft[];RotateRight[];
Print[]

```

Many of *Mathematica*’s built-in functions have the property that they simply “go inside” a  list. A function with this property is said to be *listable*. 

All the arithmetic functions are listable.

```mathematica
1+ {a, b, c, d, e}
{1 + a, 1 + b, 1 + c, 1 + d, 1 + e}

{a, b, c, d, e}^3
{a^3, b^3, c^3, d^3, e^3}

1/{a, b, c, d, e}
{1/a, 1/b, 1/c, 1/d, 1/e}

Nest[f,expr,n] gives an expression with f applied n times to expr
CharacterRange[]
DictionaryLookup[patt]: finds all words in an English dictionary that match the string pattern patt
Count[list,pattern] gives the number of elements in list that match pattern
OddQ[]; PrimeQ[]; IntegerQ[]
Position[expr,pattern] gives a list of the positions at which objects matching pattern appear in expr
Pick[list,sel] picks out those elements of list for which the corresponding element of sel is True.
FromDigits[]
The function Divisors[n] gives all the positive numbers which divide n.
```

