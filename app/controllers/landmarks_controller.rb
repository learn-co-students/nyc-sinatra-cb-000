class LandmarksController < ApplicationController

	get "/landmarks/new" do
		#@titles = Title.all
		@landmarks = Landmark.all 
		
		erb :"/landmarks/new"
	end
end
