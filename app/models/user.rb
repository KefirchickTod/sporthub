class User < ApplicationRecord
  CONFIRMATION_TOKEN_EXPIRATION = 10.minute
  PASSWORD_RESET_TOKEN_EXPIRATION = 10.minutes
  MAILER_FROM_EMAIL = "no-reply@example.com"

  # Virtus
  # include Virtus.model

  attribute :email, :string
  attribute :password_digest, :string
  attribute :first_name, :string
  attribute :second_name, :string

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

  # Get user full name
  # @return[String]
  def full_name
    "#{first_name} #{second_name}"
  end

  # Create special token for reset password
  # @return[String]
  def generate_password_reset_token
    signed_id expires_in: PASSWORD_RESET_TOKEN_EXPIRATION, purpose: :reset_password
  end

  # Send mail for reset password
  def send_password_reset_email!
    password_reset_token = generate_password_reset_token
    UserMailer.password_reset(self, password_reset_token).deliver_now
  end

  private

  # Convert email to low register
  def downcase_email
    self.email = email.downcase
  end
end
