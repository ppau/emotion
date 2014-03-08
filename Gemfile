source 'https://rubygems.org'

gem 'rails', '4.1.0.rc1'

gem 'capistrano-rails', group: :command_line
gem 'coffee-rails'
gem 'cucumber', group: :test, require: false    # acceptance tests
gem 'database_cleaner', group: :test            # manage database truncation/transactions
gem 'devise'
gem 'email_spec', group: :test                  # nice test assertions for emails
gem 'factory_girl_rails', group: :test          # convenient model recipes
gem 'haml-rails'
gem 'headless', group: :test, require: false    # lets us run firefox inside a virtual display on ci
gem 'html2haml', group: :command_line
gem 'jazz_hands', group: [:test, :development]
gem 'jquery-rails'                              # jquery assets
gem 'launchy', group: :test, require: false     # for show_page
gem 'pg'                                        # postgresql driver
gem 'puma', group: :command_line
gem 'rspec-rails', group: :test, require: false # test framework
gem 'sass-rails'
gem 'schema_plus'
gem 'sdoc', group: :doc
gem 'simple_form'
gem 'simplecov', group: :test, require: false   # measure test coverage
gem 'spring', group: :development
gem 'spring-commands-rspec', group: :command_line
gem 'timecop', group: :test, require: false     # system time stubbing
gem 'turbolinks'
gem 'uglifier'

# gem 'quiet_assets'     # don't log asset pipeline requests
# gem 'rack-livereload'  # transparent livereload client
# gem 'guard-livereload' # reload the web browser when source files change
# gem 'guard-rspec'
# gem 'metric_fu'        # static code analysis

if `uname` =~ /Darwin/
  gem 'rb-fsevent', group: :test, require: false # efficiently monitoring the file system
end
