class Authentication::ConfirmationsController < Authentication::AuthenticationController
  # Find user by email and send confirmation mail
  def create
    service = Users::Authentication::Confirmation.new(params, session)

    service.call
  end

  def edit
    # Login user
  end
end
