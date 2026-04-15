# port/out/gateway/

外部服务调用实现 — 实现 `domain/port/` 中定义的网关接口。

## 职责

- 实现 PaymentGateway、NotificationService 等接口
- 封装 HTTP/gRPC 调用的重试、熔断、超时策略
- 将外部服务的响应模型翻译为领域模型（防腐层 ACL）
