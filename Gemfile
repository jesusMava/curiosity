# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.0'

gem 'active_storage_validations'
gem 'bootsnap', require: false
gem 'bulma-rails', '~> 0.9.2'
gem 'devise'
gem 'fasterer', '~> 0.1.9', require: false
gem 'haml-lint', require: false
gem 'haml-rails'
gem 'image_processing', '>= 1.2'
gem 'importmap-rails'
gem 'jbuilder'
gem 'mini_magick'
gem 'pg', '~> 1.1'
gem 'prawn'
gem 'puma', '~> 5.0'
gem 'pundit'
gem 'rails', '~> 7.0.1'
gem 'redis', '~> 4.0'
gem 'sprockets-rails'
gem 'stimulus-rails'
gem 'turbo-rails'

group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot'
  gem 'faker'
  gem 'reek', require: false
  gem 'rubocop', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'rubycritic', require: false
end

group :development do
  gem 'web-console'
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'shoulda', '~> 4.0'
  gem 'webdrivers'
end
