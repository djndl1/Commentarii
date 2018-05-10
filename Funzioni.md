- datestr
- disp
- angle
- round
- floor
- ceil
- num2str
- transpose
- .'
- prod
- nan (useful for representing uninitialized variables)
- linspace
- logspace

matrix indexing by linear indices
A([1 5 3],[1 4])

- find
- ind2sub
- sub2ind
- doc
- edit

$\qquad$ Matlab functions can take a variable number of inputs and return a variable number of outputs  

- all

- any

- xor


- nargin/nargout
- semilogx/semilogy
- loglog
- axis
- xlim/ylim/zlim
- close
- reshape
- imagesc
- colorbar
- caxis
- colormap
- customize colormap
- surf
- meshgrid
- shading
- contour
- mesh
- polar: polar plots
- bar: bar graphs
- quiver: add velocity vectors
- stairs: piecewise constant functions
- fill
- doc specgraph

vectorized code is more efficient for MATLAB (avoid loops)

- roots
- poly
- polyval
- polyfit
- fzero
- fminbnd
- fminserach
- x=fzero(@(x)(cos(exp(x))+x^2-1), 1 );
- linprog 
- quadprog
- fmincon
- diff
- cumsum
- gradient
- quad
- trapz
- ode23
- ode45
- ode15s
- interp2
- A(:)
- mod, rem
- mean
- median
- mode: most frequent values in array
- hist
- histc
- bar
- rand
- randn
- random
- cell
- struct
- gca
- gcf
- get
- set
- imread
- imwrite
- pause
- xdata
- ydata
- getframe
- movie
- movie2avi
- frame2im
- rgb2ind

use disp to debug

- strcat
- tic/toc

- whos

- diary

- pwd

- cd

- what: List MATLAB files in folder

- delete

- type: Display contents of file
- system: execute system command

File Exchange window

relation operators A>2
use 1i/1j instead of the imaginary unit

- strcmp
- strcmpi
- str2double
- str2num
- sscanf
- str2double

1.9:5.1 =  1.9000    2.9000    3.9000    4.9000
$\qquad$ If you want specific control over how many terms are in the sequence, use linspace instead of the colon operator. 
You can delete rows or columns of a matrix by assigning the empty matrix ([]) to them. 
You can also assign a scalar to all entries of a submatrix

- triu/tril
- gallery
- reset(RandStream.getDefaultStream)
- randi(random integer)
- isempty
- rosser
- atan2
- log2
- conj
- sign
- sort
- any
- all
- std: standard deviation
- mode
- eig/eigs
- svd/svds
- chol
- cond/condest
- kron
- linsolve( does not work on sparse matrices) and struct opts

logical indexing: Merely creating a matrix with 1’s and 0’s does not make it a logical array. You must convert it into a logical array with S~=0, or logical(S).

- repmat: REPlicate MATrix
- bsxfun, row equilibration using bsxfun(@ldivide, max(abs(A),[],2),A): `C = bsxfun(fun,A,B)` applies the element-by-element binary operation specified by the function handle `fun` to arrays `A` and `B`, with singleton expansion enabled. 
- sprintf

debug: return

- global

%{ %} block comments, not printed by the help or doc commands
%% code cell, which can be executed by themselves

- pathtool
- which
- what: List MATLAB-specific files in directory.

for i = 1:inf(infinite loop)
switch ... case... (otherwise)... end. case{2, 4, 6, ,8}(either is matched, then executed)

### try/catch statement

```matlab
try
	statements
catch ME
	error handling statements
	rethrow(ME)
end
```

e.g.

```matlab
try
	A = load('my.txt');
catch
	disp('could not find');
	A = magic(5);
end	
```

$\qquad$ A matrix expression is interpreted by if and while to be true if every entry of the matrix expression is nonzero.
```matlab
if A ~= B
	disp(’not what you think’)
end
```
does not give what is intended because the statement would execute only if each of the corresponding entries of A and B differ. two any can be used instead
`all(all(A==B))`
`isequal`

cell: `{}`
struct: struct.property `s2.c.d`

set: `ismember, intersect, union, setdiff, unique, setxor, issorted`  
$\qquad$A matrix represents a set with each row being a single element. Character arrays represent sets of strings, all of the same length. For sets of strings with different lengths, use a cell array of strings.  

$\qquad$ The default data type is double, a 64-bit IEEE floating-point number. The single type is a 32-bit IEEE floating-point number which should be used only if you are desperate for memory.   

$\qquad$ use `cat` to build multi-dimensional arrays,cat(3,A,B)  

$\qquad$ object: a specialized struct with fields that cannot change unless you change a file that defines the object
The classdef file specifies everything you can do with or to the object (these are called *methods*).  

```matlab
classdef ...
	properties
		...;
	end
	methods
		function ... end
		function ... end
		...
	end
end
```
the concept of the method constructor

