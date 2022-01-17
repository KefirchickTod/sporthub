require 'rails_helper'

RSpec.describe "Authentication" do

  context "Register" do
    it 'should register users' do

      params = ActionController::Parameters.new({
        user: {
          password: "qwerty123",
          password_confirmation: "qwerty123",
          email: "root@example.com",
          first_name: "Hello",
          second_name: "World"
        }
      })

      # @type[Authentication::Register]
      register = Users::Authentication::Register.new(params)

      # @type[Service::ServiceResponse]
      status = register.run

      expect(status.success?).to eq(true)

    end
  end

end
