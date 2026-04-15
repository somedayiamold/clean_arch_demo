# User Service

用户服务 — 负责用户注册、认证、信息管理。

## 目录结构

与 order-service 遵循相同的整洁架构分层，详见 [apps/README.md](../README.md)。

```
user-service/
├── cmd/                启动入口 & DI 组装
├── conf/               配置文件目录
├── handler/            处理入口目录
└── router/             路由目录

业务逻辑位于 `apps/user-service/internal/`:
internal/
├── domain/             领域层
│   ├── model/            User, Role 等实体
│   ├── valueobject/      Email, Phone 等值对象
│   ├── event/            UserRegistered 等领域事件
│   └── port/             仓储 & 外部服务接口
├── usecase/            用例层
├── port/in/            入站适配（gRPC / MQ 等）
└── port/out/           出站适配（DB / Cache / 外部服务）
```
