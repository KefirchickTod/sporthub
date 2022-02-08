require "rails_helper"

describe Users::Authentication::Login do
  subject { described_class.new(params, session) }

  include_context 'login'

  context 'when valid params' do
    it 'should find and login user' do
      allow(subject).to receive(:find).and_return(user)
      expect(subject.run.success?).to be_truthy
    end
  end

  context 'when not found user' do
    let(:email) { Faker::Internet.unique.email }
    it { expect { subject.call }.to raise_error(ServiceException) }
  end

  context 'when invalid password' do
    let(:email) { user.email }
    let(:password) { Faker::Internet.unique.password }
    it { expect { subject.call }.to raise_error(Users::Authentication::Login::InvalidPassword) }
  end

end
