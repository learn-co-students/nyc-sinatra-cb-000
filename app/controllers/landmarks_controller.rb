class LandmarksController < ApplicationController

	get "/landmarks" do
		@landmarks = Landmark.all
		erb :"/landmarks/index"
	end


	get "/landmarks/new" do
		@landmarks = Landmark.all 
		
		erb :"/landmarks/new"
	end

	get "/landmarks/:id" do
		@landmark = Landmark.find(params[:id])

		erb :"/landmarks/show"
	end

	post "/landmarks" do
		@landmark = Landmark.all

		if !@landmark.exists?(name: params[:landmark][:name])	
			@landmark = Landmark.create(params[:landmark])
		end

		redirect :"/landmarks"

	end

	get "/landmarks/:id/edit" do
		@landmark = Landmark.find(params[:id])
		erb :"/landmarks/edit"
	end

	patch "/landmarks/:id" do
		landmark = Landmark.find_by_id(params[:id])

		if #some condition
			# something like:
			# @article = Article.find_by_id(params[:id])
  			# @article.title = params[:title]
  			# @article.content = params[:content]
  			# @article.save
		end

		redirect "/landmarks/#{landmark.id}"
	end
end
