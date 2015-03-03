# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


g1 = Group.create(name: "Student House")
g2 = Group.create(name: "Saturday Night")
g3 = Group.create(name: "Holiday")
g4 = Group.create(name: "Birthday Party")
g5 = Group.create(name: "Retirement Party")

u1 = User.create(email: 'tomsmith@email.com', password: 'password', password_confirmation: 'password',name: "Tom Smith", balance: 0)
u2 = User.create(email: 'johnjones@email.com', password: 'password', password_confirmation: 'password',name: "John Jones", balance: 0)
u3 = User.create(email: 'timdavies@email.com', password: 'password', password_confirmation: 'password',name: "Tim Davies", balance: 0)
u4 = User.create(email: 'barrygrape@email.com', password: 'password', password_confirmation: 'password',name: "Barry Grape", balance: 0)
u5 = User.create(email: 'jackquaid@email.com', password: 'password', password_confirmation: 'password',name: "Jack Quaid", balance: 0)
u6 = User.create(email: 'klausbrown@email.com', password: 'password', password_confirmation: 'password',name: "Klaus Brown", balance: 0)
u7 = User.create(email: 'claudewhite@email.com', password: 'password', password_confirmation: 'password',name: "Claude White", balance: 0)
u8 = User.create(email: 'barrygrey@email.com', password: 'password', password_confirmation: 'password',name: "Barry Grey", balance: 0)
u9 = User.create(email: 'sarahsmithson@email.com', password: 'password', password_confirmation: 'password',name: "Sarah Smithson", balance: 0)
u10 = User.create(email: 'jennyjackson@email.com', password: 'password', password_confirmation: 'password',name: "Jenny Jackson", balance: 0)


i1 = Invoice.create(name: "Gas", amount: 500, group_id: g1.id)
i2 = Invoice.create(name: "Electricity", amount: 400, group_id: g1.id)
i3 = Invoice.create(name: "Internet", amount: 50, group_id: g1.id)
i4 = Invoice.create(name: "Theatre Tickets", amount: 150, group_id: g2.id)
i5 = Invoice.create(name: "Dinner Bill", amount: 100, group_id: g2.id)
i6 = Invoice.create(name: "Flights", amount: 300, group_id: g3.id)
i7 = Invoice.create(name: "Hotel", amount: 1000, group_id: g3.id)
i8 = Invoice.create(name: "Council Tax", amount: 300, group_id: g1.id)
i9 = Invoice.create(name: "TV License", amount: 1000, group_id: g1.id)
i10 = Invoice.create(name: "New TV", amount: 1000, group_id: g1.id)
i11 = Invoice.create(name: "Retirement Gift", amount: 500, group_id: g5.id)
i12 = Invoice.create(name: "Birthday Present", amount: 500, group_id: g4.id)
i13 = Invoice.create(name: "Birthday Meal", amount: 500, group_id: g4.id)

g1.users << u1
g1.users << u2
g1.users << u3

puts "seed success"
