.PHONY:
build.all:
	$(MAKE) build.app
	$(MAKE) build.client

.PHONY:
build.app:
	FILEPACK_PREFIX=app filepack
	npm --prefix app run build

.PHONY:
build.client:
	FILEPACK_PREFIX=client filepack
	npm --prefix client run build

.PHONY:
run.app:
	npm --prefix app run serve

.PHONY:
run.client:
	npm --prefix app start

.PHONY:
docker.app:
	docker build -t monorepo-app -f app.dockerfile . --no-cache

.PHONY:
docker.client:
	docker build -t monorepo-client -f client.dockerfile . --no-cache

.PHONY:
clean:
	npx rimraf '**/node_modules'
	npx rimraf '**/dist'
	npx rimraf '**/*.tgz'

.PHONY:
default: build.all
