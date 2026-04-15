# deploy/

部署 & 基础设施配置。

## 目录结构

```
deploy/
├── docker/
│   ├── base.Dockerfile       共享基础镜像
│   └── docker-compose.yml    本地联调编排
├── k8s/
│   ├── base/                 公共 Kustomize base
│   ├── order-service/        订单服务 K8s manifests
│   ├── user-service/         用户服务 K8s manifests
│   └── gateway/              网关 K8s manifests
└── terraform/                云资源编排（如适用）
```

## 本地联调

```bash
docker-compose -f deploy/docker/docker-compose.yml up
```

## K8s 部署

```bash
kubectl apply -k deploy/k8s/order-service/
```
