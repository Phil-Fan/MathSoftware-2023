# MathSoftware-2023
MathSoftware course guided by Yangming Wang , 2023 , short semester</br>


## Assignment 0 Pretask
https://blog.csdn.net/weixin_45885232/article/details/109290570</br>
- 环境安装</br>
重新分配了[磁盘大小](https://blog.csdn.net/qq_43515862/article/details/120705823)</br>
  更改了软件源</br>
  安装了软件包</br>
  安装了中文环境</br>
  sudo apt install XXXX</br>
  sudo apt-get clean</br>
  sudo apt-get remove 要卸载的软件的名字  #卸载该软件</br>
  
- 编译运行</br>
./build</br>
cmake ..</br>
make</br>
./XXX</br>
使用nomacs打开图片</br>

- git操作
git init</br>
git add .</br>
git commit -m "info"</br>
git push </br>

## Assignment 1 Environment
- LaTeX语法</br>
[latex模板](https://zhuanlan.zhihu.com/p/379312980)</br>
[参考网址](https://zhuanlan.zhihu.com/p/52347414)</br>
还没学明白</br>
- 问题：</br>
编译：`xelatex XXX.XX`</br>
`error: there is no line here to end` : 前边的表格没有加`//`</br>
[表格](https://zhuanlan.zhihu.com/p/406538024)</br>
[列表](https://zhuanlan.zhihu.com/p/350596731) </br>
[图片](https://blog.csdn.net/sinat_36301420/article/details/79334728)</br>
注意图片的名字和路径</br>
bib引用</br>

- 系统信息</br>
`win+R` </br>
输入`dxdiag`</br>

- 使用命令行查询内存、硬盘信息</br>
[参考网址](https://zhuanlan.zhihu.com/p/414544197)</br>

- 虚拟机内存、硬盘</br>
[参考网址](https://www.cnblogs.com/djlsunshine/p/10833343.html)</br>
硬盘 ： `df-hl` 或者 `fdisk` </br>
[参考网址](https://www.runoob.com/linux/linux-comm-fdisk.html)</br>
`fdisk`显示`bad usage`: 没开sudo权限</br>

- Linux版本</br>
[参考网址](https://www.cnblogs.com/opensmarty/p/10936315.html)</br>
太多了不要全打印出来</br>
查看所有安装的软件</br>
`apt list --installed> XXX.txt`</br>
GPT答案</br>
`comm -23 <(apt list --installed | cut -d '/' -f 1 | sort) <(gzip -dc /var/log/installer/initial-status.gz | sed -n 's/^Package: //p' | sort) > installed_packages.txt`</br>



- 编译器版本</br>
`gcc -v`</br>

- Makefile 规则</br>
不用makefile感觉编译就很费时间。。。。</br>
这次的Makefile没有仔细学，就是按照老师给的例子模仿了一下</br>
不懂的地方：为什么先编译一次tex，再编译一次bib，再编译两次tex</br>
明天再继续！</br>

