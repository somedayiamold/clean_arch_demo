# port/out/persistence/

数据库仓储实现 — 实现 `domain/port/` 中定义的 Repository 接口。

## 职责

- 实现 OrderRepository 接口
- 封装 SQL / ORM 操作
- 数据库模型（DO）与领域模型的转换

## 常量示例

```go
const (
    TableOrder     = "t_order"
    TableOrderItem = "t_order_item"
)
```

这些表名常量仅在此层可见，不泄露到 domain 或 usecase。
