## Assignment 4
今日重点：**C程序的编译链接过程（大作业的Bonus）**
### 题目
- 1. 阅读附件的 30.7 1D Interpolation Example Programs</br>
- 2. 在你的系统里编译并运行该程序；</br>
- 3. 将第18行：y[i] = i + cos (i * i); </br>
改为 y[i] = i + cos (i * i)+3.22010...;   // 加上的部分为你的学号，第一个数字后加小数点。</br>
- 4. 编译运行修改后的程序，生成图片：inter.eps</br>
图像生成命令改为：</br>
graph -T ps < interp.dat > interp.eps</br>
这里graph需要安装：</br>
sudo apt install plotutils</br>
- 5. 将这个例子用中文描述一遍，不用附源代码，但要附你生成的图片，形成文件inter.tex.</br>
- 6. 将c源码，tex，eps文件上传到你的源的目录ass04中。</br>


### Task - Environment
遇到了问题
```
没有可用的软件包 plotutils，但是它被其它的软件包引用了。</br>
这可能意味着这个缺失的软件包可能已被废弃，</br>
或者只能在其他发布源中找到</br>
```
首先去找了[这个经验帖](https://www.chinastor.com/linux/ubuntu/052Q31342015.html)</br>
里面有很多关键的步骤</br>
```
# 下载plotutils库
wget https://ftp.gnu.org/gnu/plotutils/plotutils-2.6.tar.gz

# 解压缩下载的tar.gz文件
tar -xzvf plotutils-2.6.tar.gz

# 下载libXaw库
wget https://www.x.org/releases/X11R7.5/src/lib/libXaw-1.0.7.tar.gz

# 将libXaw库的头文件拷贝到系统目录
cp plotutils-2.6/include/X11/Xaw/* /usr/include/X11/Xaw

# 创建libXaw.so的软链接
sudo ln  XXX  XXXX

# 进入plotutils源码目录
cd plotutils-2.6

# 编辑报错的文件（示例中为zwrite）
vim z_write

# 在文件中替换所有的png_ptr->jmpbuf为png_jmpbuf(png_ptr)
:%s/png_ptr->jmpbuf/png_jmpbuf(png_ptr)/gc

# 保存文件并退出编辑器

# 继续安装plotutils库
./configure
make
sudo make install

```

`png_ptr->jmpbuf`又报错了</br>
根据[网友经验](https://blog.csdn.net/TTTree_/article/details/103925728 )的提示，查询了[官方文档](https://linux.die.net/man/3/libpng) </br>
在[错误指导](https://zhuanlan.zhihu.com/p/592731889) 中找到了以下提示</br>
```
警告：setjmp / longjmp 会让 C++ 包括析构函数在内的很多特性变得不可靠，从而使得 RAII 等防止资源泄露的方法失去原本的效果，所以在后文涉及的代码中请谨慎使用各种 C++ 特性！详情请参见 cppreference 上 longjmp 的介绍：
```
所以找到了问题所在：由于版本问题，所以有些结构体和指针的操作并不支持了</br>
所以要换做`libpng`的函数进行操作，所以进入`z_write`文件</br>
搜索所有的`png_ptr->jmpbuf` 替换为`setjmp(png_jmpbuf(png_ptr))`</br>

至此，错误消失，可以正常使用</br>


### tex
作业的内容是课上的例子的复现</br>
其实不深究的话没什么难度</br>
[插值 - 知乎](https://zhuanlan.zhihu.com/p/98431641)</br>
[理解插值法](https://zhuanlan.zhihu.com/p/64855561)</br>
### Makefile
- gcc 编译</br>
在功能上，预处理、编译、汇编是3个不同的阶段</br>
但gcc在实际操作时可以把这3个步骤合并为一个步骤来执行,即使用 -c选项：</br>
`$ gcc –c test.c -o test.o`</br>
- 链接</br>
`gcc -o <exe name> <xxx.o> <xxx.o>`</br>
动态链接`gcc -shared -o libhello.so hello.c`找不到的时候再去找</br>
`gcc -o hello main.o -Llib -lhello`</br>
shell 不知道位置，通过环境变量指明</br>
`export LD_LIBRARY_PATH=/home/Projects/.../lib`</br>

```
-L 指定库路径
-l （小写的L）指定库名称
-I （大写的i）指定头文件所在路径
-i 指定头文件名称
```
