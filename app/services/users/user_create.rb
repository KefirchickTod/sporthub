module Users
  class UserCreate < Service
    def initialize(params)
      @params = validate(params)
    end

    def call
    end

    private

    # Validate basic data from form
    def validate(p)
      p.require(:user).permit(:first_name, :second_name)
    end
  end
end
