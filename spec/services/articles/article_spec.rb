#require_relative "../../../config/environment"
#require 'factory_bot_rails'
require "rails_helper"

RSpec.describe Articles do

  let!(:user) { create(:user) }
  let!(:category) { create(:category) }
  let!(:article) { create(:article) }
  let(:id) { nil }
  let(:params) do
    {
      id: id,
      title: "#{Faker::Book.title}#{rand(0..2523234)}",
      short_text: Faker::Lorem.paragraph_by_chars(number: 64, supplemental: false),
      full_text: Faker::Lorem.paragraph_by_chars(number: 255, supplemental: false),
      is_public: rand(0..1),
      default_photo: "https://www.nopcommerce.com/images/thumbs/0005720_coming-soon-page_550.jpeg",
      # users_id: @users.sample.id,
      categories_id: category.id
    }
  end

  describe "Create" do

    it "should create new article" do
      status = Articles::ArticleCreate.new(params, user.id).run

      expect(status).to be_a_kind_of(ServiceResponse)
      expect(status.success?).to eq(true)
    end
  end

  describe 'update' do
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

  describe 'delete ' do
    let!(:article) { create(:article) }

    it "should delete article from db" do
      service = Articles::ArticleDelete.new(article.id)

      expect(service.run.success?).to eq(true)
    end
  end

end
