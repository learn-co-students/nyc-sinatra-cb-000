class FiguresController < ApplicationController
  # add controller methods
  get '/figures' do
    erb :'figures/index'
  end

  post '/figures' do
    @figure = Figure.create(name: params[:figure][:name])

    if params[:figure][:title_ids] != nil
      params[:figure][:title_ids].each do |id|
        @figure.titles << Title.find(id)
      end
    end

    if params[:title][:name] != ""
      new_title = Title.create(name: params[:title])
      @figure.titles << new_title
    end

    if params[:figure][:landmark_ids] != nil
      params[:figure][:landmark_ids].each do |id|
        @figure.landmarks << Landmark.find(id)
      end
    end

    if params[:landmark][:name] != ""
      new_landmark = Landmark.create(name: params[:landmark][:name])
      @figure.landmarks << new_landmark
    end


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
    @titles = Title.all
    @landmarks = Landmark.all
    @figure = Figure.find(params[:id])
    erb :'figures/edit'
  end

  patch '/figures/:id' do
    # binding.pry
    @figure = Figure.find(params[:id])
    if params[:figure][:name] != ""
      @figure.name = params[:figure][:name]
    end


    @figure.titles.clear
    if params[:title][:name] != ""
      new_title = Title.create(name: params[:title][:name])
      @figure.titles << new_title
    end

    @figure.landmarks.clear
    if params[:landmark][:name] != ""
      new_landmark = Landmark.create(name: params[:landmark][:name])
      @figure.landmarks << new_landmark
    end

    @figure.save
    erb :"figures/#{@figure.id}"

  end



end
