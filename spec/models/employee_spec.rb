require "rails_helper"

RSpec.describe Employee, type: :model do
  before(:each) do
    @sales = Department.create!(name: "Sales", floor: "1st floor")

    @jack = Employee.create!(name: "Jack Harlow", level: 1, department: @sales)

    @ticket1 = @jack.tickets.create!(subject: "random task 1", age: 5)
    @ticket2 = @jack.tickets.create!(subject: "random task 2", age: 3)
    @ticket3 = @jack.tickets.create!(subject: "random task 3", age: 2)
  end
  
  describe "relationships" do
    it { should belong_to :department }
    it { should have_many :employee_tickets }
    it { should have_many(:tickets).through(:employee_tickets) }
  end

  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:level) }
    it { should validate_numericality_of(:level) }
  end

  describe "#oldest_ticket" do
    it "returns the oldest ticket that an employee has" do
      expect(@jack.oldest_ticket).to eq(@ticket1.subject)
    end
  end
end
