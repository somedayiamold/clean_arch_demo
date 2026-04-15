# pkg/errors/

统一错误码 & 错误类型 — 跨服务保持一致的错误语义。

## 示例

```go
const (
    CodeOK             = 0
    CodeInvalidParam   = 400001
    CodeUnauthorized   = 401001
    CodeForbidden      = 403001
    CodeNotFound       = 404001
    CodeConflict       = 409001
    CodeInternalError  = 500001
)

type BizError struct {
    Code    int
    Message string
    Cause   error
}

func NewBizError(code int, message string) *BizError {
    return &BizError{Code: code, Message: message}
}
```
