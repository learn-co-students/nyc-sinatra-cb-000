class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'figures/new'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'figures/edit'
  end

  patch '/figures/:id' do
    if !params[:figure].keys.include?('title_ids')
      params[:figure]['title_ids'] = []
    end
    if !params[:figure].keys.include?('landmark_ids')
      params[:figure]['landmark_ids'] = []
    end
    @figure = Figure.find(params[:id])
    @figure.update(params[:figure])
    if !params[:title][:name].empty?
      @figure.titles << Title.create(params[:title])
    end
    if !params[:landmark][:name].empty?
      @figure.landmark << Title.create(params[:landmark])
    end
    redirect "figures/#{@figure.id}"
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    if !params["title"]["name"].empty?
      @figure.titles << Title.create(params[:title])
    end
    if !params["landmark"]["name"].empty?
      @figure.landmarks << Landmark.create(params[:Landmark])
    end
    @figure.save
  end
end
