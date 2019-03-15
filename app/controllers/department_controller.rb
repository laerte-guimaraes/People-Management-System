class DepartmentController < ApplicationController

	def new
		@department = Department.new
	end

	def create
		@department = Department.new(required_params)
		if @department.save
			redirect_to @department
		else
			render :new
		end
	end

	def show
		@department = Department.find(params[:id])
	end

	def required_params
		attributes = params.require(:department)
		{
			name: attributes[:name]
		}
	end

end