RSpec.describe Category, type: :model do

  Fabricator(:category, :class_name => "Category") do
    name 'cool category'
  end

  describe "#create" do
    let(:category) { Fabricate.build(:category) }
    context "When creating an category" do
      it "should validate that there is a name" do
          category.name = nil
          expect(category).to_not be_valid
      end
    end
  end
end
