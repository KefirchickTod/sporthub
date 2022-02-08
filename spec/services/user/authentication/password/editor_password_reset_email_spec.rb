require 'rails_helper'

describe Users::Authentication::Password::EditorPasswordResetEmail do
  subject { described_class.new(token) }

  include_context 'password'

  context 'when valid token' do
    it 'should return user if valid all params' do
      allow(subject).to receive(:find_by_token).and_return(user)
      expect(subject.run.success?).to be_truthy
    end
  end

  context 'when invalid params' do
    it { expect { subject.call }.to raise_error(ServiceException) }
  end

end