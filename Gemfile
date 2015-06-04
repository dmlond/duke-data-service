source 'https://rubygems.org'

ruby '2.2.2', :engine => 'jruby', :engine_version => '9.0.0.0.pre2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.1'
# Use postgresql as the database for Active Record
gem 'activerecord-jdbcpostgresql-adapter'
# Use puma as the webserver in development
gem 'puma'

gem 'jwt'
gem 'grape'
gem "hashie-forbidden_attributes" #overrides strong_params in grape endpoints
gem "grape-active_model_serializers"
gem 'react-rails'
gem 'tilt'
gem 'jquery-rails'
gem 'turbolinks'

# circle-ci metadata formatter
gem 'rspec_junit_formatter', '0.2.2'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem "factory_girl_rails"
  gem "faker"
  gem 'rspec-rails'
  gem 'shoulda-matchers', require: false
  gem 'spring-commands-rspec', group: :development
end
