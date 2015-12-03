require 'spec_helper'

  RSpec.describe User, type: :model do
  	describe '#valid?' do 
  		let(:user) {FactoryGirl.build(:user, name: 'test_name', email: 'test@test.com', address: '123 test st', zip: '12345', phone: '123-4567', city: 'test_town', state: 'NY')}
		context 'when there is no name' do
			it "is invalid when there is no name" do
				user.name = nil
				expect(user).to_not be_valid
			end
		end
		context 'when there is no email' do
			it "is invalid when there is no email" do
				user.email = nil
				expect(user).to_not be_valid
			end
		end
		context 'when there is no address' do
			it "is invalid when there is no address" do
				user.address = nil
				expect(user).to_not be_valid
			end
		end
		context 'when there is no zip' do
			it "is invalid when there is no zip" do
				user.zip = nil
				expect(user).to_not be_valid
			end
		end
		context 'when there is no phone' do
			it "is invalid when there is no phone" do
				user.phone = nil
				expect(user).to_not be_valid
			end
		end
		context 'when there is no city' do
			it "is invalid when there is no city" do
				user.city = nil
				expect(user).to_not be_valid
			end
		end
		context 'when there is no state' do
			it "is invalid when there is no state" do
				user.state = nil
				expect(user).to_not be_valid
			end
		end	
	end

	describe '#email_valid?' do 
		let(:user) {FactoryGirl.build(:user, name: 'test_name', email: 'test@test.com', address: '123 test st', zip: '12345', phone: '123-4567', city: 'test_town', state: 'NY')}
		let(:user2) {FactoryGirl.build(:user, name: 'test_name', email: 'test@test.com', address: '123 test st', zip: '12345', phone: '123-4567', city: 'test_town', state: 'NY')}
		context 'when there are two identical emails' do
			it "is invalid when the email is not unique" do
				expect(user2).to_not be_valid
			end
		end
		let(:user3) {FactoryGirl.build(:user, name: 'test_name', email: 'testtest.com', address: '123 test st', zip: '12345', phone: '123-4567', city: 'test_town', state: 'NY')}
		context 'when the email format is incorrect' do
			it "is invalid when the email is not correct" do
				expect(user3).to_not be_valid
			end
		end
	end
	describe '#business' do
		let(:user) {FactoryGirl.build(:user, name: 'test_name', email: 'test@test.com', address: '123 test st', zip: '12345', phone: '123-4567', city: 'test_town', state: 'NY')}
		let(:business){FactoryGirl.build(:business, user_id: user.id)}
		context 'when a user is created a business id is assigned' do
			it 'matches the business user_id with the user id' do
				expect(business.user_id == user.id).to be true
			end
		end
	end
	describe '#charity' do
		let(:user) {FactoryGirl.build(:user, name: 'test_name', email: 'test@test.com', address: '123 test st', zip: '12345', phone: '123-4567', city: 'test_town', state: 'NY')}
		let(:charity){FactoryGirl.build(:charity, user_id: user.id)}
		context 'when a user is created a charity id is assigned' do
			it 'matches the charity user_id with the user id' do
				expect(charity.user_id == user.id).to be true
			end
		end
	end
end