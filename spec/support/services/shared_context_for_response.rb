RSpec.shared_context 'articles' do

  let!(:user) { create(:user) }
  let!(:category) { create(:category) }
  let!(:article) { create(:article) }
  let(:id) { nil }
  let(:params) do
    {
      id: id,
      title: "#{Faker::Book.title}#{rand(0..2523234)}",
      short_text: Faker::Lorem.paragraph_by_chars(number: 64, supplemental: false),
      full_text: Faker::Lorem.paragraph_by_chars(number: 255, supplemental: false),
      is_public: rand(0..1),
      default_photo: "https://www.nopcommerce.com/images/thumbs/0005720_coming-soon-page_550.jpeg",
      # users_id: @users.sample.id,
      categories_id: category.id
    }
  end

end