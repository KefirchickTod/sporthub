module Admin
  class CategoriesController < Admin::AdminController
    # GET /admin/categories
    def index
      @categories = Category.all
    end

    # Get /admin/categories/new
    def new
      # User for create select parent category
      @category = Category.new
    end

    # GET /admin/categories/create
    def create
      Categories::Create.new(category_params).call
      redirect_to admin_categories_url
    end

    def update
      Categories::Update.new(params[:id], category_params).call
      redirect_to admin_categories_url
    end

    def edit
      @category = Category.find(params[:id])
    end

    def destroy
      Categories::Delete.new(params[:id]).call
    end

    def show
    end

    private

    def category_params
      params.require(:category).permit(:title, :parent_id)
    end

  end
end
