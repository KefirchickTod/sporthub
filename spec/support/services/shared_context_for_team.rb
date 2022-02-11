RSpec.shared_context "teams" do
  let!(:category) { create(:category) }
  let!(:country) { create(:country) }
  let!(:team) { create(:team) }
  let(:title) { "#{Faker::Book.title}#{rand(0..2523234)}" }
  let(:id) { nil }

  let(:params) do
    {
      id: id,
      title: title,
      categories_id: category.id,
      countries_id: country.id,
      sub_category_id: category.id
    }
  end
end
