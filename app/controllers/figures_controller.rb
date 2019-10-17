class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'/figures/new'
  end

  get '/figures/:id' do
    @figure = Figure.find_by(id: params[:id])
    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    @titles = Title.all
    @landmarks = Landmark.all
    @figure = Figure.find_by(id: params[:id])
    erb :'/figures/edit'
  end

  patch '/figures/:id' do
    if !params[:figure].keys.include?(:title_ids)
      params[:figure][:title_ids] = []
    end

    @figure = Figure.find_by(id: params[:id])
    @figure.update(params[:figure])
    if !params[:landmark][:name].empty?
      figure.landmarks << Landmark.create(name: params[:landmark][:name])
    end
    if !params[:title][:name].empty?
      figure.titles << Title.create(name: params[:title][:name])
    end
    @figure.save
    redirect "/figure/#{@figure.id}"
  end

  post '/figures' do
    figure = Figure.create(params[:figure])
    if !params[:landmark][:name].empty?
      figure.landmarks << Landmark.create(name: params[:landmark][:name])
    end
    if !params[:title][:name].empty?
      figure.titles << Title.create(name: params[:title][:name])
    end
    redirect '/figures'
  end

end
