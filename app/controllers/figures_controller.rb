class FiguresController < ApplicationController

  get '/figures/new' do
    erb :'/figures/new'
  end

  post '/figures' do

    @figure = Figure.create(name: params['figure']['name'])
    @figure.title_ids = params['figure']['title_ids'] if params['figure']['title_ids']
    @figure.landmark_ids = params['figure']['landmark_ids'] if params['figure']['landmark_ids']

    if params['title']['name'] != ""
      title = Title.create(:name => params['title']['name'])
      @figure.titles << title
    end

    if params['landmark']['name'] != ""
      landmark = Landmark.create(:name => params['landmark']['name'])
      landmark.figure_id = @figure.id
      @figure.landmarks << landmark
    end
  end

  get '/figures' do
    erb :'/figures/index'
  end

  get '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by_id(params[:id])
    erb :'/figures/edit'
  end

  post '/figures/:id' do
    @figure = Figure.find_by_id(params['id'])
    binding.pry

    @figure.name = params['figure']['name']
    landmark = Landmark.find_or_create_by(:name => params['landmark']['name'])
    landmark.figure_id = @figure.id
    @figure.landmarks << landmark


    @figure.save
    redirect "/figures/#{@figure.id}"


  end

end
