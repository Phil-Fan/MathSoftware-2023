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

### 总结
今天的内容相当于`missing semester`里第二讲的一部分把</br>
重点就是**变量、管道、重定向以及`test`的判断**，再加一些流程控制语句</br>
复习了一些细节的问题，学了学数组之类的</br>


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

