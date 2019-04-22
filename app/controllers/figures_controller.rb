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

  post '/figures' do
    #Handle new figure creation here!
    figure = Figure.new
    figure.name = params[:figure][:name]
    figure.titles = params[:figure][:title_ids].collect{|id| Title.find(id)} if params[:figure][:title_ids]
    if params[:title][:name] != '' then
      title = Title.new
      title.name = params[:title][:name]
      title.figures << figure
      title.save
      figure.titles << title
    end
    figure.landmarks = params[:figure][:landmark_ids].collect{|id| Landmark.find(id)} if params[:figure][:landmark_ids]
    if params[:landmark][:name] != '' then
      landmark = Landmark.new
      landmark.name = params[:landmark][:name]
      landmark.year_completed = params[:landmark][:year_completed]
      landmark.figure = figure
      landmark.save
      figure.landmarks << landmark
    end
    figure.save
    redirect "/figures/#{figure.id}"
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'figures/edit'
  end

  patch '/figures/:id' do
    #Handle figure edit here!
    figure = Figure.find(params[:id])
    figure.name = params[:figure][:name]
    figure.titles.clear
    figure.titles = params[:figure][:title_ids].collect{|id| Title.find(id)} if params[:figure][:title_ids]
    if params[:title][:name] != '' then
      title = Title.new
      title.name = params[:title][:name]
      title.figures << figure
      title.save
      figure.titles << title
    end
    figure.landmarks.clear
    figure.landmarks = params[:figure][:landmark_ids].collect{|id| Landmark.find(id)} if params[:figure][:landmark_ids]
    if params[:landmark][:name] != '' then
      landmark = Landmark.new
      landmark.name = params[:landmark][:name]
      landmark.year_completed = params[:landmark][:year_completed]
      landmark.figure = figure
      landmark.save
      figure.landmarks << landmark
    end
    figure.save
    redirect "/figures/#{figure.id}"
  end
end
