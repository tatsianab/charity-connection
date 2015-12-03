require 'spec_helper'

RSpec.describe Charity, type: :model do
	describe '#belongs to user?' do
		let(:user) {FactoryGirl.build(:user, id: 1)}
		let(:charity) {FactoryGirl.build(:charity, user_id: user.id)}

		context 'charity associations' do
			it 'belongs to user' do
				expect(charity.user_id == user.id).to be true
			end
		end		
	end
end