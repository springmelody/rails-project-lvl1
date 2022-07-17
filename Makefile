install:
	bundle install

lint:
	bundle exec rubocop

test:
	rake test

lint-fix:
	bundle exec rubocop -A

.PHONY: test
