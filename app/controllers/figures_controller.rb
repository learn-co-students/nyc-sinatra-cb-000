class FiguresController < ApplicationController

	get "/figures/new" do
		@titles = Title.all
		@landmarks = Landmark.all 
		
		erb :"figures/new"
	end

	post "/figures" do

		@figure = Figure.create(params[:figure])

		# if the Title textbox is not empty, 
		# create a new title and add it to figure.landmark << Title.create(params[])
		
		# if the Landmark textbox is not empty, 
		# create a new landmark and add it to the figure's landmark array
		# otherwise, just add the landmark.
		# 
		# REVIEW> THIS DOESN"T SEEM RIGHT.
		
		if !params[:landmark][:name].empty?
			@figure.landmarks << Landmark.create(params[:landmark])
		else
			@figure.landmarks << Landmark.find_by(params[:landmark][:name])
		end

		@figure.save

		# redirect :"/figures/#{figure.id}"
	end
end