$\qquad$ As an alternative to placing all methods in a single file (as in the factor1.m example), you can create a folder name that begins with @, such as @factor1. The parent folder of @factor1 must be on your MATLAB path. Put your factor1.m file inside @factor1. Remove the `mldivide` and `maxdiag` functions and place them in files called *mldivide.m* and *maxdiag.m* in the @factor1 folder. The two techniques specify the same class, just with a different file and folder structure. Using an @folder is helpful if your methods involve a lot of code.  

$\qquad$ If you have multiple properties with different attributes, simply include multiple properties blocks in the class definition.  

- str2func

$\qquad$ Some MATLAB functions that operate on function handles need to evaluate the function on a vector, so it is often better to define an anonymous function (or M-file) so that it can operate entry-wise on scalars, vectors, or matrices. 
One advantage of anonymous functions is that they can implicitly refer to variables in the workspace or the calling function without having to use the global statement.  

- func2str()
- which: name resolution
- warning
- input
- keyboard: KEYBOARD Invoke keyboard from M-file.

```matlab
s = whos; space = sum([s.bytes])
```

- memory
- dependency report
- profiler viewer
- gtext
- meshz
- surfc
- surfl
- isosurface
- clf
- uicontrol
- callback
- spy

18. ### Sparse Matrix

$\qquad$ only double or logical vectors or two-dimensional arrays can be stored in the sparse mode  

$\qquad$ An m-by-n sparse matrix is stored as a set of sparse colums, where each column is represented as a packed list of nonzero values and their row indices.  
$\qquad$ if you must operate on the rows of a sparse matrix A, compute the transpose.  
$\qquad$ sparse(), spdiags(), speye(), sprand(), spones()

19. ### Symbolic Math

   syms ... real/integer/positive/rational
   symbolic computations are handled by a separate symbolic engine call MuPAD
   
syms x clear;

- reset(symengine)

- sym('log(2)')

- diff

- pretty: displays a symbolic expression in an easier-to-read form

- latex()

- ccode()

- fortran()

- int()

- vpa()

- limit()

- taylor()

- simplify()

- vpa()

- digits()

- subs()

- factor(): applied to a numeric or symbolic interger argument to compute the prime factorization of the integer

- expand()

- horner()

- fplot()

- ezpolar()

- funtool()

- ezcontour()

- ezcontourf()

- ezmesh()

- ezmeshc()

- ezsurf()

- ezsurfc()

- colspace()

- poly()

- charpoly()

- jordan()

- solve()

- null()

$\qquad$ The solve function cannot solve all equations. It does well with low-degree polynomial equations, but can have difficulty with trigonometric or other transcendental equations. If an exact symbolic solution is found, you can convert it to a floating-point solution via double. If an exact symbolic solution cannot be found, then a variable precision one is computed.   

  $\qquad$ The output of solve is in alphabetical order. 

- dsolve()
- mupadwelcome

### 20. Polynomials, Interpolation and Integration

- pchip()
- spline()
- ppval

#### 20. Numeric Integration (quadrature)

- quad

- quadl 


### 21. Solving Equations

- fzero() finds a numerical solution to $f(x)=0$

- dde23() for delay differential equations

- bvp4c() for boundary value ODE problems

- pdepe() and pdeval() for PDE

### 22. Displaying Results

- fprint() : can print matrices.
- fopen(): opens a file. fclose(): close a file
- sprintf(): sends its output to a string

### 23. Cell Publishing

$\qquad$ Cell publishing creates nicely formatted reports of Matlab code, Command Window text output, figures, and graphics in HTML, LaTeX, PDF or XML.  
$\qquad$ The term cell publishing has nothing to do with the cell array data type. In this context, a cell is a section of an M-file that corresponds to a section of your report. A cell starts with a cell divider, which is a comment with two percent signs at the beginning of a line, and ends either at the start of the next cell, or the end of the M-file. Cell publishing is normally done via scripts, not functions.  

- publish()
- web()

### Apendix

- exist(): determines if a variable, file, folder, or class exists.
- copyfile(): makes a copy of a file
- isdir(): test whether a string refers to a folder
- matlabroot(): lists the folder where MATLAB is installed
- ispc(): tests if your computer is running MS Windows
- fileparts(): extracts the components of a filename and its path
- filesep(): returns the file separator ('\' on MS, '/' on Linux)
- fullfile(): constructs the full filename (with its entire path) from a list of folders and a base filename.
- uigetdir(); uigetfile(); uiputfile(): displays a dialog box for ...
- fgetl(): reads a line from a text file, discarding newline characters.
- fgets(): reads a line from a text file, keeping newline characters.
- feof(): tests if the end-of-file has been reached.
- fread(): reads data from a binary file. With the file from the fwrite example below, try f=fopen(’a.bin’,’r’); C=fread(f,’double’);, and compare with A(:).
- fscan(): reads formatted data from a text file, with a format string similar to the one used by `fprintf`.
- fseek(): moves to a specified position in a file, where the next fread or fwrite will take place
- ftell(): returns the current position in a file, as the number of bytes from the beginning of the file.
- textscan(): reads formatted data from a text file or string.
- wavread(): reads an audio signal from a .wav file.
- sound(): plays audio from a signal