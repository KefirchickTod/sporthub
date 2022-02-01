require "rails_helper"

describe Articles::Update do
  subject { described_class.new(params) }

  include_context 'articles'

  context "when params is valid" do
    let(:id) { article.id }
    it { expect(subject.run.success?).to be_truthy }
  end

  context "when params is invalid" do
    let(:id) { 100599100599 }
    it { expect(subject.run.error?).to be_truthy }
  end

end