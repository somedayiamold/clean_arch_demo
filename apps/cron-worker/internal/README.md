# internal/

Cron Worker 核心业务代码（Go internal 包保护）。

## 分层结构

```
internal/
├── domain/             ① 领域层
│   ├── model/            业务实体
│   └── port/             出站端口接口
├── usecase/            ② 用例层
└── port/               ③ 端口层
    ├── in/
    │   └── cron/         定时任务入口
    └── out/
        ├── persistence/  DB 访问
        └── messaging/    MQ 生产者
```

## 说明

Cron Worker 不对外暴露 HTTP/gRPC 端口，入站仅通过定时任务触发。
handler/ + router/ 用于注册 cron job。
