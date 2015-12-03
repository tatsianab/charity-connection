require 'spec_helper'

RSpec.describe Business, type: :model do


	describe '#has_items?' do
		# let(:business) {FactoryGirl.build(:business, id: 1)}
		# let(:item) {FactoryGirl.build(:item, business_id: business.id)}

		# let(:item2) {FactoryGirl.build(:item, business_id: business.id)}

		context 'business associations' do
			it 'has many items' do
				@business = Business.create({user_id: 1})
				@item = Item.create({title: 'item', inventory: 1, description: 'item description'})
				@item.business = @business
				expect(@item.business == @business)
			end
		end
	end

	describe '#belongs to user?' do
		let(:user) {FactoryGirl.build(:user, id: 1)}
		let(:business) {FactoryGirl.build(:business, user_id: user.id)}

		context 'business associations' do
			it 'belongs to user' do
				expect(business.user_id == user.id).to be true
			end
		end		
	end
end