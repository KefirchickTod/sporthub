require_relative "../../../config/environment"

RSpec.describe Categories do
  context "Editable" do
    before(:each) do
      @params = ActionController::Parameters.new({
        category: {
          title: "#{Faker::Book.title}#{rand(0..2523234)}",
          parent_id: Category.all.sample.id
        }

      })
    end

    it "should create new category" do
      category = Categories::CategoryCreate.new(@params).call

      expect(category).to be_a_kind_of(Category)
    end

    it "should update data in category" do
      id = Category.last.id

      category = Categories::CategoryUpdate.new(id, @params).call

      expect(category).to be_a_kind_of(Category)
    end
  end

  context "Delete" do
    it "should delete last category" do
      id = Category.last.id
      destroyed = Categories::CategoryDelete.new(id).call
      expect(destroyed).to eq(true)
    end
  end
end
