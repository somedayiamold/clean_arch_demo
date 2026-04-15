# domain/port/

出站端口接口 — 领域层对外部世界的需求声明。

## 职责

- 定义仓储接口（Repository）
- 定义外部服务网关接口（PaymentGateway, NotificationService 等）
- **仅包含接口定义**，具体实现在 `port/out/` 中

## 示例

```go
// repository.go
type OrderRepository interface {
    Save(ctx context.Context, order *model.Order) error
    FindByID(ctx context.Context, id string) (*model.Order, error)
    ListByUserID(ctx context.Context, userID string, page Pagination) ([]*model.Order, error)
}

// payment_gateway.go
const CacheKeyPrefix = "order:"

type PaymentGateway interface {
    Charge(ctx context.Context, orderID string, amount Money) (PaymentResult, error)
    Refund(ctx context.Context, paymentID string) error
}

// notification.go
type NotificationService interface {
    SendOrderConfirmation(ctx context.Context, userID string, orderID string) error
}
```

## 为什么统一放在 domain/port/?

仓储、支付网关、通知服务本质都是"领域层需要的外部能力"。统一放在 `port/` 下，避免分散到多个目录。
