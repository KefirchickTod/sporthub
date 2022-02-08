require "rails_helper"

describe Users::Authentication::Register do
  subject { described_class.new(params, session) }

  include_context 'register'

  context 'when valid params for register' do
    it { expect(subject.run.success?).to be_truthy }
  end

  context 'when not valid confirmed password' do
    let(:password_confirmation) { Faker::Internet.unique.password }
    it { expect(subject.run.error?).to be_truthy }
  end

  context 'when email not unique' do
    let(:email) { user.email }
    it { expect { subject.call }.to raise_error(Users::Authentication::Register::EmailExistException) }
  end

  context 'when bad register params' do
    let(:first_name) { nil }
    it { expect { subject.call }.to raise_error(StandardError) }
  end

end