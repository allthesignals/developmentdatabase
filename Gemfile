source 'https://rubygems.org'

ruby '2.1.5'

gem 'rails', '4.2.1'

# Database
gem 'pg',     '~> 0.18'
gem 'seed-fu', '~> 2.3'     # Manages fixtures
gem 'faker', require: false # Fake sample data

# Users & Permissions
gem 'bcrypt',    '~> 3.1'
gem 'devise',    '~> 3.5.0'
gem 'authority', '~> 3.1.0'
gem 'rolify',    '~> 5.0.0'

# Utilities
gem 'enumerize', '~> 1.1.0'
gem 'geometry',  '~> 6.5'
gem 'wannabe_bool', '0.3.0'

# Presenters
gem 'burgundy',     '~> 0.2.0' # Presenter
gem 'escape_utils', '~> 1.1.0' # speeds up URI Template
gem 'uri_template', '~> 0.7.0'

# Views
gem 'haml-rails',   '~> 0.9'
gem 'sass-rails',   '~> 5.0.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'uglifier', '>= 1.3.0' # Compress JavaScript
gem 'kaminari'  # Pagination

# Semantic UI
gem 'therubyracer'
gem 'less-rails-semantic_ui', '~> 2.1'
gem 'autoprefixer-rails', '~> 5.2.1.0'

gem 'paperclip' # File attachments

# API
gem 'jsonapi-resources', '~> 0.7.0' # JSON API standard
gem 'api-pagination',    '~> 4.2' # Paginates API in headers

# Server
gem 'puma', '~> 2.15'
gem 'foreman', require: false

gem 'bullet', '4.14.10', group: [:development, :test]

group :development do
  gem 'spring', '~> 1.6.0' # Keeps environment in background
  gem 'better_errors'      # Clearer error messages
  gem 'binding_of_caller'  # REPL & more in error page
  gem 'byebug'             # Debugger
  gem 'web-console', '~> 2.0'
  gem 'guard',       '~> 2.2.0', require: false # Autorun tests
  gem 'guard-minitest',          require: false # MiniTest adapter
  # Watch Mac filesystem events
  gem 'rb-fsevent', '~> 0.9.0', require: RUBY_PLATFORM.include?('darwin') && 'rb-fsevent'
  gem 'brakeman',   '~> 3.1.0', require: false # Assess security
end

group :test do
  gem 'minitest-rails'     # Test library
  gem 'minitest-rails-capybara' # Integration tests
  gem 'minitest-reporters' # For progress bar, etc.
  gem 'minitest-fail-fast' # End testing on first failure
  gem 'minitest-focus'     # One test at a time
  gem 'codeclimate-test-reporter', require: nil
  gem 'launchy'
  gem 'rake' # Specified for Travis CI
end


