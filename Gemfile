source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.4'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'
# Use mysql2 as the database for Active Record
# gem 'mysql2'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# group :production do
#   # unicornサーバー
#   gem 'unicorn'
# end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  # pry機能
  gem 'pry-rails'
  gem 'pry-doc'                 # methodを表示
  gem 'pry-byebug'              # デバッグを実施
  gem 'pry-stack_explorer'      # スタックをたどれる
  # テスト向けの機能
  gem 'rspec-rails', '~> 3.6'
  gem 'factory_bot_rails'
  gem 'rails-controller-testing'
  # 開発・テスト環境ではsqlite3を使用
  # gem 'sqlite3'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # N+1問題解決用の機能
  gem 'bullet'
end

group :production do
  # Unicornサーバー
  # gem 'unicorn'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# 以下は追加のgem
# ログイン・会員登録機能
gem 'devise'
# seedデータ投入機能
gem 'seed-fu'
# enumの日本語化補助機能
gem 'enum_help'
# i18n機能
gem 'rails-i18n'
# bootstrap
gem 'bootstrap-sass'
# autoprefix
gem 'autoprefixer-rails'
# jquery
gem 'jquery-rails'
# カレンダー機能
gem 'momentjs-rails', '>= 2.9.0'
gem 'bootstrap3-datetimepicker-rails', '~> 4.17.47'
# font-awesome
gem 'font-awesome-rails'
# マップ機能
gem 'geocoder'
# jsファイルに変数を渡す機能
gem 'gon'
# ページング機能
gem 'kaminari-bootstrap', '~> 3.0.1'
# 画像アップロード機能
gem "refile", require: "refile/rails", github: 'manfe/refile'
gem "refile-mini_magick"
# S3への画像アップロード機能
# gem "refile-s3"
# 環境変数を設定する機能
# gem 'dotenv-rails'
# デプロイ時はlistenを移動する
# gem 'listen', '>= 3.0.5', '< 3.2'
# OGP設定用のgem
gem 'meta-tags'
# SNSシェアボタン用のgem
gem 'social-share-button'