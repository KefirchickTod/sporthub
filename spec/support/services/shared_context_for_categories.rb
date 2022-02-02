RSpec.shared_context 'categories' do
  let!(:category) { create(:category) }
  let(:id) { nil }
  let(:params) do
    {
      id: id,
      title: "#{Faker::Book.title}#{rand(0..2523234)}",
      parent_id: category.id
    }
  end
end