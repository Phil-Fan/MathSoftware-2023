# Project - Bonus 实现
### 实现方法
使用方法如下：</br>
在`proj`文件夹下：</br>
先输入`make exe`生成可执行文件</br>
再输入`make pic`生成图片</br>
再输入`make pdf`生成`pdf`</br>

也可以**直接`make`生成所有文件**</br>

初始文件夹如下图
```
├── doc
│   ├── Makefile  -----负责pdf文件的产生
│   ├── proj.tex
│   └── references.bib
├── Makefile      -----负责组织各个文件的生成
├── README
├── src----------------图片生成方法1
│   ├── compile.sh-----替代CMakeList,使用脚本自动找到依赖
│   ├── gene.py--------操作paraview自动生成结果视图的python脚本文件
│   └── step-3.cc
├── src2---------------图片生成方法2
│   ├── compile.sh-----替代CMakeList,使用脚本自动找到依赖
│   ├── gene.py--------操作paraview自动生成结果视图的python脚本文件
│   └── step-3.cc
└── src3---------------图片生成方法3
    ├── compile.sh-----替代CMakeList,使用脚本自动找到依赖
    ├── gene.py--------操作paraview自动生成结果视图的python脚本文件
    └── step-3.cc
```


### 思路
一步步来，先生成`.o`文件，再链接生成可执行文件</br>
### 编译
核心思路：**根据报错步步修改**：</br>
```
g++ -c step-3.cc
```
发现是`mpi.h`、`Sacado.hpp`、`petsc.h`这三个头文件需要给出</br>
所以使用以下命令找出所有包括这些头文件的目录，</br>
```
sudo find /usr -name "mpi.h"
sudo find /usr -name "Sacado.hpp"
sudo find /usr -name "petsc.h"
```
结果为</br>
```
sudo find / -name "mpi.h"
	/usr/lib/x86_64-linux-gnu/fortran/gfortran-mod-15/openmpi/mpi.h
	/usr/lib/x86_64-linux-gnu/openmpi/include/mpi.h -------------------------所需要的路径
	/usr/include/mumps_seq/mpi.h
	/usr/include/deal.II/base/mpi.h
	/usr/src/linux-hwe-5.19-headers-5.19.0-46/include/linux/mpi.h
	/usr/src/linux-hwe-5.19-headers-5.19.0-45/include/linux/mpi.h
```
所以接下来的事情就是从这些目录中把目标目录筛选出来，</br>
这里可以使用数据处理三剑客(`grep`,`sed`,`awk`)</br>
例如</br>
```
sudo find / -name "mpi.h" | grep '/openmpi/include/mpi.h$'------------------------找到全部路径
```
使用`dirname`获取去除文件名的路径</br>
按照g++格式写到编译语句当中</br>
```
g++ -c step-3.cc -I/usr/lib/x86_64-linux-gnu/openmpi/include/ \
	-I/usr/include/trilinos -I/usr/lib/petscdir/petsc3.15/x86_64-linux-gnu-real/include
```
在脚本当中添加一些循环和判断，把上面的思路改成变量的形式，</br>
注意打印一下中间输出语句，就可以用啦！</br>

### 链接
有了刚才的想法，接下来的步骤就比较轻松了</br>
发现5个需要添加的动态库，而且需要格外注意这些库的版本需要限定用`-l:` </br>
`g++ -o step step-3.o -ldeal.ii -L/path -l:/package.so.XXX.XX`</br>
```
ibtrilinos_teuchoscomm.so.13.2
libtrilinos_teuchoscore.so.13.2
libtbb.so.2
libmpi_cxx.so.40
libmpi.so.40
```
找到这些依赖以后，和上边的脚本连起来，就可以了！</br>

```
/// \file README
/// \brief My final proj of mathsoftware, by Wangheyu
/// \author PhilFan
/// \version 1.1
/// \date 2023-07-11
```
