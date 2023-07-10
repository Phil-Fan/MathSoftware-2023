## Assignment 2

### 作业内容
自行查阅适当的资料，完成下述工作：</br>
- 阅读 An Introduction to Scientific Computing Twelve</br>
Computational Projects Solved with MATLAB 的 12.2 和 12.4，</br>
用中文翻译这两节的内容，要求保留全部的公式，并重新绘制图 12.1.</br>
- 在你的源内，增加一个ass02的目录，其中包含一篇文档，</br>
名为：navier-stokes.tex，内容为上述翻译. (昨天的作业顺便移到ass01目录中去吧)</br>
- 文件可以用 xelatex 生成为 navier-stokes.pdf.</br>
- 在ass02目录中，增加一个名为 references.bib 的文件，里面只有一篇文献，</br>
就是这本书自己. 将其引用在你的翻译的第一句话之后，并生成参考文献.</br>
- 提供一个 ass02/Makefile 文件，使得 make 后能自动产生 navier-stokes.pdf，</br>
不会出现引用缺失.</br>
- 公式和图片可以重新编号，但和正文之间的引用关系不能变.</br>
- 图片可以用 pgf 或 tikz 重绘.</br>

</br>
</br>

### 总结
**今天重点是：LaTeX基本使用、OverLeaf网站、tex+Makefile+slide的工作流**</br>
今天的作业感觉比较机械化吧，没有什么太大难度，就是搜搜公式c+v一下</br>
画画图，应该比较快的</br>
想起了以前再xmind里打公式的时候hhh</br>

王老师说了一句话我觉得还蛮有道理的：**你用不到的东西就不要去学，但是要了解**</br>
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
