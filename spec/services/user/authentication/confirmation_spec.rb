require "rails_helper"

describe Users::Authentication::Confirmation do
  subject { described_class.new(email) }

  include_context 'confirmation'

  context 'when confirmation latter send' do
    it 'should create mock for sending function' do
      allow(subject).to receive(:send_confirmation).and_return(true)
      expect(subject.call).to be_truthy
    end
  end

  context 'when cant find user' do
    let(:email) { Faker::Internet.unique.email }
    it { expect { subject.call }.to raise_error(ServiceException) }
  end

end
