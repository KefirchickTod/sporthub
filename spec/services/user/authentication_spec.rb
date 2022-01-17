require_relative "../../../config/environment"
require "faker"

RSpec.describe "Authentication" do
  context "Register" do
    before(:each) do
      password = Faker::Internet.password
      @params = ActionController::Parameters.new({
        user: {
          email: Faker::Internet.unique.email,
          password: password,
          password_confirmation: password,
          first_name: Faker::Games::ElderScrolls.first_name,
          second_name: Faker::Games::ElderScrolls.last_name
        }
      })
    end

    it "should register and get register instance users" do
      # p @params
      # @type[Authentication::Register]
      register = Users::Authentication::Register.new(@params)

      # @type[ServiceResponse]
      response = register.run

      expect(response).to be_a_kind_of(ServiceResponse)
      expect(response.success?).to eq(true)
      expect(response.data).to be_a_kind_of(User)
    end
  end

  context "Login" do
    it "should success login user to system" do
      login = Users::Authentication::Login.new(ActionController::Parameters.new({
        user: {
          email: "root@root.com",
          password: "admin123"
        }
      }))

      expect(login.call).to be_a_kind_of(User)
    end

    it "should error login user to system" do
      login = Users::Authentication::Login.new(ActionController::Parameters.new({
        user: {
          email: "notEmailInDb@root.com",
          password: "admin123213321"
        }
      }))

      expect { login.call }.to raise_error("Cant find user by email")
    end
  end
end
