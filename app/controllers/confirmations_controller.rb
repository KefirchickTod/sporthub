class ConfirmationsController < ApplicationController
  # Find user by email and send confirmation mail
  def create
    service = Users::Authentication::Confirmation.new(params)

    service.call
  end
end
