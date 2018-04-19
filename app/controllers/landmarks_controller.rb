class LandmarksController < ApplicationController
  get '/landmarks' do
    erb :'/landmarks/index'
  end

  get '/landmarks/new' do
    erb :'landmarks/new'
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/show'
  end

  post '/landmarks' do
    year = params[:landmark][:year_completed]
    if year.scan(/^\d+$/).any? && year.size == 4
      @landmark = Landmark.find_or_create_by(params[:landmark])
      @landmark.year_completed = year
    else
      raise "Year Completed must be a four-digit number!"
    end
    if !params[:figure][:name].empty?
      @landmark.figure = Figure.find_by(params[:figure])
    end
    @landmark.save

    redirect to "/landmarks/#{@landmark.id}"
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/edit'
  end

  patch '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    year = params[:year_completed]
    if year.scan(/^\d+$/).any? && year.size == 4
      @landmark.year_completed = year
    else
      raise "Year Completed must be a four-digit number!"
    end
    @landmark.name = params[:name]
    if !params[:figure][:name].empty?
      @landmark.figure = Figure.find_by(params[:figure])
    end
    @landmark.save

    erb :'/landmarks/show'
  end
end
