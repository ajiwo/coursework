require 'rubygems'
require 'sinatra'

items = []

get '/' do
  response = ""
  items.each do |item|
    response = response + item.to_s + "<br/>"
  end
  response
end

get '/add/:item' do
  # The new item will be available as params[:item]
  items.push params[:item]
  redirect to('/')
end

get '/remove/:item' do
  items.delete(params[:item])
  redirect to('/')
end

