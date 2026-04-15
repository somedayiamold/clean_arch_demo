# port/

端口层 — 替代传统的 adapter 层，按数据流方向分为入站和出站。

## 结构

```
port/
├── in/           入站驱动适配 — 外部请求进入系统
│   ├── http/       HTTP handler & 路由注册
│   ├── grpc/       gRPC handler
│   ├── consumer/   MQ 消费者
│   └── cron/       定时任务入口
│
└── out/          出站被驱动适配 — 系统调用外部资源
    ├── persistence/  DB 仓储实现（实现 domain/port/repository）
    ├── gateway/      外部服务调用（实现 domain/port/payment_gateway 等）
    ├── messaging/    MQ 生产者实现
    └── cache/        缓存实现
```

## 为什么分 in/out？

| 维度 | port/in/ | port/out/ |
|---|---|---|
| 数据流方向 | 外部 → 用例 | 用例 → 外部 |
| 依赖方向 | 调用 usecase | 实现 domain/port 接口 |
| 可替换场景 | HTTP → gRPC | MySQL → PostgreSQL |
| 常量示例 | 路由前缀、Header key | 表名、Redis key |

看包名即可判断数据流方向，消除歧义。
