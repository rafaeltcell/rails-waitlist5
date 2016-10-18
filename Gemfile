source 'https://rubygems.org'

gem 'rails', '5.0.0.1'
gem 'pg'
gem 'rails_12factor', group: :production

gem 'bootstrap-sass', '3.3.6'
gem 'sass-rails'
gem 'uglifier'
gem 'coffee-rails'

gem 'slim'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby, group: :production

gem 'jquery-rails'
gem 'jbuilder'

gem 'devise'

gem 'rails-controller-testing'

gem 'grape', '0.10.1'

group :development do
  gem 'capistrano-rails'
  gem 'capistrano-rvm'
  gem 'capistrano3-puma'
  gem 'derailed'
  gem 'stackprof'
end

group :test do
  gem 'rspec'
  gem 'rspec-rails'
  gem 'database_cleaner'
end

group :passenger_server do
  gem 'passenger', require: 'phusion_passenger/rack_handler'
end

group :puma_server do
  gem 'puma'
end

group :unicorn_server do
  gem 'unicorn'
  gem 'rack-handlers'
end
