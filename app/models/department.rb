class Department < ApplicationRecord
  has_many :employees

  def add_employee(employee)
    employees << employee
  end
end