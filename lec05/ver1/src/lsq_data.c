#include <stdio.h>
#include <stdlib.h>
#include <time.h>

// 生成测试数据点并保存到文件
void generateAndSaveTestData(const char* filename, int n) {
    FILE* file = fopen(filename, "w");
    if (file == NULL) {
        printf("Failed to open the file.\n");
        return;
    }
    
    srand(time(NULL));  // 使用当前时间作为随机数种子
    
    for (int i = 0; i < n; i++) {
        // 生成随机的 x 和 y 值
        double x = (double)rand() / RAND_MAX * 10.0;
        double y = (double)rand() / RAND_MAX * 10.0;
        fprintf(file, "%.2f %.2f\n", x, y);
    }
    
    fclose(file);
}

int main() {
    int n = 100;
    
    // 生成测试数据并保存到文件
    generateAndSaveTestData("testdata.txt", n);
    
    printf("Test data has been generated and saved to \"testdata.txt\".\n");
    
    return 0;
}
