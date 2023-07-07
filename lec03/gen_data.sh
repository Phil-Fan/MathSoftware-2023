#!/bin/bash

# 从参数中读取文件数量和行数
# 验证文件数量是否为数字
while true; do
  echo -n "请输入文件数量(正整数): "
  read -r file_count
  if ! [[ $file_count =~ ^[0-9]+$ ]];then
    echo "请输入数字"	
  elif [[ $file_count -le 0 ]];then
    echo "请输入正整数"
  else
    break
  fi  
done

# 验证行数是否为数字
while true; do
  echo -n "请输入文件默认行数(正整数): "
  read -r line_number
  if ! [[ $line_number =~ ^[0-9]+$ ]];then
    echo "请输入数字"	
  elif [[ $line_number -le 0 ]];then
    echo "请输入正整数"
  else
    break
  fi  
done

# 创建一个函数来生成随机数据
generate_data() {
  for ((i=1; i<=line_number; i++))
  do
    echo "Data $1 - Line $i"
  done
}

# 创建存储数据的文件夹
mkdir -p ./data

# 生成第一个文件
generate_data 1 > "./data/data1.txt"
echo "Data 1: $line_number lines with no duplicates"

# 生成指定数量的数据文件
for ((data=2; data<=file_count; data++))
do
  # 随机选择一个文件作为模板
  template_file=$((RANDOM % (data-1) + 1))

  # 调用函数生成数据，并重定向输出到文件
  generate_data $data > "./data/data$data.txt"

  # 复制抄袭的行
  while read -r line
  do
    echo "$line" >> "./data/data$data.txt"
  done < "./data/data$template_file.txt"

  echo "Data $data: $line_number lines with $line_number lines duplicated from data$template_file.txt"
done

