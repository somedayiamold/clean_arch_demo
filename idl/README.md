# idl/

IDL 契约定义 — Proto / OpenAPI / GraphQL Schema 的唯一归属。

## 目录结构

```
idl/
├── order/v1/           订单服务契约
│   └── order.proto
├── user/v1/            用户服务契约
│   └── user.proto
└── common/v1/          公共类型（分页、时间戳等）
    └── pagination.proto
```

## 版本管理

- 每个服务的 IDL 按 `v1/`、`v2/` 目录分版本
- Breaking change 必须升版本号
- common/ 中的公共类型应保持极度稳定

## 代码生成

```bash
make generate   # 生成的 stub 输出到 generated/proto/
```

## 原则

- 这里是 **Single Source of Truth**，服务内不再重复定义 IDL
- 所有服务共享同一份契约定义，确保接口一致性
