# usecase/

用例层 — 业务编排，一个用例一个文件。

## 职责

- 编排领域对象完成一个完整的业务动作
- 定义用例 Input/Output DTO（与领域模型解耦）
- 控制事务边界

## 文件规范

| 文件 | 说明 |
|---|---|
| `create_order.go` | 创建订单用例 |
| `cancel_order.go` | 取消订单用例 |
| `dto.go` | 用例层 Input/Output 数据结构 |

## 示例

```go
// create_order.go

const DefaultPageSize = 20

type CreateOrderUseCase struct {
    orderRepo   port.OrderRepository
    paymentGW   port.PaymentGateway
    eventPub    port.EventPublisher
}

func (uc *CreateOrderUseCase) Execute(ctx context.Context, input CreateOrderInput) (*CreateOrderOutput, error) {
    order, err := model.NewOrder(input.UserID, input.Items)
    if err != nil {
        return nil, err
    }
    if err := uc.orderRepo.Save(ctx, order); err != nil {
        return nil, err
    }
    uc.eventPub.Publish(ctx, event.OrderCreatedEvent{...})
    return &CreateOrderOutput{OrderID: order.ID}, nil
}
```

## 依赖规则

- ✅ 可依赖：`domain/`（model, valueobject, event, port）
- ✅ 可依赖：`pkg/types`、`pkg/errors`
- ✗ 禁止依赖：`port/in/`、`port/out/`、任何框架包
