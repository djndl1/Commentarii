#Chap.1 Introduction

​	改善图示信息以便人们解释； 为存储、传输和表达而对图像数据进行处理，以便于机器自动理解。
	数字图像处理是借助于数字计算机处理数字图像
	
$\qquad$$\qquad$图像源：从伽马射线到无线电波的整个电磁波谱，包括超声波‘电子显微镜和计算机生成的图像
			电磁能谱，声波、超声波、电子
			图像处理-图像分析/理解-计算机视觉 的连续统
			低级-中级-高级 处理

###1.2 起源

​		电缆传输图片
		计算机的兴起
		空间项目的开发
		CT（计算机断层）

###1.3 实例应用

###1.4 基本步骤

​		输入-输出都是图像
		输入图像-输出提取的属性

$\qquad$$\qquad$_Figure 1.23_
		图像获取image acquisition
		图像增强(image enhancement)：使图像在特定应用中比原始图像更适合进行处理
		图像复原(image restoration)：倾向于以图像退化的数学或概率模型为基础
		彩色图像处理(color image processing)
		小波：以不同辨率来描述图像的基础(wavelets and multiresolution processing)
		压缩(compression)
		形态学处理(morphological processing)
		分割(segmentation)
		表示（representation 确定表示范围，比如边界或者整个区域）与描述（description 特征选择）
		识别(recognition)：基于目标的描述给该目标赋予标志
		显示(display)

###1.5 图像处理系统的组成

​	_Fig. 1.24_

#第2章 数字图像基础

​		

###2.1 人类视觉系统

​			人眼结构
			眼中图像的形成
			亮度适应和辨别
			

###2.2 光和电磁波谱

​			E=hv 光子 频率段
			单色光/无色光 的唯一属性是 强度，用 灰度级 表示，从黑到白的度量值通常称为 灰度级
			彩色光源：发光强度（能量总和，瓦特）　光通量（流明数，观察者从光源感受到的能量）　	亮度（主观描述）
			要求“看到”一个物体的电磁波的波长必须小于等于物体的尺寸
		

###2.3 图像感知和获取

​			照射源， 场景
			照射可以由非传统光源，比如超声波甚至计算机产生的照射模式。
			平坦表面反射 透射
			
$\qquad$$\qquad$$\qquad$单个传感器，条带传感器，阵列传感器
			简单的图像形成模型 2.3.4
			反射系数/透射系数 * 入射分量
			灰度级/强度级 $l=0$黑色 $l=L-1$白色 gray scale

###2.4 取样和量化 

​			取样：对坐标值进行数字化　＝》样本数
			量化：对幅值数字化　＝》灰度级
			实践中，取样方法由生成该图像的传感器配置决定
			
$\qquad$$\qquad$$\qquad$二维阵列$f(x,y)$
			三种表示*Fig2.18*
			图像原点位于左上角：图像显示器, 矩阵排列方式

​			$M:row\; N:col$ $L$:灰度级，一般为2的整数次幂
			_动态范围_： 最大可度量灰度与最小可检测灰度之比 dynamic range
			_饱和度_：超过该值的灰度级会被剪切掉 saturation
			_对比度_：最高和最低灰度级的灰度差；高动态范围意味着高对比度 contrast
			
$\qquad$$\qquad$$\qquad$_空间分辨率_的度量必须针对空间单位来规定才有意义 spatial resolution
			_灰度分辨率_： 灰度级中可分辨的最小变化，最通用8比特 intensity resolution
			
$\qquad$$\qquad$$\qquad$_内插_： 使用已知数据来估计未知位置的数值的处理 interpolation
				最近邻内插，把元图像中最近邻的灰度赋给每个新位置 nearest neighbor interpolation
				双线性内插 bi-linear interpolation
				双三次内插 bicubic interpolation

###2.5 像素间的关系

​			4邻域 8邻域 4/8-neighbors 
			
$\qquad$$\qquad$$\qquad$__邻接性__： 处于同一灰度值集合且处于邻域中 adjacency
				4/8/m-adjacency
			__连通性__： 相互邻接的 Connectivity
			用连通定义 _前景_ 和 _背景_ foreground background
			__区域边界__：与背景有邻点的像素集合（８邻接）(boundary, border, contour)
			_内边界_与_外边界_（背景边界）(inner/outer border)
			the concept of edge is different from boundary, and is formed from pixels with derivative values that exceed a preset threshold
			
