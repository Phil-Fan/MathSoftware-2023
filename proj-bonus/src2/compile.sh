#!/bin/bash
echo "正在寻找所需要的依赖 ..."
# 使用 find 命令在 /usr 目录下查找文件并筛选特定路径
mpi_path=$(sudo find /usr -name "mpi.h" | grep '/openmpi/include/mpi.h$')
sacado_path=$(sudo find /usr -name "Sacado.hpp" | grep '/trilinos/Sacado.hpp$')
petsc_path=$(sudo find /usr -name "petsc.h" | grep '/petscdir/petsc3.15/x86_64-linux-gnu-real/include/petsc.h$')

# 提取路径中的文件夹名
mpi_include_dir=$(dirname "$mpi_path")
sacado_include_dir=$(dirname "$sacado_path")
petsc_include_dir=$(dirname "$petsc_path")
echo "Finished!"
# 定义颜色代码
YELLOW='\033[1;33m'
NC='\033[0m'  # 用于重置颜色

# 使用 printf 输出对齐的文本和黄色字体
printf "mpi.h路径为\n  ${YELLOW}%s${NC}\n" "$mpi_include_dir"
printf "Sacado.hpp路径为\n  ${YELLOW}%s${NC}\n" "$sacado_include_dir"
printf "petsc.h的路径为\n  ${YELLOW}%s${NC}\n" "$petsc_include_dir"
# 编写编译命令
compile_command="g++ -c step-3.cc -I$mpi_include_dir -I$sacado_include_dir -I$petsc_include_dir"

# 打印编译命令
echo "Compiling step-3.cc with the following command:"
echo "$compile_command"

# 执行编译命令
$compile_command


# 目标文件路径
object_file="step-3.o"

# 查找依赖库的文件夹路径
teuchoscomm_path=$(find /usr -name "libtrilinos_teuchoscomm.so.13.2" -exec dirname {} \;)
teuchoscore_path=$(find /usr -name "libtrilinos_teuchoscore.so.13.2" -exec dirname {} \;)
tbb_path=$(find /usr -name "libtbb.so.2" -exec dirname {} \;)
mpi_cxx_path=$(find /usr -name "libmpi_cxx.so.40" -exec dirname {} \;)
mpi_path=$(find /usr -name "libmpi.so.40" -exec dirname {} \;)

# 定义颜色代码
YELLOW='\033[1;33m'
NC='\033[0m'  # 用于重置颜色

# 输出路径的格式
path_format="${YELLOW}%s${NC}"

# 输出路径
printf "teuchoscomm路径为\n  ${path_format}\n" "$teuchoscomm_path"
printf "teuchoscore路径为\n  ${path_format}\n" "$teuchoscore_path"
printf "tbb路径为\n  ${path_format}\n" "$tbb_path"
printf "mpi_cxx路径为\n  ${path_format}\n" "$mpi_cxx_path"
printf "mpi路径为\n  ${path_format}\n" "$mpi_path"

# 检查依赖库的路径是否都在同一文件夹下
if [ "$teuchoscomm_path" = "$teuchoscore_path" ] &&
   [ "$teuchoscore_path" = "$tbb_path" ] &&
   [ "$tbb_path" = "$mpi_cxx_path" ] &&
   [ "$mpi_cxx_path" = "$mpi_path" ]; then
    libraries_dir="$teuchoscomm_path"
    libraries_option="-L$libraries_dir"
else
    libraries_option="-L$teuchoscomm_path -L$teuchoscore_path -L$tbb_path -L$mpi_cxx_path -L$mpi_path"
fi

# 编写编译命令
compile_command="g++ -o step-3 $object_file -ldeal.ii $libraries_option -l:libtrilinos_teuchoscomm.so.13.2 -l:libtrilinos_teuchoscore.so.13.2 -l:libtbb.so.2 -l:libmpi_cxx.so.40 -l:libmpi.so.40"

# 打印编译命令
echo "Compiling step-3 with the following command:"
echo "$compile_command"
$compile_command

