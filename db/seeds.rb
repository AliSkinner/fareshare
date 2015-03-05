# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)




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

g1 = Group.create(name: "Student House", created_by: u4.id)
g2 = Group.create(name: "Saturday Night")
g3 = Group.create(name: "Holiday")
g4 = Group.create(name: "Birthday Party")
g5 = Group.create(name: "Retirement Party")
g6 = Group.create(name: "Trip to India")
g7 = Group.create(name: "But and Ben")
g8 = Group.create(name: "Summer House")
g9 = Group.create(name: "Great Big Party")

i1 = Invoice.create(name: "Gas", amount: 500, group_id: g1.id, paid: false)
i2 = Invoice.create(name: "Electricity", amount: 400, group_id: g1.id, paid: false)
i3 = Invoice.create(name: "Internet", amount: 50, group_id: g1.id, paid: false)
i4 = Invoice.create(name: "Theatre Tickets", amount: 150, group_id: g2.id, paid: false)
i5 = Invoice.create(name: "Dinner Bill", amount: 100, group_id: g2.id, paid: false)
i6 = Invoice.create(name: "Flights", amount: 300, group_id: g3.id, paid: false)
i7 = Invoice.create(name: "Hotel", amount: 1000, group_id: g3.id, paid: false)
i8 = Invoice.create(name: "Council Tax", amount: 300, group_id: g1.id, paid: false)
i9 = Invoice.create(name: "TV License", amount: 1000, group_id: g1.id, paid: false)
i10 = Invoice.create(name: "New TV", amount: 1000, group_id: g1.id, paid: false)
i11 = Invoice.create(name: "Retirement Gift", amount: 500, group_id: g5.id, paid: false)
i12 = Invoice.create(name: "Birthday Present", amount: 500, group_id: g4.id, paid: false)
i13 = Invoice.create(name: "Birthday Meal", amount: 500, group_id: g4.id, paid: false)
i14 = Invoice.create(name: "Flight", amount: 1000, group_id: g6.id, paid: false)
i15 = Invoice.create(name: "Hotels", amount: 1500, group_id: g6.id, paid: false)
i16 = Invoice.create(name: "Council Tax", amount: 1000, group_id: g7.id, paid: false)
i17 = Invoice.create(name: "Electricity", amount: 300, group_id: g7.id, paid: false)
i18 = Invoice.create(name: "Roof Repairs", amount: 1000, group_id: g7.id, paid: false)
i19 = Invoice.create(name: "Booze", amount: 200, group_id: g9.id, paid: false)
i20 = Invoice.create(name: "More Booze", amount: 300, group_id: g9.id, paid: false)
i21 = Invoice.create(name: "Rent", amount: 1000, group_id: g8.id, paid: false)
i22 = Invoice.create(name: "Food", amount: 500, group_id: g8.id, paid: false)
i23 = Invoice.create(name: "Electricity", amount: 200, group_id: g8.id, paid: false)
i24 = Invoice.create(name: "Car", amount: 300, group_id: g8.id, paid: false)

g1.users << [u4, u2, u3]
g2.users << [u4, u5, u6]
g3.users << [u4, u8]
g4.users << [u4, u10]
g5.users << [u4, u7, u6]
g6.users << [u4, u1, u3, u7]
g7.users << [u4, u10, u9]
g8.users << [u4]
g9.users << [u4, u1, u8, u6, u10]

a1 = Allocation.create(invoice_id: i1.id, user_id: u4.id, share: 200, paid: false)
a2 = Allocation.create(invoice_id: i1.id, user_id: u2.id, share: 150, paid: false)
a3 = Allocation.create(invoice_id: i1.id, user_id: u3.id, share: 150, paid: false)
a4 = Allocation.create(invoice_id: i2.id, user_id: u4.id, share: 140, paid: false)
a5 = Allocation.create(invoice_id: i2.id, user_id: u2.id, share: 120, paid: false)
a6 = Allocation.create(invoice_id: i2.id, user_id: u3.id, share: 140, paid: false)
a7 = Allocation.create(invoice_id: i3.id, user_id: u4.id, share: 18, paid: false)
a8 = Allocation.create(invoice_id: i3.id, user_id: u2.id, share: 23, paid: false)
a9 = Allocation.create(invoice_id: i3.id, user_id: u3.id, share: 9, paid: false)

a61 = Allocation.create(invoice_id: i8.id, user_id: u4.id, share: 100, paid: false)
a62 = Allocation.create(invoice_id: i8.id, user_id: u2.id, share: 120, paid: false)
a63 = Allocation.create(invoice_id: i8.id, user_id: u3.id, share: 80, paid: false)
a64 = Allocation.create(invoice_id: i9.id, user_id: u4.id, share: 300, paid: false)
a65 = Allocation.create(invoice_id: i9.id, user_id: u2.id, share: 400, paid: false)
a66 = Allocation.create(invoice_id: i9.id, user_id: u3.id, share: 300, paid: false)
a67 = Allocation.create(invoice_id: i10.id, user_id: u4.id, share: 333, paid: false)
a68 = Allocation.create(invoice_id: i10.id, user_id: u2.id, share: 167, paid: false)
a69 = Allocation.create(invoice_id: i10.id, user_id: u3.id, share: 500, paid: false)

a10 = Allocation.create(invoice_id: i4.id, user_id: u4.id, share: 50, paid: false)
a11 = Allocation.create(invoice_id: i4.id, user_id: u5.id, share: 75, paid: false)
a12 = Allocation.create(invoice_id: i4.id, user_id: u6.id, share: 25, paid: false)
a13 = Allocation.create(invoice_id: i5.id, user_id: u4.id, share: 40, paid: false)
a14 = Allocation.create(invoice_id: i5.id, user_id: u5.id, share: 40, paid: false)
a15 = Allocation.create(invoice_id: i5.id, user_id: u6.id, share: 20, paid: false)

