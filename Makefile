install:
	bundle install

lint:
	rubocop

lint-fix:
	rubocop -A
