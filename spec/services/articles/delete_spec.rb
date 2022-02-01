require "rails_helper"

describe Articles::Delete do
  subject { described_class.new(id) }

  include_context 'articles'

  context 'when valid delete params' do
    let(:id) { article.id }
    it { expect(subject.run.success?).to be_truthy }
  end

  context 'when invalid delete params' do
    let(:id) { 100123322 }
    it { expect(subject.run.error?).to be_truthy }
  end

end