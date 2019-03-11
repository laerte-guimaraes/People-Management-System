class Employee < ApplicationRecord

	belongs_to :department

	validates :name,
		:company,
		:summary,
		:role,
		:department_id,
		:admission_date,
		:description,
		presence: true
		
end
