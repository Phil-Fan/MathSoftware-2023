# MathSoftware-2023
MathSoftware course guided by Wang_heyu, 2023 , short semester</br>


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
![day1 timeuseage](https://gitee.com/philfan/my-images/raw/master/%E5%BE%AE%E4%BF%A1%E5%9B%BE%E7%89%87_20230703181455.png)


## Assignment 2
今天的作业感觉比较机械化吧，没有什么太大难度，就是搜搜公式c+v一下</br>
画画图，应该比较快的</br>
想起了以前再xmind里打公式的时候hhh</br>
有点困先划划水，完了再来补</br>

王老师说了一句话我觉得还蛮有道理的：你用不到的东西就不要去学，但是要了解</br>
感觉以后写论文可以用一点这种自动化的流程，ppt和报告都搞定了</br>
C大报告这样生成感觉也是可以的</br>
不太想重复太多的写点坐标的工作，所有后面画图变成了与gpt交流ac01</br>


### 总体流程
- step1 昨天晚上睡觉前，看到老师发了今天的作业，现在overleaf里把公式敲了</br>
- step1.5 写了一下makefile</br>
- step2 调整了交叉引用和文献格式，解决了一些页眉、页码和中文问题</br>
- step3 学习了一下画图方法，调教gpt生成了需要的图片</br>
- step4 调整了最终的结果，写了一点点注释什么的</br>

耗时如下，因为上课的时候也在写，所以加起来3-4.5h左右把</br>
![时间](https://gitee.com/philfan/my-images/raw/master/20230704130237.png)


### 一些卡住的地方

- 特殊符号怎么打
`\mathbb{R}`实数集</br>
`\partial x` 偏导`\partial ^n x`n阶</br>
` \approx `约等于</br>
`\left[y_c(j), y_c(j + 1)\right]`区间的写法</br>
- 无序列表</br>
```
\begin{itemize}
    \item $u(i, j) \approx u(x_c(i), y_m(j))$（单元的西侧面），
    \item $v(i, j) \approx v(x_m(i), y_c(j))$（单元的南侧面），
    \item $p(i, j) \approx p(x_m(i), y_m(j))$（单元的中心）。
\end{itemize}
```

- 多行公式</br>
```
\begin{equation}
\begin{aligned}
q(x, y) &=  x+y^2\\
p(x, y) &=  x+y\\
\end{aligned}
\end{equation}
```
- 页眉设置</br>
```
% 定义新的页眉样式
\fancypagestyle{sectionheader}{
    \fancyhf{} % 清空当前页眉设置
	\fancyhead[L]{Page:\thepage}
	%\fancyhead[C]{中间页眉}
	\fancyhead[R]{\leftmark}
}
```

- 设置起始页码</br>
`\setcounter{page}{0}`

- 双向箭头画法</br>

```
\begin{tikzpicture}
    \draw[latex-latex,fill=black] (0,0) -- (2,0);
    \draw[latex-latex,fill=black] (3,0) -- (5,0);
    \draw[stealth-stealth,fill=black] (6,0) -- (8,0);
\end{tikzpicture}
```
### 资源网站
[latex语法](https://xmind.cn/faq/question/equation/)很喜欢xmind做的这个，ui比网上大部分好看且清楚</br>
[Overleaf 在线LaTeX](https://cn.overleaf.com/project)</br>
[PGF example](https://pgfplots.net/)</br>
[Tikz example](https://texample.net/tikz/examples/all/)</br>

