PYTHON3 := $(shell command -v python3.8 || command -v python3)

.PHONY: minimal
minimal: node_modules build

venv: Makefile requirements-dev.txt
	rm -rf venv
	virtualenv venv --python=$(PYTHON3)
	venv/bin/pip install -r requirements-dev.txt

node_modules: package.json yarn.lock
	yarn

build: node_modules
	node_modules/.bin/vuepress build docs --dest build

.PHONY: start
start: export PORT = $(shell node_modules/.bin/get-port $(shell seq 9000 9020 | tr '\n' ' '))
start: node_modules
	node_modules/.bin/vuepress dev --port "${PORT}" docs

.PHONY: test
test: venv
	venv/bin/pre-commit install -f --install-hooks
	venv/bin/pre-commit run --all-files

.PHONY: clean
clean:
	# remove everything targeted by .gitignore
	git clean -fdX
