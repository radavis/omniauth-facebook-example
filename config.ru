require 'bundler/setup'
require 'omniauth-facebook'
require './app.rb'

use Rack::Session::Cookie, secret: ENV['SESSION_SECRET']

use OmniAuth::Builder do
  provider :facebook,
    ENV['FACEBOOK_APP_ID'],
    ENV['FACEBOOK_APP_SECRET'],
    scope: 'public_profile,email'
end

run Sinatra::Application
