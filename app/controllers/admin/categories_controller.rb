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
      Categories::CategoryCreate.new(params).call
      redirect_to admin_categories_url
    end

    def update
      Categories::CategoryUpdate.new(params[:id], params).call
      redirect_to admin_categories_url
    end

    def edit
      @category = Category.find(params[:id])
    end

    def destroy
      Categories::CategoryDelete.new(params[:id]).call
    end

    def show
    end
  end
end
