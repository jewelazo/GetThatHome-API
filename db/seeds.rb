require "json"
puts "Charging Seeds..."
Favorite.destroy_all
Sale.destroy_all
Rent.destroy_all
Property.destroy_all
User.destroy_all

all_properties = JSON.parse(File.read("data/properties.json"), symbolize_names: true)
puts "Start seeding users ... "

user1 = User.create(email: 'user1@mail.com', name: 'user1', password: 'password',password_confirmation: 'password',role:0,phone:123123123)
user2 = User.create(email: 'user2@mail.com', name: 'user2', password: 'password',password_confirmation: 'password',role:1,phone:223123123)
user3 = User.create(email: 'user3@mail.com', name: 'user3', password: 'password',password_confirmation: 'password',role:1,phone:323123123)
user4 = User.create(email: 'user4@mail.com', name: 'user4', password: 'password',password_confirmation: 'password',role:0,phone:423123123)

puts "Finish seeding users"

puts "Start seeding rents ... "
6.times do
    rent_data={
        monthly_rent:[2000,3000,4000,5000].sample(),
        maintenance:[200,300,400,500].sample(),
        pet: [true,false].sample()
    }
    Rent.create(rent_data)
end

puts "Finish seeding rents"

puts "Start seeding sales ... "
6.times do
    sale_data={
        price: [200000,300000,400000,500000].sample()
    }
    Sale.create(sale_data)
end
puts "Finish seeding sales"


puts "Start seeding properties ... "
users_seeker=User.where(role:0)
n=0
r=1
users_seeker.each do |user_seeker|
    all_properties[n..n+5].each do |property|
        property_data=property.slice(:address)
        new_property=Property.new(property_data)
        io_path = property[:photo][:io_path]
        filename = property[:photo][:filename]
        new_property.photo.attach(io: File.open(io_path), filename: filename)
        new_property.property_type=[0,1].sample()
        new_property.closed=false
        new_property.bathrooms=(1..5).to_a.sample()
        new_property.bedrooms=(1..5).to_a.sample()
        new_property.area=[100,200,500,600,800,1000,1200].sample()
        new_property.description="#{new_property.bedrooms} Bedroom/#{new_property.bathrooms} Bathroom apartment available for ASAP move-in!Apartment features hardwood floors throughout, virtual doorman, Central AC/heat, dishwasher and a microwave. The kitchen has custom cabinetry and the living room is big enough to fit a dinner table, a couch and a tv set up."
        new_property.user=user_seeker
        new_property.propertiable=Rent.find(r) if r<=3
        new_property.propertiable=Sale.find(r-3) if r>3 && r<=6
        new_property.propertiable=Rent.find(r-3) if r>=7 && r<=9
        new_property.propertiable=Rent.find(r-6) if r>9 && r<=12
        puts "Property not created. Errors: #{new_property.errors.full_messages}" unless new_property.save
        r+=1 
        
        
    end
    n+=6
end
puts "Finish seeding properties"
# property1 = Property.create(address:"Los Olivos, Avenida Las Palmeras, Los Olivos, Provincia de Lima, Lima, 39, Perú ",property_type:1,bedrooms:1,bathrooms:2,area:1200,description:"1231231",user_id: user2.id,propertiable:sale1,closed:false)
# property2 = Property.create(address:"Los Flamingos, Urbanización Sol de Oro, Los Olivos, Provincia de Lima, Lima, LIMA 31, Perú",property_type:0,bedrooms:1,bathrooms:2,area:12010,description:"121231",user_id: user2.id,propertiable:sale3,closed:false)

puts "Start seeding favorites ... "
properties_list=Property.all
landlord_users=User.where(role:1)
landlord_users.each do |landlord_user|
    properties_list.sample(rand(3..5)).each do |property|
        favorite_data={
            user: landlord_user,
            property:property,
            favorite: true,
            contacted: false,
        }
        Favorite.create(favorite_data)
    end
end
puts "Finish seeding favorites"
# properties_list.sample(rand(3..6))
# favorite1 = Favorite.create(user_id:user1.id,property_id:property2.id,favorite:true,contacted:false)
# favorite2 = Favorite.create(user_id:user4.id,property_id:property1.id,favorite:true,contacted:false)

