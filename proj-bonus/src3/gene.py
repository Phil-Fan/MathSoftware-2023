import importlib

# 检查是否安装了 vtk 包
try:
    importlib.import_module('vtk')
    print("vtk package is already installed.")
except ImportError:
    print("vtk package is not installed. Installing...")
    
    # 执行安装命令
    import subprocess
    subprocess.check_call(['pip', 'install', 'vtk'])

    print("vtk package has been installed.")

# 导入必要的模块
from paraview.simple import *

print("start generating pic")
# 加载 VTK 文件
# 打开 ParaView 并加载网格数据
filename = "./solution.vtk"
grid_data=LegacyVTKReader(FileNames=[filename])
print("load success")

# 应用切片过滤器
slice_filter = Slice(Input=grid_data)
slice_filter.SliceType = "Plane"
slice_filter.SliceOffsetValues = [0.0]
slice_filter.SliceType.Normal = [0, 0, 1]
slice_filter.UpdatePipeline()

# 应用变形过滤器
warp_filter = WarpByScalar(Input=grid_data)
warp_filter.ScaleFactor = 6.0
warp_filter.UpdatePipeline()

# 创建渲染视图
render_view = GetRenderView()
render_view.ViewSize = [800, 600]
render_view.Background = [1, 1, 1]



#SetActiveView(render_view)
# 显示所有的 Pipeline
Show(grid_data, render_view)
Show(slice_filter, render_view)
Show(warp_filter, render_view)
# 获取视图的名称
render_view_name = render_view.GetLogName()
print("当前活动视图名称：", render_view_name)


# 定义视角
viewpoints = [
    {'label': 'Front View'},
    {'label': 'Top View'},
    {'label': 'Side View'},
    {'label': 'Isometric View'}
]

# 设置预设视角
preset_viewpoints = {
    'Front View': {'position': [0, 0, 10], 'focal_point': [0, 0, 0], 'view_up': [0, 1, 0]},
    'Top View': {'position': [0, 10, 0], 'focal_point': [0, 0, 0], 'view_up': [0, 0, 1]},
    'Side View': {'position': [10, 0, 0], 'focal_point': [0, 0, 0], 'view_up': [0, 0, 1]},
    'Isometric View': {'position': [10, 10, 10], 'focal_point': [0, 0, 0], 'view_up': [0, 0, 1]}
}

# 遍历视角并保存图像
for i, viewpoint in enumerate(viewpoints):
    view_name = viewpoint['label']
    if view_name in preset_viewpoints:
        preset_view = preset_viewpoints[view_name]
        if preset_view is not None:
            render_view.ResetCamera()
            render_view.CameraPosition = preset_view['position']
            render_view.CameraFocalPoint = preset_view['focal_point']
            render_view.CameraViewUp = preset_view['view_up']
        ResetCamera()  # 重置相机
        Render()  # 渲染图像
        WriteImage('proj{}.png'.format(i + 9))
        print(i,viewpoint)
print("showsuccess")
# 渲染并保存图像
# 关闭 ParaView 会话
Disconnect()
exit()





