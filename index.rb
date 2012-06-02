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
  @user = User.find("name" => params[:user])
end

get '/home' do
  erb :index
end

get '/user/:userid' do
  @user = User.find('id' => params[:userid])
  erb :user
end

get '/search/:name' do
  @users = mongo('user').find({'name' => /.*#{params[:name]}.*/i})
  erb :search_results
end

get '/create/:name/:times' do
  (1..params[:times].to_i).to_a.each { |i|
    mongo(:user).insert({ 'id' => i, 'name' => params[:name] });
  }
  erb :index
end
