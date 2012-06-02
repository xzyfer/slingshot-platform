require 'sinatra'
helpers do
  Dir["helpers/*"].each do |f|
    load "./#{f}"
  end
end


get '/home' do
  erb :index
end
