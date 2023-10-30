require "rails_helper"

RSpec.describe "the departments index" do
  before(:each) do
    @sales = Department.create!(name: "Sales", floor: "1st floor")
    @IT = Department.create!(name: "IT", floor: "2nd floor")
    @finance = Department.create!(name: "Finance", floor: "3rd floor")

    @jack = Employee.create!(name: "Jack Harlow", level: 1, department: @sales)
    @sally = Employee.create!(name: "Sally Jones", level: 2, department: @sales)
    @james = Employee.create!(name: "James Cornfield", level: 3, department: @IT)
    @rebecca = Employee.create!(name: "Rebecca Smith", level: 4, department: @finance)
  end

  it "lists all departments' name, floor, and employees in the dept" do

    @sales.add_employee(@jack)
    @sales.add_employee(@sally)
    @IT.add_employee(@james)
    @finance.add_employee(@rebecca)

    visit "/departments"

    expect(page).to have_content(@sales.name)
    expect(page).to have_content(@sales.floor)
    expect(page).to have_content(@IT.name)
    expect(page).to have_content(@IT.floor)
    expect(page).to have_content(@finance.name)
    expect(page).to have_content(@finance.floor)

    expect(page).to have_content(@jack.name)
    expect(page).to have_content(@sally.name)
    expect(page).to have_content(@james.name)
    expect(page).to have_content(@rebecca.name)
  end
end
