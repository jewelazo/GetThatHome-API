puts "Charging Seeds..."
Favorite.destroy_all
Sale.destroy_all
Rent.destroy_all
Property.destroy_all
User.destroy_all

puts "Creating users ... "

user1 = User.create(email: 'user1@mail.com', name: 'user1', password: 'password',password_confirmation: 'password',role:0,phone:123123123)
user2 = User.create(email: 'user2@mail.com', name: 'user2', password: 'password',password_confirmation: 'password',role:1,phone:223123123)
user3 = User.create(email: 'user3@mail.com', name: 'user3', password: 'password',password_confirmation: 'password',role:1,phone:323123123)
user4 = User.create(email: 'user4@mail.com', name: 'user4', password: 'password',password_confirmation: 'password',role:0,phone:423123123)
puts "Creating rents ... "

rent1 = Rent.create(monthly_rent:100,maintenance:200,pet:true)
rent2 = Rent.create(monthly_rent:1200,maintenance:1200,pet:true)
rent3 = Rent.create(monthly_rent:12100,maintenance:1100,pet:false)
puts "Creating sales ... "


sale1 = Sale.create(price:100)
sale2 = Sale.create(price:200)
sale3 = Sale.create(price:300)
sale4 = Sale.create(price:400)

puts "Creating properties ... "

property1 = Property.create(address:"Los Olivos, Avenida Las Palmeras, Los Olivos, Provincia de Lima, Lima, 39, Perú ",property_type:1,bedrooms:1,bathrooms:2,area:1200,description:"1231231",user_id: user2.id,propertiable:sale1,closed:false)
property2 = Property.create(address:"Los Flamingos, Urbanización Sol de Oro, Los Olivos, Provincia de Lima, Lima, LIMA 31, Perú",property_type:0,bedrooms:1,bathrooms:2,area:12010,description:"121231",user_id: user2.id,propertiable:sale3,closed:false)
puts "Creating favorites ... "

favorite1 = Favorite.create(user_id:user1.id,property_id:property2.id,favorite:true,contacted:false)
favorite2 = Favorite.create(user_id:user4.id,property_id:property1.id,favorite:true,contacted:false)
puts "Finish"
