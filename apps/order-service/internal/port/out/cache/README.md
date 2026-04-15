# port/out/cache/

缓存实现。

## 职责

- 实现缓存相关的端口接口
- 封装 Redis / 本地缓存的读写操作
- 管理缓存 key 模式和过期策略

## 常量示例

```go
const (
    OrderCacheTTL   = 30 * time.Minute
    OrderKeyPattern = "order:%s"
)
```
