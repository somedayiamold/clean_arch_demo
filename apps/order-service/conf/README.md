# conf/

服务配置结构与加载。

## 职责

- 定义服务配置结构体（强类型）
- 加载 YAML / TOML / ENV 配置文件
- 提供配置默认值

## 配置加载优先级

```
命令行参数 > 环境变量 > 配置文件 > 代码默认值
```

## 环境变量覆盖

配置项可通过环境变量覆盖，命名规则：`SERVICE_SECTION_KEY`

```bash
ORDER_SERVICE_DB_HOST=127.0.0.1
ORDER_SERVICE_DB_PORT=3306
ORDER_SERVICE_CACHE_TTL=30m
```

## 默认值示例

```go
const (
    DefaultPort       = 8080
    DefaultDBTimeout  = 5 * time.Second
    DefaultCacheTTL   = 10 * time.Minute
)

type Config struct {
    Port  int        `yaml:"port"`
    DB    DBConfig   `yaml:"db"`
    Cache CacheConfig `yaml:"cache"`
    MQ    MQConfig   `yaml:"mq"`
}
```

## 多环境配置

按环境拆分文件，通过 `APP_ENV` 环境变量选择：

```
conf/
├── config.yaml           # 基础配置（所有环境共享）
├── config.dev.yaml       # 开发环境覆盖
├── config.staging.yaml   # 预发环境覆盖
└── config.prod.yaml      # 生产环境覆盖
```
