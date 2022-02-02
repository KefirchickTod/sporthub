require "rails_helper"

describe Users::Delete do
  subject { described_class.new(id) }

  include_context 'users'

  context 'when valid id' do
    let(:id) { user.id }
    it { expect(subject.call).to raise_error(ServiceException) }
  end

  context 'when invalid id' do
    let(:id) { 10234324233 }
    it { expect(subject.run.error?).to be_truthy }
  end

end
