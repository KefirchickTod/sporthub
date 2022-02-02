require "rails_helper"

describe Categories::Delete do
  subject { described_class.new(id) }

  include_context 'categories'

  context "when valid id" do
    let(:id) { category.id }
    it { expect(subject.run.success?).to be_truthy }
  end
  context "when invalid id" do
    let(:id) { 10234324 }
    it { expect { subject.call }.to raise_error(ServiceException) }
  end
end