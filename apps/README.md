# apps/

可独立部署的服务单元。每个子目录是一个完整的微服务，拥有自己的整洁架构分层。

## 服务列表

| 服务 | 说明 |
|---|---|
| `order-service/` | 订单服务 — 订单创建、支付、取消等核心业务 |
| `user-service/` | 用户服务 — 用户注册、认证、信息管理 |
| `gateway/` | API Gateway / BFF — 请求路由、聚合、协议转换 |
| `cron-worker/` | 定时任务 / 异步消费者 |

## 服务内部结构

```
apps/{service}/
├── cmd/                启动入口 & DI 组装
├── domain/             ① 领域层（最内层）
│   ├── model/            聚合根、实体
│   ├── valueobject/      值对象
│   ├── event/            领域事件
│   └── port/             出站端口接口
├── usecase/            ② 用例层
├── port/               ③ 端口层
│   ├── in/               入站驱动适配
│   └── out/              出站被驱动适配
├── config/             服务配置
└── migration/          DB 迁移脚本
```

## 新增服务

```bash
make new-service name=payment-service
```
