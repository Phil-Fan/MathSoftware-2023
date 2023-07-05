.PHONY: all clean

# 目标：生成数据
data:
	bash gen_data.sh

# 目标：检查重复
check:
	bash duplicate_checking.sh

# 默认目标
all: data check


# 目标：清理生成的数据文件
clean:
	rm -rf ./data

