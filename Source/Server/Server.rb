require 'sinatra'
require 'sinatra'
require 'json'
require './mysqldal.rb'

get '/' do
  response = "Hello World"

  response
end

get '/SystemDistribution/:year/:month/:day' do
  callback = params.delete('callback') 
  json = MysqlDal.fetchHourlyDeatilsByDay(params[:year],params[:month],params[:day]);

  if callback
    content_type :js
    response = "#{callback}(#{json})" 
  else
    content_type :json
    response = json
  end
  
  response
end  

get '/StateDistribution/:year/:month/:day' do
  callback = params.delete('callback') 
  json = MysqlDal.fetchHourlyDetailsByStateByDay(params[:year],params[:month],params[:day]);

  if callback
    content_type :js
    response = "#{callback}(#{json})" 
  else
    content_type :json
    response = json
  end
  
  response
end 