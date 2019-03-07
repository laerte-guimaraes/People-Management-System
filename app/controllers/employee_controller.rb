class EmployeeController < ApplicationController

	def show
		@employee = Employee.find(params[:id])
	end

	def new
		@employee = Employee.new
	end

	def create
		@employee = Employee.new(require_params(params))
		if @employee.save
			redirect_to employee_path(@employee)
		else
			render :new
		end
	end

	def edit
		@employee = Employee.find(params[:id])
		# @employee[:admission_date] = date_validator(@employee[:admission_date])
	end

	def update
		@employee = Employee.find(params[:id])
		if @employee.update(require_params(params))
			redirect_to employee_path(@employee)
		else
			render :edit
		end
	end

	def require_params(params)
		data = params.require(:employee)
		data[:admission_date] = date_validator(data[:admission_date])
		data.symbolize_keys
	end

	def date_validator(date_field)
		begin
			Date.parse(date_field)
		rescue
			nil
		end
	end

end