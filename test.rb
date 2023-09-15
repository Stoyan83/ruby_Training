name: "Ruby on Rails CI"
on:
  push:
    branches: [ "main" ]
  pull_request:
    branches: [ "main" ]
jobs:
  test:
    runs-on: ubuntu-latest
    env:
      RAILS_ENV: test
    steps:
      - name: Checkout code
        uses: actions/checkout@v2
      - name: Install Ruby and gems
        uses: ruby/setup-ruby@v1 # Use the latest version
        with:
          bundler-cache: true
      - name: Set up database
        run: |
          bundle exec rails db:prepare
          bundle exec rails db:migrate
      - name: Run tests
        run: bundle exec rails test

  lint:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v2
      - name: Install Ruby and gems
        uses: ruby/setup-ruby@v1 # Use the latest version
        with:
          bundler-cache: true
      - name: Security audit dependencies
        run: bundle exec bundler-audit --update
      - name: Security audit application code
        run: bundle exec brakeman -q -w2
      - name: Lint Ruby files
        run: bundle exec rubocop --parallel

