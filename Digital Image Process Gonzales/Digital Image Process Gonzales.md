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

## 3.1 Background

$$
g=T[f]
$$

where $f$ is the input image, $g$ is the output and $T$ is an operatior on $f$

e.g. averaging out the intensities of all pixels in a neighborhood, called _spatial filtering_, with which operation called _spatial filter_ , a.k.a. _spatial mask_, _kernel_, _template_, _window_. It's a _neighborhood processing_

$\qquad$Let the window shrink to one pixel and this becomes _point processing_.

$\qquad$__Enhancement__:  the process of manipulating an image so that the result is more suitable than the original for a specific application, implying it's problem-oriented. No general theory.

##3.2 Some Basic Intenisty Transformation Fucntions

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

$\quad\quad$ _Filter_, though borrowed from frequency domain processing, here used for _spatial filters_, a.k.a _spatial masks, kernels, templates, windows_.

###### Mechanics

$\quad\quad$ A _spatial filter_ consists of a _neighborhood_ and a _predefined operation_ that is performed on the image pixels encompassed by the neighborhood. It is seldom the case that filtered pixels replace the values of the corresponding location in the original image.

Linear spatial filter $g(x,y)=\sum\limits^a_{s=-a}\sum\limits^b_{t=-b}w(s,t)f(x+s,y+t)$

###### Spatial Correlation and Convolution

Correlation: $+$, Convolution: $-$

First $f$ with enough 0s on either side to allow each pixel in $w$ to visit every pixel in $f$.

Filter $w(s,t)$ , function $m\times n\ image\ f(x,y)$
$$
w(x,y)*f(x,y)=\sum\limits^a_{s=-a}\sum\limits^{b}_{t=-b}w(s,t)f(x\pm s,y\pm t)
$$
$a=(m-1)/2,\ b=(n-1)/2$

Correlation is convolution with its filter rotated by 180 degrees. _Convolution filter, convolution mask_ or _convolution kernel_ are used to denote a spatial filter and not necessarily that the filter will be used for true convolution.

###### Vector Representation of Linear Filtering

$\quad\quad$ The characteristic response $R$  of a mask in a neighborhood
$$
R = w_1 z_1 + w_2 z_2 + ... + w_{mn}z_{mn}
=\sum\limits^{mn}_{k=1}w_kz_k=w^Tz
$$

###### Generating Spatial Filter Masks

$\quad\quad$ Generating an $m\times n$ linear spatial filter: $mn$ mask coefficients.  
$\quad\quad$ Generating a nonlinear filter: the size of a neighborhood and the operations to be performed on the image pixels contained in the neighborhood

## 3.5 Smoothing Spatial Filters

$\quad\quad$ For _blurring_ and for _noise reduction_

Blurring: removal of small details, bridging of small gaps  
Noise reduction: blurring with a linear filter and also by nonlinear filtering

__Averaging Filter__(lowpass filter)

_Box filter_: a spatial averaging filter with all coefficients being equal
_Weighted average_

###### Order-Statistic (Nonlinear) Filters

__Order-statistic filters__: nonlinear spatial filters whose response is based on ordering (ranking) the pixels contained in the iamge area encompassed by the filter and then replacing the value of the center pixel with the value determined by the ranking result.  
e.g. _median filter_, which provides excellent noise reduction capabilities, particularly effective in dealing with _impulse noise (salt-and-pepper, giving white and black appearance)._  
	_min filter_
	_max filter_

# Chap.4 Filtering in the Frequency Domain

The proposing of Fourier Transform   
The advent of digital computers and the invention of Fast Fourier Transform 

### Fundamentals

######__Fourier series__

$$
f(t)=\sum\limits^{\infin}_{n=-\infin}c_ne^{j\frac{2\pi n}{T}t}
$$

where $c_n=\dfrac{1}{T}\int\limits^{T/2}_{-T/2}f(t)e^{-j\frac{2\pi n}{T}t}dt\qquad for\ n=0,\pm1,\pm2,...$

