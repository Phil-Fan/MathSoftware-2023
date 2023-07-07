#include <stdio.h>

// 最小二乘拟合函数
void leastSquaresFit(double x[], double y[], int n, double* slope, double* intercept) {
    double sumX = 0.0, sumY = 0.0, sumXY = 0.0, sumXX = 0.0;
    
    // 计算各项和
    for (int i = 0; i < n; i++) {
        sumX += x[i];
        sumY += y[i];
        sumXY += x[i] * y[i];
        sumXX += x[i] * x[i];
    }
    
    // 计算斜率和截距
    double avgX = sumX / n;
    double avgY = sumY / n;
    double denominator = sumXX - sumX * avgX;
    
    if (denominator != 0) {
        *slope = (sumXY - sumX * avgY) / denominator;
        *intercept = avgY - (*slope) * avgX;
    } else {
        // 如果分母为0，则斜率和截距无法计算
        printf("Vertical line. Slope and intercept undefined.\n");
    }
}

int main() {
    // 定义数组来存储测试数据
    double x[100];
    double y[100];
    int n = 100;
    
    // 从文件中读取测试数据
    FILE* file = fopen("testdata.txt", "r");
    if (file == NULL) {
        printf("Failed to open the file.\n");
        return 1;
    }
    
    // 读取测试数据
    for (int i = 0; i < n; i++) {
        if (fscanf(file, "%lf %lf", &x[i], &y[i]) != 2) {
            printf("Error reading data from file.\n");
            fclose(file);
            return 1;
        }
    }
    
    fclose(file);
    
    // 调用最小二乘拟合函数
    double slope, intercept;
    leastSquaresFit(x, y, n, &slope, &intercept);
    
    // 输出拟合结果
    printf("Slope: %.2f\n", slope);
    printf("Intercept: %.2f\n", intercept);
    
    // 输出gnuplot格式的数据文件
    FILE* output = fopen("output.dat", "w");
    if (output == NULL) {
        printf("Failed to open the output file.\n");
        return 1;
    }
    
    // 将测试数据写入文件
    for (int i = 0; i < n; i++) {
        fprintf(output, "%.2f %.2f\n", x[i], y[i]);
    }
    
    fprintf(output, "\n");
    
    // 计算最佳拟合曲线上的点，并写入文件
    for (double xi = 0.0; xi <= 10.0; xi += 0.1) {
        double yi = slope * xi + intercept;
        fprintf(output, "%.2f %.2f\n", xi, yi);
    }
    
    fclose(output);
    
    printf("Output file \"output.dat\" generated.\n");
    
    return 0;
}
