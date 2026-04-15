# pkg/types/

跨服务共享值对象 — 多服务公用的基元类型。

## 示例

```go
// pagination.go
type PageToken struct {
    Cursor string
    Size   int
}

// money.go（如果多个服务都需要金额计算）
type Money struct {
    Amount   int64
    Currency string
}

// time_range.go
type TimeRange struct {
    Start time.Time
    End   time.Time
}
```

## 准入标准

- ≥3 个服务使用
- 语义稳定，不会频繁变更
- 纯值对象，不包含行为逻辑
