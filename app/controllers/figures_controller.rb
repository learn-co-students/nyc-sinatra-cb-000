class FiguresController < ApplicationController
  
  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/new' do
    erb :'/figures/new'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    # @figure.update(name: params[:figure][:name])
    # @figure.title_ids = params[:figure][:title_ids]
    # @figure.landmark_ids = params[:figure][:landmark_ids]
    if params[:title][:name] != ""
      @figure.titles << Title.create(params[:title])
      # @title = Title.create(name: params[:title][:name])
      # FigureTitle.create(title_id: @title.id, figure_id: @figure.id)
      # I can't understand why the line below didn't work in place of the line above; even added a save for good measure.
      # @figure.title_ids << @title.id -OR- @figure.title_ids.push(@title.id)
    end
    if params[:landmark][:name] != ""
      @figure.landmarks << Landmark.create(params[:landmark])
      # Landmark.create(params[:landmark][:name], year_completed: params[:landmark][:year_completed], figure_id: @figure.id)
    end
    @figure.save
    redirect "/figures/#{@figure.id}"
  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by_id(params[:id])
    erb :"/figures/edit"
  end

  get '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    erb :"/figures/show"
  end

  patch '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    @figure.update(params[:figure])
    # @figure.update(name: params[:figure][:name])
    # @figure.title_ids = params[:figure][:title_ids]
    # @figure.landmark_ids = params[:figure][:landmark_ids]
    if params[:title][:name] != ""
      @figure.titles << Title.create(params[:title])
      # @title = Title.create(name: params[:title][:name])
      # FigureTitle.create(title_id: @title.id, figure_id: @figure.id)
    end
    if params[:landmark][:name] != ""
      @figure.landmarks << Landmark.create(params[:landmark])
      # Landmark.create(name: params[:landmark][:name], year_completed: params[:landmark][:year_completed], figure_id: @figure.id)
    end
    @figure.save
    redirect :"/figures/#{@figure.id}"
  end

end