$\quad\quad$ __Impulse__
$$
\delta(0)=
\begin{cases}
\infin & \text{if   $t=0$}\\
0 & \text{if $t\neq0$}
\end{cases}
$$
constrained by 
$$
\int\limits^{\infin}_{-\infin}\delta{(t)dt}=1
$$
has the _sifting property_:
$$
\int\limits^{\infin}_{-\infin}f(t)\delta(t-t_0)dt=f(t_0)
$$
and its discrete counterpart, _unit discrete impulse_:
$$
\delta(x)=\begin{cases}
1 & \quad x=0\\
0 & \quad x\neq 0
\end{cases}\\
\sum\limits^{\infin}_{x=-\infin}\delta(x)=1
$$
Sifting property: 
$$
\sum\limits^{\infin}_{x=-\infin}f(x)\delta(x-x_0)=f(x_0)\\
$$
$\quad\quad$ __Impulse train__
$$
s_{\Delta T}(t)=\sum\limits^{\infin}_{n=-\infin}\delta(t-n\Delta T)
$$

###### __Fourier Transform of Functions of One Continuous Variable__

$$
F(\mu)=\mathcal{F}\{f(t)\}=\int^{\infin}_{-\infin}f(t)e^{-j2\pi \mu t}dt
$$

__Inverse Fourier transform__
$$
f(t)=\mathcal{F(\mu)}=\int\limits^{\infin}_{-\infin}F(\mu)e^{j2\pi \mu t}d\mu
$$
__Convolution__
$$
f(t)*h(t)=\int^{\infin}_{-\infin}f(\tau)h(t-\tau)d\tau\\
\mathcal{F}\{f(t)*h(t)\}=H(\mu)F(\mu)
$$

###### Sampling and the Fourier Transform of Sampled Functions

$$
\tilde{f}(t)=f(t)s_{\Delta T}(t)=\sum\limits^{\infin}_{n=-\infin}f(t)\delta(t-\Delta T)
$$

With its FT:
$$
\tilde{F}(\mu)=\mathcal{F}\{\tilde{f}(t)\}=F(\mu)*S(\mu)=\dfrac{1}{\Delta T}\sum\limits^{\infin}_{n=-\infin}F(\mu - \dfrac{n}{\Delta T})
$$
which is an infinite periodic sequence of copies of $F(\mu)$

######__Sampling Theorem__

$$
\dfrac{1}{\Delta T}>2\mu_{max}\quad \text{Nyquist Rate}
$$

$\quad\quad$Except for some special cases, aliasing is always present in sampled signals, even if the original sampled function is band-limited, infinite frequency components are introduced the moment we limit the duration of the function. No function of finite duration can be band-limited. Conversely, a function that is band-limited must extend from $-\infin$ to $\infin$.

$\quad\quad$The effects of aliasing can be reduced by smoothing the input funcition to attenuate its higher frequencies, called _anti-aliasing_.

###### Function Reconstruction from Sampled Data

$\quad\quad$Reconstruction of a function from a set of its samples reduces in practice to interpolating between the samples.

Using a low-pass filter $H(\mu)$
$$
f(t)=\sum\limits^{\infin}_{n=-\infin}f(n\Delta T)\ sinc[(t-n\Delta T)/n\Delta T]
$$
where $sinc(x)=\dfrac{sin(x)}{x}$, gives a perfect reconstruction.

### 4.4 The Discrete Fourier Transform (DFT) of One Variable