a16 = Allocation.create(invoice_id: i6.id, user_id: u4.id, share: 100, paid: false)
a17 = Allocation.create(invoice_id: i6.id, user_id: u8.id, share: 200, paid: false)
a18 = Allocation.create(invoice_id: i7.id, user_id: u4.id, share: 400, paid: false)
a19 = Allocation.create(invoice_id: i7.id, user_id: u8.id, share: 600, paid: false)

a20 = Allocation.create(invoice_id: i12.id, user_id: u4.id, share: 300, paid: false)
a21 = Allocation.create(invoice_id: i12.id, user_id: u10.id, share: 200, paid: false)
a22 = Allocation.create(invoice_id: i13.id, user_id: u4.id, share: 210, paid: false)
a23 = Allocation.create(invoice_id: i13.id, user_id: u10.id, share: 290, paid: false)

a24 = Allocation.create(invoice_id: i11.id, user_id: u4.id, share: 150, paid: false)
a25 = Allocation.create(invoice_id: i11.id, user_id: u7.id, share: 150, paid: false)
a26 = Allocation.create(invoice_id: i11.id, user_id: u6.id, share: 200, paid: false)

a27 = Allocation.create(invoice_id: i14.id, user_id: u4.id, share: 350, paid: false)
a28 = Allocation.create(invoice_id: i14.id, user_id: u1.id, share: 350, paid: false)
a29 = Allocation.create(invoice_id: i14.id, user_id: u3.id, share: 200, paid: false)
a30 = Allocation.create(invoice_id: i14.id, user_id: u7.id, share: 100, paid: false)
a31 = Allocation.create(invoice_id: i15.id, user_id: u4.id, share: 350, paid: false)
a32 = Allocation.create(invoice_id: i15.id, user_id: u1.id, share: 350, paid: false)
a33 = Allocation.create(invoice_id: i15.id, user_id: u3.id, share: 350, paid: false)
a34 = Allocation.create(invoice_id: i15.id, user_id: u7.id, share: 450, paid: false)

a35 = Allocation.create(invoice_id: i16.id, user_id: u4.id, share: 330, paid: false)
a36 = Allocation.create(invoice_id: i16.id, user_id: u10.id, share: 330, paid: false)
a37 = Allocation.create(invoice_id: i16.id, user_id: u9.id, share: 340, paid: false)
a38 = Allocation.create(invoice_id: i17.id, user_id: u4.id, share: 90, paid: false)
a39 = Allocation.create(invoice_id: i17.id, user_id: u10.id, share: 90, paid: false)
a40 = Allocation.create(invoice_id: i17.id, user_id: u9.id, share: 120, paid: false)
a41 = Allocation.create(invoice_id: i18.id, user_id: u4.id, share: 300, paid: false)
a42 = Allocation.create(invoice_id: i18.id, user_id: u10.id, share: 300, paid: false)
a43 = Allocation.create(invoice_id: i18.id, user_id: u9.id, share: 400, paid: false)

a44 = Allocation.create(invoice_id: i19.id, user_id: u4.id, share: 200, paid: false)
a45 = Allocation.create(invoice_id: i20.id, user_id: u4.id, share: 300, paid: false)

a46 = Allocation.create(invoice_id: i21.id, user_id: u4.id, share: 100, paid: false)
a47 = Allocation.create(invoice_id: i21.id, user_id: u1.id, share: 100, paid: false)
a48 = Allocation.create(invoice_id: i21.id, user_id: u8.id, share: 200, paid: false)
a49 = Allocation.create(invoice_id: i21.id, user_id: u6.id, share: 200, paid: false)
a50 = Allocation.create(invoice_id: i21.id, user_id: u10.id, share: 400, paid: false)

a51 = Allocation.create(invoice_id: i22.id, user_id: u4.id, share: 80, paid: false)
a52 = Allocation.create(invoice_id: i22.id, user_id: u1.id, share: 80, paid: false)
a53 = Allocation.create(invoice_id: i22.id, user_id: u8.id, share: 90, paid: false)
a54 = Allocation.create(invoice_id: i22.id, user_id: u6.id, share: 90, paid: false)
a55 = Allocation.create(invoice_id: i22.id, user_id: u10.id, share: 160, paid: false)
a56 = Allocation.create(invoice_id: i23.id, user_id: u4.id, share: 20, paid: false)
a57 = Allocation.create(invoice_id: i23.id, user_id: u1.id, share: 60, paid: false)
a58 = Allocation.create(invoice_id: i23.id, user_id: u8.id, share: 40, paid: false)
a59 = Allocation.create(invoice_id: i23.id, user_id: u6.id, share: 60, paid: false)
a60 = Allocation.create(invoice_id: i23.id, user_id: u10.id, share: 20, paid: false)

a70 = Allocation.create(invoice_id: i24.id, user_id: u4.id, share: 120, paid: false)
a71 = Allocation.create(invoice_id: i24.id, user_id: u1.id, share: 20, paid: false)
a72 = Allocation.create(invoice_id: i24.id, user_id: u8.id, share: 30, paid: false)
a73 = Allocation.create(invoice_id: i24.id, user_id: u6.id, share: 30, paid: false)
a74 = Allocation.create(invoice_id: i24.id, user_id: u10.id, share: 100, paid: false)

puts "seed success"
