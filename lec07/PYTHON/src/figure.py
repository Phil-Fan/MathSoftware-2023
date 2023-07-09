import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D
from matplotlib import cm

# 从文件读取椭球参数
with open("dimension.txt", "r") as file:
    dimensions = file.readline().split()
    a = float(dimensions[0])
    b = float(dimensions[1])
    c = float(dimensions[2])

# 创建椭球上的点
u = np.linspace(0, 2 * np.pi, 100)
v = np.linspace(0, np.pi, 50)
x = a * np.outer(np.cos(u), np.sin(v))
y = b * np.outer(np.sin(u), np.sin(v))
z = c * np.outer(np.ones(np.size(u)), np.cos(v))

# 创建田字形的图片
fig, axs = plt.subplots(2, 2, figsize=(8, 8))

# 绘制前视图
axs[0, 0].imshow(np.flipud(np.transpose(y)), cmap=cm.viridis, extent=(-b, b, -c, c))
axs[0, 0].set_title('Front View')
axs[0, 0].set_xlabel('Y')
axs[0, 0].set_ylabel('Z')

# 绘制俯视图
axs[0, 1].imshow(np.flipud(np.transpose(x)), cmap=cm.viridis, extent=(-a, a, -b, b))
axs[0, 1].set_title('Top View')
axs[0, 1].set_xlabel('X')
axs[0, 1].set_ylabel('Y')

# 绘制平视图
axs[1, 0].imshow(np.flipud(np.transpose(z)), cmap=cm.viridis, extent=(-a, a, -c, c))
axs[1, 0].set_title('Side View')
axs[1, 0].set_xlabel('X')
axs[1, 0].set_ylabel('Z')

# 绘制3D视图
axs[1, 1] = fig.add_subplot(224, projection='3d')
axs[1, 1].plot_surface(x, y, z, cmap=cm.viridis)
axs[1, 1].set_title('3D View')
axs[1, 1].set_xlabel('X')
axs[1, 1].set_ylabel('Y')
axs[1, 1].set_zlabel('Z')

# 调整子图之间的间距
plt.subplots_adjust(wspace=0.3, hspace=0.3)

# 保存图片
plt.savefig('figure.png')

# 显示图片
# plt.show()

