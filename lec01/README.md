## Assignment 1 Environment
### 作业内容
用git获取我的代码，重复我上课的两个例子，并且自行查阅适当的资料，完成下述工作：</br>
1. 创建你的gitee帐号，创建一个叫math-soft的源，将其设成公开仓库</br>
2. 在你的源内，增加一篇文档，名为：enviroment.tex，内容为对你参加课程学习的计算环境的描述，要求至少包含：</br>
  +你的计算机型号，CPU型号，内存大小，硬盘大小，显卡型号 （指你真正的计算机）</br>
  +你的Linux实现方式：主系统，双系统还是虚拟机，或者其他。如果是虚拟机，描述一下虚拟机的内存大小和硬盘大小。</br>
  +你的Linux版本，和安装了哪些额外的软件（系统自带的不用列，自己安装的不论是否是我视频中有的尽量列出）。</br>
  +你的编辑器和你的gcc编译器的版本。</br>
  +用最多不超过200字评估一下你在未来的学习和工作中使用Linux环境工作的可能性和可能场景。</br>
  +文章应该能用latex编译通过，可以参考我的文件，注意字体需要安装。最后在学在浙大提交你的git源地址（gitee那个）。</br>


### 环境配置和Linux基础
其实使用Linux环境工作，第一道坎就是配好这个环境</br>
第一次课也围绕基础的Linux操作展开</br>
具体的细节可以去看鸟哥的linux书，讲的挺不错的</br>


- 系统信息</br>
`win+R` </br>
输入`dxdiag`</br>

- 使用命令行查询内存、硬盘信息</br>
[参考网址](https://zhuanlan.zhihu.com/p/414544197)</br>

- 虚拟机内存、硬盘</br>
虚拟机第一次装的时候最好留够40GB的空间，这样就不用反复设置了</br>
更改磁盘空间大小工具——[Gparted](https://blog.csdn.net/ningmengzhihe/article/details/127295333) </br>
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


###  LaTeX语法
LaTeX的学习就四个字：**熟能生巧**</br>
最好先看一下老师的模板或者overleaf上的模板，也可以在网上找一些</br>
[latex模板](https://zhuanlan.zhihu.com/p/379312980)</br>
[参考网址](https://zhuanlan.zhihu.com/p/52347414)</br>

- 问题：</br>
编译：`xelatex XXX.XX`</br>
`error: there is no line here to end` : 前边的表格没有加`//`</br>
[表格](https://zhuanlan.zhihu.com/p/406538024)</br>
[列表](https://zhuanlan.zhihu.com/p/350596731) </br>
[图片](https://blog.csdn.net/sinat_36301420/article/details/79334728)</br>
注意图片的名字和路径</br>
bib引用</br>





