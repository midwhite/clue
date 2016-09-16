# Load the Rails application.
require File.expand_path('../application', __FILE__)

config.action_dispatch.default_headers = {
    'Access-Control-Allow-Credentials' => 'true',
    'Access-Control-Allow-Origin' => 'https://clue-web.herokuapp.com/',
    'Access-Control-Request-Method' => '*'
}

# Initialize the Rails application.
Rails.application.initialize!
