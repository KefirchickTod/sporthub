RSpec.shared_context "users" do
  let!(:role) { create(:role) }
  let(:id) { nil }
  let(:email) { Faker::Internet.unique.email }
  let(:role_id) { role.id }
  let(:params) do
    {
      id: id,
      email: email,
      first_name: Faker::Games::ElderScrolls.first_name,
      second_name: Faker::Games::ElderScrolls.last_name,
      role: role_id
    }
  end
end
