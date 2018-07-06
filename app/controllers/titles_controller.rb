class TitlesController < ApplicationController
  get '/titles' do
    @titles = Title.all
    erb :'titles/index'
  end

  get 'titles/new' do
    erb :'titles/new'
  end

  get '/titles/:id' do
    @title = Title.find(params[:id])
    erb :'titles/show'
  end

  get '/titles/:id/edit' do
    @title = Title.find(params[:id])
    erb :'titles/edit'
  end

  post '/titles' do
      @title = Title.create(params[:title])
      @title.figures <<  Figure.find_or_create_by(params[:figure]) if !params[:figure][:name].empty?
     redirect to "/titles/#{@title.id}"
   end

   patch '/titles' do
     @title = Title.find(params[:id])
     @title.update(params[:title])
     @title.figures <<  Figure.find_or_create_by(params[:figure]) if !params[:figure][:name].empty?
     redirect to "/titles/#{title.id}"
   end

end
