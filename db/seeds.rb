# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
Item.destroy_all
Business.destroy_all
Charity.destroy_all
Category.destroy_all
Cart.destroy_all
LineItem.destroy_all
Order.destroy_all


Fabricator(:user) do 
    name { Faker::Name.name }
    email {Faker::Internet.email}
    password { "test"}
    password_confirmation { |attrs| attrs[:password] }
    address {Faker::Address.street_name}
    city {Faker::Address.city}
    state {Faker::Address.state}
    zip {Faker::Address.zip}
    phone {Faker::PhoneNumber.phone_number}
end
#user password is always test
10.times {Fabricate(:user)}

business_range = (0..4).to_a
charity_range = (5..9).to_a

5.times do
	Business.create(user_id: User.all[business_range.pop].id)
	Charity.create(user_id: User.all[charity_range.pop].id)
end

User.create(name: 'Admin', email: 'admin@gmail.com', password: 'test', password_confirmation: 'test', address: '11 Broadway', city: 'New York', state: 'NY', zip: '10004', phone: '212-870-2578')
Admin.create(user_id: User.all[10].id)

Category.create(name: 'food', id: 1)
Category.create(name: 'electronics', id: 2)
Category.create(name: 'furniture', id: 3)
Category.create(name: 'clothes', id: 4)

Fabricator(:item) do
	title {Faker::Commerce.product_name}
	inventory {rand(1..20)}
	description {Faker::Company.bs}
	category_id {rand(1..4)}
	business_id {rand(1..5)}
	photo_url {"http://lorempixel.com/200/200/technics/"}
end

10.times {Fabricate(:item)}

business_item_range = (Business.first.id..Business.last.id).to_a

Item.all.each do |item|
	item.business_id = business_item_range.shuffle.take(1).first
	item.save
end
