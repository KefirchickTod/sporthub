RSpec.shared_context 'confirmation' do
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

RSpec.shared_context 'password' do
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
RSpec.shared_context 'login' do
  let(:user) { create(:user) }
  let(:session) { {} }
  let(:email) { "root@root.com" }
  let(:password) { email }
  let(:params) do
    {
      email: email,
      password: password
    }
  end

end
RSpec.shared_context 'register' do
  let(:user) { create(:user) }
  let(:session) { {} }
  let(:password) { Faker::Internet.password }
  let(:password_confirmation) { password }
  let(:email) { Faker::Internet.unique.email }
  let(:first_name) { Faker::Games::ElderScrolls.first_name }
  let(:params) do
    {
      email: email,
      password: password,
      password_confirmation: password_confirmation,
      first_name: first_name,
      second_name: Faker::Games::ElderScrolls.last_name
    }
  end
end
