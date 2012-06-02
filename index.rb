require 'sinatra'

Dir["mixins/*"].each do |f|
  load "./#{f}"
end

helpers do
  Dir["helpers/*"].each do |f|
    load "./#{f}"
  end
end

Dir["models/*"].each do |f|
  load "./#{f}"
end

before do
  @user = User.find(params[:user])
end

get '/home' do
  erb :index
end

get '/create/:name' do
  mongo(:user).insert({ 'name' => params[:name] });
  erb :index
end
