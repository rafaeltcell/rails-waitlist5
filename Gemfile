source 'https://rubygems.org'
ruby '2.2.4'

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
end

group :puma_server do
  gem 'puma'
end

group :unicorn_server do
  gem 'unicorn'
  gem 'rack-handlers'
end
