require "sinatra"
require "sinatra/json"
require "dotenv"
Dotenv.load
require "pry" if development?

get "/" do
  erb :home
end

## The Plain Old HTTP Way

get "/auth/:provider/callback" do
  # request-phase: User visits "/auth/facebook", and gets redirected here.

  # Now, handle the callback-phase
  # 1. find or create user from the auth_hash: env["omniauth.auth"]
  # 2. save the user id to the session

  # printing the auth_hash to the page
  auth_hash = env["omniauth.auth"]
  "<pre>#{JSON.pretty_generate(auth_hash)}</pre>"
end

get "/auth/failure" do
  "Authorization Failed :("
end


## The Front-end Way
=begin
get "/client-side-auth" do
  erb :facebook
end

get "/auth/:provider/callback" do
  # handle callback-phase...

  # just returning the auth_hash, in this case
  content_type "application/json"
  json(env["omniauth.auth"])
end

get "/auth/failure" do
  content_type "application/json"
  json(request.env)
end
=end
