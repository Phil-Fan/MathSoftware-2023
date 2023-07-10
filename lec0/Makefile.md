## Makefile

[missing semester 元编程](https://missing-semester-cn.github.io/2020/metaprogramming/)

### 构成

[深入解析Makefile系列(0) -- 初识Makefile - 知乎 (zhihu.com)](https://zhuanlan.zhihu.com/p/362908163)

[深入解析Makefile系列(2) -- 常用的通配符、內建变量和模式规则 - 知乎 (zhihu.com)](https://zhuanlan.zhihu.com/p/362915681)

```text
目标 … : 依赖 …
    命令
    …
```

- `Makefile`组成
    - **目标**：编译过程中需要生成的文件，一个目标同样可以是一个需要执行的命令。
    - **依赖**：编译目标时需要依赖的文件列表，以空格分隔
    - **命令**：被执行的指令，命令部分需要以tab开头，**值得注意的是，命令部分的语句将会由makefile的规则做简单替换(变量替换，通配符的替换等等)之后被传递给shell，由shell解析**

- **`Makefile`流程**

  **以最小代价进行更新**

    - 检查依赖文件是否有更新，同时检查目标文件是否存在
    - 如果依赖文件有更新或者没有目标文件，执行命令部分以重新生成目标

    - 如果依赖文件没有更新，不重新编译生成目标

    - 如果一个依赖文件是一个目标，使用相同的以上三条规则先处理依赖文件。

### 规则

- 最好显式定义伪目标

```text
.PHONY : clean
clean:
    -rm main
```

- 生成中间文件，分布式编译

  不要将所有文件放到一个里编译

- 隐式规则(自动推导)

```makefile
1 main:foo.o bar.o common.h
2     cc foo.o bar.o main.c -o main
3 foo.o:common.h foo.h
4 bar.o:common.h bar.h
5 clean:
6     rm -rf *.o  main
```

### 变量

- 赋值
```
% 是一种模式，它会匹配其左右两侧相同的字符串
```

```makefile
=  : 普通的赋值符，将右值赋给左值
?= ：如果没有初始化该变量，就给它赋上默认值，属于条件赋值符
:= : 直接赋值，不过在变量展开上与 =不同(见下文).
::= : 这种赋值符等效于 :=
+= : 追加赋值符，在原变量的值上追加赋值
!= : 这个赋值符比较特殊，右值为一条shell命令，shell命令的返回值赋给赋值符左边的变量.
```

```makefile
$@：代表目标文件的名称。
$<：代表规则的第一个依赖文件的名称。
$^：代表所有依赖文件的列表，以空格分隔。
$?：代表比目标新的依赖文件的列表。
$*：代表目标文件去除后缀的部分。
$(@D)：代表目标文件所在的目录部分。
$(@F)：代表目标文件的文件名部分。
$(<D)：代表依赖文件所在的目录部分。
$(<F)：代表依赖文件的文件名部分。
```



### 函数 

[深入解析Makefile系列(3) -- 函数的使用 - 知乎 (zhihu.com)](https://zhuanlan.zhihu.com/p/362917196)

```makefile
# 模式替换
TEXT = foo.c bar.c
RESULT = $(patsubst %.c,%.o,${TEXT})

${TEXT : %.c=%.o}

# 按照首字母字典排序
$(sort list)
```



### 多文件

[深入解析Makefile系列(4) -- 多目录处理 - 知乎 (zhihu.com)](https://zhuanlan.zhihu.com/p/362922473)



### 逻辑处理

[深入解析Makefile系列(5) -- 逻辑处理 - 知乎 (zhihu.com)](https://zhuanlan.zhihu.com/p/362925982)

[深入解析Makefile系列(6) -- makefile编写实用技巧 - 知乎 (zhihu.com)](https://zhuanlan.zhihu.com/p/362927893)

