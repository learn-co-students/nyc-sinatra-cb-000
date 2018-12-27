class LandmarksController < ApplicationController
  # add controller methods
  get '/landmarks' do
    erb :'landmarks/index'
  end

  get '/landmarks/new' do
    @titles = Title.all
    @figures = Figure.all
    erb :'landmarks/new'
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :'landmarks/show'
  end

  post '/landmarks' do
    # change figure to landmarks
    @landmark = Landmark.create(name: params[:landmark][:name], year_completed: params[:landmark][:year_completed])

    # if params[:landscape][:title_ids] != nil
    #   params[:landscape][:title_ids].each do |id|
    #     @landscape.titles << Title.find(id)
    #   end
    # end
    #
    # if params[:title][:name] != ""
    #   new_title = Title.create(name: params[:title])
    #   @figure.titles << new_title
    # end
    #
    # if params[:figure][:landmark_ids] != nil
    #   params[:figure][:landmark_ids].each do |id|
    #     @figure.landmarks << Landmark.find(id)
    #   end
    # end
    #
    # if params[:landmark][:name] != ""
    #   new_landmark = Landmark.create(name: params[:landmark][:name])
    #   @figure.landmarks << new_landmark
    # end

    redirect "/landscape/#{@landscape.id}"
  end

  get '/landmarks/:id/edit' do
    binding.pry
    @landmark = Landmark.create(name: params[:landmark][:name], year_completed: params[:landmark][:year_completed])
    @figures = Figure.all
    @titles = Title.all
    erb :'landmarks/edit'
  end

end
