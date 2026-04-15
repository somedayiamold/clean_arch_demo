# port/in/cron/

定时任务入站适配。

## 职责

- 注册定时任务（cron expression）
- 在触发时调用对应的 usecase
- 处理分布式锁（防止多实例重复执行）
