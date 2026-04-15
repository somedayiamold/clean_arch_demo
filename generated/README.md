# generated/

自动生成的代码 — Proto stub / ORM model 等。

## 目录结构

```
generated/
├── proto/              Proto 生成的 stub
│   ├── order/v1/
│   ├── user/v1/
│   └── common/v1/
└── orm/                ORM 生成的 model（如适用）
```

## 生成命令

```bash
make generate
```

## Git 策略

根据团队规模选择：

| 策略 | 适用场景 | 做法 |
|---|---|---|
| 提交进仓库 | 小团队，降低本地构建成本 | 正常 git add |
| .gitignore | 大团队，保持仓库干净 | CI 中自动重新生成 |

## 注意

- ⚠️ 不要手动修改此目录下的文件
- 所有修改应从 `idl/` 中的 IDL 定义发起，然后重新生成
