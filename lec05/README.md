## Assignment 5
重点内容：**Makefile 和 python 环境**</br>
### 作业题目
在[我的源](https://gitee.com/wang_heyu/mathsoft.git)中的`example/lsq` 目录下，有一套关于最小二乘模型的文档和程序。

1. 请在你的源中建立一个ass05的子目录，在此目录下, 再建一个doc目录，一个src目录。
2. 将`lsq`的全部.c文件存放到`src`目录下，`.tex`和`.bib`文件存放到`doc`目录下。
3. 在`ass05`目录下增加一个Makefile
4. 要求在`ass05`目录下输入
```
make  // 产生ass05/doc/lsq.pdf和可执行文件ass05/lsq
make exe // 产生可执行文件 ass05/lsq
make doc // 产生文档 ass05/doc/lsq.pdf
make clean // 恢复目录到未编译状态
```
5. 尽量使用各种自动变量，增加伪目标 all 和 clean
6. 上传未编译的ass05至你的源。

### 主要内容

- `VMware`中共享文件夹的构建</br>

- `Makefile`的一些用法和语法</br>

- `Linux`中`python`环境的准备</br>
[Ubuntu 安装 Conda](https://zhuanlan.zhihu.com/p/459607806)和一些`python`和`conda`的操作/br>

[ZJU Mirror](http://mirrors.zju.edu.cn/)</br>

```shell
# 查看版本
python --version 
source ~/.bashrc

# 创建虚拟环境
conda create -n <name> python=<version> <包名>
# 进入conda环境
conda activate   
# 退出conda环境
conda deactivate

#查看安装了哪些包
conda list
 
#安装包
conda install package_name(包名)
conda install -n 环境名 包名 # 在conda指定的某个环境中安装包
 
#查看当前存在哪些虚拟环境
conda env list 

? 使用?和tab键迅速入门
```

`python`常用库</br>

- `numpy` 数值计算（联想到利用`numpy`优化`cnn`计算）
- `scipy` 数值计算最牛的
- `sympy` 符号计算
- `matplotlib`
- `jupyter notebook` 交互式环境，做笔记本挺好的，win里边也不错

### 作业
多文件有两种实现思路</br>
- **第一种**是在命令中切换目录，用短路运算 && 一直执行到所有动作结束</br>
- **第二种**是用多个Makefile文件进行组织，</br>
每个Makefile仅管理本目录下的文件，以及include不同文件</br>
当然在大程序中第二种较多</br>

删除旧文件有趣写法`git ls-files -o | xargs rm -f`</br>


### 作业说明
ver1 是较简单版本的实现
ver2 在ver1版本基础上进行了小修改

文件说明：

- lsq.c		- C语言代码，最小二乘拟合程序，make 产生可执行程序lsq。</br>
- lsq 		- 可执行程序，由lsq.c编译产生，运行时需要数据testdata.txt，
   		  并输出output.dat文件。</br>
- lsq_data.c 	- C语言代码，产生用于拟合的程序，make 产生可执行程序lsq_data。</br>
- lsq_data  	- 可执行程序，又lsq_data.c编译产生，运行后产生测试数据文件
   		  testdata.txt。</br>
- lsq.gp 		- gnuplot脚本文件，用gnuplot调入后将output.dat文件转成矢量
   		  图像文件output.eps。</br>
- output.eps 	- 矢量图形文件，由output.dat通过gnuplot产生。</br>
- lsq_slide.tex  	- latex源码文件，编译后产生介绍最小二乘拟合的slide。</br>
- lsq.tex 	- latex源码文件，编译后产生介绍最小二乘拟合的文章，文章中会用到
  		  由程序产生的数据和图像。</br>
- output.dat 	- 由lsp运行产生的数据。</br>
- references.bib 	- 参考文献，由lsq.tex调用。</br>
- Makefile 	- 编译脚本文件。上述可执行文件和图像数据可以通过make产生，
  		  make clean则删除全部产生的程序和图像数据。</br>

## Makefile

[missing semester 元编程](https://missing-semester-cn.github.io/2020/metaprogramming/)

### 构成

[深入解析Makefile系列(0) -- 初识Makefile - 知乎 (zhihu.com)](https://zhuanlan.zhihu.com/p/362908163)

[深入解析Makefile系列(2) -- 常用的通配符、內建变量和模式规则 - 知乎 (zhihu.com)](https://zhuanlan.zhihu.com/p/362915681)

```text
目标 … : 依赖 …
    命令
    …
```

- `Makefile`组成
    - **目标**：编译过程中需要生成的文件，一个目标同样可以是一个需要执行的命令。
    - **依赖**：编译目标时需要依赖的文件列表，以空格分隔
    - **命令**：被执行的指令，命令部分需要以tab开头，**值得注意的是，命令部分的语句将会由makefile的规则做简单替换(变量替换，通配符的替换等等)之后被传递给shell，由shell解析**

- **`Makefile`流程**

  **以最小代价进行更新**

    - 检查依赖文件是否有更新，同时检查目标文件是否存在
    - 如果依赖文件有更新或者没有目标文件，执行命令部分以重新生成目标

    - 如果依赖文件没有更新，不重新编译生成目标

    - 如果一个依赖文件是一个目标，使用相同的以上三条规则先处理依赖文件。

### 规则

- 最好显式定义伪目标

```text
.PHONY : clean
clean:
    -rm main
```

- 生成中间文件，分布式编译

  不要将所有文件放到一个里编译

- 隐式规则(自动推导)

```makefile
1 main:foo.o bar.o common.h
2     cc foo.o bar.o main.c -o main
3 foo.o:common.h foo.h
4 bar.o:common.h bar.h
5 clean:
6     rm -rf *.o  main
```

### 变量

- 赋值
```
% 是一种模式，它会匹配其左右两侧相同的字符串
```

```makefile
=  : 普通的赋值符，将右值赋给左值
?= ：如果没有初始化该变量，就给它赋上默认值，属于条件赋值符
:= : 直接赋值，不过在变量展开上与 =不同(见下文).
::= : 这种赋值符等效于 :=
+= : 追加赋值符，在原变量的值上追加赋值
!= : 这个赋值符比较特殊，右值为一条shell命令，shell命令的返回值赋给赋值符左边的变量.
```

```makefile
$@：代表目标文件的名称。
$<：代表规则的第一个依赖文件的名称。
$^：代表所有依赖文件的列表，以空格分隔。
$?：代表比目标新的依赖文件的列表。
$*：代表目标文件去除后缀的部分。
$(@D)：代表目标文件所在的目录部分。
$(@F)：代表目标文件的文件名部分。
$(<D)：代表依赖文件所在的目录部分。
$(<F)：代表依赖文件的文件名部分。
```



### 函数 

[深入解析Makefile系列(3) -- 函数的使用 - 知乎 (zhihu.com)](https://zhuanlan.zhihu.com/p/362917196)

```makefile
# 模式替换
TEXT = foo.c bar.c
RESULT = $(patsubst %.c,%.o,${TEXT})

${TEXT : %.c=%.o}

# 按照首字母字典排序
$(sort list)
```



### 多文件

[深入解析Makefile系列(4) -- 多目录处理 - 知乎 (zhihu.com)](https://zhuanlan.zhihu.com/p/362922473)



### 逻辑处理

[深入解析Makefile系列(5) -- 逻辑处理 - 知乎 (zhihu.com)](https://zhuanlan.zhihu.com/p/362925982)

[深入解析Makefile系列(6) -- makefile编写实用技巧 - 知乎 (zhihu.com)](https://zhuanlan.zhihu.com/p/362927893)

