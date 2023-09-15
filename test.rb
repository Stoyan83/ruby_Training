name: "Ruby on Rails CI"
on:
  push:
    branches: [ "main" ]
  pull_request:
    branches: [ "main" ]
jobs:
  test:
    runs-on: ubuntu-latest
    services:
      # Use an official SQLite image
      sqlite:
        image: sqlite:latest
        ports:
          - "5432:5432"
        options: --health-cmd "echo 'SELECT 1;'" --health-interval 10s --health-timeout 5s --health-retries 5
    env:
      RAILS_ENV: test
      DATABASE_URL: "sqlite3::memory:" # Use an in-memory SQLite database
    steps:
      - name: Checkout code
        uses: actions/checkout@v2
      # Add or replace dependency steps here
      - name: Install Ruby and gems
        uses: ruby/setup-ruby@v1
        with:
          bundler-cache: true
      # Add or replace database setup steps here
      - name: Set up database schema
        run: bin/rails db:schema:load
      # Add or replace test runners here
      - name: Run tests
        run: bin/rake

  lint:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v2
      - name: Install Ruby and gems
        uses: ruby/setup-ruby@v1
        with:
          bundler-cache: true
      # Add or replace any other lints here
      - name: Security audit dependencies
        run: bin/bundler-audit --update
      - name: Security audit application code
        run: bin/brakeman -q -w2
      - name: Lint Ruby files
        run: bin/rubocop --parallel
