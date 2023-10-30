sales = Department.create!(name: "Sales", floor: "1st floor")
IT = Department.create!(name: "IT", floor: "2nd floor")
finance = Department.create!(name: "Finance", floor: "3rd floor")

jack = Employee.create!(name: "Jack Harlow", level: 1, department: sales)
sally = Employee.create!(name: "Sally Jones", level: 2, department: sales)
james = Employee.create!(name: "James Cornfield", level: 3, department: IT)
rebecca = Employee.create!(name: "Rebecca Smith", level: 4, department: finance)

ticket1 = jack.tickets.create!(subject: "random task 1", age: 5)
ticket2 = jack.tickets.create!(subject: "random task 2", age: 3)
ticket3 = jack.tickets.create!(subject: "random task 3", age: 2)
ticket4 = Ticket.create!(subject: "add this ticket to jack", age: 7)
ticket5 = Ticket.create!(subject: "email boss", age: 1)