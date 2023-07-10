## Assignment 7
### 作业题目
1. 请在自己的源下建立目录ass07，在目录中，执行 make 以后产生一个pdf文件，内有一个三维椭面，
椭球的三轴由用户指定，并存放在一个名为dimension的文本文件中，
文件具体格式自己决定。只要能指定长短轴数据即可。比如可以就是三个数字，一个x轴，一个y轴，一个z轴。
可以只考虑整数。三维图形参见这个效果：
![image](https://github.com/Phil-Fan/MathSoftware-2023/assets/56161071/55a3e53d-2e4d-4103-9c62-6fe9cae91b3c)

2. 可以使用任何编程或脚本或软件手段。
3. 最后项目中只保留文本格式文件，不必上传 pdf 文件，但助教应该通过make能得到图形pdf.
4. 提示：gnuplot demo script: surface2.dem (sourceforge.net)

### 课上内容
软件的使用与搭配
linux本身是由字符串构建的，一切都是文件</br>
所以理论上Nothing is Impossible</br>
- 例1
用Tikz + C + Makefile </br>
[制作树图](https://blog.csdn.net/Daniel_tanxz/article/details/106649995)的流程</br>
- 例2
使用 绘制Mandelbrot set(复平面的迭代)</br>
[R 绘制结果](https://zhuanlan.zhihu.com/p/392574615)      [Mandelbrot Set - 知乎](https://zhuanlan.zhihu.com/p/392574615)</br>
[BMP图像文档](https://learn.microsoft.com/zh-cn/windows/win32/gdi/bitmap-storage)</br>
C -> 数据 -> 图像
不同格式之间的转换 -> 不同软件之间的协同</br>
[paraview start guide](https://www.paraview.org/paraview-downloads/download.php?submit=Download&version=v5.11&type=data&os=Sources&downloadFile=ParaViewGettingStarted-5.11.0.pdf)</br>
[VTK官方网站](https://vtk.org/)           [基于物理的引擎](https://www.pbrt.org/)</br>
[dealii guide](https://www.math.colostate.edu/~bangerth/videos.html)</br>

### 作业实现
作业相当于还是上课例程的复现吧，用学到的东西画图</br>
感觉还是比较好实现的</br>
我自己写了一个脚本负责从命令行读入3个参数并放在dimension.txt文件下，</br>
然后使用画图的工具画出这个图，</br>
再把这些东西套到前两天的框架当中，就可以完成今天的任务</br>
我自己用gnuplot和matlibplot分别实现了一下，感觉两种工具都挺好用的</br>


- 文件夹结构
GNU_PLOT 下是用GNU_PLOT工具实现的效果</br>
PYTHON文件夹下是通过PYTHON中的matplotlib库实现的效果</br>

两种方式思路相似，略有小差别，请根据文件夹下的README进行操作</br>
请先确保您的linux环境下可以执行xdg-open命令</br>

请确保您的电脑上拥有这两个库：</br>
- numpy：用于处理数值计算和数组操作。</br>
	安装方式：可以使用命令 pip install numpy 进行安装。</br>
- matplotlib：用于绘制图形和图像。</br>
	安装方式：可以使用命令 pip install matplotlib 进行安装。</br>

文件夹结构</br>
```
.
├── GNU_PLOT
│   ├── Makefile
│   ├── README
│   └── src
│       ├── figure.gp
│       ├── figure.tex
│       ├── references.bib
│       └── txt.sh
├── PYTHON
│   ├── Makefile
│   ├── README
│   └── src
│       ├── figure.py
│       ├── figure.tex
│       ├── references.bib
│       └── txt.sh
└── README
```

