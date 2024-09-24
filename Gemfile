source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.3'

gem 'pg', '1.1.3'
gem 'puma', '~> 3.11'
gem 'rails', '~> 5.2.2'

gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'

# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

gem 'jbuilder'
gem 'turbolinks'

gem 'bootsnap', '>= 1.1.0', require: false
gem 'devise', '~> 4.4'
gem 'http'
gem 'parallel'
gem 'pg_search', '~> 2.3'
gem 'pundit', '~> 2.2'
gem 'whenever', '~> 1.0.0'
gem 'will_paginate', '3.3.0'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', '~> 11.1.3'
  gem 'factory_bot', '!= 6.4.5'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'rails-controller-testing'
  gem 'rspec-rails'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.3.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'yard'
end

group :test do
  gem 'capybara'
  gem 'database_cleaner'
end
