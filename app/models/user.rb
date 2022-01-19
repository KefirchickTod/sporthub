class User < ApplicationRecord
  CONFIRMATION_TOKEN_EXPIRATION = 10.minute
  MAILER_FROM_EMAIL = "no-reply@example.com"

  before_save :downcase_email

  # Validate block
  validates :email, presence: true, uniqueness: true, format: {with: URI::MailTo::EMAIL_REGEXP, message: "Invalid email"}
  validates :password, presence: true, length: {minimum: 8, maximum: 128}

  # Include block
  has_secure_password

  # Set user confirm
  def confirm!
    update_columns(confirmed_at: Time.current)
  end

  # Check if user confirm email
  def confirmed?
    confirmed_at.present?
  end

  def generate_confirmation_token
    signed_id expires_in: CONFIRMATION_TOKEN_EXPIRATION, purpose: :confirm_email
  end

  def unconfirmed?
    !confirmed?
  end

  def send_confirmation_email!
    confirmation_token = generate_confirmation_token
    UserMailer.confirmation(self, confirmation_token).deliver_now
  end

  private

  # Convert email to low register
  def downcase_email
    self.email = email.downcase
  end
end
