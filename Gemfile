# Use ruby 2.0.0-p247 or higher for byebug compatibility

source 'https://rubygems.org'
ruby '2.0.0'
gem 'rails', '~> 4.0.0'

# Monitoring
gem 'rack-timeout', '~> 0.1.0beta3'
gem 'newrelic_rpm'
gem 'airbrake'                # use with airbrake.io or errbit
# gem 'airbrake_user_attributes'  # use with self-hosted errbit; see config/initializers/airbrake.rb
# gem 'rack-google-analytics'



# Data
gem 'pg'
# gem 'jbuilder'

# Assets
gem 'sass-rails'
gem 'haml-rails'
gem 'simple_form'
gem 'uglifier'

# Javascript
gem 'jquery-rails'
gem 'turbolinks'
gem 'jquery-turbolinks'

# CoffeeScript
# Not needed in production if precompiling assets
gem 'coffee-rails'
# Uncomment if node.js is not installed
# gem 'therubyracer', platforms: :ruby

# Design
gem 'bootstrap-sass'
# gem 'bourbon'
# gem 'neat'
# gem 'country_select'

# Authentication
gem 'devise'
gem 'cancan'
gem 'omniauth'
gem 'omniauth-facebook'
gem 'omniauth-twitter'
# gem 'omniauth-persona'
# gem 'omniauth-google-oauth2'
# gem 'omniauth-linkedin'

# Admin
gem 'rails_admin', github: '10hacks/rails_admin'

# Workers
gem 'sidekiq'
gem 'devise-async'
gem 'sinatra', require: false

# Utils
gem 'addressable'
gem 'settingslogic'

group :development do
  # Docs
  gem 'sdoc', require: false    # bundle exec rake doc:rails

  # Errors
  # gem 'better_errors'
  # gem 'binding_of_caller'     # extra features for better_errors
  # gem 'meta_request'          # for rails_panel chrome extension

  # Deployment
  # gem 'capistrano'

  # Guard
  gem 'terminal-notifier-guard' # osx only
  gem 'guard-rspec'
  # gem 'guard-livereload'
  # gem 'rack-livereload'
end

group :development, :test do
  gem 'zeus'                    # required in gemfile for guard

  # Debugging
  gem 'awesome_print'
  gem 'byebug'                  # ruby 2.0 debugger with built-in pry
  gem 'pry'                     # better than irb
  gem 'pry-rails'               # adds rails specific commands to pry
  gem 'pry-byebug'              # add debugging commands to pry
  gem 'pry-stack_explorer'      # navigate call stack
  # gem 'pry-rescue'            # start pry session on uncaught exception
  # gem 'pry-doc'               # browse docs from console
  # gem 'pry-git'               # add git support to console
  # gem 'pry-remote'            # connect remotely to pry console
  # gem 'coolline'              # sytax highlighting as you type
  # gem 'coderay'               # use with coolline

  # Testing
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'capybara-webkit'
  # gem 'poltergeist'           # alternative to capybara-webkit
  # gem 'capybara-firebug'
  # gem 'launchy'               # save_and_open_page support for rspec
  # gem 'zeus-parallel_tests'   # speed up lengthy tests

  # Logging
  gem 'quiet_assets'

  # Events
  gem 'rb-fsevent'              # osx only
  # gem 'rb-inotify'            # linux only
end

group :test do
  # Helpers
  gem 'ffaker'
  gem 'shoulda-matchers'
  gem 'database_cleaner'
  # gem 'timecop'               # Mock Time

  # Coverage
  gem 'simplecov', require: false
  # gem 'coveralls', :require => false
end

group :production do
  gem 'dalli'                   # memcached
  gem 'memcachier'              # heroku add-on for auto config of dalli
  gem 'unicorn'
  gem 'rails_12factor'          # https://devcenter.heroku.com/articles/rails4
end

