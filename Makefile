install:
	bundle install

lint:
	bundle exec rubocop

test:
	bundle exec rake test

lint-fix:
	bundle exec rubocop -A

.PHONY: test
