.DEFAULT_GOAL := help

.PHONY: help
help: ## show help information
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-15s\033[0m %s\n", $$1, $$2}'

.PHONY: test
test: test-bash test-zsh ## test in all shells

.PHONY: test-bash
test-bash: ## test in bash
	shellspec --shell bash

.PHONY: test-zsh
test-zsh: ## test in zsh
	shellspec --shell zsh
