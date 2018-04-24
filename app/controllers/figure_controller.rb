class FiguresController < ApplicationController

  enable :sessions

  get "/figures" do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/new' do
    erb :'/figures/new'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end

  post '/figures' do
    @figure = Figure.create(params["figure"])

    # title
    if params[:title][:name]
      @figure.titles << Title.create(params[:title])
    # else
      # params["titles"].each do |title|
        # @figure.titles << Title.find(title)
      # end
    end


    # landmark
    if params[:landmark][:name]
      @figure.landmarks << Landmark.create(params[:landmark])
    # else
      # params["landmarks"].each do |landmark|
        # @figure.landmark << Title.find(name: landmark)
    end

    @figure.save


    redirect "/figures/#{@figure.id}"
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'/figures/edit'
  end

  post '/figures/:id' do
                      
    @figure = Figure.find(params["id"])
    @figure.update(params[:figure])
    if params[:title][:name]
    @figure.titles << Title.create(params[:title])
    end
    if params[:landmark][:name]
    @figure.landmarks << Landmark.create(params[:landmark])
    end
    @figure.save
    redirect "/figures/#{@figure.id}"

  end


end
