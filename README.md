# Demo Monorepo

基于 **整洁架构（Clean Architecture）** 设计的 Monorepo 后端项目模板。

## 目录结构

```
├── apps/           可独立部署的服务
├── idl/            IDL 契约（Proto / OpenAPI）唯一归属
├── generated/      自动生成代码（Proto stub / ORM model）
├── pkg/            共享库（跨服务复用）
├── deploy/         部署 & 基础设施配置
├── migrations/     数据库迁移脚本
├── scripts/        通用脚本
├── tools/          开发者工具链
├── test/           跨服务测试
└── docs/           全局文档
```

## 分层架构

每个服务内部遵循四层架构，依赖方向 **由外向内**：

```
port/in  →  usecase  →  domain  ←  port/out
(入站适配)   (业务编排)   (核心规则)   (出站适配)
```

- **domain/** — 实体、值对象、领域事件、出站端口接口（最稳定，零外部依赖）
- **usecase/** — 用例编排，一个用例一个文件
- **port/in/** — 入站驱动适配（gRPC / MQ Consumer / Cron）
- **port/out/** — 出站被驱动适配（DB / Cache / MQ Producer / 外部服务），实现 domain/port 接口

## 依赖规则

| 层级 | 可依赖 pkg/ | 可依赖 idl/ | 可依赖其他 app |
|---|---|---|---|
| domain | ✅（仅 types/errors） | ✗ | ✗ |
| usecase | ✅（仅 types/errors） | ✗ | ✗ |
| port/in | ✅ | ✅（generated stub） | ✗ |
| port/out | ✅ | ✅（generated stub） | ✗ |
| cmd | ✅ | ✅ | ✗ |

**核心红线**：服务间零代码依赖，仅通过 idl/ 契约 + 网络调用通信。

## 常量定义规则

| 常量类型 | 归属位置 | 示例 |
|---|---|---|
| 领域业务常量 | `domain/model/` 或 `domain/valueobject/` | 订单状态枚举 |
| 端口契约常量 | `domain/port/` | 缓存 key 前缀 |
| 用例级常量 | `usecase/` 对应文件内 | 默认分页大小 |
| 入站协议常量 | `port/in/http/` 等 | 路由前缀、Header key |
| 出站实现常量 | `port/out/persistence/` 等 | 表名、Redis key 模式 |
| 跨服务共享常量 | `pkg/errors/` 或 `pkg/types/` | 统一错误码 |

## 快速开始

```bash
# 创建新服务
make new-service name=payment-service

# 本地联调
make dev

# 运行全部测试
make test

# Proto 代码生成
make generate
```

## 文档

- [架构决策记录](docs/adr/)
- [编码规范](docs/conventions/)
- [新人入门](docs/onboarding.md)
