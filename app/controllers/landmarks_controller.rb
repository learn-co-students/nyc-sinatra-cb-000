class LandmarksController < ApplicationController

  # Read get: Index page
  get '/landmarks' do
    @landmarks = Landmark.all

    erb :'/landmarks/index'
  end

  # Read get: New landmark page
  get '/landmarks/new' do

    erb :'/landmarks/new'
  end

  # Read: Show landmark detail page
  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])

    erb :'/landmarks/show'
  end

  # Post: Create landmark
  post '/landmarks' do
    #binding.pry
    if !Landmark.find_by(name: params[:landmark][:name])
      landmark = Landmark.create(params[:landmark])
    end

    redirect :"/landmarks/#{landmark.id}"
  end

  # Read: Edit a landmark
  get '/landmarks/:id/edit' do
    @landmark = Landmark.find_by_id(params[:id])

    erb :'/landmarks/edit'
  end

  # Patch: Edit landmark
  patch '/landmarks/:id' do
    #binding.pry
    landmark = Landmark.find(params[:id])

    landmark.update(params[:landmark])
    #landmark.name = params[:landmark][:name]
    #landmark.year_completed = params[:landmark][:year_completed]
    #landmark.save

    redirect :"/landmarks/#{landmark.id}"
  end

end
