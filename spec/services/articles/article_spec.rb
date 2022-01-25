require_relative "../../../config/environment"

RSpec.describe Articles do
  context "Editable" do
    before(:each) do
      @categories = Category.limit(5)
      @params = ActionController::Parameters.new({
        article: {
          title: "#{Faker::Book.title}#{rand(0..2523234)}",
          short_text: Faker::Lorem.paragraph_by_chars(number: 64, supplemental: false),
          full_text: Faker::Lorem.paragraph_by_chars(number: 255, supplemental: false),
          is_public: rand(0..1),
          default_photo: "https://www.nopcommerce.com/images/thumbs/0005720_coming-soon-page_550.jpeg",
          # users_id: @users.sample.id,
          categories_id: @categories.sample.id
        }
      })
    end

    it "should create new article" do
      status = Articles::ArticleCreate.new(@params, User.limit(5).sample.id).run

      expect(status).to be_a_kind_of(ServiceResponse)
      expect(status.success?).to eq(true)
    end

    it "should not update article" do
      article = Article.last
      @params[:id] = article.id + 1

      expect { Articles::ArticleUpdate.new(@params).call }.to raise_error(StandardError)
    end

    it "should update already exist article" do
      article = Article.last
      @params[:id] = article.id

      service = Articles::ArticleUpdate.new(@params)

      expect(service.run.success?).to eq(true)
    end
  end

  context "Deleted" do
    before(:each) do
      @last_article = Article.last
    end

    it "should delete article from db" do
      service = Articles::ArticleDelete.new(@last_article.id)

      expect(service.run.success?).to eq(true)
    end
  end
end
