require 'sinatra'
require_relative 'randpairs.rb'

get '/' do
    erb :home
end

post '/home' do
    first_name = params[:fname]
    redirect '/lastname?fname=' + first_name 
end