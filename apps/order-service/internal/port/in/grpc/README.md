# port/in/grpc/

gRPC 入站适配。

## 职责

- 实现 generated proto 中定义的 service interface
- 将 proto message 转换为 usecase DTO
- 调用 usecase 并返回 proto response
