class Employee < ApplicationRecord
  validates :name, presence: true
  validates :level, presence: true, numericality: true
  belongs_to :department
  has_many :employee_tickets
  has_many :tickets, through: :employee_tickets

  def oldest_ticket
    #could incorporate an 'if' statement here to account for when people don't have any tickets assigned to them
    tickets.order(:age).last.subject
  end
end