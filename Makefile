ROLE = $(shell basename `pwd`)

.PHONY: test converge verify

all: test

test:
	@echo 'Running test on $(ROLE) role' | boxes -a c -d parchment 2>/dev/null | lolcat 2>/dev/null ; molecule test

converge:
	@echo 'Running converge on $(ROLE) role' | boxes -a c -d parchment 2>/dev/null | lolcat 2>/dev/null ; molecule converge

verify:
	@echo 'Running verify on $(ROLE) role' | boxes -a c -d parchment 2>/dev/null | lolcat 2>/dev/null ; molecule verify

default: converge
