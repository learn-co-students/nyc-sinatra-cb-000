class FiguresController < ApplicationController

  get '/' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/new' do
    erb :'/figures/new'
  end

  post '/' do
    @figure = Figure.create(params["figure"])
     if !params[:landmark][:name].empty?
       @figure.landmarks << Landmark.create(params[:landmark])
     end

     if !params[:title][:name].empty?
       @figure.titles << Title.create(params[:title])
     end

     @figure.save
     redirect to "/#{@figure.id}"
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
    @figure = Figure.find(params[:id])
    @figure.update(params[:figure])

      if !params[:landmark][:name].empty?
        @figure.landmarks << Landmark.create(params[:landmark])
      end

      if !params[:title][:name].empty?
        @figure.titles << Title.create(params[:title])
      end

    @figure.save
    redirect to "/#{@figure.id}"
  end

end
