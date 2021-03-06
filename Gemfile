# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.6.3"

gem "pg", ">= 0.18", "< 2.0"
gem "puma", "~> 3.11"
gem "rails", "~> 5.2.3"

gem "bootsnap", ">= 1.1.0", require: false

group :development, :test do
  gem "byebug", platforms: %i(mri mingw x64_mingw)
  gem "pry-rails"

  # Rubocop
  gem "sanelint"

  gem "brakeman"
  gem "bundler-audit"

  gem "rspec-rails", "~> 3.8"
  gem "factory_bot_rails", "~> 5.0.2"
  gem "json-schema", "~> 2.8.1"
  gem "faker", "~> 1.9.3"
  gem "database_cleaner", "~> 1.7.0"
end

group :development do
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

gem "tzinfo-data", platforms: %i(mingw mswin x64_mingw jruby)
