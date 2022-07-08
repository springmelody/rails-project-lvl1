install:
	bundle install

lint:
	rubocop

test:
	rake test

lint-fix:
	rubocop -A

.PHONY: test
