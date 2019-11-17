# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

gem 'sinatra'
gem 'dry-monads'

group :test, :development do
  gem 'pry'
end

group :test do
  gem 'rspec'
  gem 'rack-test'
end
