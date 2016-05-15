source 'https://rubygems.org'

ruby '2.3.0'

group :heroku do
  gem 'unicorn'
  gem 'rails_12factor'
end

gem 'rails', '~> 3.2'

gem 'authlogic'
gem 'omniauth'
gem 'omniauth-facebook'

gem 'mime-types', :require => 'mime/types'
gem 'carrierwave', '~> 0.6.1'

# -- Database
# SQLite:
group :development do
  gem 'sqlite3'
end
group :production do
  # PostgreSQL (default on heroku):
  gem 'pg'
end

# -- Cloud storage
# AWS S3 support. Can be disabled if using local file system instead of cloud storage.
gem 'fog'

# -- Photo resizing
# MiniMagick
gem 'mini_magick'
gem 'mini_exiftool_vendored'