$\qquad$$\qquad$$\qquad$距离度量的定义，欧式距离、D4距离、D8距离

###2.6 数学工具

​		灰度的集合运算P47
			__并集__：对应最大　交集：对应最小　补集：差值
			
$\qquad$$\qquad$$\qquad$__模糊集__：　引入_隶属度函数_ Fuzzy set, membership function
			__几何变换__P109 Geometric spatial transformation
			__反向映射与前向映射__ forward/inverse mapping
			__图像对齐＼图像配准__，选择约束点 image registration, tie points/control points
			将图像作为向量处理
			__图像变换__P54-56 image transform

# Chap.3  Intensity Transformations and Spatial Filtering

$\qquad$__spatial domain__: the image plane itself  
$\qquad$__transform domain__: transforming an image into the transform domain doing the processing there and bring the results back into the spatial domain, e.g. _frequency domain_

$\qquad$Two principal categories of _spatial processing_: 

1. __intensity transformation__: operate on single pixels
2. **spatial filtering**: performs operations by working in a neighborhood of every pixel in an image

### 3.1 Background

$$
g=T[f]
$$

where $f$ is the input image, $g$ is the output and $T$ is an operatior on $f$

e.g. averaging out the intensities of all pixels in a neighborhood, called _spatial filtering_, with which operation called _spatial filter_ , a.k.a. _spatial mask_, _kernel_, _template_, _window_. It's a _neighborhood processing_

$\qquad$Let the window shrink to one pixel and this becomes _point processing_.

$\qquad$__Enhancement__:  the process of manipulating an image so that the result is more suitable than the original for a specific application, implying it's problem-oriented. No general theory.

###3.2 Some Basic Intenisty Transformation Fucntions

$$
s=T(r)
$$

Three basic types: 

1. Linear (negative and identity)
2. Logarithmic (log and inverse-log)
3.  Power-law (nth power and nth root)

###### Image Negatives

$$
s=L-1-r
$$

Particularly suited for enhancing white or gray detail embedded in dark regions, especially when the black areas are dominant in size.

###### Log Transformations

$$
s=c\;log(1+r)
$$

where $c$ is a constant and $r\geq0$. It maps a narrow range of low intensity values in the input into a wider range of output levels, and the opposite is true of higher values of input levels. Use this to expand the values of dark pixels in an image while compressing the higher level values. The opposite is true of the inverse log. E.g. processing Fourier spectra.

###### Power-Law(Gamma) Transformation

$$
s=cr^{\gamma}
$$

where $c$ and $\gamma$ are postive constants

Sometimes also written as
$$
s=c(r+\epsilon)^{\gamma}
$$
Varying $\gamma$ gives different transformation.

Applications: __Gamma correction__: the process to correct power-law response phenomena. e.g. CRT gamma correction
		     __General-purpose contrast manipulation__

######Piecewise-Linear Transformation Functions

$\qquad$A complementary approach to the methods above, and it can be arbitaryrily complex.

__Contrast stretching__; expands the range of intensity levels in an image so that it spans the full intensity range of the recording medium or display device.

$\qquad$if $r_1=s_1\quad\quad s_2=r_2$, it becomes a thresholding function

__Intensity-level slicing__: highlighting a specific range of intenisties in an image. This produces a binary image and is useful for studying the shape of the flow of the contrast medium.

**Bit-plane slicing**: highlighting certain bits of the intensities of a byte. The higer order bit planes contain a significant amount of the visually significant data, the lower-order planes contribute to more subtle intensity details. Decomposing an image into its bit planes is useful for analyzing the relative importance of each bit in the image, a process that aids in determining the adequacy of the number of bits used to quantize the image. Also useful for iamge compression, in which fewer tan all planes are used in reconstructing an image.

##3.3 Histogram Processing

$\qquad$**Histogram**: a digital image with intensity levels in the range $[0,L-1]$ is a discrete function $h(r_k)=n_k$, where $r_k$ is the kth intensity value and $n_k$ is the number of pixels in the image with intensity $r_k$. Commonly normailzed by the total number of pixels $MN$, i.e. $p(r_k)=n_k/MN$ ,which is an estimate of the probability of occurrence of intensity level in an image.

