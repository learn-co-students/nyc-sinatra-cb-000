class LandmarksController < ApplicationController

  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'/landmarks/index'
  end

  get '/landmarks/new' do
    @titles = Title.all
    @figures = Figure.all
    erb :'/landmarks/new'
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find_by(id: params[:id])
    erb :'/landmarks/show'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find_by(id: params[:id])
    @titles = Title.all
    @figures = Figure.all
    erb :'/landmarks/edit'
  end

  post '/landmarks' do
    new_landmark = Landmark.create(name: params[:landmark][:name], year_completed: params[:landmark][:year_completed])

    redirect "/landmarks/#{new_landmark.id}"
  end

  post '/landmarks/:id' do
    landmark = Landmark.find_by(id: params[:id])
    landmark.name = params[:landmark][:name]
    landmark.year_completed = params[:landmark][:year_completed]
    landmark.save
    redirect "/landmarks/#{landmark.id}"
  end

end
