# 介绍

此模块用于支持登临cuda环境的cmake `find_package(CUDA)`

# 使用说明

### 配置登临环境

1. 安装 sdk
2. source sdk/env.sh

### 修改 cmake code

在`find_package(CUDA)`之前，将本目录加入 CMAKE_MODULE_PATH，参考 sample/CMakeLists.txt
```cmake
list(APPEND CMAKE_MODULE_PATH /your/modules_cuda/root/dir/)
```

### 正常编译运行

参考 sample/run.sh

