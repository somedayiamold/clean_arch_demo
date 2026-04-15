# internal/

User Service 核心业务代码（Go internal 包保护，禁止外部 import）。

## 分层结构

```
internal/
├── domain/             ① 领域层（最内层）
│   ├── model/            聚合根 & 实体（User, Role）
│   ├── valueobject/      值对象（Email, Phone）
│   ├── event/            领域事件（UserRegistered, UserUpdated）
│   └── port/             出站端口接口（repository, notification...）
├── usecase/            ② 用例层（业务编排）
└── port/               ③ 端口层
    ├── in/               入站驱动适配（gRPC / MQ Consumer / Cron）
    └── out/              出站被驱动适配（DB / Cache / 外部服务）
```

HTTP 入站适配由服务根目录的 `handler/` + `router/` 承担（框架约定）。

## 依赖规则

- domain → 仅依赖 Go 标准库 + `pkg/types` + `pkg/errors`
- usecase → 依赖 domain，不依赖 port/ 或任何框架包
- port/out → 实现 domain/port 接口
- port/in → 调用 usecase