$\quad\quad$ The Fourier(DTFT) of a sampled function $f_n$ is  continuous and infinitely periodic with period $1/\Delta T$, all we need to characterize is one period, and sampling one period is the basis for the DFT.
$$
F_m=\sum\limits^{M-1}_{n=0}f_ne^{-j2\pi mn/M}\quad m=0,1,2,...,M-1
\\f_n=\dfrac{1}{M}\sum\limits^{M-1}_{m=0}F_m e^{j2\pi mn/M}\quad n=0,1,2,...,M-1
$$
[Discrete Fourier Transform on Wiki](https://en.wikipedia.org/wiki/Discrete_Fourier_transform)  
[Discrete-time Fourier Transform on Wiki](https://en.wikipedia.org/wiki/Discrete-time_Fourier_transform)

$\quad\quad$ It completely describes the [discrete-time Fourier transform](https://en.wikipedia.org/wiki/Discrete-time_Fourier_transform) (DTFT) of an *N*-periodic sequence, which comprises only discrete frequency components. ([Using the DTFT with periodic data](https://en.wikipedia.org/wiki/Discrete-time_Fourier_transform#Periodic_data))

$\quad\quad$ Both the forward and inverse discrete transforms are infinitely periodic with period $M$.

The discrete equivalent of convolution
$$
f(x)*h(x)=\sum\limits^{\infin}_{m=-\infin}f(m)h(x-m)
$$
for $x=0,1,2,...,M-1$, is periodic (_circular convolution_) with period $M$, thus given as one period 
$$
f(x)*h(x)=\sum\limits^{M-1}_{m=0}f(m)h(x-m)
$$
Given sampling interval $\Delta T$ and $M$ samples
$$
T=M\Delta T\\
\Delta u = \dfrac{1}{M\Delta T}=\dfrac{1}{T}\quad \text{Resolution on frequency domain}\\
\Omega=M\Delta u=\dfrac{1}{\Delta T}\quad \text{Entire Frequency range}
$$

### 4.5 Extension to Functions of Two Variables

######The 2-D Impulse and Its Sifting Property

2-D Continuous variables $t,z$
$$
\delta(t,z)=\begin{cases}
\infin & \text{    if $t=z=0$}
\\0 & \text{    otherwise}
\end{cases}
\\ \int^{\infin}_{-\infin} \int^{\infin}_{-\infin}\delta(t,z)dtdz=1\\
\int^{\infin}_{-\infin} \int^{\infin}_{-\infin}f(t,z)\delta(t-t_0,z-z_0)dtdz=f(t_0,z_0)
$$
2-D Discrete variables $x,y$
$$
\delta(x,y)=\begin{cases}
1 & \text{    if $x=y=0$}
\\0 & \text{    otherwise}
\end{cases}
\\ \sum\limits^{\infin}_{x=-\infin} \sum\limits^{\infin}_{y=-\infin}\delta(x,y)=1\\
\sum\limits^{\infin}_{x=-\infin} \sum\limits^{\infin}_{y=-\infin}f(x,y)\delta(x-x_0,y-y_0)dtdz=f(x_0,y_0)
$$

###### The 2-D Continuous Fourier Transform Pair

$$
F(u,v)= \int^{\infin}_{-\infin} \int^{\infin}_{-\infin}f(t,z)e^{-j2\pi(\mu t + \nu z)}dtdz\\
f(t,z)= \int^{\infin}_{-\infin} \int^{\infin}_{-\infin}F(\mu,\nu)e^{j2\pi (\mu t+\nu z)}d\mu d\nu
$$

###### 2-D Sampling Theorem

$$
\dfrac{1}{\Delta T}>2\mu_{max}\\
\dfrac{1}{\Delta Z}>2\nu_{max}
$$

###### Aliasing

_Spatial aliasing_: undersampling  
_Temporal aliasing_: wagon wheel effect

Anti-aliasing filtering has to be done at the "front-end", before thei mage is sampled.

###### Image Interpolation and resampling

$\quad\quad$One of the most common applications of 2-D interpolation in image processing is in image resizing.  
Zooming: over-sampling  
Shrinking: under-sampling  

$\quad\quad$ nearest neighbor interpolation with over-sampling: zooming by _pixel replication_; 

$\quad\quad$ Image shrinking: under-sampling is achieved by row-column deletion. To reduce aliasing, it is a good idea to blur an image slightly before shrinking it. An alterante technique is to _super-sample_ the original scene and then reduce its size by row and column deletion, which yields sharper results than with smoothing.

__Moiré Effect__

###### The 2-D Discrete Fourier Transform and Its Inverse

$$
F(u,v)=\sum\limits^{M-1}_{x=0}\sum\limits^{N-1}_{y=0}f(x,y)e^{-j2\pi (ux/M+vy/N)}
\\f(x,y)=\dfrac{1}{MN}\sum\limits^{M-1}_{u=0}\sum\limits^{N-1}_{v=0}F(u,v)e^{j2\pi(ux/M+vy/N)}
$$

__Properties__
$$
\Delta u=\dfrac{1}{M\Delta T}\\
\Delta v = \dfrac{1}{N\Delta Z}
$$
_Translation and rotation_
$$
f(x,y)e^{j2\pi (u_0 x/M+v_0 y/N)}\leftrightarrow F(u-u_0,v-v_0)\\
f(x-x_0,y-y_0)\leftrightarrow F(u,v)e^{-j2\pi(x_0u/M+y_0v/N)}\\
f(r,\theta + \theta_0)\leftrightarrow F(\omega,\phi + \theta_0)
$$
_Periodicity_
$$
F(u,v)=F(u+k_1 M,v+k_2 N)\\
f(x,y)=f(x+k_1 M,y+k_2 N)\\
f(x,y)(-1)^{x+y}\leftrightarrow F(u-M/2,v-N/2)
$$

$$
\sum\limits^{M-1}_{x=0}\sum\limits^{N-1}_{y=0}w_e(x,y)w_o(x,y)=0
$$

For any two discrete even and odd functions $w_e\text{ and }w_0$

![52379666335](D:\Documents\GitHub\Commentarii\Digital Image Process Gonzales\1523796663357.png)

###### Fourier Spectrum and Phase Angle

Magnitude: Fourier (frequency) spectrum  
Power spectrum: $P(u,v)=|F(u,v)|^2$

Magnitude, phase angle and power spectrum are arrays of size $M\times N$.
$$
|F(0,0)|=MN|\bar{f}(x,y)|\text{    where $\bar{f}$ is the average of f}\\
\text{$F(0,0)$ sometimes is called the }\textit{dc component}
$$
In general, visual analysis of phase angle images yields little intuitive information, however, it is a measure of displacement of the various sinusoids with respect to their origin. The phase is important in determining shape characteristics.

###### The 2-D Convolution Theorem

$$
f(x,y)*h(x,y)=\sum\limits^{M-1}_{m=0}\sum\limits^{N-1}_{n=0}f(m,n)h(x-m,y-n)
$$

gives one period of the convolution, and the following convolution theorem
$$
f(x,y)*h(x,y)\leftrightarrow F(u,v)H(u,v)\\
f(x,y)h(x,y)\leftrightarrow F(u,v)*H(u,v)
$$
The first equaiton is the basis for all the filtering techiniques discussed here.

$\quad\quad$If we elect to compute the spatial convolution using the IDFT of the product of the two transforms, then the periodicity issues must be taken into account. But _wraparound error_ is introduced.

_Zero padding_: by appending to each period enough zeros, the result would be a correct periodic convolution.



![52380227082](D:\Documents\GitHub\Commentarii\Digital Image Process Gonzales\1523802270827.png)

![52380228456](D:\Documents\GitHub\Commentarii\Digital Image Process Gonzales\1523802284560.png)

![52380230712](D:\Documents\GitHub\Commentarii\Digital Image Process Gonzales\1523802307121.png)

![52380232075](D:\Documents\GitHub\Commentarii\Digital Image Process Gonzales\1523802320753.png)



# Chap.5 Image Restoration and Reconstruction

\indThe principal goal of restoration techiniques is to improve an iamge in some predefined sense. Image enhancement is largely a subjective process, while restoration attempts to recover an image that has been degraded by using a priori knowledge of the degradation phenomenon, that is, oriented toward modeling the degradation and applying the inverse process in order to recover the original image.

###### A Model of the Image Degradation/Restoration Process

$$
g(x,y)=h(x,y)*f(x,y)+\eta(x,y)\\
G(u,v)=H(u,v)F(u,v)+N(u,v)
$$

