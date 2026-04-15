# 新人入门指南

## 环境准备

1. 安装 Go 1.21+
2. 安装 Docker & Docker Compose
3. 安装 buf（Proto 代码生成）：`go install github.com/bufbuild/buf/cmd/buf@latest`
4. 安装 make

## 快速上手

```bash
# 克隆仓库
git clone <repo-url> && cd demo

# 代码生成
make generate

# 本地启动所有服务
make dev

# 运行测试
make test
```

## 项目结构

详见 [根目录 README](../README.md)。

## 开发规范

详见 [编码规范](conventions/)。

## 创建新服务

```bash
make new-service name=my-new-service
```

## 常见问题

### Proto 生成失败？
确保已安装 buf，并运行 `make generate`。

### 如何添加新的数据库迁移？
在 `apps/{service}/migration/` 中创建新的迁移文件，参考 [迁移文档](../apps/order-service/migration/README.md)。
