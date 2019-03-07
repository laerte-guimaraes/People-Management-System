class Employee < ApplicationRecord

	validates :name,
		:company,
		:summary,
		:role,
		:department,
		:admission_date,
		:description,
		presence: true
		
end
