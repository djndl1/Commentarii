# Chap. 9 Morphological Image Processing

$\quad\quad$_Mathematical morphology_: a tool for extracting image components that are useful in the representation and description of region shape. Tools such as morphology and related concepts are a cornerstone of the mathematical foundation that is utilized for extracting meaning from an image.

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

![52441429067](/home/djn_dl/Desktop\GitHub\Commentarii\Digital Image Process Gonzales\1524414290676.png)

###### Dilation

With $A$ and $B$ as sets in $Z^2$ , the _dilation_ of $A$ by $B$, defined as
$$
A\oplus B=\{z|(\hat{B})_z\cap A\neq\varnothing\}
$$
or
$$
A\oplus B=\{z|(\hat{B})_z\cap A\subseteq A \}
$$
![52441429991](/home/djn_dl/Desktop\GitHub\Commentarii\Digital Image Process Gonzales\1524414299919.png)

$\quad\quad$One of the simplest applications of dilation is for bridging gaps. One immediate advantage of the morphological approach over the lowpass filter method is that the morphological method resulted directly in a binary image.

###### Duality

$\quad\quad$Erosion and dilation are duals of each other w.r.t. set complementation and reflection.
$$
(A\ominus B)^c=A^c\oplus \hat{B}\\
(A\oplus B)^c=A^c\ominus \hat{B}
$$
Assume $\hat{B}=B$, we can obtain the erosion of an image by $B$ simply by dilating its background with the same structuring element and complementing the result.

## 9.3  Opening and Closing

$\quad\quad$ _Opening_ generally smoothes the contour of an object, breaks down isthmuses and eliminates thin protrusions. _Closing_ generally fuses narrow breaks and long thin gulfs, eliminates small holes and fills gaps in the contour.

$\quad\quad$The _opening_ of set $A$ by structuring element _B_, defined as
$$
A\circ B=(A\ominus B)\oplus B=\bigcup\{(B)_z|(B)_z\subseteq A\}
$$
Erosion of $A$ by $B$, followed by a dilation of the result by $B$

![52449524996](/home/djn_dl/Desktop\GitHub\Commentarii\Digital Image Process Gonzales\1524495249963.png)

$\quad\quad$The _closing_ of set $A$ by structuring element $B$, defined as 
$$
A\ \yen\ B=(A\oplus B)\ominus B
$$
![52449546516](/home/djn_dl/Desktop\GitHub\Commentarii\Digital Image Process Gonzales\1524495465168.png)

![52449572537](/home/djn_dl/Desktop\GitHub\Commentarii\Digital Image Process Gonzales\1524495725371.png)

__Duality__
$$
(A\ \yen B)^c=(A^c\circ\hat{B})\\
(A\circ B)^c=(A^c\ \yen\ \hat{B})
$$
__Properties__
$$
A\circ B \text{ is a subset of }A\\
\text{If $C$ is a subset of $D$, then $C\circ B$ is a subset of $D\circ B$}\\
\text{$(A\circ B)\circ B=A\circ B$}
$$

$$
A\text{ is a subset of }A\ \yen\ B\\
\text{If $C$ is a subset of $D$, then $C\ \yen\ B$ is a subset of $D\ \yen\ B$}\\
\text{$(A\ \yen\ B)\ \yen\ B=A\ \yen\  B$}
$$

A morphological filter consisting of opening followed by closing can be used to remove noise.

## 9.4 The Hit-or-Miss Transformation

$\quad\quad$The morphological hit-or-miss is a basic tool for shape detection.

_Morphological hit-or-miss transform_: 
$$
A\circledast B=(A\ominus B_1)\cap(A^c\ominus B)=(A\ominus B_1)-(A\oplus\hat{B}_2)
$$
where $B=(B_1, B_2)$, $B_1$ is the set formed from elements of B associated with an object and $B_2$ is the set of elements of B associated with the corresponding background.

![52449862915](/home/djn_dl/Desktop\GitHub\Commentarii\Digital Image Process Gonzales\1524498629150.png)

$\quad\quad$The approach here is based on an assumed definition that two or more objects are distinct only if they form disjoint sets, thus we require each object have at least one-pixel-thick background around it. If this requirement is not needed, the hit-or-miss transform reduces to simple erosion.

## 9.5 Some Basic Morphological Algorithms

$\quad\quad$One of the principal applications of morphology is in extracting image components that are useful in the representation and description of shape.

###### Boundary Extraction

$$
\beta(A)=A-(A\ominus B)
$$

where $B$ is a suitable structuring element.

###### Hole Filling

$\quad\quad$A _hole_ may be defined as a background region surrounded by a connected border of foreground pixels.

Algorithm:   

1. Initialize $X_0$ of $0s$ except at the locations where the given point corresponds to a hole.
2. _Conditionally dilate_ $X_k=(X_{k-1}\oplus B)\cap A^c \quad k=1,2,3,...$, where $B$ is a $3\times 3$ cross
3. Terminate if $X_k=X_{k-1}$ 
4. Compute $X_k\cup A$

The intersection at each step with $A^c$ limits the result to inside the region of interest.