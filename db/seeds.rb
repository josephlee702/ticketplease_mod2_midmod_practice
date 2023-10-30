sales = Department.create!(name: "Sales", floor: "1st floor")
IT = Department.create!(name: "IT", floor: "2nd floor")
finance = Department.create!(name: "Finance", floor: "3rd floor")

jack = Employee.create!(name: "Jack Harlow", level: 1)
sally = Employee.create!(name: "Sally Jones", level: 2)
james = Employee.create!(name: "James Cornfield", level: 3)
rebecca = Employee.create!(name: "Rebecca Smith", level: 4)
