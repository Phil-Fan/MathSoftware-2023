## Assign 6 Cmake & Doxygen & OOP

今天前面都在讲计算的相关问题</br>
后面20min比较有意思，讲了一个摸鱼插件——Doxygen，顺带讲了一点点C++的知识</br>

### 题目
1. 在你的源里增加一个目录ass06.</br>
2. 参照 Duck 类，设计一个 Class，名字为 Chicken，要求属性为：</br>
```
int age;
int ID;
double weight;
```
要求操作为：</br>
```
void sing();
Chicken(int _a, int _I, double _w);
~Chicken();
```
自己可以适当补充内容。</br>
3. 用 Doxygen 格式给它提供注释，建议只用英文。如果用了中文，latex产生会有编译器（要用xelatex），模板（要用ctex）和字体问题。</br>
4. 写一个CMakeLists.txt 完成编译和文档的自动生成。并要求可以指定安装的目录，安装后，可执行文件为`目标目录/bin/chicken`，
头文件装在`目标目录/include/`</br>
提示，以上参考我的源里 example/Duck 和 example/C/hello.cmake .</br>


### Cmake



### Doxygen
![图片](http://www.doxygen.nl/manual/infoflow.png)
- 安装
使用Vundle管理插件</br>
[安装介绍](https://blog.csdn.net/bodybo/article/details/78685640)</br>
[VIM文档实用指南](https://blog.csdn.net/clarkZHUO/article/details/1471573)</br>
- 自定义
Vim + Doxygen </br>

键位映射</br>
```
map <F3>a :DoxAuthor
map <F3>f :Dox
map <F3>b :DoxBlock
map <F3>c O/** */<Left><Left>
```

- 基础功能介绍</br>
网上大部分的教程都是GUI教程xs，但是现在感觉gui有些东西就是冗余的</br>
查这种说真的比不上GPThhh
[Doxygen文档生成工具教程](https://www.jianshu.com/p/bf5afbbe183b)</br>
[Window - Doxygen快速入门](https://zhuanlan.zhihu.com/p/100223113)</br>
[Doxygen + graphviz](https://www.cnblogs.com/arnoldlu/p/11552271.html)</br>
[linux workflow](http://blog.chinaunix.net/uid-21809556-id-1814825.html)</br>
[注释规范](https://www.cnblogs.com/schips/p/12200388.html)</br>
- custom css</br>
在github上可以找到不少自定义的html框架</br>比如
[Doxygen Theme](https://github.com/nnen/doxygen-theme)，
[Doxygen Theme](https://github.com/MaJerle/doxygen-dark-theme)，
[Doxygen Awesome - Github](https://github.com/jothepro/doxygen-awesome-css)</br>
[更改Doxygen主题](https://www.coder.work/article/1566553#:~:text=Doxygen%20%E5%85%81%E8%AE%B8%E6%82%A8%E8%AE%BE%E7%BD%AE%E4%B8%80%E4%BA%9B%E9%80%89%E9%A1%B9%E6%9D%A5%E6%8E%A7%E5%88%B6%E8%BE%93%E5%87%BA%E7%9A%84%E5%A4%96%E8%A7%82%E3%80%82%20%E9%80%9A%E5%B8%B8%E5%AE%83%E4%BB%AC%E4%BB%A5%20HTML_%20%E5%BC%80%E5%A4%B4%E3%80%82%20%E4%B8%BA%E4%BA%86%E8%8E%B7%E5%BE%97%E6%9C%80%E5%A4%A7%E7%9A%84%E7%81%B5%20active%20%EF%BC%8C%E6%82%A8%E5%8F%AF%E4%BB%A5%E9%80%9A%E8%BF%87,HTML_FOOTER%20%E5%92%8C%20HTML_STYLESHEET%20%E9%80%89%E9%A1%B9%E6%8F%90%E4%BE%9B%E8%87%AA%E5%AE%9A%E4%B9%89%E9%A1%B5%E7%9C%89%E5%92%8C%E9%A1%B5%E8%84%9A%20HTML%20%E4%BB%A5%E5%8F%8A%E8%87%AA%E5%AE%9A%E4%B9%89%20CSS%20%E6%A0%B7%E5%BC%8F%E8%A1%A8.)</br>


- 使用
```
doxygen –g               # 生成项目文件
doxygen    -s -g  v    # 不带注释生成
```
### 作业实现
首先关于类的实现，我做了一个**小鸡互啄**的游戏</br>
有一定的游戏性，是一个回合制的简单小游戏</br>
有点C大程的味道</br>
Doxygen还是好用的，为啥C大的时候不知道这个工具呜呜呜</br>

</br>
</br>
进入build文件夹</br>
cmake ..</br>
make</br>
make install</br>
文件会出现在ass06/demo文件夹下</br>
同时会出现html和latex文件</br>

