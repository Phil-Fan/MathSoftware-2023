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
