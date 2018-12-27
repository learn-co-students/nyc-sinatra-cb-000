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


  post '/landmarks' do
    change figure to landmarks
    # @figure = Figure.create(name: params[:figure][:name])
    #
    # if params[:figure][:title_ids] != nil
    #   params[:figure][:title_ids].each do |id|
    #     @figure.titles << Title.find(id)
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
  end

end
