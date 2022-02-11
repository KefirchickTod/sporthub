module Users
  class Update < Service
    def initialize(id, params, image = nil)
      @params = params
      @id = id
      @image = image
    end

    def call
      @user = find_user

      role = @params[:role]
      @params = @params.except(:role)

      raise ServiceException.new(@user.errors.messages) unless @user.update(@params)

      if @image
        @user.image.attach(@image)
      end

      update_role(role)

      @user
    end

    private

    def update_role(id)
      # puts "Role id is #{id}"

      return remove_roles if !id || id == 0 || id.to_s.empty?

      role = Role.find(id)

      raise ServiceException.new("Cant find role with id #{id}") unless role.present?

      @user.add_role(role.name)
    end

    def remove_roles
      @user.roles.each do |role|
        @user.remove_role(role.name)
      end
    end

    # Get user, not exists then raise ServiceError
    # @return[User]
    def find_user
      user = User.find_by(id: @id)
      raise ServiceException.new("Cant find user with id[#{@id}]") unless user.present?
      user
    end
  end
end
