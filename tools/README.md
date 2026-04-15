# tools/

开发者工具链。

## 目录结构

```
tools/
├── codegen/      代码生成器（Proto → stub, ORM model 生成等）
├── linter/       自定义架构守护规则（如禁止 domain 导入 port/out）
├── scripts/      开发辅助脚本（一键启动、格式化、依赖检查、affected-only 构建等）
└── templates/    新服务脚手架模板
```

## 架构守护

`linter/` 中应包含自动化规则，在 CI 中强制执行：

- 禁止 domain 层导入 port/ 或 pkg/logger 等技术包
- 禁止 apps/A 导入 apps/B 的代码
- 禁止 usecase 层导入框架包

## 新服务脚手架

```bash
make new-service name=payment-service
# 使用 templates/ 下的模板自动生成标准目录结构
```
