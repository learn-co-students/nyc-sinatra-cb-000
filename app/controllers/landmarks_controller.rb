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
		@figure = Figure.all
		
		erb :"/landmarks/edit"
	end

	patch "/landmarks/:id" do
		@landmark = Landmark.find_by_id(params[:id])

		#if !landmark.blank?
			@landmark.update(params[:landmark])
			@landmark.save
		#end

		redirect "/landmarks/#{@landmark.id}"
	end
end
