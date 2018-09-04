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

  get "/figures/:id" do
    @figure = Figure.find_by(id: params[:id])
    erb :'/figures/show'
  end

  post "/figures" do
    # binding.pry
    new_figure = Figure.create(name: params[:figure][:name])

    if params[:figure][:title_ids]
      params[:figure][:title_ids].each do |title_id|
        new_figure.titles << Title.find_by(id: title_id)
      end
    end

    if !params[:title][:name].empty?
      new_title = Title.create(name: params[:title][:name])
      new_figure.titles << new_title
    end

    if params[:figure][:landmark_ids]
      params[:figure][:landmark_ids].each do |landmark_id|
        new_figure.landmarks << Landmark.find_by(id: landmark_id)
      end
    end

    if !params[:landmark][:name].empty?
      new_landmark = Landmark.create(name: params[:landmark][:name])
      if !params[:landmark][:year].empty?
        new_landmark.year_completed = params[:landmark][:year]
        new_landmark.save
      end
      new_figure.landmarks << new_landmark
    end

    redirect '/figures'

  end

end
