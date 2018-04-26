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
FactorInteger[]
MemberQ[]
Short[]: displays a short form of a list
ReadList[]
MapIndexed[]
```

## 5. Changing Heads

$\quad\quad$Any expression in _Mathematica_ has the following presentation `head[arg1, arg2,...,argn`， where `head` and `arg` could be expressions themselves. _Mathematica_ gives us the ability to replace the head of an expression with another head, done by `Apply`, of which shorthand is `@@`.

$\quad\quad$To replace the head of the other layers of a list, one can specify the levels
in the Apply.

```mathematica
Apply[f, {{a, b}, {c}, {d, e}}, 1]
{f[a, b], f[c], f[d, e]}

p[n_]:=Times@@Table[1+x^i,{i,1,n,1}]
Divisors[]: gives the divisors of a number, including itself
FactorInteger[]
FreeQ[expr,form] yields True if no subexpression in expr matches form, and yields False otherwiseFreeQ[expr,form]: True if 

Excercise 5.3
fac[n_] := First /@ FactorInteger[n]
ind[n_] := Last /@ FactorInteger[n]
pridec[n_] := ! MemberQ[PrimeQ /@ fac[n], False]
produ[n_] := (Plus @@ Times @@@ FactorInteger[n]) == n
Select[Range[100], pridec[#] && produ[#] &]

Exercise 5.7
ProDiv[n_] := Most[Divisors[n]]
ProPowSet[s_] := Rest[Most[Subsets[s]]]
Condi1[n_] := Apply[Plus, ProDiv[n]] > n
Condi2[n_] := ! 
  MemberQ[Equal[n, #] & /@ (Plus @@@ ProPowSet[ProDiv[n]]), True]
```

## 6. A bit of logic and set theory

$\quad\quad$Mathematica echoes back the expressions that she can’t evaluate (e.g., `x==5`).  If you want Mathematica to judge from the face value, then use `===`.

$\quad\quad$In Mathematica, for a variable, one can specify certain domains. This
means that the variable takes its values from a specific type of data.
The domains available are Algebraics, Booleans, Complexes, Integers,
Primes, Rationals and Reals. 

```mathematica
[Esc]el[Esc] or \[Element]/Element[]
```

$\quad\quad$Mathematica provides the logical quantifiers ∀, ∃ and ⇒ with `ForAl`,`` Exist``
and`` Implies`` commands. But these seem not to be that powerful yet. 

$\quad\quad$If one wants to get rid of duplications in a list, 

```mathematica
Union[{a,b,b,a}]
{a,b}
Union[]:[Esc]un[Esc],\[Union]
Intersection[]:[Esc]inter[Esc] or \[Intersection]
Complement[eall, e1, e2, ... ] gives the elements in eall which are not in any of the ei.
Append[{a,b,c},d]
{a,b,c,d}
AppendTo[s,elem] is equivalent to s = Append[s,elem]
Tally[list] tallies the elements in list, listing all distinct elements together with their multiplicities.
 If[stat,this,that] where stat is a Boolean expression, i.e., has the value of True or False, will execute this if the stat value is True and that otherwise. 
 Which
 (* If and Which can be used to define piecewise functions*)
 PiecewiseExpand[]
 Piecewise[]
```

Defining the function using `Which` makes Mathematica consider this function as a continuous function.  

## 7. Sums and Products

$\quad\quad$`Sum` and `Product` and their numerical versions `NSum`, `NProduct`

##8. Loops and Repetitions

```matlab
Do[]
```

## 9. Substitution, Mathematica rules

```mathematica
x+y/. x->2
Solve[]
Range[5] * x /. Times -> Power
expr///.rules: ReplaceRepeated, MaxIterations->
```

## 13. Linear Algebra

$\quad\quad$One can generate a matrix by using `Array`

```mathematica
Array[Subscript[x, #1, #2] &, {4, 4}] // MatrixFormH
```

