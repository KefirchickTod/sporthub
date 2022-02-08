require 'rails_helper'

describe Users::Authentication::Password::CreatorPasswordResetSender do
  subject { described_class.new(email) }

  include_context 'password'

  context 'when valid email' do
    it 'should find user' do
      allow(subject).to receive(:send!).and_return(true)
      allow(subject).to receive(:confirmed?).and_return(true)
      expect(subject.run.success?).to be_truthy
    end
  end

  context 'when invalid email' do
    let(:email) { Faker::Internet.unique.email }
    it { expect { subject.call }.to raise_error(Users::Authentication::Exceptions::InvalidEmailError) }
  end

  context 'when user not confirmed' do
    it 'should raise Confirmation error' do
      allow(subject).to receive(:confirmed?).and_return(false)
      expect { subject.call }.to raise_error(Users::Authentication::Password::ConfirmationError)
    end
  end

end
