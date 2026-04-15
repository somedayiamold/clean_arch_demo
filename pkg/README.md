# pkg/

共享库 — 跨服务复用的公共代码。

## 目录结构

```
pkg/
├── errors/       统一错误码 & 错误类型
├── types/        跨服务共享值对象（Money, PageToken）
├── events/       跨服务领域事件契约（event name + payload schema）
├── logger/       日志封装
├── tracing/      链路追踪封装
├── httputil/     HTTP 工具函数
├── auth/         JWT / OAuth 公共逻辑
└── testkit/      测试夹具 & Mock 工具
```

## 使用原则

1. **极度克制** — 只有 ≥3 个服务共用且语义稳定的代码才放入 pkg/
2. **不含业务逻辑** — events/ 只包含事件契约（名称 + Schema），不含发布/订阅逻辑
3. **扁平化** — 不做 pkg-kernel / pkg 的二级分类，用包名直接表达用途
4. **依赖规则**：
   - domain / usecase 层仅可依赖 `types/` 和 `errors/`
   - port/ 层可依赖 pkg/ 的所有包
