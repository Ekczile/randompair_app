require 'sinatra'
require_relative 'randpairs.rb'

get '/' do
    erb :home
end

post '/home' do
    if params[:names].class != Array
        redirect '/'
    end
    names = params[:names].join(",")
    params[:names].each do |v|
        if v == "" || v == " "
            redirect '/'
        end
    end
    redirect 'pairs?names=' + names
end     


get '/pairs' do
    names = params[:names].split(",")
    pairednames = create_random_pairs(names)
    erb :pairs, locals: {names: names, pairednames: pairednames}
end
