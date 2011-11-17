require 'sinatra'

Dir["lib/**/*.rb"].each {|f| require "./#{f}"}
helpers Sinatra::Partials

configure :development do
  require "sinatra/reloader"
end

not_found do
  redirect '/404.html'
end

helpers do
  include Rack::Utils
  alias_method :h, :escape_html
end


get '/' do
  erb :index
end

