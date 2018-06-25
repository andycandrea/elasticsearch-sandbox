# frozen_string_literal: true

source('https://rubygems.org')
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby('2.4.4')

gem('puma', '~> 3.11')
gem('rails', '~> 5.2.0')
gem('sass-rails', '~> 5.0')
gem('sqlite3')
gem('uglifier', '>= 1.3.0')

gem('jbuilder', '~> 2.5')

gem('bootsnap', '>= 1.1.0', require: false)
gem('mocha', group: 'test', require: 'mocha/api')
gem('rails-controller-testing', group: 'test')

# NOTE: Kaminari has to be loaded before Elasticsearch::Model so the callbacks
# are executed
gem('kaminari')

gem('elasticsearch')
gem('elasticsearch-model')
gem('elasticsearch-rails')
gem('oj')
gem('sidekiq')

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'rubocop'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara', '>= 2.15', '< 4.0'
  gem 'chromedriver-helper'
  gem 'selenium-webdriver'
end

group :development, :test do
  gem 'pry'
end
