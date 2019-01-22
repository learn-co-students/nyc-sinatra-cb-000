class FiguresController < ApplicationController
  get '/figures' do
    @figures = Figure.all

    erb :'figures/index.html'
  end

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all

    erb :'figures/new.html'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    @figure.update(params[:figure])

    unless params[:title][:name].empty?
      @figure.titles << Title.create(params[:title])
    end

    unless params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end

    redirect to "/figures/#{@figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])

    erb :'figures/show.html'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @titles = Title.all
    @landmarks = Landmark.all

    erb :'figures/edit.html'
  end

  patch '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.update(params[:figure])

    unless params[:title][:name].empty?
      @figure.titles << Title.create(params[:title])
    end

    unless params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end

    redirect to "/figures/#{@figure.id}"
  end
end
