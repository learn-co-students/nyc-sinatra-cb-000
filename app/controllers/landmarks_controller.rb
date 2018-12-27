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




end
