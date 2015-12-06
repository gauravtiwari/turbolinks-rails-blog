ruby '2.2.3'
source 'https://rubygems.org'

source 'https://rails-assets.org' do
  gem 'rails-assets-underscore'
  gem 'rails-assets-animate-css'
  gem 'rails-assets-snackbarjs'
  gem 'rails-assets-autosize'
end

gem 'rails', github: 'rails/rails'
gem 'sprockets-rails', github: 'rails/sprockets-rails'
gem 'sprockets', github: 'rails/sprockets'
gem 'sass-rails', github: 'rails/sass-rails'
gem 'actioncable', github: 'rails/actioncable'
gem 'arel', github: 'rails/arel'
gem 'rack', github: 'rack/rack'

# Use Postgresql as database
gem 'pg'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', github: 'rails/coffee-rails'

# Bootstrap for layout
gem 'bootstrap-sass', '~> 3.3.5'

# Font awesome
gem 'font-awesome-sass', '~> 4.4.0'

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbograft'

# Authentication
gem 'bcrypt'

# Use Unicorn as the app server
gem 'passenger'

# Authorization
gem 'pundit'

# Modernizer
gem 'modernizr-rails'

# Background Job processing
gem 'sidekiq'

# At.js
gem 'jquery-atwho-rails'

# Time format
gem 'local_time'

# Application configuration
gem 'figaro'

# Caching system
gem 'readthis'
gem 'hiredis'

# Pagination
gem 'will_paginate', github: 'kirs/will_paginate', branch: 'fix/i18n-path'

# Foreman - Process management
gem 'foreman'

# Fake data
gem 'faker'

# Slug
gem 'stringex'

group :production, :staging do
  # Heroku
  gem 'rails_12factor'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', github: 'rails/web-console'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'byebug'
  gem 'better_errors'
  gem 'bullet'
  gem 'binding_of_caller'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
