class FiguresController < ApplicationController

  get '/' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/new' do
    erb :'/figures/new'
  end

  post '/' do
    @figure = Figure.create(params[:figure])
      if params[:landmark][:name] != ""
        new_landmark = Landmark.new(name: params[:landmark])
        new_landmark.figure_id = @figure.id
        new_landmark.save
      end
      if params[:title][:name] != ""
        new_title = Title.create(name: params[:title])
        FigureTitle.create(title_id: new_title.id, figure_id: @figure.id)
      end
    redirect "figures/#{@figure.id}"
  end

  get '/:id' do
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end

  get '/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'/figures/edit'
  end

  post '/:id' do
    @figure = Figure.update(params[:figure])
      if params[:landmark][:name] != ""
        new_landmark = Landmark.new(name: params[:landmark])
        new_landmark.figure_id = @figure.id
        new_landmark.save
      end
      if params[:title][:name] != ""
        new_title = Title.create(name: params[:title])
        FigureTitle.create(title_id: new_title.id, figure_id: @figure.id)
      end
    redirect "figures/#{@figure.id}"
  end

end
