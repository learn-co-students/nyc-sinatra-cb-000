class FiguresController < ApplicationController

  get "/figures" do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get "/figures/new" do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'/figures/new'
  end

  get "/figures/:id/edit" do
    @figure = Figure.find_by(id: params[:id])
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'/figures/edit'
  end

  get "/figures/:id" do
    @figure = Figure.find_by(id: params[:id])
    erb :'/figures/show'
  end

  post "/figures" do

    new_figure = Figure.create(name: params[:figure][:name])

    Helpers.add_titles(new_figure, params[:figure][:title_ids], params[:title][:name])
    Helpers.add_landmarks(new_figure, params[:figure][:landmark_ids], params[:landmark])

    redirect '/figures'

  end

  post "/figures/:id" do

    figure = Figure.find_by(params[:id])
    figure.name = params[:figure][:name]

    Helpers.add_titles(figure, params[:figure][:title_ids], params[:title][:name])
    Helpers.add_landmarks(figure, params[:figure][:landmark_ids], params[:landmark])

    redirect "/figures/#{figure.id}"
  end




end
