#!/bin/bash

##############################################
# duplicate_checking.sh
# 作者：PhilFan
# 目的：制作一个作弊检查器，使用diff命令，比较目录中所有文件的区分度
# 方法：该脚本比较目录中每个文件的内容，并记录行数差异小于阈值的文件名
#	其中阈值为总行数的20%与手动输入阈值的较小值
##############################################

# ANSI颜色码
YELLOW='\033[0;33m'
RED='\033[0;31m'
NC='\033[0m' # 恢复默认颜色

# 定义min函数，返回任意数量参数中的最小值
min() {
  local min_val=$1

  shift #所有参数向左移动一位
  for num in "$@"; do
    if [ "$num" -lt "$min_val" ]; then
      min_val=$num
    fi
  done

  echo "$min_val"
}

# 比较文件并记录结果的函数
compare_files() {
  file1=$1
  file2=$2
  
  #echo $1 $2 "file"
  
  # 统计file1中的总行数
  file1_lines=$(wc -l < "$file1")

  # 统计file2中的总行数
  file2_lines=$(wc -l < "$file2")

  # 比较文件并计算不同行的数量,diff 箭头不同代表着不同文件，所以可以统计有以 < 开头的行数，即为统计出的不同的行数
  diff_lines=$(diff "$file1" "$file2" | grep -c "^<")

  # 计算阈值
  threshold=$(min "$threshold" "$((file1_lines/5))" "$((file2_lines/5))")

  # 检查差异是否小于指定阈值
  if [ "$diff_lines" -lt "$threshold" ]; then
    # 打印文件名和比较结果
	((cnt++))
	printf "${RED}检测到第 %s 个 符合结果的文件 信息为${NC}\n" "$cnt"
	printf "${YELLOW}%-20s %-30s${NC}" "$file1" "$file2"
	printf "%-10s %-10s %s\n" "$diff_lines" "$file1_lines" "$file2_lines"
  fi
}

# 写一个打印数组元素到同一行的函数，元素之间以空格分隔，函数接收数组名为参数，用于调试
print_array_elements() {
  #local 是shell中的局部变量的意思
  local array_name=$1
  # 获取数组的长度
  local array_length=${#array_name[@]}

  # 遍历数组元素
  for ((i = 0; i < array_length; i++)); do
    # 打印数组元素
    echo  "${array_name[i]}"
  done
}

# 欢迎页面
echo "-----------------------------------------"
printf "${YELLOW}      欢迎使用重复检查脚本${NC}\n"
echo "-----------------------------------------"
printf  "${YELLOW}作者：PhilFan${NC}\n"
printf  "${YELLOW}目的：比较目录中所有文件的区分度${NC}\n"
printf  "${YELLOW}方法：该脚本比较目录中每个文件的内容，并记录行数差异小于阈值的文件名${NC}\n "
printf  "${YELLOW}其中阈值为总行数的20%%与手动输入阈值的较小值 ${NC}\n"
echo "-----------------------------------------"

# 检查是否提供了目录路径
if [ $# -ne 0 ]; then
  echo "请不要着急，阈值和目录等一下会让你输入的doge"
  exit 1
fi

# 从用户输入读取阈值

# 验证 threshold 是否为数字
while true; do
  echo -n "请输入阈值(正整数): "
  read threshold
  if ! [[ $threshold =~ ^[0-9]+$ ]];then
    echo "请输入数字"	
  elif [[ $threshold -le 0 ]];then
	echo "请输正整数"
  else
	break
  fi  
done

while true; do
  # 从用户输入读取目录路径
  echo -n "请输入目录路径: "
  read destination_directory

  # 检查提供的目录是否存在
  if [ ! -d "$destination_directory" ]; then
    echo "目录 '$destination_directory' 不存在。"
  else
	break
  fi
done

# 切换到指定目录
cd "$destination_directory" || exit 1

# 查找目录中的所有文件,要记住find原先就是递归寻找的，输出结果是每个文件的路径
files=$(find . -type f)
echo "------------------------------------------"
echo "本目录下共有文件${#files[@]}个 分别为"
print_array_elements "${files[@]}"
echo "------------------------------------------"

cnt=0

# 记录已比较的文件对
compared_pairs=()
#my_array=("元素1" "元素2" "元素3")
#shell 把数组作为函数的参数进行传递时候 需要写成"${my_array[*]}"


# 遍历每个文件并与其他文件进行比较
for file1 in $files; do
  for file2 in $files; do
    # 跳过与自身比较的文件和已比较的文件对
    # 要注意$的使用和“”的使用;这里需要防止重复判断，所以要记录已经操作过的文件
    
    if [ "$file1" != "$file2" ] && ! [[ " ${compared_pairs[*]} " == *" $file1 $file2 "* ]] && ! [[ " ${compared_pairs[*]} " == *" $file2 $file1 "* ]]; then  
      compare_files "$file1" "$file2"
      # 将已比较的文件对添加到记录中
	  compared_pairs+=("$file1 $file2")
      #echo "${compared_pairs[@]}"
	  #print_array_elements "${compared_pairs[*]}"
    fi
  done
done

printf  "本次搜索共统计出 ${YELLOW} $cnt ${NC} 个结果，欢迎下次使用\n\n"
# 脚本结束

