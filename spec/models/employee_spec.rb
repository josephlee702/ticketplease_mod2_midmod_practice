require "rails_helper"

RSpec.describe Employee, type: :model do
  before(:each) do
    @sales = Department.create!(name: "Sales", floor: "1st floor")

    @jack = Employee.create!(name: "Jack Harlow", level: 1, department: @sales)

    @ticket1 = @jack.tickets.create!(subject: "random task 1", age: 5)
    @ticket2 = @jack.tickets.create!(subject: "random task 2", age: 3)
    @ticket3 = @jack.tickets.create!(subject: "random task 3", age: 2)
    @ticket4 = Ticket.create!(subject: "email boss", age: 7)
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

  describe "#add_ticket" do
    it "adds a ticket to the employee" do
      expect(@jack.tickets).to eq([@ticket1, @ticket2, @ticket3])
      @jack.add_ticket(@ticket4)
      expect(@jack.tickets).to eq([@ticket1, @ticket2, @ticket3, @ticket4])
    end
  end

  describe "#order_tickets" do
    it "orders tickets from oldest to newest" do
      @jack.add_ticket(@ticket4)
      expect(@jack.order_tickets).to eq([@ticket4, @ticket1, @ticket2, @ticket3])
    end
  end
end
