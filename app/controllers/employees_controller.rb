class EmployeesController < ApplicationController
  def show
    @employee = Employee.find(params[:id])
    @ordered_tickets = @employee.order_tickets

    if params[:search].present?
      @ticket = Ticket.find(params[:search])
      @employee.add_ticket(@ticket)
      @ordered_tickets = @employee.order_tickets
    end
  end
end