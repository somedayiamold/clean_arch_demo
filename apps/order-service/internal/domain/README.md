# domain/

领域层 — 整洁架构的最内层，承载核心业务规则。

## 子目录

| 目录 | 职责 |
|---|---|
| `model/` | 聚合根 & 实体，包含业务行为方法和业务常量（如状态枚举） |
| `valueobject/` | 值对象（不可变，自带校验），如 Money、Address |
| `event/` | 领域事件定义（OrderCreated、OrderPaid），仅包含事件结构和名称 |
| `port/` | 出站端口接口 — 仓储、外部网关、通知等所有外部依赖的抽象 |

## 依赖规则

- ✅ 可依赖：Go 标准库、`pkg/types`、`pkg/errors`
- ✗ 禁止依赖：`usecase/`、`port/in/`、`port/out/`、任何框架包

## 常量定义

领域业务常量（如订单状态、业务枚举）定义在 `model/` 或 `valueobject/` 中，紧跟其所属的领域对象。
