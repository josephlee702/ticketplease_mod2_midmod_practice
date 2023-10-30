require "rails_helper"

RSpec.describe Department, type: :model do
  before(:each) do
    @sales = Department.create!(name: "Sales", floor: "1st floor")
    
    @jack = Employee.create!(name: "Jack Harlow", level: 1, department: @sales)
    @sally = Employee.create!(name: "Sally Jones", level: 2, department: @sales)
  end

  describe "relationships" do
    it { should have_many :employees }
  end

  describe '#add_employee' do
    it 'can add employees to a department' do
      @sales.add_employee(@jack)
      @sales.add_employee(@sally)
      expect(@sales.employees).to eq([@jack, @sally])
      expect(@sales.employees.count).to eq(2)
    end
  end
end