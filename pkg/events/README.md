# pkg/events/

跨服务领域事件契约 — 事件名称 + Payload Schema 定义。

## 职责

- 定义跨服务事件的名称常量
- 定义事件 Payload 结构体
- **不包含** 发布/订阅的实现逻辑

## 示例

```go
const (
    TopicOrderCreated = "order.created"
    TopicUserRegistered = "user.registered"
)

type OrderCreatedPayload struct {
    OrderID   string    `json:"order_id"`
    UserID    string    `json:"user_id"`
    Total     int64     `json:"total"`
    CreatedAt time.Time `json:"created_at"`
}
```

发布实现在 `apps/*/port/out/messaging/`，消费实现在 `apps/*/port/in/consumer/`。
