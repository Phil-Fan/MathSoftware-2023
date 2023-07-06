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


## Assignment 3
### Question
T1 感觉和昨天的差不太多</br>
T2 是shell命令相关的</br>
_请编写一个名为`duplicate_checking.sh` 的脚本，功能为比较一个目录下全部文件的区分度。</br>
将有区别行数小于`$1`的文件的文件名记录下来，每个记录1行，格式为：</br>
文件1  文件2  区别行数  文件1总行数 文件2总行数 </br>
将`duplicate_checking.sh`上传到你的gitee源的ass03目录下。</br>_

### 过程
- `duplicate_checking.sh`文件</br>
- `Makefile文件`</br>
- `gen_data.sh`文件</br>

### I `duplicate_checking.sh`
核心是使用`diff`语句加`grep`的统计</br>

遇到的一些问题</br>
- 颜色输出,`ANSI`颜色码</br>
```
# ANSI颜色码
YELLOW='\033[0;33m'
RED='\033[0;31m'
NC='\033[0m' # 恢复默认颜色
用printf更好的控制输出格式

printf "${YELLOW}      欢迎使用重复检查脚本${NC}\n"
```

- 特殊情况的匹配</br>
如`$1` `$2`输入的数字不符合格式，需要返回错误信息并重新执行</br>
这部分需要格外注意`test`命令的写法，包括`$`符号与中括号，大括号，双引号的选择与书写</br>
[linux应用之test命令详细解析 - madtank - 博客园 (cnblogs.com)](https://www.cnblogs.com/tankblog/p/6160808.html)</br>

- 短路运算符</br>
`cd "$destination_directory" || exit 1`</br>

- 数组</br>
把数组作为函数的参数进行传递时候 需要写成"${my_array[*]}"，才可以传递</br>
shell传数组的时候是复制一份再进行操作。</br>
```
a1=(0 1 1)
echo=${a1[1]}
//*和@获取所有元素
echo "数组的元素为: ${my_array[*]}"
echo "数组的元素为: ${my_array[@]}"
echo ${#array[1]} // 显示长度
```

### II `gen_data.sh`</br>
这个不是很会写，调gpt也没有调出我想要的效果</br>
- 有趣的写法</br>
```
while read -r line
  do
    echo "$line" >> "./data/data$data.txt"
  done < "./data/data$template_file.txt"
```

### III Makefile
[Makefile介绍1](https://zhuanlan.zhihu.com/p/56489231)</br>
[Makefile介绍2](https://zhuanlan.zhihu.com/p/92010728)</br>
[Makefile介绍3](https://zhuanlan.zhihu.com/p/430029724)</br>
### 总结
今天的内容相当于`missing semester`里第二讲的一部分把</br>
重点就是变量、管道、重定向以及`test`的判断，再加一些流程控制语句</br>
复习了一些细节的问题，学了学数组之类的</br>

## 其他
看到了一些有意思的，贴一下</br>

- shell技巧</br>
[shell代码风格指导](https://zh-google-styleguide.readthedocs.io/en/latest/google-shell-styleguide)</br>
cheatsheet[awesome-cheatsheets/languages/bash.sh at master](https://github.com/skywind3000/awesome-cheatsheets/blob/master/languages/bash.sh)</br>
[bashshell总结](https://www.cnblogs.com/napoleon_liu/articles/1952228.html)</br>
[shellscript Turorial](https://www.tutorialspoint.com/unix/shell_scripting.htm#)</br>
一个脚本库？[acker-scripts](https://github.com/NARKOZ/hacker-scripts/tree/master)</br>
[运维常用的脚本集合](https://github.com/Ljohn001/ljohn_ops)</br>

- 正则表达式</br>
[互动式教程](https://regexone.com/)</br>

- PS1的自定义</br>
[linux修改PS1，自定义命令提示符样式 - 自我更新 - 博客园 (cnblogs.com)](https://www.cnblogs.com/liu-shijun/p/11075314.html)</br>


## Assignment 4

今天学院小学期回来就快五点了，回来看了智云开始写</br>
所幸今天的任务不是很难</br>
但是还是遇到了配环境的一些问题，以及前两天的LaTeX的一些语法问题</br>
![耗时3h左右](http://file.cc98.org/v2-upload/2023-07-06/wqprth02.jpg)</br>
耗时3h左右把</br>
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


## Git相关
今天看完了missing semester里面git的一节，简直讲的不要再清楚</br>
无敌震惊于老师的操作速度，太牛了简直</br>

通过自顶向下的方式（从命令行接口开始）学习 Git，是抽象且难记忆的</br>
所以在课上通过**Git 的数据模型**开始介绍，自底向上进行介绍；</br>

数据模型是**快照`Snapshot`+文件`blob`+文件夹`tree`**</br>
`type object = blob | tree | commit`</br>
而数据模型是通过其**Hash**值唯一确定的，通过`git cat-file -p HASH`命令可以查看</br>

历史记录的实现是通过**有向无环图**建立的，类似于学过的链表，每个节点都会指向他的父节点</br>
引用（references）是指向某个提交的指针，</br>
使用`git checkout`命令，就可以在不同的节点之间来回移动</br>

### 基础操作</br>
```
git init  创建一个新的 git 仓库
git status 显示当前状态
git add <filename> 添加文件到暂存区
git commit 创建提交
git log: 显示历史日志
git log --all --graph --decorate: 可视化历史记录（有向无环图）!!!! 这个真的是魔术
git diff <filename>: 显示与暂存区文件的差异
git diff <revision> <filename>: 显示某个文件两个版本之间的差异
git checkout <revision>: 更新 HEAD 和目前的分支
```
### 远端操作</br>
```
git remote: 列出远端
git remote add <name> <url>: 添加一个远端
git push <remote> <local branch>:<remote branch>: 将对象传送至远端并更新远端引用
git branch --set-upstream-to=<remote>/<remote branch>: 创建本地和远端分支的关联关系
git fetch: 从远端获取对象/索引
git pull: 相当于 git fetch; git merge
git clone: 从远端下载仓库
```
### 撤销</br>
```
git reset HEAD <file>: 恢复暂存的文件
git checkout -- <file>: 丢弃修改
```
### Git 高级操作</br>
```
git config: Git 是一个 高度可定制的 工具
git clone --depth=1: 浅克隆（shallow clone），不包括完整的版本历史信息
git add -p: 交互式暂存
git blame: 查看最后修改某行的人
.gitignore: 指定 故意不追踪的文件
```
