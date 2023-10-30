require "rails_helper"

RSpec.describe Ticket, type: :model do
  describe "relationships" do
    it { should have_many :employee_tickets }
    it { should have_many(:employees).through(:employee_tickets) }
  end

  describe "validations" do
    it { should validate_presence_of(:subject) }
    it { should validate_presence_of(:age) }
    it { should validate_numericality_of(:age) }
  end

  before(:each) do
  end

  describe "class methods" do
    describe "#search" do
      it 'returns exact matches' do
      
      end
    end
  end

  describe "instance methods" do
    describe ".shelter_name" do
      it "returns the shelter name for the given pet" do
      end
    end
  end
end
