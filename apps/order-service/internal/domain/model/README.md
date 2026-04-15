# domain/model/

聚合根 & 实体。

## 职责

- 定义核心业务对象（Order, OrderItem 等）
- 封装业务行为方法（如 Order.Cancel(), Order.Pay()）
- 包含该实体的业务常量和枚举

## 示例

```go
// order.go

const (
    OrderStatusPending  = "pending"
    OrderStatusPaid     = "paid"
    OrderStatusShipped  = "shipped"
    OrderStatusCanceled = "canceled"
    MaxOrderItems       = 50
)

type Order struct {
    ID        string
    UserID    string
    Status    string
    Items     []OrderItem
    Total     Money
    CreatedAt time.Time
}

func (o *Order) Cancel() error {
    if o.Status == OrderStatusShipped {
        return ErrCannotCancelShippedOrder
    }
    o.Status = OrderStatusCanceled
    return nil
}
```
