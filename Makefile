node_modules: package.json yarn.lock
	yarn

.PHONY: start
start: export PORT = $(shell node_modules/.bin/get-port $(shell seq 9000 9020 | tr '\n' ' '))
start: node_modules
	node_modules/.bin/vuepress dev --port "${PORT}" docs