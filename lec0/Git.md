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




