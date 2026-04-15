.PHONY: generate dev test test-unit test-integration test-e2e lint new-service build

# ====== 代码生成 ======
generate:
	@echo "Generating proto stubs..."
	buf generate
	@echo "Done."

# ====== 本地开发 ======
dev:
	docker-compose -f deploy/docker/docker-compose.yml up --build

# ====== 测试 ======
test: test-unit test-integration

test-unit:
	@echo "Running unit tests..."
	@for svc in apps/*/; do \
		echo "Testing $$svc..."; \
		cd $$svc && go test ./... -count=1 -short && cd ../..; \
	done

test-integration:
	@echo "Running integration tests..."
	go test ./test/integration/... -count=1 -v

test-e2e:
	@echo "Running e2e tests..."
	go test ./test/e2e/... -count=1 -v

# ====== 代码质量 ======
lint:
	@echo "Running linters..."
	golangci-lint run ./...
	@echo "Running architecture guard..."
	go run ./tools/linter/...

# ====== 构建 ======
build:
	@for svc in apps/*/; do \
		name=$$(basename $$svc); \
		echo "Building $$name..."; \
		cd $$svc && go build -o ../../bin/$$name ./cmd/ && cd ../..; \
	done

# ====== 新服务脚手架 ======
new-service:
ifndef name
	$(error Usage: make new-service name=<service-name>)
endif
	@echo "Creating new service: $(name)"
	@mkdir -p apps/$(name)/cmd
	@mkdir -p apps/$(name)/conf
	@mkdir -p apps/$(name)/handler
	@mkdir -p apps/$(name)/router
	@mkdir -p apps/$(name)/internal/domain/{model,valueobject,event,port}
	@mkdir -p apps/$(name)/internal/usecase
	@mkdir -p apps/$(name)/internal/port/in/{grpc,consumer,cron}
	@mkdir -p apps/$(name)/internal/port/out/{persistence,gateway,messaging,cache}
	@mkdir -p migrations/$(name)
	@echo "# $(name)\n\nNew service." > apps/$(name)/README.md
	@echo "Service $(name) created at apps/$(name)/"
