# domain/event/

领域事件定义。

## 职责

- 定义事件结构体（事件名、Payload）
- 仅是数据结构定义，不包含发布/订阅逻辑

## 示例

```go
const (
    EventOrderCreated = "order.created"
    EventOrderPaid    = "order.paid"
)

type OrderCreatedEvent struct {
    OrderID   string
    UserID    string
    Total     int64
    CreatedAt time.Time
}
```

发布逻辑在 `port/out/messaging/`，消费逻辑在 `port/in/consumer/`。
