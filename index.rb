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
  @user = mongo('user').find("name" => params[:user])
end

get '/home' do
  erb :index
end

get '/user/:userid' do
  @user = mongo('user').find('id' => 1).to_a.first
  erb :user
end

get '/search/:name' do
  @users = mongo('user').find('name' => /.*#{params[:name]}.*/i).to_a
  erb :search_results
end

get '/create/:name/:times' do
  images = ["1-1", "1-2", "2-1", "2-2", "2-3", "2-4", "2-5", "3", "3-1", "3-2", "3-3", "3-4", "3-5", "3-6", "4", "4-1", "4-2", "4-3", "4-4", "4-5", "4-6", "4-7", "4-8", "5", "5-1", "5-2", "5-3", "5-4", "5-5", "5-6", "6", "6-1", "6-2", "6-3", "6-4", "6-5", "6-6", "6-7", "6-8"]
  (1..params[:times].to_i).to_a.each { |i|
    mongo(:user).insert({ 'id' => i, 'name' => params[:name], 'image' => images[i] });
  }
  erb :index
end
