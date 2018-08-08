source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', "~> 5.1"

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem "turbolinks"

gem 'ecdsa',   :path => '../minerva/ruby_ecdsa'
#gem 'ecdsa',   :git => 'https://github.com/AnimaGUS-minerva/ruby_ecdsa.git', :branch => 'ecdsa_interface_openssl'

#gem 'chariwt', :path => '../chariwt'
gem 'chariwt', :git => 'https://github.com/mcr/ChariWTs.git'
gem 'jwt'

gem "fixture_save", :path => "../fixture_save"
#gem 'fixture_save', :git => 'https://github.com/mcr/fixture_save.git'

gem 'active_scaffold',  :git => "https://github.com/mcr/active_scaffold.git"
#gem 'active_scaffold', :git => "https://github.com/activescaffold/active_scaffold.git", :branch => 'master'
gem 'therubyracer', platforms: :ruby

gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.

gem 'sdoc', '~> 0.4.0'
gem 'uglifier'

gem 'mail'
gem 'ffi', '~> 1.9.24'

# Use Capistrano for deployment
gem 'capistrano-rails', group: :development

# CoAP server for Rails.
gem 'coap',    :path => "../minerva/coap"
gem 'openssl', :path => "../minerva/ruby-openssl"
gem 'celluloid-io', :path => "../minerva/celluloid-io"
gem 'david', :path => "../minerva/david"

# encode/decode cbor messages
gem 'cbor'
gem 'json'

group :mudcontroller do
  gem 'sqlite3'
end

gem 'sqlite3'
gem 'pg', '0.20'

# used in production on SecureHomeGateway
gem 'thin'

group :development, :test do
  # Use postgresql as the database for Active Record
  gem 'pg', '0.20'

  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'pry'
  gem 'pry-doc'

  #
  gem 'rspec-rails', '~> 3.0'
  gem 'rails-controller-testing'
  gem 'cbor-diag'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  #gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'webmock'


end

