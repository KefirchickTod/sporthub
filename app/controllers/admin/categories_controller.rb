module Admin
  class CategoriesController < Admin::AdminController
    include ServiceHandle

    # Get /admin/categories/new
    def new
      # User for create select parent category
      @categories = Category.all
    end

    # GET /admin/categories/create
    def create
    end

    # GET /admin/categories
    def index
      @categories = Category.all
    end

    def update
    end

    def edit
    end
  end
end
