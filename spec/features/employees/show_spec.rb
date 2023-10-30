require "rails_helper"

RSpec.describe "the employees show page" do
  before(:each) do
    @sales = Department.create!(name: "Sales", floor: "1st floor")

    @jack = Employee.create!(name: "Jack Harlow", level: 1, department: @sales)

    @ticket1 = @jack.tickets.create!(subject: "random task 1", age: 5, created_at: "2023-10-28 03:16:07.048914000 +0000", updated_at: "2023-10-28 03:16:07.048914000 +0000")
    @ticket2 = @jack.tickets.create!(subject: "random task 2", age: 3, created_at: "2023-10-29 03:16:07.048914000 +0000", updated_at: "2023-10-29 03:16:07.048914000 +0000")
    @ticket3 = @jack.tickets.create!(subject: "random task 3", age: 2, created_at: "2023-10-30 03:16:07.048914000 +0000", updated_at: "2023-10-30 03:16:07.048914000 +0000")
  end

  it "shows the employee's name, department, and list of tickets from oldest to newest" do
    visit "/employees/#{@jack.id}"
    expect(page).to have_content(@jack.name)
    expect(page).to have_content(@jack.department.name)
    expect(page).to have_content(@ticket1.subject)
    expect(page).to have_content(@ticket2.subject)
    expect(page).to have_content(@ticket3.subject)
    expect(@ticket1.subject).to be < @ticket2.subject
    expect(@ticket2.subject).to be < @ticket3.subject
    expect(@ticket1.subject).to be < @ticket3.subject
  end

  it "shows the oldest ticket assigned to the employee listed separately" do
    visit "/employees/#{@jack.id}"
    expect(page).to have_content("Oldest Ticket: #{@ticket1.subject}")
  end
end
