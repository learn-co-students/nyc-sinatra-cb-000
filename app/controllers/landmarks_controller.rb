class LandmarksController < ApplicationController

    get '/landmarks' do
      @landmarks = Landmark.all
      erb :'/landmarks/index'
    end

    get '/landmarks/new' do
      erb :'landmarks/new'
    end

    get '/landmarks/:id' do
      @landmark = Landmark.find(params[:id])
      erb :'/landmarks/show'
    end

    get '/landmarks/:id/edit' do
      @landmark = Landmark.find(params[:id])
      erb :'/landmarks/edit'
    end

    post '/landmarks' do
      @landmark = Landmark.create(params[:landmark])
      @landmark.figure = Figure.find_or_create_by(params[:figure]) if !params[:figure][:name].empty?
      @landmark.save
      redirect to "/landmarks/#{@landmark.id}"
    end

    patch '/landmarks/:id' do
      @landmark = Landmark.find(params[:id])
      @landmark.update(params[:landmark])
      @landmark.figure = Figure.find_or_create_by(params[:figure])
      @landmark.save
      redirect to "/landmarks/#{@landmark.id}"
    end

end
