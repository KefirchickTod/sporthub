require 'rails_helper'

describe Users::Authentication::Password::UpdatePasswordResetEmail do
  subject { described_class.new(token, params) }

  include_context 'password'

  let(:params) do
    {
      password: password,
      password_confirmation: password
    }
  end

  before(:each) do
    # todo(q?): if before(:all) raise error, why?
    allow(subject).to receive(:find_by_token).and_return(user)
    allow(subject).to receive(:unconfirmed?).and_return(true)
  end

  context 'when valid password' do
    it { expect(subject.call).to be_kind_of(User) }
  end
  context 'when invalid password' do
    let(:params) do
      {
        password: password,
        password_confirmation: Faker::Internet.unique.password
      }
    end
    it { expect(subject.run.error?).to be_truthy }
  end

end
