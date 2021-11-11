puts "Charging Seeds..."
puts "Creating users"
Sale.destroy_all
Rent.destroy_all
Property.destroy_all
User.destroy_all

user1 = User.create(email: 'user1@mail.com', name: 'user1', password: 'password',password_confirmation: 'password',role:0,phone:123123123)
user2 = User.create(email: 'user2@mail.com', name: 'user2', password: 'password',password_confirmation: 'password',role:1,phone:223123123)
user3 = User.create(email: 'user3@mail.com', name: 'user3', password: 'password',password_confirmation: 'password',role:1,phone:323123123)

user4 = User.create(email: 'user4@mail.com', name: 'user4', password: 'password',password_confirmation: 'password',role:0,phone:423123123)
puts "Users created"



rent1 = Rent.create(monthly_rent:100,maintenance:200,pet:true)
rent2 = Rent.create(monthly_rent:1200,maintenance:1200,pet:true)
rent3 = Rent.create(monthly_rent:12100,maintenance:1100,pet:false)

sale1 = Sale.create(price:100)
sale2 = Sale.create(price:200)
sale3 = Sale.create(price:300)
sale4 = Sale.create(price:400)


property1 = Property.create(address:"1231231",property_type:1,bedrooms:1,bathrooms:2,area:1200,description:"1231231",user_id: user2.id,propertiable:sale1)

property2 = Property.create(address:"11231231",property_type:0,bedrooms:1,bathrooms:2,area:12010,description:"121231",user_id: user2.id,propertiable:sale3)

favorite1 = Favorite.create(user_id:user1.id,property_id:property2.id)

favorite2 = Favorite.create(user_id:user4.id,property_id:property1.id)
puts "SEEDS FINISHED"
