RSpec.shared_context 'users' do
  let(:id) { nil }
  let(:email) { Faker::Internet.unique.email }
  let(:params) do
    {
      id: id,
      email: email,
      first_name: Faker::Games::ElderScrolls.first_name,
      second_name: Faker::Games::ElderScrolls.last_name
    }
  end
end