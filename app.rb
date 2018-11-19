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
    redirect 'changedpairs?names=' + names
end     

get '/changedpairs' do
    names = params[:names].split(",")
    pairednames = create_random_pairs(names)
    names = names.join(",")
    erb :changedpairs, locals: {names: names, pairednames: pairednames}
end

post '/changedpairs' do
    names = params[:names].split(",")
    pairednames = create_random_pairs(names)
    names = names.join(",")
    redirect 'pairs?narmes=' + names + '&pairednames=' + pairednames
end

get '/pairs' do
    names = params[:names].split(",")
    p "this is my params3 #{params}"
    pairednames = create_random_pairs(names)
    names = names.join(',')
    erb :pairs, locals: {names: names, pairednames: pairednames}
end

post '/pairs' do
    names = params[:names].join(",")
    names = names.split(',')
    pairednames = create_random_pairs(names)
    names = names.join(",")
    pairednames = pairednames.join(",")
    p "this is names #{names}"
    redirect 'pairs?names=' + names + '&pairednames=' + pairednames
end
