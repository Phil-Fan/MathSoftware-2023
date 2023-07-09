#!/usr/bin/env gnuplot

# 获取命令行参数数量
n = ARGC
# 如果至少需要三参数传递
if (n == 3) {
    # 获取参数并转换为数值
    a = real(ARGV[1])
    b = real(ARGV[2])
    c = real(ARGV[3])

    # 输出参数值
    print "传递的参数 a =", a
    print "传递的参数 b =", b
    print "传递的参数 c =", c
} 
else {
    print "需要传递三个参数"
    print "例如：gnuplot -c plot_script.gp 3 4 5"
    exit
}

# 设置绘图输出为 PNG 图片
set terminal pngcairo transparent enhanced font "arial,10" fontscale 1.0 size 1200, 800
# 指定输出文件名为 'figure.png'
set output 'figure.png'

# 设置绘图参数
set multiplot layout 2, 2

# 设置参数范围
set urange [-pi : pi] noreverse nowriteback
set vrange [-pi : pi] noreverse nowriteback
# 手动设置坐标轴范围
set xrange [-a:a]
set yrange [-b:b]
set zrange [-c:c]

# 设置绘图样式
set dummy u, v
set key bmargin center horizontal Right noreverse enhanced autotitle nobox
set parametric
set isosamples 50, 20
set hidden3d back offset 1 trianglepattern 3 undefined 1 altdiagonal bentover
set style data lines
set xyplane relative 0

# 设置图形标题
set title "Ellipsoid"

# 主视图
set view 0,0, 1
set title "主视图"
splot a*cos(u)*cos(v), b*sin(u)*cos(v), c*sin(v) with lines

# 俯视图
set view 0, 90, 1
set title "俯视图"
splot a*cos(u)*cos(v), b*sin(u)*cos(v), c*sin(v) with lines

# 左视图
set view 90, 0, 1
set title "左视图"
splot a*cos(u)*cos(v), b*sin(u)*cos(v), c*sin(v) with lines

# 基本视图
set view 60, 30, 1
set title "基本视图"
splot a*cos(u)*cos(v), b*sin(u)*cos(v), c*sin(v) with lines

# 取消多图模式
unset multiplot

# 自动缩放图形
set autoscale

