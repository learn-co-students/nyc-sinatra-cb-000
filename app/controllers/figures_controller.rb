class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end

  get '/figures/new' do
    erb :'figures/new'
  end

  get '/figures/:id'
    @figure = Figure.find(params[:id])
    erb :'figures/show'
  end

  get '/figures/:id/edit'
    @figure = Figure.find(params[:id])
    erb :'figures/edit'
  end

  post '/figures' do

    redirect to "/figures/#{@figure.id}"
  end

  patch '/figures' do

    redirect to "/figures/#{@figure.id}"
  end
end
