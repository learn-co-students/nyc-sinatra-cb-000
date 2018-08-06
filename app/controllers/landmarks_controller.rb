class LandmarksController < ApplicationController

  get '/' do
    @landmarks = Landmark.all
    erb :'/landmarks/index'
  end

  get '/new' do
    erb :'/landmarks/new'
  end

  post '/' do
    @landmark = Landmark.create(params[:landmark])
      if !params["figure"]["name"].empty?
        @landmark.figure = Figure.create(name: params["figure"]["name"])
      end
    @landmark.save
    redirect "landmarks/#{@landmark.id}"
  end

  get '/:id' do
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/show'
  end

  get '/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/edit'
  end

  post '/:id' do
    @landmark = Landmark.find(params[:id])
    @landmark.update(params[:landmark])
      if !params["figure"]["name"].empty?
        @landmark.figure = Figure.create(name: params["figure"]["name"])
      end
    @landmark.save
    redirect "landmarks/#{@landmark.id}"
  end

end
