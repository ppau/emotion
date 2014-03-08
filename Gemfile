source 'https://rubygems.org'

gem 'rails', '4.1.0.rc1'

#gem 'haml-rails'                                         # html templating
#gem 'html2haml', group: :command_line                    # command line tool
gem 'capistrano-rails', group: :command_line             # deploy recipes
gem 'coffee-rails'                                       # coffeescript
gem 'cucumber', group: :test, require: false             # acceptance tests
gem 'database_cleaner', group: :test                     # manage database truncation/transactions
gem 'devise'                                             # user account management
gem 'email_spec', group: :test                           # nice test assertions for emails
gem 'factory_girl_rails', group: :test                   # convenient model recipes
gem 'headless', group: :test, require: false             # lets us run firefox inside a virtual display on ci
gem 'jazz_hands', group: [:test, :development]           # debugger and other nice stuff
gem 'jquery-rails'                                       # jquery assets
gem 'launchy', group: :test, require: false              # for show_page
gem 'less-rails'                                         # for processing twitter bootstrap
gem 'pg'                                                 # postgresql driver
gem 'puma', group: :command_line                         # web server
gem 'rspec-rails', group: :test, require: false          # test framework
gem 'sass-rails'                                         # css templating
gem 'schema_plus'                                        # foreign key constraints and other goodies
gem 'sdoc', group: :doc                                  # documentation generator
gem 'simple_form'                                        # easier rails forms
gem 'simplecov', group: :test, require: false            # measure test coverage
gem 'spring', group: :development                        # cache rails environment between command line calls
gem 'spring-commands-rspec', group: :command_line        # run rspec under spring
gem 'therubyracer', group: :command_line, require: false # javascript v8
gem 'timecop', group: :test, require: false              # system time stubbing
gem 'turbolinks'                                         # faster page navigation with javascript
gem 'twitter-bootstrap-rails'                            # precanned baseline styles
gem 'uglifier'                                           # minifier

# gem 'friendly_id'
# gem 'quiet_assets'     # don't log asset pipeline requests
# gem 'rack-livereload'  # transparent livereload client
# gem 'guard-livereload' # reload the web browser when source files change
# gem 'guard-rspec'      # rerun tests when code changes
# gem 'metric_fu'        # static code analysis

if `uname` =~ /Darwin/
  gem 'rb-fsevent', group: :test, require: false # efficiently monitoring the file system
end
