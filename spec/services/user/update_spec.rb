require "rails_helper"

describe Users::Update do
  subject { described_class.new(id, params) }

  include_context "users"

  let!(:user) { create(:user) }
  context "when valid params" do
    let(:id) { user.id }
    it { expect(subject.call).to be_a_kind_of(User) }
  end

  context "when not unique email" do
    let(:email) { user.email }
    it { expect(subject.run.error?).to be_truthy }
  end

  context "when invalid id" do
    let(:id) { nil }
    it { expect { subject.call }.to raise_error(ServiceException) }
  end

  context "when delete role" do
    let(:id) { user.id }
    let(:role_id) { "" }
    it { expect(subject.call).to be_a_kind_of(User) }
  end
end
