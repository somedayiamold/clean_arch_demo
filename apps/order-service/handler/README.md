# handler/

HTTP 入站适配层（对应整洁架构中的 `port/in/http`）。

由于框架约定，HTTP handler 单独放在服务根目录下而非 `internal/port/in/` 中。
gRPC / MQ Consumer / Cron 等其他入站适配仍在 `internal/port/in/` 中。

## 职责

- 请求反序列化 & 参数校验
- 调用 usecase.Execute()
- 响应格式化 & 错误码映射

## 常量示例

```go
const (
    APIPrefix     = "/api/v1/orders"
    HeaderTraceID = "X-Trace-ID"
)
```

## 中间件

认证、限流、日志等中间件也放在此处，作为 handler 链的一部分。

## 与 internal/port/in/ 的关系

| 目录 | 协议 | 原因 |
|---|---|---|
| `handler/` | HTTP | 框架（如 Hertz/cwgo）代码生成约定 |
| `internal/port/in/grpc/` | gRPC | 整洁架构入站适配 |
| `internal/port/in/consumer/` | MQ | 整洁架构入站适配 |
| `internal/port/in/cron/` | Cron | 整洁架构入站适配 |
