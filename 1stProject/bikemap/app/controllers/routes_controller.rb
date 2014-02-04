class RoutesController < ApplicationController
	require 'httparty'

	def index
		@route = Route.new
	end

	def create
		new_route= params.require(:route).permit(:startLocation, :endLocation, :roadGradeStrategy)
		@route= Route.new(new_route)
		@results = getRoute(@route.startLocation, @route.endLocation, @route.roadGradeStrategy)
		redirect_to @route
	end

	def show
	    @route = Route.find(params[:id])
	end

	def getRoute(startLocation, endLocation, roadGradeStrategy)
    return HTTParty.get('open.mapquestapi.com/directions/v2/route?', :query => {
      :api_key => 'Fmjtd%7Cluur2162nq%2C8l%3Do5',
      :ambiguities => 'ignore',
      :route_type => 'bicycle',
      :manMaps => 'false',
      :roadGradeStrategy => roadGradeStrategy,
      :from => startLocation,
      :to => endLocation})
  	end

end
