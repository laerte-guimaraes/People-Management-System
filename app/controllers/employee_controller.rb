class EmployeeController < ApplicationController

	def show
		@employee = Employee.find(params[:id])
	end

	def new
		@employee = Employee.new
	end

	def create
		@employee = Employee.new(require_params(params))
		if @employee.save!
			redirect_to employee_path(@employee)
		end
	end

	def require_params(params)
		data = params.require(:employee)
		data[:admission_date] = Date.parse(data[:admission_date])
		data.symbolize_keys
	end

end