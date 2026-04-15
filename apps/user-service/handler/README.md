# handler/

HTTP 入站适配层（对应整洁架构中的 `port/in/http`）。

由于框架约定，HTTP handler 单独放在服务根目录下而非 `internal/port/in/` 中。

## 职责

- 请求反序列化 & 参数校验
- 调用 usecase.Execute()
- 响应格式化 & 错误码映射
