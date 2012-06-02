require 'sinatra'
helpers do
  Dir["helpers/*"].each do |f|
    load "./#{f}"
  end
end


get '/home' do
  erb :index
end

get '/create/:name' do
  mongo('user').insert({ 'name' => params[:name] });
  erb :index
end