$\qquad$ Basis for numerous spatial domain processing techniques.
$\qquad$ For image enhancement
$\qquad$ the information inherent in histograms is useful in other image processing applicaitons, e.g. image compression.

Dark, light, low contrast and high contrast on their histograms

###### Histogram Equalization

**PDF**, **CDF** 
$$
s=T(r)\quad0\leq r\leq L-1
$$
Assume that:

1. $T(r)$ is a monotonically increasing function
   sometimes strictly monotinically increasing 
2. $T(r)$ is surjective

Since CDF satisfies condtion 1 and 2, we have 
$$
s=T(r)=(L-1)\int\limits^{r}_0 p_r(w)dw
$$
which, by simple calculus, is proved to give rise to the result below:
$$
p_s(s)=\dfrac{1}{L-1}\quad0\leq s\leq L-1
$$
That is, given any $p_r(r)$, $p_s(s)$ always is uniform, independent of $r$.

$\qquad$For the discrete counterpart
$$
p_r(r_k)=\dfrac{n_k}{MN}\quad k=0,1,2,...,L-1\\
s=T(r_k)=(L-1)\sum\limits^k_{j=0}p_r(r_j)\\
\qquad\qquad\quad\quad=\dfrac{L-1}{MN}\sum\limits^k_{j=0}n_j\quad k=0,1,2,...,L-1\\
s \; needs\ to\ be\ rounded\ to\ the\ nearest\ integer
$$
$\qquad$$Eq. (10)$ is called __histogram equalization__ or __histogram linearization__. Though it cannot be proved in general that discrete histogram equalization. It has the general tendency to spread the histogram of the input image so that the intensity levels of the equalized image space wider range of the intensity scale. The net result is _contrast enhancement_.

###### Histogram Matching/specification

$\quad\quad$ It is useful sometimes to be ablle to specify the shape of the histogram that we wish the processed image to have, not always a uniform one.

$\quad\quad$ Either in continuous cases or in discrete cases, histogram mathcing is achieved through an imtermediate stage of histogram equalization. That is, given the input $(r, p_r)$ and the specified output $(z,p_r)$, we obtain the mapping from $r$ to $z$ by equalize their corresponding histogram equalized results.

>1. Conpute the corresponding histogram-equalized results of $r$ and $z$ , denoted by $s_k$ and $G(z_q)$, discretize them
>
>2. For $k=1,...L-1$
>
>   ​	Find the closest $G(z_q)$ to $s_k$ 
>   	Map this $k$ to this $q$
>   	if there are more than one $q$
>   		choose the smallest one
>
>3.  The mapping from $r_k$ to $z_q$ is thus obtained

$\quad\quad$ Histogram specification is, for the most part, a trial and error process, and there are no rules for specifying histograms and one must resort to analysis on a case-by-case basis for any given enhancement task.

###### Local Histogram Processing

$\quad\quad$ It is necessary to enhance details over small *areas* in an iamge. The solution is to devise transformation functions based on the intensity distribution in a neighborhood of every pixel in the image

$\quad\quad$ The histogram is computed over a neighborhood while the transformation is done only at the center.

###### Using Histogram Statistics for Image Enhancement

_mean_, _moment_, _variance_ obtained from the histogram
_sample mean_, _sample variance_ obtained directly from the image

Mean: intensity
Variance; contrast
global and local

$\quad\quad$ Using the local mean and variance can develop simple yet powerful enhancement techniques based on statistical measures that have a close, predictable correspondence with image appearance.

$\quad\quad$ A contrast enhancing application

## 3.4 Fundamentals of Spatial Filtering

\in _Filter_, though borrowed from frequency domain processing, here used for _spatial filters_, a.k.a _spatial masks, kernels, templates, windows_.

###### Mechanics

\in A _spatial filter_ consists of a _neighborhood_ and a _predefined operation_ that is performed on the image pixels encompassed by the neighborhood. It is seldom the case that filtered pixels replace the values of the corresponding location in the original image.

Linear spatial filter $g(x,y)=\sum\limits^a_{s=-a}\sum\limits^b_{t=-b}w(s,t)f(x+s,y+t)$

###### Spatial Correlation and Convolution
