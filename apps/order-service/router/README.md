# router/

HTTP 路由注册目录。

## 职责

- 定义路由分组与 URL 映射
- 挂载中间件到指定路由组
- 将请求分发到对应的 handler

## 路由分组约定

```go
// 示例
r := server.Default()

v1 := r.Group("/api/v1")
{
    orders := v1.Group("/orders")
    {
        orders.POST("/", handler.CreateOrder)
        orders.GET("/:id", handler.GetOrder)
        orders.PUT("/:id/cancel", handler.CancelOrder)
    }
}
```

## 中间件挂载

- 全局中间件（日志、Recovery）在 router 根级别挂载
- 认证中间件在需要鉴权的路由分组上挂载
- 限流中间件按路由粒度挂载
