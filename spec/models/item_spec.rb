require 'spec_helper'

RSpec.describe Item, type: :model do

  Fabricator(:business, :class_name => "Business") do
    user_id 3
  end

  Fabricator(:item, :class_name => "Item") do
    category_id 2
    business_id 4
    title "a cool item"
    inventory 14
    description " its so cool that is crazy"
    photo_url "k;lkdfjkld;"
  end


  describe "#create" do
    let(:business){ Fabricate.build(:business, id:5)}
    let(:item) { Fabricate.build(:item, business_id: business.id ) }
    context "When creating an item" do
      it "should validate that there is a title" do
          item.title = nil
          expect(item).to_not be_valid
      end

      it "should validate that there is a description" do
          item.description = nil
          expect(item).to_not be_valid
      end

      it "should validate that there is a inventory" do
          item.inventory = nil
          expect(item).to_not be_valid
      end

      it "should validate that there is a bussiness_id" do
          item.business_id = nil
          expect(item).to_not be_valid
      end

      it "should validate that the bussiness_id and current user_id match" do
          item.business_id = nil
          expect(item.business_id == business.id).to be false
      end

      it "should validate that there is a category_id" do
          item.category_id = nil
          expect(item).to_not be_valid
      end

      it "should validate that the item persists when all fields are correct" do
          expect(item.save).to be true
      end
    end
  end
end
