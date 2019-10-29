class LandmarksController < ApplicationController

  get '/landmarks' do
    @landmarks = Landmark.all
  erb :'/landmarks/index'
  end

 #new
  get '/landmarks/new' do
  erb :'/landmarks/new'
  end

#show
  get '/landmarks/:id' do
    @landmark = Landmark.find_by_id(params[:id])
    erb :'/landmarks/show'
  end


  get '/landmarks/:id/edit'do
    @landmark = Landmark.find_by_id(params[:id])
    erb :'landmarks/edit'
  end

  post '/landmarks' do
    @landmark = Landmark.create(name: params[:landmark][:name], year_completed: params[:landmark][:year_completed])
    redirect "/landmarks/#{@landmark.id}"
  end

  patch '/landmarks/:id' do
    @landmark = Landmark.find_by_id(params[:id])
    @landmark.name = params[:landmark][:name]
    @landmark.year_completed = params[:landmark][:year_completed]
    @landmark.save
    redirect "/landmarks/#{@landmark.id}"
  end



end
