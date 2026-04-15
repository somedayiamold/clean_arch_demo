# migration/

数据库迁移脚本。

## 文件命名规范

```
{version}_{description}.{up|down}.sql
```

示例：
```
001_create_order_table.up.sql
001_create_order_table.down.sql
002_add_order_status_index.up.sql
002_add_order_status_index.down.sql
```

## 工具

推荐使用 [golang-migrate](https://github.com/golang-migrate/migrate) 或 [goose](https://github.com/pressly/goose)。
