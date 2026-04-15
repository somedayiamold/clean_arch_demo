# Cron Worker

定时任务 / 异步消费者服务。

## 目录结构

```
cron-worker/
├── cmd/                启动入口
├── conf/               配置文件目录
├── handler/            处理入口目录
└── router/             路由目录

业务逻辑位于 `apps/cron-worker/internal/`:
internal/
├── domain/             领域层（如有独立业务规则）
│   ├── model/
│   └── port/
├── usecase/            用例层
├── port/
│   ├── in/cron/          定时任务入口
│   └── out/
│       ├── persistence/  DB 访问
│       └── messaging/    MQ 生产者
```

## 使用场景

- 订单超时自动取消
- 数据清洗与对账
- 报表生成
- 跨服务数据同步

## 部署

独立部署，不对外暴露 HTTP/gRPC 端口。
