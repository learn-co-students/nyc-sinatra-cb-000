class FiguresController < ApplicationController

	get "/figures/new" do
		@titles = Title.all
		@landmarks = Landmark.all 
		
		erb :"figures/new"
	end

	post "/figures" do

		@figure = Figure.create(params[:figure])

		if !params[:landmark][:name].empty?
			# if the Title textbox is not empty, 
			# create a new title and add it to figure.landmark << Title.create(params[])
		end

		# redirect :"/figures/#{figure.id}"

end