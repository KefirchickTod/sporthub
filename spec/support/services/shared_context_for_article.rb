RSpec.shared_context "articles" do
  let!(:user) { create(:user) }
  let!(:category) { create(:category) }
  let!(:article) { create(:article) }
  let!(:country) { create(:country) }
  let!(:team) { create(:team) }
  let(:id) { nil }

  let(:params) do
    {
      id: id,
      title: "#{Faker::Book.title}#{rand(0..2523234)}",
      content: Faker::Lorem.paragraph_by_chars(number: 64, supplemental: false),
      caption: Faker::Lorem.paragraph_by_chars(number: 64, supplemental: false),
      is_public: true,
      show_comment: true,
      users_id: user.id,
      categories_id: category.id,
      teams_id: team.id,
      countries_id: country.id
    }
  end
end
