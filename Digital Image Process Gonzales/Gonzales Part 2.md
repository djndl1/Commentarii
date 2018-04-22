

# Chap.6 Color Image Processing

__Fullcolor__: acquired with a fullcolor sensor  
__Pseudocolor__: assigned colors to a particular monochrome intensity or range of intensities. 

$\quad\quad$Some of the gray-scale methods are directly applicable to color images.

## 6.1 Color Fundamentals

Intensity for achromatic light  
gray level for black-to-grays-to-white.

_Radiance_ from the source, _luminance_ by the observer, subjective _brightness_

$\quad\quad$It is important to keep in mind that having three specific primary color wavelengths fro the purpose of standardization deos not mean that these three fixed RGB components acting alone can generate all spectrum colors.

Primary colors of light: RGB  
Primary colors of pigments/colorants: magenta, cyan, yellow

$\quad\quad$CRT: array of triangular dot patterns of electron-sensitive phosphor that produce different colors.  In the case of LCD, light filters are used to produce the three primary colors of light.

$\quad\quad$Color characteristics: _brightness_, _hue_ (an attribute associated with the dominant wavelength in a mixture of light waves, like yellow, red, orange), _saturation_ (the relative purity or the amount of white light mixed with a hue).

_Chromaticity_: _Hue_, _saturation_  
[_Tristimulus_](https://en.wikipedia.org/wiki/CIE_1931_color_space#Tristimulus_values)
[CIE chromaticity diagram](https://en.wikipedia.org/wiki/CIE_1931_color_space#CIE_xy_chromaticity_diagram_and_the_CIE_xyY_color_space) 
_color gamut_: a range of colors produced by RGB monitors

## 6.2 Color Models

$\quad\quad$A _color model (color space, color system)_ is a specification of a coordinate system and a subspace within that system where each color is represented by a single point.

###### The RGB Color Model

![52438138232](D:\Documents\GitHub\Commentarii\Digital Image Process Gonzales\1524381382329.png)

_pixel depth_: the number of bits used to represent eahc pixel in RGB space.

216 colors out of the 256 colors are de facto standard for _safe colors_. The safe-color cube has only valid colors on the surface cube.

###### The CMY and CMYK Color Models

$\quad\quad$Most devices that deposit colored pigments on paper such as color printers and copiers, require CMY data input or perform an RGB to CMY conversion.
$$
\pmatrix{C\\M\\ Y}=\pmatrix{1\\1\\1}-\pmatrix{R\\G\\B}
$$
A fourth color, black, combined with C M Y is added.

###### The HSI Color Model

Practical for human interpretation.

_Hue_: the angle by which a point rotates around the black-white axis, from red, through yellow, green, cyan, blue, magenta and back to red.  
_Brightness_ (Intensity): the axis  
_Saturation_: distance from the axis

## 6.3 Pseudocolor Image Processing

$\quad\quad$For human visualization and interpretation. Humans can discern thousands of color shades and intensities, compared to only two dozen or so shades of gray.

###### Intensity Slicing

Gray scale $[0,L-1]$, $P$ planes perpendicular to the intensity axis and $0<P<L-1$, partitioning the gray scale into $P+1$ intervals, $V_1, V_2,...,V_{P+1}$. 
$$
f(x,y)=c_k \quad \text{if}\ f(x,y)\in V_k
$$

###### Intensity to Color Transformations

![52438557042](D:\Documents\GitHub\Commentarii\Digital Image Process Gonzales\1524385570429.png)

E.g. $f_R(x,y)$, $f_G(x,y)$ , $f_B(x,y)$ are sinusoids of different phases.

![52438622724](D:\Documents\GitHub\Commentarii\Digital Image Process Gonzales\1524386227249.png)

Sometimes it is of interest to combine several monochrome images into a single color composite.

# Chap. 9 Morphological Image Processing

_Mathematical morphology_: a tool for extracting image components that are useful in the representation and description of region shape. Tools such as morphology and related concepts are a cornerstone of the mathematical foundation that is utilized for extracting meaning from an image.

## 9.1 Preliminaries

The _reflection_ of a set $B$: $\hat{B}=\{w|w=-b\ for\ b\in B\}$

The _translation_ of a set $B$ by point $z=(z_1,z_2)$, denoted by $(B)_z$: $(B)_z=\{c|c=b+z,\ \text{for}\ b\in B\}$

_structuring elements (SEs)_: small sets or subimages used to probe an image under the study for properties of interest. An operation is on a set is defined using a structuring element.

## 9.2 Erosion and Dilation

###### Erosion

With $A$ and $B$ as sets in $Z^2$ , the _erosion_ of $A$ by $B$, defined as
$$
A\ominus B=\{z|(B)_z\subseteq A\}
$$
or
$$
A\ominus B=\{z|(B)_z\cap A^c=\varnothing \}
$$
Set $B$ is assumed to be a structuring element. We can view _erosion_ as a morphological filtering operation in which image details smaller than the structuring element are filtered.

![52441429067](D:\Documents\GitHub\Commentarii\Digital Image Process Gonzales\1524414290676.png)

###### Dilation

With $A$ and $B$ as sets in $Z^2$ , the _dilation_ of $A$ by $B$, defined as
$$
A\oplus B=\{z|(\hat{B})_z\cap A\neq\varnothing\}
$$
or
$$
A\oplus B=\{z|(\hat{B})_z\cap A=\subseteq A \}
$$
![52441429991](D:\Documents\GitHub\Commentarii\Digital Image Process Gonzales\1524414299919.png)

$\quad\quad$One of the simplest applications of dilation is for bridging gaps. One immediate advantage of the morphological approach over the lowpass filter method is that the morphological method resulted directly in a binary image.

###### Duality

$\quad\quad$Erosion and dilation are duals of each other w.r.t. set complementation and reflection.
$$
(A\ominus B)^c=A^c\oplus \hat{B}\\
(A\oplus B)^c=A^c\ominus \hat{B}
$$
Assume $\hat{B}=B$, we can obtain the erosion of an image by $B$ simply by dilating its background with the same structuring element and complementing the result.