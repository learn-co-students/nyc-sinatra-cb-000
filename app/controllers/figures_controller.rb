class FiguresController < ApplicationController

	get "/figures/new" do
		@titles = Title.all
		@landmarks = Landmark.all 
		
		erb :"figures/new"
	end

	post "/figures" do

		@figure = Figure.create(params[:figure])

		# create a new figure w/ a new title 
		# check if it's empty
		# check if it's already in the list 
		if !params[:title][:name].empty?
			@figure.titles << Title.create(params[:title])
		else
		end
		
		# create a new figure w/ a new landmark
		# check if it's empty
		# check if it's already in the list 
		if !params[:landmark][:name].empty?
			@figure.landmarks << Landmark.create(params[:landmark])
		else
		end

		@figure.save

		# redirect :"/figures/#{@figure.id}"
	end
end