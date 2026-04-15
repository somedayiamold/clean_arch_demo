# API Gateway

API 网关 / BFF — 请求路由、聚合、协议转换。

## 目录结构

```
gateway/
├── cmd/              启动入口
├── conf/             配置文件目录
├── handler/          处理入口目录
└── router/           路由目录

业务逻辑位于 `apps/gateway/internal/`:
internal/
├── port/
│   ├── in/grpc/        接收外部 gRPC 请求 (HTTP/路由由外部 handler/router 管理)
│   └── out/gateway/    转发到内部微服务
```

## 说明

Gateway 通常不包含领域逻辑，因此没有 `domain/` 和 `usecase/` 层。
它的主要职责是：

- 请求路由 & 负载均衡
- 聚合多个微服务的响应（BFF 模式）
- 统一认证 & 限流
- 协议转换（HTTP ↔ gRPC）
