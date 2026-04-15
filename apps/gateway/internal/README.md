# internal/

Gateway 核心逻辑（Go internal 包保护）。

## 分层结构

```
internal/
└── port/
    ├── in/               入站适配（gRPC 请求接收，HTTP 由外部 handler/ 管理）
    └── out/
        └── gateway/      出站适配 — 转发请求到内部微服务
```

Gateway 不包含 domain 和 usecase 层，因为它没有独立的业务规则。
主要职责是请求路由、聚合转发和协议转换。
