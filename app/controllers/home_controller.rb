class HomeController < ApplicationController

	def index
		@employees = Employee.all
	end

end