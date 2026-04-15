# Order Service

订单服务 — 负责订单的创建、支付、取消等核心业务流程。

## 目录结构

```
order-service/
├── cmd/                    启动入口，负责依赖注入组装
├── conf/                   服务配置结构 & 加载
├── handler/                处理入口目录 (HTTP handlers, 中间件)
└── router/                 路由目录

业务逻辑位于 `apps/order-service/internal/`:
internal/
├── domain/                 领域层（最内层，零外部依赖）
│   ├── model/                聚合根 & 实体（Order, OrderItem）
│   ├── valueobject/          值对象（Money, Address）
│   ├── event/                领域事件（OrderCreated, OrderPaid）
│   └── port/                 出站端口接口（repository, payment gateway...）
├── usecase/                用例层（业务编排）
├── port/
│   ├── in/                 入站适配
│   │   ├── consumer/         MQ 消费者
│   │   ├── cron/             定时任务入口
│   │   └── grpc/             gRPC handler
│   └── out/                出站适配（实现 domain/port 接口）
│       ├── persistence/      DB 仓储实现
│       ├── gateway/          外部服务调用
│       ├── messaging/        MQ 生产者
│       └── cache/            缓存实现
```

## 启动

```bash
go run ./cmd/main.go
```
