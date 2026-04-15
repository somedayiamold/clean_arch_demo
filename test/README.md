# test/

跨服务测试 — 集成测试、端到端测试、性能测试。

## 目录结构

```
test/
├── integration/    服务间集成测试（A 调 B 的真实通信）
├── e2e/            端到端场景测试（Gateway → 各服务 → DB 全链路）
└── fixtures/       共享测试数据集 & SQL seed
```

## 说明

- 各服务的 **单元测试** 放在服务内部各层源码旁边（如 `*_test.go`）
- 此目录只放需要跨服务协作的测试
- fixtures/ 中的数据可被多个测试套件共享

## 运行

```bash
make test-unit          # 各服务单元测试
make test-integration   # 跨服务集成测试
make test-e2e           # 端到端测试
```
