source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.3.0"
gem "rails", "~> 7.1.2"
gem "sprockets-rails"
gem "pg", "~> 1.1"
gem "puma", "~> 6.4.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "redis", "~> 4.0"
gem "bootsnap", require: false
gem "image_processing", "~> 1.2"
gem "rotp", "~> 6.3"
gem "base32"

group :development, :test do
  gem "debug", platforms: %i[mri mingw x64_mingw]
end

group :development do
  gem "dotenv-rails"
  gem "web-console"
  gem "standard"
  gem "awesome_print"
end
