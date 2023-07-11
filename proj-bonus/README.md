```
/// \file README
/// \brief My final proj of mathsoftware, by Wangheyu
/// \author PhilFan
/// \version 1.0
/// \date 2023-07-09
```
### 实现方法
使用方法如下：</br>
在proj文件夹下：</br>
先输入make exe生成可执行文件</br>
再输入make pic生成图片</br>
再输入make pdf生成pdf</br>

也可以**直接make生成所有文件**</br>

初始文件夹如下图
```
├── doc
│   ├── Makefile  -----负责pdf文件的产生
│   ├── proj.tex
│   └── references.bib
├── Makefile      -----负责组织各个文件的生成
├── README
├── src----------------图片生成方法1
│   ├── build
│   ├── CMakeLists.txt
│   ├── gene.py--------操作paraview自动生成结果视图的python脚本文件
│   └── step-3.cc
├── src2---------------图片生成方法2
│   ├── build
│   ├── CMakeLists.txt
│   ├── gene.py--------操作paraview自动生成结果视图的python脚本文件
│   └── step-3.cc
└── src3---------------图片生成方法3
    ├── build
    ├── CMakeLists.txt
    ├── gene.py--------操作paraview自动生成结果视图的python脚本文件
    └── step-3.cc
```


## Final Project
[我的数学软件学习记录楼](https://www.cc98.org/topic/5646949)</br>
[知乎笔记 step-3](https://zhuanlan.zhihu.com/p/554933661)</br>
[step3 官方文档](https://www.dealii.org/current/doxygen/deal.II/step_3.html)</br>

### 要求
1. 阅读deal.II的examples中的step-3；</br>

2. 运行这个程序，生成图像数据；</br>

3. 撰写一篇报告，描述这个工作的主要内容，你可以直接翻译或摘要step-3的tutorial的Introduction部分，</br>
不要求逐词翻译，但要求有必要的公式和代码。注意到Introduction结束为止，之后的The commented program 不要再继续了。</br>

4. 描述一下step-3在计算的问题，具体参数，最后附图片。注：以上对数学的描述正确与否，不予考虑。</br>

5. 图片可以是gnuplot或vtk格式生成，然后转换成eps或pdf之后插入文档。如果直接截屏插入，会有扣分。</br>

6. 请自己规划好目录结构，在你的源下新建一个proj的目录，存放全部必要的数据。要求助教make之后，能够得到最终报告final.pdf。可以放一个README做如何编译生成的说明。</br>

7. 加分因素（非必须）：不使用cmake，而是自己写一个Makefile，直接make就可以得到最终结果。如果实现了，请在README中说明。（提示：.h在哪里？需要哪些.so？如何指明？） </br>


### 思路
1-2     对应的是lec1的内容（环境配置和shell初步）</br>
3       对应的是lec2（NS方程那一节）</br>
4-5     对应latex那一节</br>
6       对应Makefile那一节</br>
7       对应Cmake那一节，感觉我对这块还不太熟</br>

### 一些可以增加的点
- 用Doxygen写一点step-3源码的注释，并生成 Doxygen File</br>
- 使用多级Makefile进行作业，并指定安装目录，写好以后用自动变量进行替代</br>
- LaTeX 找一个好看一点的模板</br>
- 图片插入并排</br>

### 一些摘录
- 使用Python脚本控制paraview进行绘图</br>
按照z轴进行提升的方法</br>
切换activate view的方法</br>
filter的设置</br>
最终视角的转换</br>

- 多文件夹Makefile的方式</br>
法一：使用文件夹下的Makefile</br>
法二：使用子shell + 一行多命令   ———— 防止出现目录错误问题</br>
```
 ( cd $(PWD) && xelatex $(PROJ) && bibtex $(PROJ) && xelatex $(PROJ) && xelatex $(PROJ) )
```
- 多文件夹进行重复相似操作的Makefile写法</br>
```
OBJECTS := $(addsuffix /step-3,$(SRC))

$(OBJECTS): %/step-3: %/build %/step-3.cc %/CMakeLists.txt
ifeq ($(filter $(MAKECMDGOALS),exe all),$(MAKECMDGOALS))
	@if [ -e "$@" ]; then \
		echo "$@ already exists. Skipping..."; \
	else \
		echo "Generating exe"; \
		(cd $< && cmake --log-level=WARNING .. && make -s && chmod a+x step-3 && mv step-3 .. && rm -rf *); \
		(cd $(@D) && ./step-3); \
	fi
endif
```

- 使用Makefile实现与Cmake同样的效果</br>
自动寻找依赖库的路径</br>

- 页眉页脚设置</br>
```
\usepackage{fancyhdr}

% 定义新的页眉样式
\fancypagestyle{sectionheader}{
    \fancyhf{} % 清空当前页眉设置
	\fancyhead[L]{Page:\thepage}
	%\fancyhead[C]{中间页眉}
	\fancyhead[R]{\leftmark}
}
\setlength{\headheight}{14.49998pt}
\addtolength{\topmargin}{-2.49998pt}
```
- 插入图片格式（单图、双图、四连图）</br>
```
# 单图
\usepackage{float}
\begin{figure}[H]% 插入一张图片，H表示浮动环境下的here
	\centering
	\begin{minipage}{0.83\textwidth}% 小页面尺寸，可自行调节
		\centering
		\includegraphics[width=1.0% 图片尺寸，可自行调节
		\textwidth]{lqx}% 图片名称（图片需与tex文件在同一文件夹）
		\caption{\fontsize{10pt}{15pt}\selectfont 单图}% 图例
	\end{minipage}
\end{figure}

# 双图
\begin{figure}[H]% 插入两张图片并且并排
	\centering
	\begin{minipage}{0.48\textwidth}
		\centering
		\includegraphics[width=0.83\textwidth]{title部分效果}
		\caption{\fontsize{10pt}{15pt}\selectfont 俩图}
	\end{minipage}
	\hspace{0cm}% 图片间距
	\hfill% 撑满整行
	\begin{minipage}{0.48\textwidth}
		\centering
		\includegraphics[width=0.83\textwidth]{框架}
		\caption{\fontsize{10pt}{15pt}\selectfont 俩图}
	\end{minipage}
\end{figure}

# 四图
\begin{figure}[htbp]
    \centering
    \begin{subfigure}{0.48\textwidth}
        \centering
        \includegraphics[width=\textwidth]{proj1.png}
        \caption{Top View}
        \label{fig:front_view}
    \end{subfigure}
    \hfill
    \begin{subfigure}{0.48\textwidth}
        \centering
        \includegraphics[width=\textwidth]{proj2.png}
        \caption{Front View}
        \label{fig:top_view}
    \end{subfigure}
    
    \vspace{1cm} % 图片间距
    
    \begin{subfigure}{0.48\textwidth}
        \centering
        \includegraphics[width=\textwidth]{proj3.png}
        \caption{Side View}
        \label{fig:side_view}
    \end{subfigure}
    \hfill
    \begin{subfigure}{0.48\textwidth}
        \centering
        \includegraphics[width=\textwidth]{proj4.png}
        \caption{Isometric View}
        \label{fig:isometric_view}
    \end{subfigure}
    
    \caption{四个视角的计算结果}
    \label{fig:four_views}
\end{figure}
```


### 总结
·······未完待续</br>
