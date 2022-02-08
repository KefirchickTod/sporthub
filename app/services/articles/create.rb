module Articles
  class Create < Service
    # @param[ActionController]
    # @param[Integer]
    def initialize(params, user_id, image = nil)
      @params = params
      @user_id = user_id
      @image = image
    end

    # Save article data
    # @return[Article]
    def call
      article = Article.new(@params)

      raise ServiceException.new("Cant find user with id [#{@user_id}]") unless user?

      article.users_id = @user_id

      # raise article.is_public.to_s

      raise ServiceException.new(article.errors.full_messages.to_sentence) unless article.save

      article.image.attach(@image) if @image

      article
    end

    private

    def user?
      User.find_by(id: @user_id).present?
    rescue
      false
    end
  end

end
