require "rails_helper"

describe Users::Delete do
  subject { described_class.new(id) }

  include_context 'users'

  let!(:user) { create(:user) }
  context 'when valid id' do
    let(:id) { user.id }
    it { expect(subject.run.success?).to be_truthy }
  end

  context 'when invalid id' do
    let(:id) { 10234324233 }
    it { expect(subject.run.error?).to be_truthy }
  end

end
