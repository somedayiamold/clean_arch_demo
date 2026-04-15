# port/in/consumer/

MQ 消费者入站适配。

## 职责

- 订阅消息队列 topic
- 反序列化消息体
- 调用对应的 usecase 处理业务逻辑
- 处理 ack/nack 和重试策略
