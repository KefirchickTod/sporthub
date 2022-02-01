require "rails_helper"

describe Articles::ArticleUpdate do
  context 'when id is incorrect' do
    let(:id) { 100500 }
    it "should not update article" do
      expect { Articles::ArticleUpdate.new(params).call }.to raise_error(ServiceException)
    end
  end
  context 'when id is correct' do

    let(:id) { article.id }
    it "should update already exist article" do

      service = Articles::ArticleUpdate.new(params)

      expect(service.run.success?).to eq(true)
    end
  end
end
