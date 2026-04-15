# port/out/messaging/

MQ 生产者实现。

## 职责

- 实现事件发布接口
- 将领域事件序列化并发送到消息队列
- 封装 Kafka / RabbitMQ / Pulsar 等具体 SDK
